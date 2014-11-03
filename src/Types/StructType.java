package Types;

import java.util.Vector;

import STO.*;

public class StructType extends CompositeType{
	
	private Scope scope;
	
	public StructType(String strName, int size){
		super(strName, size);
	}
	
	public StructType(String strName) {
		super(strName, 0);
	}
	
	public StructType() {
		super("", 0);
	}
	
	public void setScope(Scope scope) {
		this.scope = scope;
	}
	
	public Scope getScope()	{
		return this.scope;
	}
	
	public void setStructMembers(STO member) {
		this.scope.InsertLocal(member);
		this.setSize(this.getSize() + member.getType().getSize());
	}
	
	public STO getMember(String id) {
		return this.scope.accessLocal(id);
	}
	
	public Vector<STO> getAllMembers() {
		return this.scope.accessAll();
	}
	
	public boolean isAssignableTo(Type t) {
		return this.isEquivalentTo(t);
	}
	
	public boolean isEquivalentTo(Type t) {
		//structs are different, not sure if we can use instanceof
				if(t.getName().equals(this.getName())) {
					return true;
				} else if(t instanceof StructType) {
					return this.getAllMembers().equals(((StructType) t).getAllMembers());
				}
//				return this.getName() == t.getName();
				return false;
	}

	@Override
	public Type clone() {
		// TODO Auto-generated method stub
		StructType struct = new StructType(this.getName());
		struct.setScope(this.scope);
		return struct;
	}
}
