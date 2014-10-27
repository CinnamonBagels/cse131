package STO;
import Types.*;

//---------------------------------------------------------------------
// For typedefs like: typedef int myInteger1, myInteger2;
// Also can hold the structdefs
//---------------------------------------------------------------------

public class TypedefSTO extends STO
{
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public TypedefSTO(String strName)
	{
		super(strName);
		this.setIsModifiable(true);
		this.setIsAddressable(true);
	}

	public TypedefSTO(String strName, Type typ)
	{
		super(strName, typ);
		this.setIsModifiable(true);
		this.setIsAddressable(true);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isTypedef()
	{
		return true;
	}
}
