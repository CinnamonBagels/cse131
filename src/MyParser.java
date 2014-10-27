//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

import java_cup.runtime.*;

import java.util.*;

import Operator.*;
import STO.*;
import STO.Scope;
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
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoVarDecl(Hashtable lstIDs, Type t) {
		Enumeration<VarSTO> e = lstIDs.keys();

		// for (int i = 0; i < lstIDs.size(); i++)
		while (e.hasMoreElements()) {
			VarSTO sto = e.nextElement();
			////system.out.println(sto.getName());
			
			if(sto.getType() == null || sto.getType().isVoid()) {
				//
				sto.setType(t);
			}
			
			if(sto.getType().isArray() || sto.getType().isPointer()) {
				DoSetSubType(t, sto.getType());
			}

			String idName = sto.getName();

			if (m_symtab.accessLocal(idName) != null && currentStruct == null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id,sto.getName()));
			} else if(m_symtab.accessLocal(idName) != null && currentStruct != null) { //else if(m_symtab.accessLocal(idName) != null && currentStruct != null)
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error13a_Struct,sto.getName()));
			}
			
			m_symtab.insert(sto);
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoIterationVarDecl(STO sto) {
		if (m_symtab.accessLocal(sto.getName()) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id,
					sto.getName()));
		}

		m_symtab.insert(sto);
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
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoConstDecl(Hashtable lstIDs, Type t) {
		Enumeration<STO> e = lstIDs.keys();

		// for (int i = 0; i < lstIDs.size(); i++)
		// ////system.out.println("wut");
		while (e.hasMoreElements()) {
			STO id = e.nextElement();
			// ////system.out.println("wut");
			if (m_symtab.accessLocal(id.getName()) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id,
						id.getName()));
			} else {
				// ////system.out.println(id);

				if (id.isError()) {
					// ////system.out.println("wut");
					continue;
				}
				if (id.isConst()) {
					// ////system.out.println("wut");
					if (!id.getType().isAssignableTo(t)) {
						m_nNumErrors++;
						m_errors.print(Formatter.toString(
								ErrorMsg.error8_Assign, id.getType().getName(),
								t.getName()));
					} else {
						// ////system.out.println("here");
						// ////system.out.println(((ConstSTO)
						// lstIDs.get(id)).getValue());
						ConstSTO sto = new ConstSTO(id.getName(), id.getType(),
								((ConstSTO) id).getValue());
						m_symtab.insert(sto);
					}

				} else {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(
							ErrorMsg.error8_CompileTime, id.getName()));
				}
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

			TypedefSTO sto = new TypedefSTO(id, t);
			m_symtab.insert(sto);
		}
	}
	
	//dont need string id
	
	STO DoStructdef(String id) {
		if(m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			return new ErrorSTO(Formatter.toString(ErrorMsg.redeclared_id, id));
		}
		
		TypedefSTO sto = new TypedefSTO(id, new StructType(id));
		m_symtab.insert(sto);

		this.currentStruct = (StructType) sto.getType();
		return sto;
	}
	
	void DoStructScope(String id) {
		//need current struct
		Scope scope = m_symtab.scopePeek();
		currentStruct.setScope(scope);
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoStructdefDecl(String id) {
		////system.out.println(currentStruct.getName());
		//Tansen, this does a check so that recursive structs cannot be within the struct itself.
		//However, recursive Struct POINTERS ARE VALID. the check should go HERE.
		for(STO x : currentStruct.getAllMembers()) {
			if(x.getType().getName() == currentStruct.getName()) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error13b_Struct, x.getType().getName()));
			}
		}
		
