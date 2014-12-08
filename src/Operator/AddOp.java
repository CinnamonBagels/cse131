package Operator;

import STO.STO;

public class AddOp extends ArithmeticOp {

	public AddOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public String getOperation() {
		return "+";
	}
	
	public boolean isAddOp() {
		return true;
	}
}
