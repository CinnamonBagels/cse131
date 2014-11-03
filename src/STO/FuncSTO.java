package STO;
import java.util.Vector;

import Types.*;

//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

public class FuncSTO extends STO
{
	private Type m_returnType;
	private boolean isReturnReference;
	private Vector<VarSTO> params;
	
	
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public FuncSTO(String strName)
	{
		super (strName);
		setReturnType(null);
                // You may want to change the isModifiable and isAddressable                      
                // fields as necessary
	}
	
	public FuncSTO(String strName, Type typ) {
		super(strName, typ);
		setReturnType(null);
	}
	
	
	private FunctionPointerType getFunctionPointerType() {
		return (FunctionPointerType) this.getType();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isFunc() 
	{ 
		return true;
                // You may want to change the isModifiable and isAddressable                      
                // fields as necessary
	}

	//----------------------------------------------------------------
	// This is the return type of the function. This is different from 
	// the function's type (for function pointers).
	//----------------------------------------------------------------
	public void setReturnType(Type typ)
	{
		//System.out.println("EIUHRUEIHUIRJISEjr");
		//System.out.println(typ);
		getFunctionPointerType().m_returnType = typ;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Type getReturnType ()
	{
		//System.out.println(getFunctionPointerType().m_returnType);
		return getFunctionPointerType().m_returnType;
	}
	
	public Type getType() {
		return super.getType();
	}
	
	public void setIsReturnRefernece(boolean isReturnReference) {
		this.getFunctionPointerType().isReturnReference = isReturnReference;
	}
	
	public boolean getIsReturnRefernece() {
		return this.getFunctionPointerType().isReturnReference;
	}
	
	public void setParameters(Vector<VarSTO> params) {
		this.getFunctionPointerType().params = params;
	}
	
	public Vector<VarSTO> getParameters() {
		return this.getFunctionPointerType().params;
	}
}