//		////system.out.println(currentStruct.get)
	}

	STO DoCreateDeclaration(String id, Type pointerType, Type arrayType) {

		VarSTO sto = new VarSTO(id);
		////system.out.println("I am here");
		if (pointerType != null) {
			sto = new VarSTO(id, pointerType);
		}

		// array overwrites pointer
		if (arrayType != null) {
			sto = new VarSTO(id, arrayType);
			////system.out.println("I am herew");
		}

		return sto;
	}

	Type DoArrayDecl(STO index) {
		if (!index.getType().isInt()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error10i_Array, index
					.getType().getName()));
			index = new ErrorSTO(Formatter.toString(ErrorMsg.error10i_Array,
					index.getType().getName()));
		} else if (!(index.isConst())) {
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
			// ////system.out.println(((ConstSTO) index).getIntValue());
			return new ArrayType(null, ((ConstSTO) index).getIntValue());
		}

		// if code gets here, that means it errored somewhere up in the block of
		// code ^.
		return new ArrayType(null, 0);
	}
	
	//inner type, containing type, can be only arraytype or pointer type
	Type DoSetSubType(Type innerType, Type outerType) {
		
		////system.out.println(innerType);
		////system.out.println(innerType.getName());
		if(outerType.isArray()) {
			((ArrayType) outerType).setContainingType(innerType);
		} else {
			((PointerType) outerType).setContainingType(innerType);
		}
		
		return innerType;
	}
 
	// ----------------------------------------------------------------
	// id is func name, type is return type, isReturnReference self explan/
	// ----------------------------------------------------------------
	void DoFuncDecl_1(String id, Type t, boolean isReturnReference) {
		
		m_returnMissingFlag = true;
		if (m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		FuncSTO sto = new FuncSTO(id, new FunctionPointerType("id"));
		System.out.println(id);

		sto.setReturnType(t);
		sto.setIsReturnRefernece(isReturnReference);
		// ////system.out.println(sto.getType());
		m_symtab.insert(sto);
		m_symtab.openScope();
		m_symtab.setFunc(sto);
		// get level AFTER you open scope.
		blockLevel = m_symtab.getLevel();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoFuncDecl_2() {
		FuncSTO func = m_symtab.getFunc();

		if (func.isError()) {
			////system.out.println("error here");
		}
		System.out.println(func.getName());
		System.out.println(((FunctionPointerType)func.getType()).getReturnType());
		
		//TODO LOLOLOLL NEED TO FIX LOLO FUCK IT SHIP IT
		if(((FunctionPointerType)func.getType()).getReturnType() == null) {
			func.setReturnType(new VoidType());
		}
		if (m_returnMissingFlag && !func.getReturnType().isVoid()) {
			// if function type is not void, error
			// ////system.out.println(func.getReturnType().isVoid());
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error6c_Return_missing);
		}

		m_symtab.closeScope();
		m_symtab.setFunc(null);
	}

	// expression, codeblock, else
	STO DoIfStmt(STO _1, STO _2, STO _3) {
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
			// evaluate
		}

		return _1;
	}

	// expression, codeblock
	STO DoWhileStmt(STO _1, STO _2) {
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
			// evaluate
		}

		return _1;
	}

	STO DoForeachStmt(STO id, STO list) {
		//////system.out.println(id.getType());
		//////system.out.println(list.getType());
		
		
		if (!list.getType().isArray()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12a_Foreach);
			return new ErrorSTO(ErrorMsg.error12a_Foreach);
		}
		ArrayType arr = (ArrayType) list.getType();
		
		if(!arr.isInnerTypeAssignableTo((id.getType()))) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error12v_Foreach, ((ArrayType)list.getType()).getContainingType().getName(), id.getName(), id.getType().getName()));
			return new ErrorSTO("Error Foreach: assignableTo error.");
		}
		////system.out.println(arr.isInnerTypeAssignableTo((id.getType())));
		if(id.isVar()) {
			if(((VarSTO) id).getIsReference()) {
				if(!arr.isInnerTypeEquivalentTo((id.getType()))) {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error12r_Foreach, arr.getContainingType().getName(), id.getName(), id.getType().getName()));
				}
			}
		}

		ArrayType arrayType = (ArrayType) list.getType();
		return null;
	}
	
	public void DoBreakStmt() {
		
		//probably have to do a breakstatementFlag
		if(blockLevel == m_symtab.getLevel()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12_Break);
		}
	}
	
	public void DoContinueStmt() {
		//continueStatmementFlag
		if(blockLevel == m_symtab.getLevel()) {
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error12_Continue);
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoFormalParams(Vector<VarSTO> params) {
		// only one variable function in SymbolTable.java. is there a list of
		// functions somewhere?
		// idk
		// //////system.out.println("here");
		FuncSTO func = m_symtab.getFunc();
		// //////system.out.println("here");
		if (func == null) {
			m_nNumErrors++;
			m_errors.print("internal: DoFormalParams says no proc" + "!");
		} else {
			// //////system.out.println("here set params");

			if (params != null) {
				// //////system.out.println(params.get(0).getType());
				func.setParameters(params);
				// //////system.out.println("here");
				// add parameters to the function's local scope...
				for (int i = 0; i < params.size(); i++) {
					m_symtab.insert(params.get(i));
					// ////system.out.println(params.get(i).getIsReference());
				}
				// //////system.out
				// .println("there are " + params.size() + " parameters");
			}
			
			if(currentStruct != null) {
				m_symtab.insert(new ConstSTO("this", this.currentStruct));
				currentStruct.setStructMembers(func);
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
		// //////system.out.println(stoDes.getName());
		// //////system.out.println(stoDes.isModLValue());
		if (!stoDes.isModLValue()) {
			// Good place to do the assign checks
			m_nNumErrors++;
			m_errors.print(ErrorMsg.error3a_Assign);
			return new ErrorSTO(ErrorMsg.error3a_Assign);
		}

		// type conflict check.
		if (!stoDes.getType().getName().equals(_2.getType().getName())) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error3b_Assign, _2
					.getType().getName(), stoDes.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error3b_Assign, _2
					.getType().getName(), stoDes.getType().getName()));
		}

		stoDes = _2;
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
		
		System.out.println(((FunctionPointerType)sto.getType()).getReturnType());
		
		if(sto.isVar() && sto.getType() instanceof FunctionPointerType) {
			sto = new FuncSTO(sto.getName(), sto.getType());
			//System.out.println(((FunctionPointerType)sto.getType()).getReturnType());
		}
		
		////system.out.println(sto.getClass());

		if (!sto.isFunc()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_function,
					sto.getName()));
			return new ErrorSTO(sto.getName());
		}
		
		

		// casting is gets too complicated, just set a variable.
		FuncSTO funcSTOCast = (FuncSTO) sto;
		
		System.out.println(funcSTOCast.getParameters().size());

		// //////system.out.println(funcSTOCast.getParameters().get(0).getType());
		// //////system.out.println(arguments.size());

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
		boolean lValueError = false;

		for (int i = 0; i < funcParams.size(); i++) {

			String paramTypeName = funcParams.get(i).getType().getName();
			String argTypeName;
			VarSTO param = funcParams.get(i);
			VarSTO arg;
			STO arglModCheck = args.get(i);

			if (param.getIsReference() && !arglModCheck.isModLValue()) {
				// error
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5c_Call,
						param.getName(), paramTypeName));
			}

			if (args.get(i).isVar()) {
				arg = (VarSTO) args.get(i);
				argTypeName = arg.getType().getName();
			} else {
				// TODO arguments DO NOT HAVE TYPES LOL JK I WAS PASSING IN A
				// STRING
				arg = new VarSTO(args.get(i).getName(), args.get(i).getType());
				argTypeName = arg.getType().getName();
			}

			// //////system.out.println(funcParams.get(i).getType() instanceof
			// IntegerType);
			// //////system.out.println(paramName);
			// //////system.out.println(argName);
			// ////system.out.println(arg.getIsModifiable());
			// ////system.out.println(arg.getIsAddressable());

			if (!paramTypeName.equals(argTypeName)) {
				if (!(paramTypeName.equals("float") && argTypeName
						.equals("int"))) {
					if (!(paramTypeName.equals("pointer") && argTypeName
							.equals("array"))) {
						// error
						m_nNumErrors++;
						m_errors.print(Formatter.toString(
								ErrorMsg.error5a_Call, argTypeName,
								param.getName(), paramTypeName));
						typeError = true;
					}
					// setting array to pointer, valid.
				}
				// setting int to float, valid.
			}
			// type = type
			// //////system.out.println(arg.getIsReference());
			if (param.getIsReference() && !arg.getIsReference()) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5r_Call,
						argTypeName, param.getName(), paramTypeName));
				referenceError = true;
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

		return sto;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator2_Dot(STO sto, String strID) {
		if(sto.isError()) {
			return sto;
		}
		//////system.out.println(sto.getType());
		if(!sto.getType().isStruct()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error14t_StructExp, sto.getName()));
			return new ErrorSTO("Struct " + sto.getName() + " does not exist");
		}
		
		STO member = ((StructType)sto.getType()).getMember(strID);
		
		if(member == null) {
			if(sto.getType().getName() == "this") {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error14b_StructExpThis, strID));
				return new ErrorSTO(Formatter.toString(ErrorMsg.error14b_StructExpThis, strID));
			} else {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error14f_StructExp, strID, sto.getType().getName()));
				return new ErrorSTO("Member Field " + strID + " does not exist in " + sto.getType().getName());
			}
			
		}
		System.out.println(sto.getName());
		////system.out.println(member.getType());
		
