package Operator;

import STO.*;
import Types.*;

public class ArithmeticOp extends BinaryOp {

	public ArithmeticOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public STO validateOperand(STO leftOperand, STO rightOperand) {
		Type a = leftOperand.getType();
		Type b = rightOperand.getType();
		
		//numeric checks
		if(!(a instanceof NumericType)) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
		} else if(!(b instanceof NumericType)) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
		}
		
		
		if(a.isInt() && b.isInt()) {
			return new ExprSTO("Validating " + a.getName() + " and " + b.getName() + " as an IntegerType for operator: " + this.getName() + "...\n", new IntegerType());
		} else {
			return new ExprSTO("Validating " + a.getName() + " and " + b.getName() + " as an FloatType for operator: " + this.getName() + "...\n", new FloatType());
		}
	}
	
	@Override
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//overrides operator.java
	public boolean isArithmeticOp() {
		return true;
	}
}
