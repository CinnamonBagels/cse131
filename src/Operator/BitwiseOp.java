package Operator;

import STO.*;
import Types.*;

public class BitwiseOp extends BinaryOp {

	public BitwiseOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}

	@Override
	public STO validateOperand(STO leftOperand, STO rightOperand) {
		Type a = leftOperand.getType();
		Type b = rightOperand.getType();

		if(!(a.isNumeric())) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
		} else if(!(b.isNumeric())) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
		}
		
		if(a.isInt() && b.isInt()) {
			return new ExprSTO("Validating BitwiseOp " + a.getName() + " and " + b.getName() + " as an IntegerType for operator: " + this.getName() + "...\n", new IntegerType());
		} else if(!a.isInt()) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, a.getName(), this.getName(), "int"));
		} else if(!b.isInt()) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, b.getName(), this.getName(), "int"));
		} else {
			return leftOperand; //stub.
		}
	} 

	@Override
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand) {
		// TODO Auto-generated method stub
		return null;
	}

}
