package Operator;

import STO.*;
import Types.BooleanType;

public class UnaryOp extends Operator {

	public UnaryOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public STO validateOperand(STO operand) {
		if(this.getName().equals("!")) {
			if(operand.getType().isBool()) {
				return new ExprSTO("Validating UnaryOp " + operand.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1u_Expr, "bool"));
			}
		} else {
			//stub, delete this later.
			return operand;
		}
	}
	
	public STO evaluateOperand(STO operand) {
		return null;
	}

}
