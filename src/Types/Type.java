package Types;


//---------------------------------------------------------------------
// This is the top of the Type hierarchy. You most likely will need to
// create sub-classes (since this one is abstract) that handle specific
// types, such as IntType, FloatType, ArrayType, etc.
//---------------------------------------------------------------------

public abstract class Type
{
	// Name of the Type (e.g., int, bool, or some typedef
	private String m_typeName;
	private int m_size;
	private boolean m_isAddressable;
	private boolean m_isModifiable;

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public Type(String strName, int size)
	{
		setName(strName);
		setSize(size);
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public String getName()
	{
		return m_typeName;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	private void setName(String str)
	{
		m_typeName = str;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	public int getSize()
	{
		return m_size;
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	private void setSize(int size)
	{
		m_size = size;
	}
	
	public boolean getIsAddressable() {
		return m_isAddressable;
	}
	
	private void setIsAddressable(boolean addressable) {
		m_isAddressable = addressable;
	}
	
	private boolean getIsModifiable() {
		return m_isModifiable;
	}
	
	private void setIsModifiable(boolean modifiable) {
		m_isModifiable = modifiable;
	}

	//----------------------------------------------------------------
	//	It will be helpful to ask a Type what specific Type it is.
	//	The Java operator instanceof will do this, but you may
	//	also want to implement methods like isNumeric(), isInt(),
	//	etc. Below is an example of isInt(). Feel free to
	//	change this around.
	//----------------------------------------------------------------
	private void setIsModLValue(boolean m)
	{
		setIsModifiable(m);
		setIsAddressable(m);
	}
	
	public boolean isAssignableTo(Type t) { return false; }
	public boolean isEquivalentTo(Type t) { return false; }
	public boolean isNumeric() { return false; }
	public boolean isFloat() { return this instanceof FloatType; }
	public boolean isInt() { return this instanceof IntegerType; }
	public boolean isArray() { return this instanceof ArrayType; }
	public boolean isBasic() { return this instanceof BasicType; }
	public boolean isBool() { return this instanceof BooleanType; }
	public boolean isVoid() { return this instanceof VoidType; }
	public boolean isComposite() { return this instanceof CompositeType; }
	public boolean isStruct() { return this instanceof StructType; }
	public boolean isPointerGroup() { return this instanceof PointerGroupType; }
	public boolean isPointer() { return this instanceof PointerType; }
	public boolean isFunctionPointer() { return this instanceof FunctionPointerType; }
	public boolean isNullPointer() { return this instanceof NullPointerType; }
}
