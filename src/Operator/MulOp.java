package Operator;

public class MulOp extends ArithmeticOp {

	public MulOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public String getOperation() {
		return "*";
	}
	
	public boolean isMulOp() {
		return true;
	}
}
