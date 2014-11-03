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
	
	public PointerType(String str) {
		super(str, 4);
	}
	
	public String getName() {
		if(this.containingType == null || this.isTypeDef()) {
			return super.getName();
		} else {
			return this.getContainingType().getName() + super.getName();
		}
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
		return this.isEquivalentTo(t);
	}
	
	public boolean isEquivalentTo(Type t) {
		if(t instanceof PointerType) {
			return ((PointerType) t).dereference().isEquivalentTo(this.containingType);
		} else if(t instanceof ArrayType) {
			return ((ArrayType) t).getContainingType().isEquivalentTo(this.containingType);
		}
		return false;
	}
	
	public boolean isInnerTypeAssignableTo(Type t) {
		return this.isEquivalentTo(t);
	}
	
	public boolean isInnerTypeEquivalentTo(Type t) {
		if(this.containingType instanceof PointerType && !(t instanceof NullPointerType)) {
			return ((PointerType) this.containingType).isInnerTypeEquivalentTo(t);
		} else {
			return this.containingType.isEquivalentTo(t);
		}
	}
	@Override
	public Type clone() {
		// TODO Auto-generated method stub
		PointerType pointer =  new PointerType(super.getName());
		pointer.setContainingType(this.containingType);
		return pointer;
	}
	
	public void SetBaseType(Type t){
		if(this.containingType == null){
			this.containingType = t;
		}
		else{
			((PointerType)this.containingType).SetBaseType(t);
		}
	}
}
