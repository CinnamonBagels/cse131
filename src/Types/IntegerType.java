package Types;

public class IntegerType extends NumericType{
	public IntegerType(String strName, int size){
		super(strName, size);
	}
	
	public IntegerType() {
		super("int", 4);
	}
	
	public boolean isAssignableTo(Type t) {
		return t instanceof IntegerType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof IntegerType;
	}
}
