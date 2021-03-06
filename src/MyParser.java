//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

import java_cup.runtime.*;

import java.util.*;

import Operator.*;
import STO.*;
import Types.*;

class MyParser extends parser {
	private Lexer m_lexer;
	private ErrorPrinter m_errors;
	private int m_nNumErrors;
	private String m_strLastLexeme;
	private boolean m_bSyntaxError = true;
	private int m_nSavedLineNum;
	private boolean m_returnMissingFlag;
	private int blockLevel;
	private StructType currentStruct;
	private int inLoop = 0;
	public static AssemblyGenerator generator = new AssemblyGenerator("rc.s");
	public FuncSTO main = new FuncSTO("main");
	public boolean globalInit = false;
	public Stack<STO> forStack = new Stack<STO>();

	private SymbolTable m_symtab;

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public MyParser(Lexer lexer, ErrorPrinter errors) {
		m_lexer = lexer;
		m_symtab = new SymbolTable();
		m_errors = errors;
		m_nNumErrors = 0;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public boolean Ok() {
		return m_nNumErrors == 0;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public Symbol scan() {
		Token t = m_lexer.GetToken();

		// We'll save the last token read for error messages.
		// Sometimes, the token is lost reading for the next
		// token which can be null.
		m_strLastLexeme = t.GetLexeme();
		switch (t.GetCode()) {
		case sym.T_ID:
		case sym.T_ID_U:
		case sym.T_STR_LITERAL:
		case sym.T_FLOAT_LITERAL:
		case sym.T_INT_LITERAL:
			return new Symbol(t.GetCode(), t.GetLexeme());
		default:
			return new Symbol(t.GetCode());
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public void syntax_error(Symbol s) {
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public void report_fatal_error(Symbol s) {
		m_nNumErrors++;
		if (m_bSyntaxError) {
			m_nNumErrors++;

			// It is possible that the error was detected
			// at the end of a line - in which case, s will
			// be null. Instead, we saved the last token
			// read in to give a more meaningful error
			// message.
			m_errors.print(Formatter.toString(ErrorMsg.syntax_error,
					m_strLastLexeme));
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public void unrecovered_syntax_error(Symbol s) {
		report_fatal_error(s);
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public void DisableSyntaxError() {
		m_bSyntaxError = false;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public void EnableSyntaxError() {
		m_bSyntaxError = true;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public String GetFile() {
		return m_lexer.getEPFilename();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public int GetLineNum() {
		return m_lexer.getLineNumber();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public void SaveLineNum() {
		m_nSavedLineNum = m_lexer.getLineNumber();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public int GetSavedLineNum() {
		return m_nSavedLineNum;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoProgramStart() {
		// Opens the global scope.
		m_symtab.openScope();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoProgramEnd() {
		m_symtab.closeScope();
		generator.end();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	public STO DoVarDecl(Hashtable lstIDs, Type t, boolean isStatic) {
		if (t == null) {
			return new ErrorSTO("Missing type in delcaration.");
		}
		
		boolean isError = false;
		
		Enumeration<STO> e = lstIDs.keys();
		

		while (e.hasMoreElements()) {
			STO sto = e.nextElement();
			String idName = sto.getName();
			System.out.println(idName);
			
			if (sto.isError()) {
				continue;
			}
			
			//recursive struct def
			if(currentStruct != null) {	
				if (sto.getName() == currentStruct.getName()) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error13b_Struct, sto
							.getName()));
				}
			}
			STO r = ((STO)lstIDs.get(sto));
			
			if(m_symtab.getLevel()==1){
				sto.isGlobal = true;
			}
			
			if(isStatic){
				sto.isStatic = true;
				sto.isGlobal = false;
			} else {
				sto.isStatic = false;
			}
			
			Type type;
			if(sto.getType() == null){
				type = t;
			}
			else {
				//oh god wtf does this do tansen.
				type = DoSetSubType(t, 
					sto.getType().isPointer() ? 
						sto.getType() : 
						null, 
					sto.getType().isArray() ? 
						sto.getType() : 
						null);
			}
			
			
			if (m_symtab.accessLocal(idName) != null && currentStruct != null) {
				
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error13a_Struct,
						sto.getName()));
				isError = true;
				continue;
			} else if (m_symtab.accessLocal(idName) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id,
						sto.getName()));
				isError = true;
				continue;
			}
			
			// setting types
			if (sto.getType() == null || sto.getType().isVoid()) {
				sto.setType(type);
			}
			
			
			if(((STO) lstIDs.get(sto)).getName().equals("Placeholder")) {
				
			} else if ((lstIDs.get(sto) instanceof STO)) {
				sto.isInitialized = true;
				
				if (!((STO) lstIDs.get(sto)).getType().isAssignableTo(type)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error8_Assign,
							((STO) lstIDs.get(sto)).getType().getName(), type.getName()));
					isError = true;
					continue;
				}
			}

			if(type instanceof ArrayType) {
				sto.setIsAddressable(true);
				sto.setIsModifiable(false);
			}
			if(currentStruct != null) {
				this.structVarDecl(sto, (STO)lstIDs.get(sto));
				continue;
			}
			m_symtab.insert(sto);
			if(currentStruct != null && m_symtab.getFunc() == null) {
				//currentStruct.setStructMembers(sto);
			}
			FuncSTO func = m_symtab.getFunc();
			if(func == null) {
				func = main;
			}
			
			//Assembly here
			// getFunc() == null means global scope
			
			if(m_symtab.getFunc() == null || sto.isStatic){
				sto.base = Registers.g0;
				sto.offset = (m_symtab.getFunc() != null ? m_symtab.getFunc().getName()+"_" : "") + sto.getName();
				
				
				if(sto.isInitialized && !sto.isStatic){
					generator.doData(sto, (STO)lstIDs.get(sto));
				} else if(sto.getType().isArray() || sto.getType().isStruct() || sto.getType().isPointer()) {
					generator.doBSS(sto);
				} else {
					generator.doData(sto, new ConstSTO("0", new IntegerType(), 0.0));
				} 
				
				//TODO static stuff
				
				if(sto.isStatic) {
					//have to set up static
					generator.staticerino(sto);
					if(sto.isInitialized) {
						//initialize it
						generator.isStatic = true;
						if(((STO)lstIDs.get(sto)).isConst()) {
							generator.storeConstant(sto, (ConstSTO)lstIDs.get(sto));
						} else {
							generator.storeVariable(sto, (STO)lstIDs.get(sto));
						}
					}
					
					generator.staticerino_end(sto);
					generator.isStatic = false;
				}
			}else{ // we're in local now (not static) 
				//Why is there an extra 4 bytes on stack at beginnign?
				//have to put it there because need to load floats, cant set them
				//the 4 bytes are the float buffer thingy.
				sto.offset = String.valueOf(-(func.getStackSize() + sto.getType().getSize()));
				sto.base = Registers.fp;
				func.addToStack(sto.getType().getSize());
				
				
				
//				if(currentStruct == null) {
//					sto.base = Registers.fp;
//					//sto.offset = 
//				}
				
				if(sto.isInitialized) {
					generator.localVarInit(sto, (STO)lstIDs.get(sto));
				}else{
					//we dont initialize if inside function.
					//generator.storeConstant(sto, new ConstSTO("0", new IntegerType(), 0.0));
				}
			}
		}

		if(isError) {
			return new ErrorSTO("errored");
		} else {
			return null;
			
		}
	}

	void structVarDecl(STO left, STO right) {
		left.offset = String.valueOf(currentStruct.getSize());
		System.out.println(left.getName() + " " + left.offset);
		
		currentStruct.setStructMembers(left);
	}
	// -----------------sto-----------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoIterationVarDecl(STO sto) {
		if (m_symtab.accessLocal(sto.getName()) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id,
					sto.getName()));
		}
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		
		func.addToStack(sto.getType().getSize());
		sto.base = Registers.fp;
		sto.offset = String.valueOf(-func.getStackSize());
		m_symtab.insert(sto);
		
		//assembly here?
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoExternDecl(Hashtable lstIDs) {
		for (int i = 0; i < lstIDs.size(); i++) {
			String id = ((STO) lstIDs.get(i)).getName();

			if (m_symtab.accessLocal(id) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}

			VarSTO sto = new VarSTO(id);
			m_symtab.insert(sto);
			
			//assembly here?
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoConstDecl(Hashtable lstIDs, Type t) {
		Enumeration<STO> e = lstIDs.keys();

		while (e.hasMoreElements()) {
			STO id = e.nextElement();
			if (m_symtab.accessLocal(id.getName()) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id,
						id.getName()));
			} else {
				
				if(id.isError()) {
					continue;
				}
				
				ConstSTO csto = (ConstSTO) lstIDs.get(id);
				
				if (csto.isError()) {
					continue;
				}
				ConstSTO sto = null;
				if (csto.isConst()) {
					if (!csto.getType().isAssignableTo(t)) {
						m_nNumErrors++;
						m_errors.print(Formatter.toString(
								ErrorMsg.error8_Assign, id.getType().getName(),
								t.getName()));
					} else {
						 sto = new ConstSTO(id.getName(), t,
								((ConstSTO) csto).getValue());
						m_symtab.insert(sto);
					}

				} else {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(
							ErrorMsg.error8_CompileTime, csto.getName()));
				}
				sto.base = Registers.g0;
				sto.offset = ((STO)lstIDs.get(id)).offset;
				
			}
			
			
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoTypedefDecl(Vector<String> lstIDs, Type t) {
		for (int i = 0; i < lstIDs.size(); i++) {
			String id = lstIDs.elementAt(i);
			if (m_symtab.accessLocal(id) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}
			TypedefSTO sto = new TypedefSTO(id, t.clone());
			m_symtab.insert(sto);
			//assembly here
			//however we might have to save space here and do assembly later
			//because stack stuff.
		}
	}

	// dont need string id

	STO DoStructdef(String id) {
		if (m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			return new ErrorSTO(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		TypedefSTO sto = new TypedefSTO(id, new StructType(id));
		m_symtab.insert(sto);

		this.currentStruct = (StructType) sto.getType();
		//assembly here
		return sto;
	}

	void DoStructScope(String id) {
		// need current struct
		Scope scope = m_symtab.scopePeek();
		currentStruct.setScope(scope);
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoStructdefDecl(String id) {
		STO sto = m_symtab.accessGlobal(id);
		currentStruct = null;
		return sto;
	}

	// name, init expr, opt pointer, opt array
	STO DoCreateDeclaration(String id, STO sto, Type pointerType, Type arrayType) {		
		VarSTO sto1 = new VarSTO(id);
		Type type = null;
		if(pointerType != null) {
			type = pointerType;
		}
		
		if(arrayType != null) {
			((ArrayType) arrayType).setContainingType(type);
			type = arrayType;
		}
		sto1.setType(type);
							
		return sto1;
	}

	STO DoCreateConstDeclaration(String id, STO sto) {
		if (sto == null) {
			return new ConstSTO(id);
		}

		if (sto.isError()) {
			return sto;
		}
		
		if(sto.isVar() || sto.isExpr()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error8_CompileTime, id));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error8_CompileTime, id));
		}
		return new ConstSTO(id, sto.getType(), ((ConstSTO) sto).getValue());
	}

	Type DoArrayDecl(STO index) {
		
		if (!index.getType().isInt()) {
		m_nNumErrors++;
		m_errors.print(Formatter.toString(ErrorMsg.error10i_Array, index
				.getType().getName()));
		index = new ErrorSTO(Formatter.toString(ErrorMsg.error10i_Array,
				index.getType().getName()));
		} else if(!(index.isConst())) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error10c_Array);
			index = new ErrorSTO(ErrorMsg.error10c_Array);
		} else if (((ConstSTO) index).getIntValue() <= 0) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error10z_Array, index
					.getType().getName()));
			index = new ErrorSTO(Formatter.toString(ErrorMsg.error10z_Array,
					index.getType().getName()));
		} else {
			return new ArrayType(((ConstSTO) index).getIntValue());
		}

		// if code gets here, that means it errored somewhere up in the block of
		// code ^
		return new ArrayType("Error", 0);
		
	}

