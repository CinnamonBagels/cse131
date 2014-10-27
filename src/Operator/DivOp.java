package Operator;

public class DivOp extends ArithmeticOp {

	public DivOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}

	public String getOperation() {
		return "/";
	}
	
	public boolean isDivOp() {
		return true;
	}
}
