package Operator;

import STO.*;

public abstract class BinaryOp extends Operator {

	public BinaryOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public abstract STO validateOperand(STO leftOperand, STO rightOperand);
	public abstract STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand);
	
	//overrides Operator's isBinaryOp, will return true instead of FALSE. :D
	public boolean isBinaryOp() {
		return true;
	}

}
