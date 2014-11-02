package Operator;

public class LessThanOp extends ComparisonOp {

	public LessThanOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public String getOperator() {
		return "<";
	}
	
	public boolean isLessThanOp(){
		return true;
	}
}
