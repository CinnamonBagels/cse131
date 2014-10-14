package Operator;

import STO.ErrorSTO;
import STO.ExprSTO;
import STO.STO;
import Types.IntegerType;
import Types.NumericType;
import Types.Type;

public class ModOp extends ArithmeticOp {

	public ModOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}

	@Override
	public STO validateOperand(STO leftOperand, STO rightOperand) {
		Type a = leftOperand.getType();
		Type b = rightOperand.getType();
		
		//numeric checks
//		if(!(a instanceof NumericType)) {
//			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
//		} else if(!(b instanceof NumericType)) {
//			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
//		}

		if(a.isInt()) {
			if(b.isInt()) {
				return new ExprSTO("Validating " + a.getName() + " and " + b.getName() + " as an IntegerType for operator: " + this.getName() + "...\n", new IntegerType());
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, b.getName(), this.getName(), "int"));
			}
		} else {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, a.getName(), this.getName(), "int"));
		}
	}
}
