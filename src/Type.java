

abstract class Type {
	private String m_strName;
	private Type m_type;
	private boolean m_isAddressable;
	private boolean m_isModifiable;
	
	public Type(String strName) {
		this(strName, null);
	}
	
	public Type(String strName, Type typ) {
		setName(strName);
		setType(typ);
		setIsAddressable(false);
		setIsModifiable(false);
	}
	
	public String getName() {
		return m_strName;
	}
	
	private void setName(String str) {
		m_strName = str;
	}
	
	public Type getType() {
		return m_type;
	}
	
	private void setType(Type type) {
		m_type = type;
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
	
	public boolean isModLValue()
	{
		return getIsModifiable() && getIsAddressable();
	}

	//----------------------------------------------------------------
	//
	//----------------------------------------------------------------
	private void setIsModLValue(boolean m)
	{
		setIsModifiable(m);
		setIsAddressable(m);
	}
	
	public boolean isAssignableTo(Type t) { return false; }
	public boolean isEquivalentTo(Type t) { return false; }
	public int getSize() { return 0; }
	public boolean isNumberic() { return false; }
	public boolean isFloat() { return false; }
	public boolean isInt() { return false; }
	public boolean isArray() { return false; }
	public boolean isBasic() { return false; }
	public boolean isBool() { return false; }
	public boolean isVoid() { return false; }
	public boolean isComposite() { return false; }
	public boolean isStruct() { return false; }
	public boolean isPointerGroup() { return false; }
	public boolean isPointer() { return false; }
	public boolean isFunctionPointer() { return false; }
	public boolean isNullPointer() { return false; }
}
