package Types;

public class IntegerType extends NumericType{
	public IntegerType(String strName, int size){
		super(strName, size);
	}
	
	public IntegerType() {
		super("int", 4);
	}
}
