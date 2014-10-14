package STO;
import Types.*;

//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

public class VarSTO extends STO
{
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public VarSTO(String strName)
	{
		super(strName);
		setIsModifiable(true);
		setIsAddressable(true);
		// You may want to change the isModifiable and isAddressable 
		// fields as necessary
	}

	public VarSTO(String strName, Type typ)
	{
		super(strName, typ);
		setIsModifiable(true);
		setIsAddressable(true);
		// You may want to change the isModifiable and isAddressable 
		// fields as necessary
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isVar() 
	{
		return true;
	}
}
