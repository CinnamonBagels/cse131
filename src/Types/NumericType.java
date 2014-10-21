package Types;

public abstract class NumericType extends Type{
	public NumericType(String strName, int size){
		super(strName, size);
	}
	
	public boolean isNumeric() {
		return true;
	}
	
	public boolean isAssignableTo(Type t) {
		return t instanceof NumericType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof NumericType;
	}
}
