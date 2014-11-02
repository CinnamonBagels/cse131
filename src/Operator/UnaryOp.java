package Operator;

import STO.*;
import Types.*;

public class UnaryOp extends Operator {

	public UnaryOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public STO validateOperand(STO operand, String string) {
		Type oType = operand.getType();
	
		if(this.getName().equals("!")) {
			if(operand.getType().isBool()) {
				return new ExprSTO("Validating UnaryOp " + operand.getName() + " as a BooleanType for operator: " + this.getName() + "...\n", new BooleanType());
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1u_Expr, "bool"));
			}
		} else if(this.getName().equals("++") || this.getName().equals("--")) {
			if(operand.isModLValue()) {
				if(oType.isInt()) {
					return new ExprSTO("Validating UnaryOp " + operand.getName() + " as a IntegerType for operator: " + this.getName() + "...\n", new IntegerType());
				} else if(oType.isFloat()) {
					return new ExprSTO("Validating UnaryOp " + operand.getName() + " as a FloatType for operator: " + this.getName() + "...\n", new FloatType());
				} else if(oType.isPointer()) {
					return new ExprSTO("Validating UnaryOp " + operand.getName() + " as a PointerType for operator: " + this.getName() + "...\n", new PointerType());
				}
				else {
					return new ErrorSTO(Formatter.toString(ErrorMsg.error2_Type, oType.getName(), this.getName()));
				}
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error2_Lval, this.getName()));
			}
		} else {
			//stub
			return operand;
		}
	}
	
	public STO evaluateOperand(STO operand) {
		double value = 0.0;
		ConstSTO o = (ConstSTO) operand;
		
		if(this.getName().equals("++")){
			value = o.getValue() + 1;
		} else if(this.getName().equals("--")){
			value = o.getValue() - 1;
		} else if(this.getName().equals("!")){
			value = 1.0 - o.getValue();
		}
		
		return new ConstSTO("" + value, this.getName().equals("!") ? new BooleanType() : o.getType().isFloat() ? new FloatType() : new IntegerType());
	}
	
	public boolean isUnaryOp(){
		return true;
	}

}
