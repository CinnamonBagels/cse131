package Operator;

import STO.*;
import Types.*;

public class ComparisonOp extends BinaryOp {

	public ComparisonOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public STO validateOperand(STO leftOperand, STO rightOperand) {
		Type a = leftOperand.getType();
		Type b = rightOperand.getType();
		
		if(!(a instanceof NumericType)) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
		} else if(!(b instanceof NumericType)) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
		} else {
			return new ExprSTO("Validating " + a.getName() + " and " + b.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
		}
	}
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand) {
		return null;
	}
}
