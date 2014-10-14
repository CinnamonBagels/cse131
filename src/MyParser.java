//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

import java_cup.runtime.*;

import java.util.*;

import Operator.*;
import STO.*;
import Types.*;

class MyParser extends parser
{
	private Lexer m_lexer;
	private ErrorPrinter m_errors;
	private int m_nNumErrors;
	private String m_strLastLexeme;
	private boolean m_bSyntaxError = true;
	private int m_nSavedLineNum;

	private SymbolTable m_symtab;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public MyParser(Lexer lexer, ErrorPrinter errors)
	{
		m_lexer = lexer;
		m_symtab = new SymbolTable();
		m_errors = errors;
		m_nNumErrors = 0;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean Ok()
	{
		return m_nNumErrors == 0;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Symbol scan()
	{
		Token t = m_lexer.GetToken();

		//	We'll save the last token read for error messages.
		//	Sometimes, the token is lost reading for the next
		//	token which can be null.
		m_strLastLexeme = t.GetLexeme();

		switch (t.GetCode())
		{
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

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void syntax_error(Symbol s)
	{
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void report_fatal_error(Symbol s)
	{
		m_nNumErrors++;
		if (m_bSyntaxError)
		{
			m_nNumErrors++;

			//	It is possible that the error was detected
			//	at the end of a line - in which case, s will
			//	be null.  Instead, we saved the last token
			//	read in to give a more meaningful error 
			//	message.
			m_errors.print(Formatter.toString(ErrorMsg.syntax_error, m_strLastLexeme));
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void unrecovered_syntax_error(Symbol s)
	{
		report_fatal_error(s);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void DisableSyntaxError()
	{
		m_bSyntaxError = false;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void EnableSyntaxError()
	{
		m_bSyntaxError = true;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public String GetFile()
	{
		return m_lexer.getEPFilename();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public int GetLineNum()
	{
		return m_lexer.getLineNumber();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void SaveLineNum()
	{
		m_nSavedLineNum = m_lexer.getLineNumber();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public int GetSavedLineNum()
	{
		return m_nSavedLineNum;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoProgramStart()
	{
		// Opens the global scope.
		m_symtab.openScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoProgramEnd()
	{
		m_symtab.closeScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoVarDecl(Hashtable lstIDs, Type t)
	{
		Enumeration<String> e = lstIDs.keys();
		
		//for (int i = 0; i < lstIDs.size(); i++)
		while(e.hasMoreElements())
		{
			String id = e.nextElement();
		
			if (m_symtab.accessLocal(id) != null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}

			VarSTO sto = new VarSTO(id, t);
			m_symtab.insert(sto);
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
    void DoIterationVarDecl(String id)
    {
        if (m_symtab.accessLocal(id) != null)
        {
            m_nNumErrors++;
            m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
        }   
          
        VarSTO sto = new VarSTO(id);
        m_symtab.insert(sto);
    }

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoExternDecl(Vector<String> lstIDs)
	{
		for (int i = 0; i < lstIDs.size(); i++)
		{
			String id = lstIDs.elementAt(i);

			if (m_symtab.accessLocal(id) != null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}

			VarSTO sto = new VarSTO(id);
			m_symtab.insert(sto);
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoConstDecl(Vector<String> lstIDs)
	{
		for (int i = 0; i < lstIDs.size(); i++)
		{
			String id = lstIDs.elementAt(i);

			if (m_symtab.accessLocal(id) != null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}
		
			ConstSTO sto = new ConstSTO(id);
			m_symtab.insert(sto);
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoTypedefDecl(Vector<String> lstIDs)
	{
		for (int i = 0; i < lstIDs.size(); i++)
		{
			String id = lstIDs.elementAt(i);

			if (m_symtab.accessLocal(id) != null)
			{
				m_nNumErrors++;
				m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
			}
		
			TypedefSTO sto = new TypedefSTO(id);
			m_symtab.insert(sto);
		}
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoStructdefDecl(String id)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}
		
		TypedefSTO sto = new TypedefSTO(id);
		m_symtab.insert(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFuncDecl_1(String id)
	{
		if (m_symtab.accessLocal(id) != null)
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.redeclared_id, id));
		}
	
		FuncSTO sto = new FuncSTO(id);
		m_symtab.insert(sto);

		m_symtab.openScope();
		m_symtab.setFunc(sto);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFuncDecl_2()
	{
		m_symtab.closeScope();
		m_symtab.setFunc(null);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoFormalParams(Vector<String> params)
	{
		if (m_symtab.getFunc() == null)
		{
			m_nNumErrors++;
			m_errors.print ("internal: DoFormalParams says no proc!");
		}

		// insert parameters here
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoBlockOpen()
	{
		// Open a scope.
		m_symtab.openScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	void DoBlockClose()
	{
		m_symtab.closeScope();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoAssignExpr(STO stoDes, STO _2)
	{
		if (!stoDes.isModLValue())
		{
			// Good place to do the assign checks
		}
		stoDes = _2;
		return stoDes;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoFuncCall(STO sto)
	{
		if (!sto.isFunc())
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_function, sto.getName()));
			return new ErrorSTO(sto.getName());
		}

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator2_Dot(STO sto, String strID)
	{
		// Good place to do the struct checks

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator2_Array(STO sto)
	{
		// Good place to do the array checks

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoDesignator3_ID(String strID, boolean isGlobal)
	{
		STO sto = null;
		String errorMessage = null;
		
		//check if global scope, else access it like a regular variable
		if(isGlobal) {
			sto = m_symtab.accessGlobal(strID);
			errorMessage = ErrorMsg.error0g_Scope;
		} else {
			if(sto == null) {
				sto = m_symtab.access(strID);
			}
			
			//prepare error message for undecleared ID
			errorMessage = ErrorMsg.undeclared_id;
		}
		
		//the check if sto is STILL null, the variable does not exist anywhere.
		if (sto == null)
		{
			m_nNumErrors++;
			//push our error message through
		 	m_errors.print(Formatter.toString(errorMessage, strID));
			sto = new ErrorSTO(strID);
		}

		return sto;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	STO DoQualIdent(String strID)
	{
		STO sto;

		if ((sto = m_symtab.access(strID)) == null)
		{
			m_nNumErrors++;
		 	m_errors.print(Formatter.toString(ErrorMsg.undeclared_id, strID));
			return new ErrorSTO(strID);
		}

		if (!sto.isTypedef())
		{
			m_nNumErrors++;
			m_errors.print(Formatter.toString(ErrorMsg.not_type, sto.getName()));
			return new ErrorSTO(sto.getName());
		}

		return sto;
	}

	public STO DoUnaryOp(UnaryOp _2, STO _1, String string) {
		// TODO Auto-generated method stub
		return null;
	}

	public STO DoBinaryOp(STO _1, BinaryOp _2, STO _3) {
		if(_1.isError()) {
			return _1;
		}
		
		if(_3.isError()) {
			return _3;
		}
		
		STO sto = _2.validateOperand(_1, _3);
		
		if(sto.isError()) {
			m_nNumErrors++;
			m_errors.print(sto.getName());
		}
		return sto;
	}
}