//		if(member.isFunc()) {
//			return new FuncSTO(sto.getName() + "." + strID, member.getType());
//		}
//		if(member.isFunc())
//		System.out.println(((FunctionPointerType)member.getType()).getReturnType());
		return new VarSTO(sto.getName() + "." + strID, member.getType());
	}
	
	STO DoGetThis() {
		STO structThis = m_symtab.accessLocal("this");
		
		if(structThis == null) {
			m_nNumErrors++;
			//m_errors.print();
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
				if (index.isConst()) {
					ConstSTO constIndex = (ConstSTO) index;
					if(sto.getType().isArray()) {
						//work on pointer types?
						if (constIndex.getIntValue() < ((ArrayType)sto.getType()).getArraySize()) {
							//
						} else {
							m_nNumErrors++;
							m_errors.print(Formatter.toString(
									ErrorMsg.error11b_ArrExp, constIndex
											.getIntValue(), ((ArrayType)sto.getType()).getArraySize()));
							return new ErrorSTO(
									Formatter.toString(ErrorMsg.error11b_ArrExp,
											constIndex.getIntValue(), ((ArrayType)sto.getType()).getArraySize()));
						}
					}
					
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

		return sto;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator3_ID(String strID, boolean isGlobal) {
		STO sto = null;
		String errorMessage = null;
		////system.out.println(strID);

		// check if global scope, else access it like a regular variable
		if (isGlobal) {
			sto = m_symtab.accessGlobal(strID);
			errorMessage = ErrorMsg.error0g_Scope;
		} else {
			if (sto == null) {
				sto = m_symtab.access(strID);
			}

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
		STO sto = null;
		if (_1.isError()) {
			return _1;
		}

		if (string.equals("pre")) {
			sto = _2.validateOperand(_1, string);
		} else {
			// post
			sto = _2.validateOperand(_1, string);
		}

		if (sto.isError()) {
			m_nNumErrors++;
			m_errors.print(sto.getName());
			return sto;
		}
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

				if (!result.isError()) {
					if (result.isConst()) {
						// need to cast as const
						ConstSTO constResult = (ConstSTO) result;
						////system.out.println(constResult.getValue());

						if (constResult.getType().isInt()) {
							return new ConstSTO("Arithmetic Result Value",
									new IntegerType(), constResult.getValue());
						} else {
							return new ConstSTO("Arithmetic Result Value",
									new FloatType(), constResult.getValue());
						}
					} else {
						return result;
					}
				} else {
					// error
					m_nNumErrors++;
					m_errors.print(result.getName());
					return result;
				}
			}
		}
		return sto;
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
		return sto;
	}

	public STO DoReturnCheck(STO expr) {
		// ////system.out.println("here");
		FuncSTO func = m_symtab.getFunc();
		// //////system.out.println("" + func.getReturnType().isVoid() == null);
		STO returnSTO = expr;
		// ////system.out.println(func.getReturnType());
		// ////system.out.println(expr.getType());

		if (expr == null) {
			if (!func.getReturnType().isVoid()) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6a_Return_expr);
				m_returnMissingFlag = false;
				return new ErrorSTO(ErrorMsg.error6a_Return_expr);
			} else {
				m_returnMissingFlag = false;
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
				m_returnMissingFlag = false;
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
			if (!(func.getReturnType().getName() == expr.getType().getName())) {
				if (expr.getType().isAssignableTo(func.getReturnType())) {
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
		}
		// ////system.out.println(blockLevel);
		// ////system.out.println(m_symtab.getLevel());
		// handles if no else cases.
		if (blockLevel == m_symtab.getLevel()) {
			m_returnMissingFlag = false;
		}
		return returnSTO;
	}

	public STO DoExitStmt(STO expr) {
		if (!(expr.getType().getName() == "int")) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error7_Exit, expr
					.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error7_Exit, expr
					.getType().getName()));
		}

		return expr;
	}

	public STO DoReferenceOP(STO sto) {
		return null;
	}

	public Type DoDereferenceOp(STO sto) {
		return null;
	}
}
