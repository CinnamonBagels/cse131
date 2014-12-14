package Types;

public class BooleanType extends Type{
	public BooleanType(String strName){
		super(strName, 4);
	}
	
	public BooleanType() {
		super("bool", 4);
	}
	
	public boolean isAssignableTo(Type t) {
		return t instanceof BooleanType || t instanceof IntegerType || t instanceof FloatType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof BooleanType;
	}

	@Override
	public Type clone() {
		// TODO Auto-generated method stub
		return new BooleanType(super.getName());
	}
}
