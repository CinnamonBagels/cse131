package Types;

public class VoidType extends Type{
	public VoidType(String strName, int size){
		super(strName, size);
	}
	
	public VoidType() {
		super("void", 0);
	}

	@Override
	public Type clone() {
		// TODO Auto-generated method stub
		//not sure
		return new VoidType();
	}
}
