package Types;

public class PointerType extends PointerGroupType{
	
	private Type containingType;
	
	public PointerType() {
		super("*", 4);
		this.containingType = null;
	}
	public PointerType(String strName, int size){
		super(strName, size);
	}
	
	public void setContainingType(Type t) {
		if(this.containingType == null || !(this.containingType instanceof PointerType)) {
			this.containingType = t;
		} else {
			((PointerType) this.containingType).setContainingType(t);
		}
		 //this.containingType = t;
	}
	
	public Type getContainingType() {
		//tansen cant do this because they can recursively call pointers
		//**********int
		//return this.containingType;
		if(this.containingType instanceof PointerType) {
			return ((PointerType) this.containingType).getContainingType();
			//dat recursion
		} else {
			return this.containingType;
		}
	}
	
	public Type dereference() {
		/*if(this.containingType == null) {
			return null;
		}*/
		return this.containingType;
	}
	
	public boolean isAssignableTo(Type t) {
		return t instanceof PointerType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof PointerType;
	}
	
	public boolean isInnerTypeAssignableTo(Type t) {
		if(this.containingType instanceof PointerType) {
			return ((PointerType) this.containingType).isInnerTypeAssignableTo(t);
		} else {
			return this.containingType.isAssignableTo(t);
		}
	}
	
	public boolean isInnerTypeEquivalentTo(Type t) {
		if(this.containingType instanceof PointerType) {
			return ((PointerType) this.containingType).isInnerTypeEquivalentTo(t);
		} else {
			return this.containingType.isEquivalentTo(t);
		}
	}
}