	// inner type, containing type, can be only arraytype or pointer type
	Type DoSetSubType(Type innerType, Type pointer, Type array) {
		
		Type type = innerType;
	
		if(pointer != null){
			//the rest of the times
			((PointerType)pointer).SetBaseType(type);
			type = pointer;
		}
		// pointer is null
		if(array != null){
			if(((ArrayType) array).getContainingType() != null && ((ArrayType) array).getContainingType().isPointer()) {
				PointerType pType = (PointerType) ((ArrayType) array).getContainingType();
				pType.SetBaseType(type);
				((ArrayType) array).setFinalSize(pType.getSize());
			} else {
				((ArrayType)array).SetBaseType(type);
				((ArrayType) array).setFinalSize(type.getSize());
			}
			type = array;
		}
		
		return type;		
	}

	// ----------------------------------------------------------------
	// id is func name, type is return type, isReturnReference self explan/
	// ----------------------------------------------------------------
	void DoFuncDecl_1(String id, Type t, boolean isReturnReference) {
		
		if (m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}
		FuncSTO funcSTO = null;
		m_returnMissingFlag = true;
		String base = "";
		
		if(currentStruct != null) {
			if(currentStruct.getScope().access(id) != null) {
				m_nNumErrors++;
				m_errors.print("function already defined in " + currentStruct.getName());
			}
			
			funcSTO = new FuncSTO(id, new FunctionPointerType(id));
			funcSTO.setReturnType(t);
			funcSTO.setIsReturnRefernece(isReturnReference);
			base = currentStruct.getName() + "_";
		} else {
			if(id.equals("main")) {
				funcSTO = new FuncSTO(id, new FunctionPointerType("main"));
				main = funcSTO;
			} else {
				funcSTO = new FuncSTO(id, new FunctionPointerType(id));
			}
			
			funcSTO.setReturnType(t);
			funcSTO.setIsReturnRefernece(isReturnReference);
		}
		
		//assembly here
		m_symtab.insert(funcSTO);
		m_symtab.openScope();
		m_symtab.setFunc(funcSTO);
		// get level AFTER you open scope.
		blockLevel = m_symtab.getLevel();
		funcSTO.offset = base + funcSTO.getName();
		funcSTO.base = Registers.g0;
		
		generator.beginFunction(funcSTO);
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoFuncDecl_2() {
		FuncSTO func = m_symtab.getFunc();
		
		if (func.isError()) {
		}

		// TODO LOLOLOLL NEED TO FIX LOLO FUCK IT SHIP IT
		if (((FunctionPointerType) func.getType()).getReturnType() == null) {
			func.setReturnType(new VoidType());
		}
		if (m_returnMissingFlag && !func.getReturnType().isVoid()) {
			// if function type is not void, error
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error6c_Return_missing);
		}

		m_symtab.closeScope();
		m_symtab.setFunc(null);
		
		generator.endFunction(func);
	}

