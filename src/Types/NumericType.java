package Types;

abstract class NumericType extends Type{
	public NumericType(String strName, int size){
		super(strName, size);
	}
	
	public boolean isNumeric() {
		return true;
	}
}
