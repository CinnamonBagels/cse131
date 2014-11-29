package STO;
import Types.*;

//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

public class ConstSTO extends STO
{
    //----------------------------------------------------------------
    //	Constants have a value, so you should store them here.
    //	Note: We suggest using Java's Double class, which can hold
    //	floats and ints. You can then do .floatValue() or 
    //	.intValue() to get the corresponding value based on the
    //	type. Booleans/Ptrs can easily be handled by ints.
    //	Feel free to change this if you don't like it!
    //----------------------------------------------------------------
    private Double		m_value;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public ConstSTO(String strName)
	{
		super(strName, null, true, false);
		setValue((double) 0); 
	}

	public ConstSTO(String strName, Type typ)
	{
		super(strName, typ, true, false);
		//System.out.println(strName);
		if (typ instanceof FloatType){
			setValue(Double.parseDouble(strName));
		} else if (typ instanceof IntegerType){
			double value = (double)Integer.decode(strName);
			//System.out.println(value);
			setValue((double) Integer.decode(strName));
		} else {
			setValue(strName.equals("true") ? (double) 1 : (double) 0);
		}
	}
	
	public ConstSTO(String strName, Type typ, boolean isAddressible, boolean isModifiable){
		super(strName, typ, isAddressible, isModifiable);
		if (typ instanceof FloatType){
			setValue(Double.parseDouble(strName));
		} else if (typ instanceof IntegerType){
			double value = (double)Integer.decode(strName);
			//System.out.println(value);
			setValue((double) Integer.decode(strName));
		} else {
			setValue(strName.equals("true") ? (double) 1 : (double) 0);
		}
	}
	
	public ConstSTO(String strName, Type typ, double value){
		super(strName,typ,true,false);
		setValue(value);
	}
	
	public ConstSTO(String strName, Type typ, double value, boolean isAddressible, boolean isModifiable) {
		super(strName, typ, true, false);
		setValue(value);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public boolean isConst() 
	{
		return true;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void setValue(double val) 
	{
		m_value = new Double(val);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Double getValue() 
	{
		return m_value;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public int getIntValue() 
	{
		return m_value.intValue();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public float getFloatValue() 
	{
		return m_value.floatValue();
	}

	public boolean getBoolValue() 
	{
		return m_value.intValue() != 0;
	}
}
