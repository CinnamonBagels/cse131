package Operator;	

public class LessThanOrEqualOp extends ComparisonOp {

	public LessThanOrEqualOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public String getOperator() {
		return "<=";
	}
	
	public boolean isLessThanOrEqualOp(){
		return true;
	}
}
