package Types;

public class IntegerType extends NumericType{
	public IntegerType(String strName, int size){
		super(strName, size);
	}
	
	public IntegerType() {
		super("int", 4);
	}
	
	public IntegerType(String str) {
		super(str, 4);
	}
	public boolean isAssignableTo(Type t) {
		return t instanceof IntegerType || t instanceof FloatType || t instanceof BooleanType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof IntegerType;
	}

	@Override
	public Type clone() {
		// TODO Auto-generated method stub
		return new IntegerType(super.getName());
	}
	
}
