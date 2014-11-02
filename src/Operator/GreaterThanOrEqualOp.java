package Operator;

public class GreaterThanOrEqualOp extends ComparisonOp {

	public GreaterThanOrEqualOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public String getOperator() {
		return ">=";
	}
	
	public boolean isGreaterThanOrEqualOp(){
		return true;
	}
}
