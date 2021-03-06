package STO;
import Types.*;

//---------------------------------------------------------------------
//
//---------------------------------------------------------------------

public abstract class STO
{
	private String m_strName;
	private Type m_type;
	private boolean m_isAddressable;
	private boolean m_isModifiable;
	public String base;
	public String offset;
	public boolean isGlobal;
	public boolean isStatic = false;
	public boolean isInitialized = false;
	public boolean isReference = false;
	public boolean isDereferenced = false;
	public boolean isInStruct = false;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO(String strName)
	{
		this(strName, null);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO(String strName, Type typ)
	{
		setName(strName);
		setType(typ);
		setIsAddressable(false);
		setIsModifiable(false);
	}
	
	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public STO(String strName, Type typ, boolean isAddressible, boolean isModifiable)
		{
			setName(strName);
			setType(typ);
			setIsAddressable(isAddressible);
			setIsModifiable(isModifiable);
		}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public String getName()
	{
		return m_strName;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	private void setName(String str)
	{
		m_strName = str;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Type getType()
	{
		return m_type;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void setType(Type type)
	{
		m_type = type;
	}

	//----------------------------------------------------------------
	// Addressable refers to if the object has an address. Variables
	// and declared constants have an address, whereas results from 
	// expression like (x + y) and literal constants like 77 do not 
	// have an address.
	//----------------------------------------------------------------
	public boolean getIsAddressable()
	{
		return m_isAddressable;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void setIsAddressable(boolean addressable)
	{
		m_isAddressable = addressable;
	}

	//----------------------------------------------------------------
	// You shouldn't need to use these two routines directly
	//----------------------------------------------------------------
	public boolean getIsModifiable()
	{
		return m_isModifiable;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void setIsModifiable(boolean modifiable)
	{
		m_isModifiable = modifiable;
	}

	//----------------------------------------------------------------
	// A modifiable L-value is an object that is both addressable and
	// modifiable. Objects like constants are not modifiable, so they 
	// are not modifiable L-values.
	//----------------------------------------------------------------
	public boolean isModLValue()
	{
		return getIsModifiable() && getIsAddressable();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public void setIsModLValue(boolean m)
	{
		setIsModifiable(m);
		setIsAddressable(m);
	}
	
	public int getUndecoratedOffsetValue() {
		int something = Integer.parseInt(this.offset);
		if(something < 0) {
			return something * -1;
		} else {
			return something;
		}
	}

	//----------------------------------------------------------------
	//	It will be helpful to ask a STO what specific STO it is.
	//	The Java operator instanceof will do this, but these methods 
	//	will allow more flexibility (ErrorSTO is an example of the
	//	flexibility needed).
	//----------------------------------------------------------------
	public boolean isVar() { return this instanceof VarSTO; }
	public boolean isConst() { return this instanceof ConstSTO; }
	public boolean isExpr() { return this instanceof ExprSTO; }
	public boolean isFunc() { return this instanceof FuncSTO; }
	public boolean isTypedef() { return this instanceof TypedefSTO; }
	public boolean isError() { return this instanceof ErrorSTO; }
}
