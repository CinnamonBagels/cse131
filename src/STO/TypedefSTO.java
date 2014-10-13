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
	}

	public TypedefSTO(String strName, Type typ)
	{
		super(strName, typ);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isTypedef()
	{
		return true;
	}
}
