package Types;

public class FloatType extends NumericType{
	public FloatType(String strName, int size){
		super(strName, size);
	}
	public FloatType() {
		super("float", 4);
	}
	
	public boolean isAssignableTo(Type t) {
		//could do numeric type. not sure if goin tob reak it though.
		return t instanceof FloatType || t instanceof IntegerType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof FloatType;
	}
}
