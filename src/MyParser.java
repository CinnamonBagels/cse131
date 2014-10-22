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
		Enumeration<String> e = lstIDs.keys();

		// for (int i = 0; i < lstIDs.size(); i++)
		while (e.hasMoreElements()) {
			String id = e.nextElement();

			if (m_symtab.accessLocal(id) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}

			VarSTO sto = new VarSTO(id, t);
			m_symtab.insert(sto);
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoIterationVarDecl(String id) {
		if (m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		VarSTO sto = new VarSTO(id);
		m_symtab.insert(sto);
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoExternDecl(Vector<String> lstIDs) {
		for (int i = 0; i < lstIDs.size(); i++) {
			String id = lstIDs.elementAt(i);

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
		Enumeration<String> e = lstIDs.keys();

		// for (int i = 0; i < lstIDs.size(); i++)				
		while (e.hasMoreElements()) {
			String id = e.nextElement();

			if (m_symtab.accessLocal(id) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			} else {
				STO var = (STO) lstIDs.get(id);
				
				if(var.isConst()) {
					if(!var.getType().isAssignableTo(t)) {
						m_nNumErrors++;
						m_errors.print(Formatter.toString(ErrorMsg.error8_Assign, var.getType().getName(), t.getName()));
					} else {
						ConstSTO sto = new ConstSTO(id, t, ((ConstSTO) lstIDs.get(id)).getValue());
						m_symtab.insert(sto);
					}
					
				} else {
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error8_CompileTime, var.getName()));
				}
			}
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoTypedefDecl(Vector<String> lstIDs) {
		for (int i = 0; i < lstIDs.size(); i++) {
			String id = lstIDs.elementAt(i);

			if (m_symtab.accessLocal(id) != null) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}

			TypedefSTO sto = new TypedefSTO(id);
			m_symtab.insert(sto);
		}
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoStructdefDecl(String id) {
		if (m_symtab.accessLocal(id) != null) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}

		TypedefSTO sto = new TypedefSTO(id);
		m_symtab.insert(sto);
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

		FuncSTO sto = new FuncSTO(id);
		
		sto.setReturnType(t);
		sto.setIsReturnRefernece(isReturnReference);
		System.out.println(sto.getType());
		m_symtab.insert(sto);
		m_symtab.openScope();
		m_symtab.setFunc(sto);
		//get level  AFTER you open scope.
		blockLevel = m_symtab.getLevel();
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoFuncDecl_2() {
		FuncSTO func = m_symtab.getFunc();
		
		if(func.isError()) {
			System.out.println("error here");
		}
		
		if(m_returnMissingFlag) {
			//if function type is not void, error
			System.out.println(func.getReturnType().isVoid());
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

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	void DoFormalParams(Vector<VarSTO> params) {
		// only one variable function in SymbolTable.java. is there a list of
		// functions somewhere?
		// idk
		////system.out.println("here");
		FuncSTO func = m_symtab.getFunc();
		////system.out.println("here");
		if (func == null) {
			m_nNumErrors++;
			m_errors.print(""
					+ "!");
		} else {
			////system.out.println("here set params");

			if (params != null) {
				////system.out.println(params.get(0).getType());
				func.setParameters(params);
				////system.out.println("here");
				// add parameters to the function's local scope...
				for (int i = 0; i < params.size(); i++) {
					m_symtab.insert(params.get(i));
					//system.out.println(params.get(i).getIsReference());
				}
				////system.out
					//	.println("there are " + params.size() + " parameters");
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
		////system.out.println(stoDes.getName());
		////system.out.println(stoDes.isModLValue());
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

		if (!sto.isFunc()) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_function,
					sto.getName()));
			return new ErrorSTO(sto.getName());
		}

		// casting is gets too complicated, just set a variable.
		FuncSTO funcSTOCast = (FuncSTO) sto;

//		//system.out.println(funcSTOCast.getParameters().get(0).getType());
//		//system.out.println(arguments.size());

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
		
		for(int i = 0; i < funcParams.size(); i++) {
			
			String paramTypeName = funcParams.get(i).getType().getName();
			String argTypeName;
			VarSTO param = funcParams.get(i);
			VarSTO arg;
			STO arglModCheck = args.get(i);
			
			if(param.getIsReference() && !arglModCheck.isModLValue()) {
				//error
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5c_Call, param.getName(), paramTypeName));
			}
			
			if(args.get(i).isVar()) {
				arg = (VarSTO) args.get(i);
				argTypeName  = arg.getType().getName();
			} else {
				//TODO arguments DO NOT HAVE TYPES LOL JK I WAS PASSING IN A STRING
				arg = new VarSTO(args.get(i).getName(), args.get(i).getType());
				argTypeName = arg.getType().getName();
			}
			
//			//system.out.println(funcParams.get(i).getType() instanceof IntegerType);
//			//system.out.println(paramName);
//			//system.out.println(argName);
			//system.out.println(arg.getIsModifiable());
			//system.out.println(arg.getIsAddressable());
			
	
			if(!paramTypeName.equals(argTypeName)) {
				if(!(paramTypeName.equals("float") && argTypeName.equals("int"))) {
					if(!(paramTypeName.equals("pointer") && argTypeName.equals("array"))) {
						//error
						m_nNumErrors++;
						m_errors.print(Formatter.toString(ErrorMsg.error5a_Call, argTypeName, param.getName(), paramTypeName
								));
						typeError = true;
					}
					//	setting array to pointer, valid.
				}
				// setting int to float, valid.
			} 
			// type = type
			////system.out.println(arg.getIsReference());
			if(param.getIsReference() && !arg.getIsReference()) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error5r_Call, argTypeName, param.getName(), paramTypeName));
				referenceError = true;
			}
		}
		
		//might want to add another error check for lValueError. too lazy to change now.
		if(typeError && referenceError) {
			return new ErrorSTO("Both Function Parameter Types and Pass-by-reference invalid");
		} else if(typeError) {
			return new ErrorSTO("Function Parameter Types invalid");
		}
		else if(referenceError) {
			return new ErrorSTO("Function Pass-by-reference invalid");
		}

		return sto;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator2_Dot(STO sto, String strID) {
		// Good place to do the struct checks

		return sto;
	}

	// ----------------------------------------------------------------
	//
	// ----------------------------------------------------------------
	STO DoDesignator2_Array(STO sto) {
		// Good place to do the array checks

		return sto;
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
		}
		return sto;
	}
	
	public STO DoReturnCheck(STO expr){
		FuncSTO func = m_symtab.getFunc();
		////system.out.println("" + func.getReturnType().isVoid() == null);
		STO returnSTO = expr;
		//system.out.println(func.getReturnType());
		//system.out.println(expr.getType());
		
		if(expr == null) {
			if(!func.getReturnType().isVoid()) {
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6a_Return_expr);
				m_returnMissingFlag = false;
				return new ErrorSTO(ErrorMsg.error6a_Return_expr);
			} else {
				m_returnMissingFlag = false; 
				return expr;//this should be fine since 
					//a return; on a void is FINE.
			}
			
		} else {
			if(func.getReturnType().isVoid()) {
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error6a_Return_type, expr.getType().getName(), func.getReturnType().getName()));
				m_returnMissingFlag = false;
				return new ErrorSTO(Formatter.toString(ErrorMsg.error6a_Return_type, expr.getType().getName(), func.getReturnType().getName()));
			}
		}
		
		//i THINK this is correct?
		if(func.getIsReturnRefernece()) {
			if(!func.getReturnType().equals(expr.getType())) {
				//return exists
				m_returnMissingFlag = false;
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.error6b_Return_equiv, expr.getType().getName(), func.getReturnType().getName()));
				return new ErrorSTO(Formatter.toString(ErrorMsg.error6b_Return_equiv, expr.getType().getName(), func.getReturnType().getName()));
			} else if(!expr.isModLValue()) {
				m_returnMissingFlag = false;
				m_nNumErrors++;
				m_errors.print(ErrorMsg.error6b_Return_modlval);
				return new ErrorSTO(ErrorMsg.error6b_Return_modlval);
			}
			m_returnMissingFlag = false;
		} else {
			//we really need to refactor this to have each type include isEquivalent or isAssignable.
			if(!(func.getReturnType().getName() == expr.getType().getName())) {
				if((func.getReturnType().getName().equals("float") && !expr.getType().getName().equals("int"))) {
					m_returnMissingFlag = false;
					m_nNumErrors++;
					m_errors.print(Formatter.toString(ErrorMsg.error6a_Return_type, expr.getType().getName(), func.getReturnType().getName()));
					return new ErrorSTO(Formatter.toString(ErrorMsg.error6a_Return_type, expr.getType().getName(), func.getReturnType().getName()));
				} 
				m_returnMissingFlag = false;
			}
		}
		System.out.println(blockLevel);
		System.out.println(m_symtab.getLevel());
		//handles if no else cases.
		if(blockLevel == m_symtab.getLevel()) {
			m_returnMissingFlag = false;
		}
		return returnSTO;
	}
	
	public STO DoExitStmt(STO expr) {
		if(!(expr.getType().getName() == "int")) {
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.error7_Exit, expr.getType().getName()));
			return new ErrorSTO(Formatter.toString(ErrorMsg.error7_Exit, expr.getType().getName()));
		}
		
		return expr;
	}
}
