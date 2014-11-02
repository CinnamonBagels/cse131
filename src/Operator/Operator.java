package Operator;

public abstract class Operator {
	private String operatorName;

	public Operator(String opName) {
		this.setName(opName);
	}

	private void setName(String name) {
		this.operatorName = name;
	}

	public String getName() {
		return this.operatorName;
	}

	public boolean isOperator() {
		return true;
	}

	//unary.
	//
	//THESE WILL BE OVERRIDDEN BY THEIR OPERATOR FILE COUNTERPARTS.
	public boolean isUnaryOp() {
		return false;
	}

	public boolean isNotOp() {
		return false;
	}

	public boolean isIncOp() {
		return false;
	}

	public boolean isDecOp() {
		return false;
	}

	public boolean isUnaryMinusOp() {
		return false;
	}

	public boolean isUnaryPlusOp() {
		return false;
	}
	
	//Binary Ops

	public boolean isBinaryOp() {
		return false;
	}

	public boolean isArithmeticOp() {
		return false;
	}

	public boolean isAddOp() {
		return false;
	}

	public boolean isMinusOp() {
		return false;
	}

	public boolean isMulOp() {
		return false;
	}

	public boolean isDivOp() {
		return false;
	}

	public boolean isModOp() {
		return false;
	}
	
	//boolean ops
	public boolean isBooleanOp() {
		return false;
	}

	public boolean isAndOp() {
		return false;
	}

	public boolean isOrOp() {
		return false;
	}

	public boolean isBitwiseOp() {
		return false;
	}

	public boolean isBwAndOp() {
		return false;
	}

	public boolean isBwOrOp() {
		return false;
	}

	public boolean isBwXorOp() {
		return false;
	}

	public boolean isComparisonOp() {
		return false;
	}

	public boolean isEqualToOp() {
		return false;
	}

	public boolean isNotEqualToOp() {
		return false;
	}

	public boolean isLessThanOp() {
		return false;
	}

	public boolean isLessThanEqOp() {
		return false;
	}

	public boolean isGtrThanOp() {
		return false;
	}

	public boolean isGtrThanEqOp() {
		return false;
	}
}
