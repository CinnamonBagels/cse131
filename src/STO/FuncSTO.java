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
		m_returnType = typ;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Type getReturnType ()
	{
		return m_returnType;
	}
	
	public void setIsReturnRefernece(boolean isReturnReference) {
		this.isReturnReference = isReturnReference;
	}
	
	public boolean getIsReturnRefernece() {
		return this.isReturnReference;
	}
	
	public void setParameters(Vector<VarSTO> params) {
		this.params = params;
	}
	
	public Vector<VarSTO> getParameters() {
		return this.params;
	}
}
