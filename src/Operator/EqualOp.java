package Operator;

public class EqualOp extends ComparisonOp {

	public EqualOp(String opName) {
		super(opName);
		// TODO Auto-generated constructor stub
	}
	
	public String getOperator() {
		return "==";
	}
	
	public boolean isEqualOp(){
		return true;
	}
}
