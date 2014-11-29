package Types;

import java.util.Vector;

import STO.VarSTO;

public class FunctionPointerType extends PointerGroupType {
	
	public Type m_returnType;
	public boolean isReturnReference;
	public Vector<VarSTO> params;
	
	public FunctionPointerType(String strName, int size){
		super(strName, size);
		this.params = new Vector<VarSTO>();
	}
	
	public FunctionPointerType(String strName, Type t, boolean isReturnReference, Vector<VarSTO> params) {
		super(strName, 0);
		this.params = params;
		this.isReturnReference = isReturnReference;
		this.m_returnType = t;
	}
	
	public FunctionPointerType(String strName) {
		super(strName, 0);
		this.params = new Vector<VarSTO>();
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
	
	public Type getType() {
		return this;
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
	
	public boolean isAssignableTo(Type t) {
		return true;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof FunctionPointerType;
	}
	
	public boolean isFunctionPointerType()	 {
		return true;
	}

	@Override
	public Type clone() {
		FunctionPointerType type = new FunctionPointerType(this.getName());
		type.setIsReturnRefernece(this.isReturnReference);
		type.setParameters(this.params);
		type.setReturnType(this.m_returnType);
		return type;
	}
}
