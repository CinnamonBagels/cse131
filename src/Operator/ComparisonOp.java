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
		
		if(this.getName().equals("==") || this.getName().equals("!=")) {
			if(a.isBool()) {
				if(b.isBool()) {
					return new ExprSTO("Validating ComparisonOp " + a.getName() + " and " + b.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
				} else {
					return new ErrorSTO(Formatter.toString(ErrorMsg.error1b_Expr, a.getName(), this.getName(), b.getName()));
				}
			} else if(a.isNumeric()) {
				if(b.isNumeric()) {
					return new ExprSTO("Validating ComparisonOp " + a.getName() + " and " + b.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
				} else {
					return new ErrorSTO(Formatter.toString(ErrorMsg.error1b_Expr, a.getName(), this.getName(), b.getName()));
				}
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1b_Expr, a.getName(), this.getName(), b.getName()));
			}
		} else {
			if((a.isNumeric())) {
				if((b.isNumeric())) {
					return new ExprSTO("Validating ComparisonOp " + a.getName() + " and " + b.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
				} else {
					return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
				}
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
			}			
		}
	}
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand, Type t) {
		return null;
	}
}
