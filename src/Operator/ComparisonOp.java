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
		
		if(leftOperand.isError()){
			return leftOperand;
		}
		if(rightOperand.isError()){
			return rightOperand;
		}
		
		//System.out.println("leftOperand type: " + leftOperand.getType());
		//System.out.println("rightOperand type: " + rightOperand.getType());
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
			} else if((a.isPointer() || b.isPointer())){
				
				
								
				if(!a.isPointer() || !b.isPointer()){
					return new ErrorSTO(Formatter.toString(ErrorMsg.error17_Expr, this.getName(), a.getName(), b.getName()));
				}
				
				Type x;
				Type y;
				if(a.isNullPointer()){
					x = new NullPointerType();
				} else {
					x = ((PointerType)a).getContainingType();
				}
				if(b.isNullPointer()){
					y = new NullPointerType();
				} else {
					y = ((PointerType)b).getContainingType();
				}			
				
				
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
		float left = ((ConstSTO) leftOperand).getFloatValue();
		float right = ((ConstSTO) rightOperand).getFloatValue();
		boolean value = false;
		
		if(o.isLessThanOp()){
			value = left < right;
		} else if (o.isGtrThanOp()){
			value = left > right;
		} else if (o.isLessThanEqOp()){
			value = left <= right;
		} else if (o.isGtrThanEqOp()){
			value = left >= right;
		} else if (o.isEqualToOp()){
			value = left == right;
		} else if (o.isNotEqualToOp()){
			value = left != right;
		}
		
		return new ConstSTO("" + value, new BooleanType());
	}
	
	public boolean isComparisonOp(){
		return true;
	}
}
