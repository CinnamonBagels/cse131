package Types;

public class ArrayType extends CompositeType {
	
	private Type containingType;
	private int arraySize;
	
	public ArrayType(String strName, Type t, int size){
		super(strName, t.getSize() * size);
		this.setContainingType(t);
		this.setArraySize(size);
	}
	
	public ArrayType(Type t, int size) {
		super("new array", t.getSize() * size);
		this.setContainingType(t);
		this.setArraySize(size);
	}
	
	public boolean isArrayType() {
		return true;
	}
	
	public boolean isAssignableTo(Type t) {
		return t instanceof ArrayType || t instanceof PointerType;
	}
	
	public boolean isEquivalentTo(Type t) {
		return t instanceof ArrayType;
	}
	
	public boolean isInnerTypeAssignableTo(Type t) {
		if(t instanceof IntegerType) {
			System.out.println("wtfhere");
			System.out.println(this.containingType);
			return this.containingType instanceof IntegerType;
		} else if(t instanceof FloatType) {
			return this.containingType instanceof IntegerType || this.containingType instanceof FloatType;
		} else {
			System.out.println("wtf");
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
		this.containingType = t;
	}
	
	public Type getContainingType() {
		return this.containingType;
	}
}