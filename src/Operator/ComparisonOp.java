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
			} else if(a.isPointer() || b.isPointer()){
				if(!a.isPointer() || !b.isPointer()){
					return new ErrorSTO(Formatter.toString(ErrorMsg.error17_Expr, this.getName(), a.getName(), b.getName()));
				}
				
				Type x = ((PointerType)a).getContainingType();
				Type y = ((PointerType)b).getContainingType();
				
				boolean eq = x.isEquivalentTo(y);
				boolean xptr = x instanceof NullPointerType && !(y instanceof NullPointerType);
				boolean yptr = y instanceof NullPointerType && !(x instanceof NullPointerType);
				
				if (eq || xptr || yptr){
					return new ExprSTO(x.getName() + this.getName() + y.getName(), new BooleanType());
				}
				else{
					return new ErrorSTO(Formatter.toString(ErrorMsg.error17_Expr, this.getName(), x.getName(), y.getName()));
				}
			}
			else {
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
