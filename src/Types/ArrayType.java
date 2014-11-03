package Types;

public class ArrayType extends CompositeType {
	
	private Type containingType = null;
	private int arraySize;
	
	public ArrayType(String strName, int size){
		super(strName, 4 * size);
		this.setArraySize(size);
	}
	
	public ArrayType(int size) {
		super("array", 4 * size);
		this.setArraySize(size);
	}
	
	public boolean isArrayType() {
		return true;
	}
	
	public void setArrayName(String str) {
		super.setName(str + "[" + arraySize + "]");
	}
	
	public boolean isAssignableTo(Type t) {

		
		if(t instanceof ArrayType) {
			//System.out.println("Inside ArrayType, name: " + ((ArrayType)t).getName() + ", containing type: " + this.containingType);
			return ((ArrayType) t).containingType.isEquivalentTo(this.containingType) && ((ArrayType) t).getArraySize() == this.getArraySize();
		} else if(t instanceof PointerType) {
			//System.out.println("It's a pointer.");
			return ((PointerType) t).getContainingType().isEquivalentTo(this.containingType);
		} else {
			//System.out.println("Bad");
			return false;
		}
	}
	
	public boolean isEquivalentTo(Type t) {
		if(t instanceof ArrayType) {
			if( ((ArrayType) t).getContainingType().isEquivalentTo(this.getContainingType())) {
				return true;
			}
		} 
			return false;
	}
	
	public boolean isInnerTypeAssignableTo(Type t) {
		//System.out.println("here"); //DELETE THIS
		if(t instanceof IntegerType || t instanceof FloatType) {
			//System.out.println(this.containingType);
			return this.containingType instanceof IntegerType;
		} else {
			return this.containingType == t;
		}
	}
	
	public boolean isInnerTypeEquivalentTo(Type t) {
		return this.containingType == t;
	}
	
	//do we need this?
	private void setArraySize(int size) {
		this.arraySize = size;
	}
	
	public int getArraySize() {
		return this.arraySize;
	}
	
	public void setContainingType(Type t) {
		//System.out.println("This array is a " + t.getName() + " type.");
		this.containingType = t;
	}
	
	public Type getContainingType() {
		return this.containingType;
	}
	
	public Type clone(){
		ArrayType arr = new ArrayType(this.arraySize);
		arr.setContainingType(this.containingType);
		return arr;
	}
	
	public void SetBaseType(Type t){
		this.containingType = t;
	}

}