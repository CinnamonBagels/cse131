package Operator;

import STO.ErrorSTO;
import STO.ExprSTO;
import STO.STO;
import Types.BooleanType;
import Types.Type;

public class BooleanOp extends BinaryOp {

	public BooleanOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}

	@Override
	public STO validateOperand(STO leftOperand, STO rightOperand) {
		Type a = leftOperand.getType();
		Type b = rightOperand.getType();
		
		if(a.isBool()) {
			if(b.isBool()) {
				return new ExprSTO("Validating BooleanOp" + a.getName() + " and " + b.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, b.getName(), this.getName(), "bool"));
			}
		} else {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, a.getName(), this.getName(), "bool"));
		}
	}

	@Override
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand, Type t) {
		// TODO Auto-generated method stub
		return null;
	}

}
