package Types;

public class FloatType extends NumericType{
	public FloatType(String strName, int size){
		super(strName, size);
	}
	public FloatType() {
		super("float", 4);
	}
	
	public FloatType(String strName) {
		super(strName, 4);
	}
	
	public boolean isAssignableTo(Type t) {
		//could do numeric type. not sure if goin tob reak it though.
		return t instanceof FloatType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof FloatType;
	}
	@Override
	public Type clone() {
		// TODO Auto-generated method stub
		return new FloatType(super.getName());
	}
}
