package STO;
import Types.*;

//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

public class VarSTO extends STO
{
	
	public boolean isReference;
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public VarSTO(String strName)
	{
		super(strName);
		setIsModifiable(true);
		setIsAddressable(true);
		setIsReference(false);
		// You may want to change the isModifiable and isAddressable 
		// fields as necessary
	}
	
	public VarSTO(String strName, Type typ)
	{
		super(strName, typ);
		setIsModifiable(true);
		setIsAddressable(true);
		setIsReference(false);
		// You may want to change the isModifiable and isAddressable 
		// fields as necessary
	}
	
	public VarSTO(String strName, Type typ, boolean isReference) {
		super(strName, typ);
		setIsModifiable(true);
		setIsAddressable(true);
		setIsReference(isReference);
	}

	private void setIsReference(boolean isReference) {
		this.isReference = isReference;
	}
	
	public boolean getIsReference()	{
		return this.isReference;
	}
	
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isVar() 
	{
		return true;
	}
}
