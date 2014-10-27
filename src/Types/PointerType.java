package Types;

public class PointerType extends Type{
	
	public PointerType() {
		super("*", 4);
	}
	public PointerType(String strName, int size){
		super(strName, size);
	}
	
	public boolean isAssignableTo(Type t) {
		return t instanceof PointerType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof PointerType;
	}
	public void setContainingType(Type innerType) {
		// TODO Auto-generated method stub
		
	}
}
