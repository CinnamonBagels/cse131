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
		if(!(a.isNumeric())) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
		} else if(!(b.isNumeric())) {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
		}
		
//		if(this.getName() == "/") {
//			if(((ConstSTO) rightOperand).getValue() == 0 || ((ConstSTO) rightOperand).getValue() == 0.0) {
//				return new ErrorSTO(ErrorMsg.error8_Arithmetic);
//			}	
//		}
		
		if(a.isInt()) {
			if(b.isInt()) {
				return new ExprSTO(a.getName() + " and " + b.getName() + " as an IntegerType for operator: " + this.getName(), new IntegerType());
			} else {
				return new ExprSTO(a.getName() + " and " + b.getName() + " as an FloatType for operator: " + this.getName(), new FloatType());
			}
		} else {
			return new ExprSTO(a.getName() + " and " + b.getName() + " as an FloatType for operator: " + this.getName(), new FloatType());
		}
	}
	
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand, Type t) {
		Type newType;
		double value = 0;
		//maybe we should pass in constSTO's instead.
		ConstSTO left = (ConstSTO) leftOperand;
		ConstSTO right = (ConstSTO) rightOperand;
		if(t.isFloat()) {
			newType = new FloatType();
		} else {
			newType = new IntegerType();
		}
		
		if(o.isAddOp()) {
			value = left.getValue() + right.getValue();
		} else if(o.isMinusOp()) {
			value = left.getValue() - right.getValue();
		} else if(o.isMulOp()) {
			value = left.getValue() * right.getValue();
		} else if(o.isDivOp()) {
			if(right.getFloatValue() == 0.0) {
				return new ErrorSTO(ErrorMsg.error8_Arithmetic);
			} else {
				if(newType.isInt()) {
					value = Math.floor(left.getIntValue() / right.getIntValue());
				} else {
					value = left.getValue() / right.getValue();
				}
				
			}
		} else if(o.isModOp()) {
			if(right.getIntValue() == 0) {
				return new ErrorSTO(ErrorMsg.error8_Arithmetic);
			}
			value = left.getIntValue() % right.getIntValue();
		}
		//System.out.println(value);
		return new ConstSTO("Evaluation Result", newType, value);
	}
	
	//overrides operator.java
	public boolean isArithmeticOp() {
		return true;
	}
}
