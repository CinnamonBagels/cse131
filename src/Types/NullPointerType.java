package Types;

public class NullPointerType extends PointerType{
	public NullPointerType(String strName, int size){
		super(strName, size);
	}
	
	public NullPointerType() {
		super("", 0);
	}
	
	public boolean isAssignableTo(Type t){
		return t instanceof NullPointerType || t instanceof PointerType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof NullPointerType;
	}
}
