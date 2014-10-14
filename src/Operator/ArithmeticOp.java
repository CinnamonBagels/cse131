package Operator;

import STO.*;
import Types.*;

public abstract class ArithmeticOp extends BinaryOp {

	public ArithmeticOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public STO checkOperandTypes(STO leftOperand, STO rightOperand) {
		Type leftType = leftOperand.getType();
		Type rightType = rightOperand.getType();
		
		if(leftType.isNumeric()) {
			if(rightType.isNumeric()) {
				//both are numeric
				if(leftOperand.isConst() && rightOperand.isConst()) {
					Type resultType = null;
					if(leftType.isFloat() && rightType.isFloat()) {
						resultType = new FloatType();
					} else {
						resultType = new IntegerType();
					}
					
					return new ConstSTO(leftOperand.getName() + " " + rightOperand.getName(), resultType);
				}
			}
		}
		
		return null;
	}
	
	public abstract void evaluate();
	
	//overrides operator.java
	public boolean isArithmeticOp() {
		return true;
	}

}
