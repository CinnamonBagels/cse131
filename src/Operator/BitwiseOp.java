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

//		if(!(a.isNumeric())) {
//			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, a.getName(), this.getName()));
//		} else if(!(b.isNumeric())) {
//			return new ErrorSTO(Formatter.toString(ErrorMsg.error1n_Expr, b.getName(), this.getName()));
//		}
		
		if(a.isInt()) {
			if(b.isInt()) {
				return new ExprSTO("Validating BitwiseOp " + a.getName() + " and " + b.getName() + " as an IntegerType for operator: " + this.getName() + "...\n", new IntegerType());
			} else {
				return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, b.getName(), this.getName(), "int"));
			}
		} else {
			return new ErrorSTO(Formatter.toString(ErrorMsg.error1w_Expr, a.getName(), this.getName(), "int"));
		}
	} 

	@Override
	public STO evaluateOperand(STO leftOperand, Operator o, STO rightOperand, Type t) {
		ConstSTO left = (ConstSTO) leftOperand;
		ConstSTO right = (ConstSTO) rightOperand;
		int value = 0;
		
		if(o.isBwAndOp()) {
			value = left.getIntValue() & right.getIntValue();
		} else if(o.isBwOrOp()) {
			value = left.getIntValue() | right.getIntValue();
		} else if(o.isBwXorOp()) {
			value = left.getIntValue() ^ right.getIntValue();
		} 
		//System.out.println(value);
		
		return new ConstSTO("bw result", new IntegerType(), value);
	}
	
	public boolean isBitwiseOp(){
		return true;
	}

}
