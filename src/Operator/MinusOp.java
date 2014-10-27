package Operator;

public class MinusOp extends ArithmeticOp {

	public MinusOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}

	public String getOperation() {
		return "-";
	}
	
	public boolean isMinusOp() {
		return true;
	}
}