	// expression, codeblock, else
	STO DoIfStmt(STO _1) {
		if (_1.isError()) {
			return _1;
		}

		if (!(_1.getType().isBool())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error4_Test, _1
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error4_Test, _1
					.getType().getName()));
		} else {
			generator.doIfStmt(_1);
		}

		return _1;
	}
	
	//uhh
	void EnterIfStmt() {
		generator.enterIf();
	}
	
	void EnterElseStmt() {
		generator.enterElse();
	}

	Type DoFuncPointer(Type t, Vector<VarSTO> params, boolean isReference) {
		return new FunctionPointerType("function pointer", t, isReference, params);
	}

	// expression, codeblock
	STO DoWhileStmt(STO _1) {
		if (_1.isError()) {
			return _1;
		}
		inLoop++;


		if (!(_1.getType().isBool())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error4_Test, _1
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error4_Test, _1
					.getType().getName()));
		} else {
			//assembly here?
		}
		generator.doWhile(_1);
		return _1;
	}

	STO DoForeachStmt(STO id, STO list) {
		System.out.println(id.getName());
		System.out.println(id.offset + " " + id.base);
		if(id.isError()) {
			return id;
		}
		
		inLoop++;
		
		if (!list.getType().isArray()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12a_Foreach);
			return new ErrorSTO(ErrorMsg.error12a_Foreach);
		}
		
		ArrayType arr = (ArrayType) list.getType();
		Type containingType = arr.getContainingType();
		
		if (id.isVar()) {
			if (((VarSTO) id).getIsReference()) {
				if (!id.getType().isEquivalentTo(containingType)) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(
							ErrorMsg.error12r_Foreach, arr.getContainingType()
									.getName(), id.getName(), id.getType()
									.getName()));
					return new ErrorSTO("ERrror foreach: not equiv for reference");
				}
			} else {
				if (!containingType.isAssignableTo((id.getType()))) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error12v_Foreach,
							((ArrayType) list.getType()).getContainingType().getName(),
							id.getName(), id.getType().getName()));
					return new ErrorSTO("Error Foreach: assignableTo error.");
				}
			}
		}	
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		// i dont htink i finished this.
		ArrayType arrayType = (ArrayType) list.getType();
		STO iteration = new VarSTO(id.getName() + "_" + generator.forEachIteration, new IntegerType());
		func.addToStack(iteration.getType().getSize());
		iteration.offset = String.valueOf(-func.getStackSize());
		iteration.base = Registers.fp;
		generator.doForEach(id, list, iteration);
		//pretty sure this is the only way to reference the iteration in foreachend
		forStack.push(iteration);
		return iteration;
	}

	public void DoBreakStmt() {
		// probably have to do a breakstatementFlag
		if (inLoop == 0) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12_Break);
		}
		generator.doBreak();
	}

	public void DoContinueStmt() {
		// continueStatmementFlag
		if (inLoop == 0) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12_Continue);
		}
		
		generator.doContinue();
	}
	
	public void DoCloseLoop()	 {
		inLoop--;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoFormalParams(Vector<VarSTO> params) {
		// only one variable function in SymbolTable.java. is there a list of
		// functions somewhere?
		// idk
		FuncSTO func = m_symtab.getFunc();
		if (func == null) {
			m_nNumErrors++;
			m_errors.print("internal: DoFormalParams says no proc" + "!");
		} else {
			int numArgs = 0;
			
			if (currentStruct != null) {
				//TODO structs
				STO tsto = new ConstSTO("this", this.currentStruct);
				m_symtab.insert(tsto);
				currentStruct.setStructMembers(func);
			}
			
			if (params != null) {
				func.setParameters(params);
				// add parameters to the function's local scope...
				for (int i = 0; i < params.size(); i++) {
					VarSTO sto = (VarSTO)params.get(i);
					sto.base = Registers.fp;
					//magic number LOL
					//oh yeah forgot about structs.
					sto.offset = String.valueOf((68 + 4 * numArgs++));
					//TODO Extern
					generator.storeParameters(sto, i);
					m_symtab.insert(params.get(i));
				}
			}
			
		}

		// insert parameters here
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoBlockOpen() {
		// Open a scope.
		m_symtab.openScope();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoBlockClose() {
		m_symtab.closeScope();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoAssignExpr(STO stoDes, STO _2) {
		if(stoDes.isError()) {
			return stoDes;
		}
		
		if(_2.isError()) {
			return _2;
		}
		
		if (!stoDes.isModLValue()) {
			// Good place to do the assign checks
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error3a_Assign);
			return new ErrorSTO(ErrorMsg.error3a_Assign);
		}
		
		if (!_2.getType().isAssignableTo(stoDes.getType())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error3b_Assign, _2
					.getType().getName(), stoDes.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error3b_Assign, _2
					.getType().getName(), stoDes.getType().getName()));
		}
		if(_2.isConst()) {
			generator.storeConstant(stoDes, (ConstSTO)_2);
		} else {
			if(stoDes.getType().isStruct() && _2.getType().isStruct()) {
				generator.storeStruct(stoDes, _2);
			} 
			else if(stoDes.getType().getName().equals(_2.getType().getName())){
				generator.storeVariable(stoDes, _2);
			}else{
				generator.storeConvertedVar(stoDes, _2);
			}
		}

		return stoDes;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoFuncCall(STO sto, Vector<STO> arguments) {
		if (sto.isError()) {
			m_returnMissingFlag = false;
			return sto;
		}


		if (sto.isVar() && sto.getType() instanceof FunctionPointerType) {
			sto = new FuncSTO(sto.getName(), sto.getType());
		}

		if (!sto.isFunc()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_function,
					sto.getName()));
			return new ErrorSTO(sto.getName());
		}

		// casting is gets too complicated, just set a variable.
		FuncSTO funcSTOCast = (FuncSTO) sto;
 
		if (funcSTOCast.getParameters().size() != arguments.size()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error5n_Call,
					arguments.size(), funcSTOCast.getParameters().size()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error5n_Call,
					arguments.size(), funcSTOCast.getParameters().size()));
		}

		Vector<VarSTO> funcParams = funcSTOCast.getParameters();
		Vector<STO> args = arguments;
		boolean typeError = false;
		boolean referenceError = false;
		//boolean lValueError = false;

		for (int i = 0; i < funcParams.size(); i++) {

			String paramTypeName = funcParams.get(i).getType().getName();
			String argTypeName;
			VarSTO param = funcParams.get(i);
			VarSTO arg;
			STO argVal = args.get(i);

			if (param.getType() instanceof ArrayType){
				ArrayType ptr = (ArrayType)((ArrayType)param.getType()).clone();
				ptr.setContainingType(((ArrayType)argVal.getType()).getContainingType());
				
				if(param.getType().isTypeDef()){
					ptr.setName(argVal.getType().getName());
					ptr.setTypeDef(true);
				}
				
				VarSTO newVal = new VarSTO(argVal.getName(), ptr);
				args.set(i, newVal);
				argVal = newVal;
			}
			if (param.getIsReference()){
				if(!(argVal.getType().isEquivalentTo(param.getType()))){
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error5r_Call, argVal.getType().getName(), param.getName(), param.getType().getName()));
					typeError = true;
					continue;
				}
				if(!argVal.isModLValue()) {			
					// error
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error5c_Call,
							param.getName(), paramTypeName));
					referenceError = true;
					continue;
				}
			}
			
			if(!argVal.isError()) {
				if (argVal.isVar()) {
					arg = (VarSTO) args.get(i);
					argTypeName = arg.getType().getName();
				} else {
					// TODO arguments DO NOT HAVE TYPES LOL JK I WAS PASSING IN A
					// STRING
					arg = new VarSTO(args.get(i).getName(), args.get(i).getType());
					argTypeName = arg.getType().getName();
				}

				if (!arg.getType().isAssignableTo(param.getType())) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(
							ErrorMsg.error5a_Call, argTypeName,
							param.getName(), paramTypeName));
					typeError = true;
					// setting int to float, valid.
				}
				/*if(param.getIsReference()) {
					if(!arg.getIsReference() || !arg.getType().isEquivalentTo(param.getType())) {
						m_nNumErrors++;
						m_errors.print(Formatter.toString(ErrorMsg.error5r_Call,
								argTypeName, param.getName(), paramTypeName));
						referenceError = true;
					}
				}*/
			}
		}

		// might want to add another error check for lValueError. too lazy to
		// change now.
		if (typeError && referenceError) {
			return new ErrorSTO(
					"Both Function Parameter Types and Pass-by-reference invalid");
		} else if (typeError) {
			return new ErrorSTO("Function Parameter Types invalid");
		} else if (referenceError) {
			return new ErrorSTO("Function Pass-by-reference invalid");
		}

		VarSTO returnSTO = null;
		
		if(funcSTOCast.getIsReturnRefernece()) {
			returnSTO = new VarSTO(sto.getName() + "()", funcSTOCast.getReturnType());
			returnSTO.setIsModLValue(true);
		} else {
			returnSTO = new VarSTO(sto.getName() + "()", funcSTOCast.getReturnType());
			returnSTO.setIsModLValue(false);
		}
		FuncSTO func = m_symtab.getFunc();
		//fck need to have reference to main.
		if(m_symtab.getFunc() != null) {
			returnSTO = (VarSTO) executeFunction(func, sto, returnSTO, arguments);
		} else {
			returnSTO = (VarSTO) executeFunction(this.main, sto, returnSTO, arguments);
		}
		
		return returnSTO;
	}
	
	public STO executeFunction(FuncSTO function, STO functionBeingExecuted, STO returnSTO, Vector<STO> arguments) {
		
		FunctionPointerType funcExecuted = (FunctionPointerType) functionBeingExecuted.getType();
		
		Vector<VarSTO> parameters = funcExecuted.getParameters();
		
		int argCounter = 0;

		for(int i = 0; i < parameters.size(); i++) {
			generator.prepareArguments(arguments.get(i), parameters.get(i), argCounter++);
		}

		//fuck need counter
		generator.executeFunction(functionBeingExecuted);
		returnSTO.offset = String.valueOf(-(function.getStackSize() + returnSTO.getType().getSize()));
		returnSTO.base = Registers.fp;
		//save the stack
		function.addToStack(returnSTO.getType().getSize());
		
		if(!funcExecuted.getReturnType().isVoid()) {
			generator.saveReturn(returnSTO);
		}
		return returnSTO;
		
		
	}

	STO DoStarDereference(STO pointer) {
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		if (pointer.isError()) {
			return pointer;
		}
		if (!(pointer.getType() instanceof PointerType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error15_Receiver,
					pointer.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error15_Receiver,
					pointer.getType().getName()));
		}

		Type dereferenceType = ((PointerType) pointer.getType()).dereference();
		// not sure if this check is needed...
		if (dereferenceType == null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error15_Receiver,
					pointer.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error15_Receiver,
					pointer.getType().getName()));
		} else {
			STO rsto = new VarSTO("*" + pointer.getName(), dereferenceType);
			rsto.base = Registers.fp;
			rsto.offset = String.valueOf(-(func.getStackSize() + rsto.getType().getSize()));
			func.addToStack(rsto.getType().getSize());
			generator.doDereference(pointer, rsto);
			rsto.isDereferenced = true;
			return rsto;
		}
	}

	STO DoArrowDereference(STO pointer, String id) {
		STO b = DoStarDereference(pointer);
		return this.DoDesignator2_Dot(b, id);
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator2_Dot(STO sto, String strID) {
		
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		if (sto.isError()) {
			return sto;
		}
		if (!sto.getType().isStruct()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error14t_StructExp,
					sto.getName()));
			return new ErrorSTO("Struct " + sto.getName() + " does not exist");
		}

		STO member = ((StructType) sto.getType()).getMember(strID);
		
		if (member == null) {
			if (sto.getType().getName() == "this") {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(
						ErrorMsg.error14b_StructExpThis, strID));
				return new ErrorSTO(Formatter.toString(
						ErrorMsg.error14b_StructExpThis, strID));
			} else {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error14f_StructExp,
						strID, sto.getType().getName()));
				return new ErrorSTO("Member Field " + strID
						+ " does not exist in " + sto.getType().getName());
			}

		}
		if(member.base == null || member.offset == null) {
			String accessName = member.getName();
			StructType structType = (StructType) sto.getType();
			int offset = -sto.getType().getSize();
			Scope scope = structType.getScope();
			int accumulator = 0;
			int totalOffset = 0;
			
			for( STO mem : scope.accessAll()) {
				String memberName = mem.getName();
				if(accessName.equals(memberName)) {
					break;
				}
				
				if(mem.isFunc() == false) {
					accumulator += mem.getType().getSize();
				}
				
			}
			totalOffset = offset + Integer.parseInt(member.offset);
			
			member.base = Registers.fp;
			member.offset = String.valueOf(totalOffset);
		}
		return member;
	}

	STO DoGetThis() {
		STO structThis = m_symtab.accessLocal("this");

		if (structThis == null) {
			m_nNumErrors++;
			// m_errors.print();
			return new ErrorSTO("this does not exist in struct");
		}

		return structThis;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator2_Array(STO sto, STO index) {
		// Good place to do the array checks
		if (sto.isError()) {
			return sto;
		}

		// Tansen, Index can error because of ArrayDecl.
		if (index.isError()) {
			return index;
		}

		// do we care if we know if pointer or array?
		// also, probably cant use isAssignableTo

		if (sto.getType().isArray() || sto.getType().isPointer()) {
			if (index.getType().isInt()) {

				if (sto.getType().isArray()) {
					//array
					if (index.isConst()) {
						ConstSTO constIndex = (ConstSTO) index;

						// work on pointer types?
						if (constIndex.getIntValue() < ((ArrayType) sto
								.getType()).getArraySize() && constIndex.getIntValue() >= 0) {
							//
						} else {
							m_nNumErrors++;
							m_errors.print(Formatter.toString(
									ErrorMsg.error11b_ArrExp,
									constIndex.getIntValue(),
									((ArrayType) sto.getType()).getArraySize()));
							return new ErrorSTO(Formatter.toString(
									ErrorMsg.error11b_ArrExp,
									constIndex.getIntValue(),
									((ArrayType) sto.getType()).getArraySize()));
						}
					}
					
					
					ArrayType atyp = (ArrayType) sto.getType();
					STO ret = new ExprSTO(sto.getName() + "[" + index.getName()
							+ "]", atyp.getContainingType());
					//uhh assembly array access here?
					
					ret.setIsModLValue(true);
	
					ret.base = Registers.fp;
					if(m_symtab.getFunc() == null) {
						ret.offset = String.valueOf(-(main.getStackSize() + ret.getType().getSize()));
						ret.base = Registers.fp;
						main.addToStack(ret.getType().getSize());
					} else {
						ret.offset = String.valueOf(-(m_symtab.getFunc().getStackSize() + ret.getType().getSize()));
						ret.base = Registers.fp;
						m_symtab.getFunc().addToStack(ret.getType().getSize());
					}
					
					generator.doArrayDesignator(sto, index, ret);
					ret.isReference = true;
					return ret;
				} else {
					//pointer stuff
					PointerType ptyp = (PointerType) sto.getType();
					STO ret = new ExprSTO(sto.getName() + "[" + index.getName()
							+ "]", ptyp.getContainingType());
					ret.setIsModLValue(true);
					return ret;
				}
			} else {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error11i_ArrExp,
						index.getType().getName()));
				return new ErrorSTO(Formatter.toString(
						ErrorMsg.error11i_ArrExp, index.getType().getName()));
			}
		} else {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error11t_ArrExp, sto
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error11t_ArrExp,
					sto.getType().getName()));
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator3_ID(String strID, boolean isGlobal) {
		STO sto = null;
		String errorMessage = null;

		// check if global scope, else access it like a regular variable
		if (isGlobal) {
			sto = m_symtab.accessGlobal(strID);
			errorMessage = ErrorMsg.error0g_Scope;
		} else {
				sto = m_symtab.access(strID);

			// prepare error message for undecleared ID
			errorMessage = ErrorMsg.undeclared_id;
		}

		// the check if sto is STILL null, the variable does not exist anywhere.
		if (sto == null) {
			m_nNumErrors++;
			// push our error message through
			m_errors.print(Formatter.toString(errorMessage, strID));
			sto = new ErrorSTO(strID);
		}

		return sto;
	}

	STO doNew(STO s) {
		if (!s.isModLValue()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error16_New_var);
			return new ErrorSTO(ErrorMsg.error16_New_var);
		}

		if (!(s.getType() instanceof PointerType)) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error16_New, s.getType()
					.getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error16_New, s
					.getType().getName()));
		}
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		
		func.addToStack(s.getType().getSize());
		s.offset = String.valueOf(-(func.getStackSize()));
		s.base = Registers.fp;
		generator.doNew(s);
		return s;
	}

	STO doDelete(STO s) {
		if (s.isModLValue() == false) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error16_Delete_var);
			return new ErrorSTO(ErrorMsg.error16_Delete_var);
		}
		if (s.getType() instanceof PointerType == false) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error16_Delete, s
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error16_Delete, s
					.getType().getName()));
		}
		generator.doDelete(s);
		return s;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoQualIdent(String strID) {
		STO sto;
		
		if ((sto = m_symtab.access(strID)) == null) {

			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
			return new ErrorSTO(strID);
		}

		if (!sto.isTypedef()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_type, sto.getName()));
			return new ErrorSTO(sto.getName());
		}
		return sto;
	}

	// string is "pre" or "post"
	public STO DoUnaryOp(UnaryOp _2, STO _1, String string) {		
		if (_1.isError()) {
			return _1;
		}

		STO sto = _2.validateOperand(_1, string);

		if (sto.isError()) {
			m_nNumErrors++;
			m_errors.print(sto.getName());
			return sto;
		}
		
		if(_1.isConst()) {
			ConstSTO expr = (ConstSTO) _1;
			STO result = _2.evaluateOperand(expr);
			
			if(result.isError()) {
				m_nNumErrors++;
				m_errors.print(result.getName());
			}
			
			return result;
		} 
		
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		
		sto.base = Registers.fp;
		sto.offset = String.valueOf(-(func.getStackSize() + sto.getType().getSize()));
		
		func.addToStack(sto.getType().getSize());
		
		generator.doUnaryOp(_2, _1, sto, string);
		return sto;
	}

	public STO DoBinaryOp(STO _1, BinaryOp _2, STO _3) {
		if (_1.isError()) {
			return _1;
		}

		if (_3.isError()) {
			return _3;
		}

		STO sto = _2.validateOperand(_1, _3);

		if (sto.isError()) {
			m_nNumErrors++;
			m_errors.print(sto.getName());
		} else {
			
			if (_1.isConst() && _3.isConst()) {
				ConstSTO leftOperand = (ConstSTO) _1;
				ConstSTO rightOperand = (ConstSTO) _3;
				
				// may not be const, cannot make it ConstSTO directly.
				STO result = _2.evaluateOperand(leftOperand, _2, rightOperand,
						sto.getType());
				
				if (result.isError()) {
					// error
					m_nNumErrors++;
					m_errors.print(result.getName());
				} 
				result.setIsAddressable(false);
				result.setIsModifiable(false);
				
				if(result.getType().isFloat()){
					result.offset = Strings.assignFloat + generator.stringLits;
					result.base = Registers.g0;
					generator.assignFloat((ConstSTO)result);
				} else {
					FuncSTO func = m_symtab.getFunc();
					
					if(func == null) {
						func = main;
					}
					func.addToStack(result.getType().getSize());
					result.offset = String.valueOf(-(func.getStackSize()));
					result.base = Registers.fp;
				}
				generator.evaluateBinary(leftOperand, rightOperand, _2, result);
				return result;
			} else {
				if(m_symtab.getFunc() == null) {
					sto.base = Registers.fp;
					sto.offset = String.valueOf(-(main.getStackSize() + sto.getType().getSize()));
					main.addToStack(sto.getType().getSize());
				} else {
					sto.base = Registers.fp;
					sto.offset = String.valueOf(-(m_symtab.getFunc().getStackSize() + sto.getType().getSize()));
					m_symtab.getFunc().addToStack(sto.getType().getSize());
				}
				generator.evaluateBinary(_1, _3, _2, sto);
			}
		}
		return sto;
	}
	
	public void DoShortCircuit(STO sto, BinaryOp op, AssemblyGenerator generator){
		if(sto.isError()){
			return;
		}		
		
		generator.generateComment("Short-circuiting " + op.getName() + " with " + sto.getName());
		generator.loadVariable(Registers.l1, sto);
		generator.generateASM(Strings.two_param, Instructions.cmp, Registers.l1, Registers.g0);
		if(op.getName().equals("||")){
			generator.generateASM(Strings.one_param,Instructions.bne, Strings.orT + generator.orCount);
		}else{
			generator.generateASM(Strings.one_param,Instructions.be,Strings.andF + generator.andCount);
		}
		generator.generateASM(Strings.nop);
	}

	public STO DoComparisonOp(STO _1, ComparisonOp _2, STO _3) {
		if (_1.isError()) {
			return _1;
		}

		if (_3.isError()) {
			return _3;
		}

		STO sto = _2.validateOperand(_1, _3);

		if (sto.isError()) {
			m_nNumErrors++;
			m_errors.print(sto.getName());
			return sto;
		}
		FuncSTO func = null;
		if(m_symtab.getFunc() == null) {
			func = main;
		} else {
			func = m_symtab.getFunc();
		}
		
		sto.offset = String.valueOf(-(func.getStackSize() + sto.getType().getSize()));
		sto.base = Registers.fp;
		func.addToStack(sto.getType().getSize());
		generator.evaluateComparison(_1, _2, _3, sto);
		return sto;
	}

	public STO DoReturnCheck(STO expr) {
		FuncSTO func = m_symtab.getFunc();
		if(m_symtab.getFunc() == null) {
			func = main;
		}
		STO returnSTO = expr;

		if (expr == null) {
			if (!func.getReturnType().isVoid()) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6a_Return_expr);
				m_returnMissingFlag = false;
				return new ErrorSTO(ErrorMsg.error6a_Return_expr);
			} else {
				m_returnMissingFlag = false;
				generator.doVoidReturn(func);
				return expr;// this should be fine since
				// a return; on a void is FINE.
			}

		} else {
			if (func.getReturnType().isVoid()) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error6a_Return_type,
						expr.getType().getName(), func.getReturnType()
								.getName()));
				m_returnMissingFlag = false;
				return new ErrorSTO(Formatter.toString(
						ErrorMsg.error6a_Return_type, expr.getType().getName(),
						func.getReturnType().getName()));
			}
			
		}

		// i THINK this is correct?
		if (func.getIsReturnRefernece()) {
			if (!func.getReturnType().isEquivalentTo(expr.getType())) {
				// return exists
				m_nNumErrors++;
				m_errors.print(Formatter.toString(
						ErrorMsg.error6b_Return_equiv,
						expr.getType().getName(), func.getReturnType()
								.getName()));
				return new ErrorSTO(Formatter.toString(
						ErrorMsg.error6b_Return_equiv,
						expr.getType().getName(), func.getReturnType()
								.getName()));
			} else if (!expr.isModLValue()) {
				m_returnMissingFlag = false;
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6b_Return_modlval);
				return new ErrorSTO(ErrorMsg.error6b_Return_modlval);
			}
			m_returnMissingFlag = false;
		} else {
			// we really need to refactor this to have each type include
			// isEquivalent or isAssignable.
			if (!expr.getType().isAssignableTo(func.getReturnType())) {
				m_returnMissingFlag = false;
				m_nNumErrors++;
				m_errors.print(Formatter.toString(
						ErrorMsg.error6a_Return_type, expr.getType()
								.getName(), func.getReturnType().getName()));
				return new ErrorSTO(Formatter.toString(
						ErrorMsg.error6a_Return_type, expr.getType()
								.getName(), func.getReturnType().getName()));
			}
			m_returnMissingFlag = false;
		}

		// handles if no else cases.
		if (blockLevel == m_symtab.getLevel()) {
			m_returnMissingFlag = false;
		} else {
			m_returnMissingFlag = true;
		}
		generator.doReturn(returnSTO, func);
		return returnSTO;
	}

	public STO DoExitStmt(STO expr) {
		if(expr.isError()) {
			return expr;
		}
		if (!(expr.getType().getName() == "int")) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error7_Exit, expr
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error7_Exit, expr
					.getType().getName()));
		}
		
		generator.DoExitStmt(expr);
		return expr;
	}

	public STO DoSizeOf(STO sto) {
		// is sto target valid for checking size?
		if (sto == null || !sto.getIsAddressable()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error19_Sizeof);
			return new ErrorSTO(ErrorMsg.error19_Sizeof);
		}

		// is the sto a nulltype?
		if (sto.getType() == null) {
			return new ErrorSTO(ErrorMsg.error19_Sizeof);
		}

		// functions don't have size (?)
		return new ConstSTO((sto instanceof FuncSTO) ? "0" : ("" + sto
				.getType().getSize()), new IntegerType(), false, false);
	}

	public STO DoSizeOf(Type t) {
		// no type?
		if (t == null) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error19_Sizeof);
			return new ErrorSTO(ErrorMsg.error19_Sizeof);
		}

		return new ConstSTO("" + t.getSize(), new IntegerType());
	}

	public STO DoTypeCast(Type t, STO sto) {
		if (sto.isError()) {
			return sto;
		}
		
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		
		STO typeCast = sto;
		// target is okay to cast on
		if (sto.getType().isBool() || sto.getType().isFloat() || sto.getType().isInt()) {
			// cast type is okay
			// const
			if (sto.isConst()) {
				//cant assign new const yet.
				ConstSTO csto = null;
				// casting float as int?
				if (t instanceof IntegerType && sto.getType() instanceof FloatType) {
					csto = new ConstSTO(String.valueOf(((ConstSTO) sto).getIntValue()), t);
				} else if(t instanceof FloatType && sto.getType().isInt()){
					csto = new ConstSTO(String.valueOf(((ConstSTO) sto).getValue()), t);
					assignFloat(csto);
				} else if(t instanceof BooleanType) {
					if(((ConstSTO) sto).getIntValue() == 0) {
						csto = new ConstSTO("false", t);
					} else {
						csto = new ConstSTO("true", t);
					}
				} else if(sto.getType().isBool()) {
					if(t.isInt()) {
						csto = new ConstSTO("1", t);
					} else if(t.isFloat()) {
						csto = new ConstSTO("1.0", t);
					}
				}
				return csto;
			} else if(sto.getType() instanceof PointerType) {
				
			} else if( t instanceof PointerType) {
				
			}
			// alias
			else {
				typeCast = new ExprSTO(sto.getName(), t);
				// result of cast is r value
				typeCast.setIsModLValue(false);
				
				func.addToStack(typeCast.getType().getSize());
				typeCast.offset = String.valueOf(-(func.getStackSize()));
				typeCast.base = Registers.fp;
				
				generator.doTypeCast(typeCast, sto);
				return typeCast;
			}
		}

		// invalid cast
		m_nNumErrors++;
		m_errors.print(Formatter.toString(ErrorMsg.error20_Cast, sto.getType()
				.getName(), t.getName()));

		return sto;
	}

	public STO DoAddressOf(STO sto) {
		// is the target sto even addressable?
		if (sto.getIsAddressable()) {
			// returned sto is a pointertype sto to the target sto's type
			Type t = (sto.getType() instanceof ArrayType) ? ((ArrayType) sto
					.getType()).getContainingType() : sto.getType();

			PointerType ptr = new PointerType();
			ptr.setContainingType(t);
			ExprSTO rsto = new ExprSTO("&" + sto.getName(), ptr);
			rsto.setIsModifiable(false);
			rsto.setIsAddressable(false);
			FuncSTO func = m_symtab.getFunc();
			
			if(func == null) {
				func = main;
			}
			
			func.addToStack(rsto.getType().getSize());
			rsto.base = Registers.fp;
			rsto.offset = String.valueOf(-func.getStackSize());
			generator.doAddressOf(sto, rsto);
			return rsto;
		} // not addressible
		else {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error21_AddressOf, sto
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error21_AddressOf,
					sto.getType().getName()));
		}
	}

	public void doCout(STO sto) {
		if(sto != null || !sto.isError()) {
			if(sto.isConst()) {
				if(sto.getType() == null) {
					//string literal, though im not sure if this is the correct way to do it
					
					generator.printString(sto.getName());
				} else {
					if(sto.getType().isInt()) {
						generator.doPrintConstInt("" + ((ConstSTO) sto).getIntValue());
					} else if(sto.getType().isFloat()) {
						generator.doPrintConstFloat("" + ((ConstSTO) sto).getValue());
					} else if(sto.getType().isBool()) {
						generator.doPrintConstBool("" + ((ConstSTO) sto).getBoolValue());
					}
				}
			} else {
				if(sto.getType().isInt()) {
					generator.printInt(sto);
				} else if(sto.getType().isFloat()) {
					generator.printFloat(sto);
				} else if(sto.getType().isBool()) {
					generator.printBool(sto);
				} else {
					//uh oh.
				}
			}
		}
	}
	
	public void doCoutEndl() {
		generator.doCoutEndl();
	}
	
	//discussion 
	public ConstSTO assignFloat(ConstSTO sto) {
		
		sto.offset = Strings.assignFloat + generator.stringLits;
		sto.base = Registers.g0;
		//second level, assembly stuff should go in assemblygenerator
		return generator.assignFloat(sto);
	}
	
	//not sure we need this.
	//this is a rehash of doData
	public void assignFloat(STO des, STO value) {

		value.offset = Strings.assignFloat + generator.stringLits;
		value.base = Registers.g0;
		des.offset = Strings.assignFloat + generator.stringLits;
		des.base = Registers.g0;
		generator.assignFloat(des, value);
	}
	
	//yeah. later
	
	public STO doNegate(STO sto) {
		STO returnSTO = sto;
		FuncSTO func = m_symtab.getFunc();
		
		if(func == null) {
			func = main;
		}
		
		func.addToStack(returnSTO.getType().getSize());
		
		returnSTO.base = Registers.fp;
		returnSTO.offset = String.valueOf(-func.getStackSize());
		
		return generator.doNegate(sto, returnSTO);
	}
	
	public void DoCIN(STO sto){
		generator.DoCIN(sto);
	}
	
	public void DoWhileEnd() {
		generator.endWhile();
	}
	
	public void startWhile() {
		generator.startWhile();
	}
	
	public void doEndForLoop(STO _1, STO _2) {
		STO iteration = forStack.pop();
		
		//id, list, iteration
		generator.endForEachStmt(_1, _2, iteration);
		
		
	}
}
