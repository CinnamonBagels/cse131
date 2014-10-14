package Operator;

public class BinaryOp extends Operator {

	public BinaryOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	//overrides Operator's isBinaryOp, will return true instead of FALSE. :D
	public boolean isBinaryOp() {
		return true;
	}

}
