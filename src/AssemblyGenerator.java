import java.util.*;
import java.io.*;

import Operator.BinaryOp;
import Operator.ComparisonOp;
import Operator.UnaryOp;
import STO.*;
import Types.*;

public class AssemblyGenerator {
	//output writer
	private FileWriter fileWriter;
	private int indentLevel = 0;
	public static List<String> gVars = new Vector<String>();
	public static List<String> sVars = new Vector<String>();
	public boolean inGlobalScope = true;
	public List<String> tQueue = new Vector<String>();
	public List<String> dQueue = new Vector<String>();
	public Stack<Integer> ifElseStack = new Stack<Integer>();
	public int stringLits = 0;
	public int branches = 0;
	public int arrayDecl = 0;
	public int ifElseStmts = 0;
	public int comparisons = 0;
	public int numNots = 0;
	public boolean globalVarsInit = false;
	public boolean staticVarsInit = false;
	public static final int mainGuard = 5;
	public int mainCounter = 0;
	
	private List<String> executeBuffer = new Vector<String>();
	
	public AssemblyGenerator(String fileName) {
		try {
			fileWriter = new FileWriter(fileName);
		} catch(IOException e) {
			System.out.println("nope.");
			e.printStackTrace();
		}
	}
	
	public void internalConstants(){
		// from slides
		write("! DEFINING INTERNAL CONSTANTS --\n");
		write(assembleString(Strings.section,".section","\".rodata\""));
		write(assembleString(Strings.init, Strings.endl + ":", ".asciz", "\"\\n\""));
		write(assembleString(Strings.init, Strings.intfmt + ":", ".asciz", "\"%d\""));
		write(assembleString(Strings.init, Strings.strfmt + ":", ".asciz", "\"%s\""));
		write(assembleString(Strings.init, Strings.boolt + ":", ".asciz", "\"true\""));
		write(assembleString(Strings.init, Strings.boolf + ":", ".asciz", "\"false\""));
		write(assembleString(Strings.init, Strings.rfmt + ":", Strings.asciz, Strings.floatFormat));
		write(assembleString(Strings.init, "arrayOutOfBounds:", Strings.asciz, "\"" + "Index value of %d is outside legal range [0,%d)." + "\""));
		write(assembleString("\n"));
	}
	
	
	public void beginText(){
		// from slides
		generateASM(Strings.section, ".section", "\".text\"");
		generateASM(Strings.falign, Strings.align, "4");
	}
	
	public void beginData(){
		write("! --globals--\n");
		write(assembleString(Strings.section, ".section", "\".data\""));
		write(assembleString(Strings.falign, Strings.align, "4"));
	}
	
	public void beginBSS(){
		generateASM(Strings.section, ".section", "\".bss\"");
	}
	
	public void doData(STO lhs, STO rhs){
		//since we're in data... either global or static
		if(lhs.isGlobal){
			gVars.add(lhs.offset);
		}else{
			sVars.add(lhs.offset);
		}
		String str = "";
		if(rhs.isConst()){
			ConstSTO csto = (ConstSTO)rhs;
			if(lhs.getType().isInt() || lhs.getType().isBool()){
				str = assembleString(Strings.init, lhs.offset + ":", ".word", Integer.toString(csto.getIntValue()));
			}else if(lhs.getType().isFloat()){
				//got this from regi, not sure why though
				str = assembleString(Strings.init, lhs.offset + ":", ".single", "0r" + Float.toString(csto.getFloatValue()));
			}
		}else{
			if(lhs.getType().isFloat()){
				str = assembleString(Strings.init, lhs.offset + ":", ".single", "0r0");
			}else{
				str = assembleString(Strings.init, lhs.offset + ":", ".word", "0");
			}
			//TODO do the store
			//x
			//x .word 0
			storeVariable(lhs, rhs);
		}
		dQueue.add(str);
	}
	
	public void doBSS(STO sto){
		generateASM(Strings.section, ".section", "\".bss\"");
		generateASM(Strings.falign, Strings.align);
		generateASM(Strings.init, sto.getName() + ":", ".skip", "4");
		gVars.add(sto.getName());
		generateASM("\n");
	}
	
	public void flushText(){
		
		for(String t : tQueue){
			//just write the code as is
			
			write(t);
			//hacky way of initing the global vars 
			if(!this.globalVarsInit && ++this.mainCounter > 5) {
				for(int i = 0; i < this.executeBuffer.size(); ++i) {
					write(executeBuffer.get(i));
				}
				globalVarsInit = true;
			}
			
			//this wont work
			//if(!this.staticVarsInit && this.mainCounter > 5) {
//				for(int i = 0; i < this.sVars.size(); ++i) {
//					
//				}
//			}
		}
	}
	
	public void flushData(){
		if(dQueue.size() > 0){
			beginData();
		}else{
			return;
		}
		
		if(gVars.size() > 0){
			String vars = "";
			for(String s : gVars){
				if(vars.length() == 0){
					vars = s;
				}else{
					vars = vars + "," + s;
				}
			}
			
			write(assembleString(Strings.section, ".global", vars));
		}
		
		for(String str : dQueue){
			write(str);
		}
		
		dQueue.clear();
	}
	
	public void doPrintConstInt(String str){
		generateComment("printf on int");
		generateASM(Strings.two_param, Instructions.set, Strings.intfmt, Registers.o0);
		generateASM(Strings.two_param, Instructions.set, str, Registers.o1);
		generateASM(Strings.call_op, Strings.printf);
		generateASM(Strings.nop);
		generateASM("\n");
	}
	
	public void doPrintConstBool(String str){
		generateASM(Strings.two_param, Instructions.set, Strings.strfmt, Registers.o0);
		generateASM(Strings.two_param, Instructions.set, str.equals("true") ? Strings.boolt : Strings.boolf, Registers.o1);
		generateASM(Strings.call_op, Strings.printf);
		generateASM(Strings.nop);
		generateASM("\n");
	}
	
	public void doPrintConstFloat(String str){
		//TODO not sure
		generateASM(Strings.two_param, Instructions.set, Strings.assignFloat + stringLits, Registers.l0);
		generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.f0);
		generateASM(Strings.call_op, Strings.printfloat);
		generateASM(Strings.nop);
		dQueue.add(assembleString(Strings.init, Strings.assignFloat + stringLits++ + ":", Strings.single, "0r" + str));
		
		generateASM(Strings.newline);
	}
	
	public void beginFunction(FuncSTO fsto){
		String fname = fsto.getName();
		generateASM(Strings.section, ".section", "\".text\"");
		generateASM(Strings.falign, Strings.align);
		generateASM(Strings.section, ".global ", fname);		
		generateASM(Strings.label, fname);
		generateASM(Strings.two_param, "set", "SAVE." + fname, "%g1");
		generateASM(Strings.three_param, "save", "%sp", "%g1", "%sp");
	}
	
	public void endFunction(FuncSTO fsto){
		String fname = fsto.getName();
		generateASM(Strings.label, fsto.offset + Strings.functionEnd);
		generateASM(Strings.ret, "ret");
		generateASM(Strings.restore, "restore");
		
		generateASM("SAVE." + fname + " = " + "-(92 + " + fsto.getStackSize() + ") & -8");
		generateASM(Strings.newline);
		//assembleString(Strings.save, fname, String.valueOf(fsto.stackSize); ??
		inGlobalScope = true;
	}
	
	public void doMove(String r1, String r2){
		generateASM(Strings.two_param, Instructions.move, r1, r2);
	}
	
	public void storeConstant(STO sto, ConstSTO csto){
		generateASM("! --storing constant " + sto.getName() + " with value " + csto.getValue() + "\n");
		//generateASM(Strings.tab + Strings.two_param, Instructions.set, sto.offset, Registers.l0);
		//generateASM(Strings.tab + Strings.three_param, Instructions.add, sto.base, Registers.l0, Registers.l0);
		
		//we'll have to check if in struct later
		//should make a new method for this.
		generateASM(Strings.two_param, Instructions.set, sto.offset, Registers.l0);
		generateASM(Strings.three_param, Instructions.add, sto.base, Registers.l0, Registers.l0);
		
		if(sto.isReference) {
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.l0);
		}
		
		if(sto.getType().isInt()){
			generateASM(Strings.two_param, Instructions.set, String.valueOf(csto.getIntValue()), Registers.l1);
			generateASM(Strings.two_param, Instructions.store, Registers.l1, "[" + Registers.l0 + "]");
		}else{
			generateASM(Strings.two_param, Instructions.set, csto.offset, Registers.l1);
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.f1);
			generateASM(Strings.two_param, Instructions.store, Registers.f1, "[" + Registers.l0 + "]");
		}
	}
	
	public void generateASM(String temp, String ... args){
		StringBuilder str = new StringBuilder();		
		str.append(String.format(temp, (Object[])args));
		if(!inGlobalScope){
			tQueue.add(str.toString());
		}else{
			executeBuffer.add(str.toString());
		}
	}
	
	public void generateASM(String s){
		StringBuilder str = new StringBuilder();		
		str.append(s);
		if(!inGlobalScope){
			tQueue.add(str.toString());
		}else{
			executeBuffer.add(str.toString());
		}
	}
	
	public void generateComment(String s) {
		StringBuilder str = new StringBuilder();
		str.append("/* ");
		str.append(s);
		str.append(" */\n");
		if(!inGlobalScope) {
			tQueue.add(str.toString());
		} else {
			executeBuffer.add(str.toString());
		}
	}
	
	public void write(String str){
		try{
			System.out.println(str);
			fileWriter.write(str);
		}
		catch(IOException e){
			System.out.println("Error writing to file");
			e.printStackTrace();
		}
	}
	
	public void end(){
		try{
			if(dQueue.size() > 0){
				flushData();
			}			
			write("\n");
			internalConstants();
			//flush text
			flushText();
			fileWriter.close();
		}catch(IOException e){
			System.out.println("can't close for some reason");
			System.exit(1);
		}
	}
	
	public String assembleString(String temp, String ... args){
		StringBuilder str = new StringBuilder();
		str.append(String.format(temp, (Object[])args));
		return str.toString();
	}
	
	public void increaseIndent(){
		++indentLevel;
	}
	
	public void decreaseIndent(){
		--indentLevel;
	}

	public void localVarInit(STO left, STO right) {
		//checking for automatic int -> float casting
		if(left.getType().isFloat() && right.getType().isInt()) {
		} else {
			generateComment("setting " + left.getName() + " = " + right.getName());
			generateASM(Strings.two_param, Instructions.set, left.offset, Registers.l0);
			generateASM(Strings.three_param, Instructions.add, left.base, Registers.l0, Registers.l0);
			
			if(right.isConst()) {
				if(right.getType().isInt() || right.getType().isBool()) {
					generateASM(Strings.two_param, Instructions.set, String.valueOf(((ConstSTO) right).getIntValue()), Registers.l1);
					generateASM(Strings.two_param, Instructions.store, Registers.l1, "[" + Registers.l0 + "]");
				} else if(right.getType().isFloat()) {
					generateComment("setting float");
					generateASM(Strings.two_param, Instructions.set, right.offset, Registers.l1);
					//l1 f0, l0
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.f0);
					generateASM(Strings.two_param, Instructions.store, Registers.f0, "[" + Registers.l0 + "]");
					
				}
			} else {
				generateASM(Strings.two_param, Instructions.set, right.offset, Registers.l1);
				generateASM(Strings.three_param, Instructions.add, right.base, Registers.l1, Registers.l1);
				
				if(right.getType().isFloat()) {
					//l1 f0 l0
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.f0);
					generateASM(Strings.two_param, Instructions.store, Registers.f0, "[" + Registers.l0 + "]");
				} else {
					//l1 l0 l0
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.l2);
					generateASM(Strings.two_param, Instructions.store, Registers.l2, "[" + Registers.l0 + "]");
				}
			}
			
			generateComment("Done.");
		}
	}
	
	public String promoteIntToFloat(STO left, STO right) {
		STO tmp = new ExprSTO("promoteCasting", new FloatType());
		tmp.base = Registers.fp;
		tmp.offset = "" + tmp.getType().getSize();
		
		if(right.isConst()) {
			storeVariable(tmp, right);
			loadVariable(Registers.f1, tmp);
		} else {
			loadVariable(Registers.f1, right);
		}
		
		generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
		
		return Registers.f1;
	}
	
	public void storeVariable(STO dest, STO value) {
		String dest_register = "";
		
		if(value.getType().isFloat()) {
			dest_register += Registers.f1;
		} else {
			dest_register += Registers.l1;
		}
		generateComment("Storing " + value.getName() + " into " + dest.getName());
		//setting destination
		generateASM(Strings.two_param, Instructions.set, dest.offset, Registers.l0);
		generateASM(Strings.three_param, Instructions.add, dest.base, Registers.l0, Registers.l0);
		
		if(dest.isReference) {
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.l0);
		}
		
		if(value.isConst() && !value.getType().isFloat()) {
			generateASM(Strings.two_param, Instructions.set, "" + ((ConstSTO) value).getIntValue(), dest_register);
		} else {
			//setting value.
			generateASM(Strings.two_param, Instructions.set, value.offset, Registers.l2);
			generateASM(Strings.three_param, Instructions.add, value.base, Registers.l2, Registers.l2);
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l2 + "]", dest_register);
		}
		
		generateASM(Strings.two_param, Instructions.store, dest_register, "[" + Registers.l0 + "]");
	}

	public void loadVariable(String register, STO sto) {
		if(sto.isConst()) {
			Type type = ((ConstSTO) sto).getType();
			
			if(type.isInt() || type.isBool()) {
				generateASM(Strings.two_param, Instructions.set, "" + ((ConstSTO) sto).getIntValue(), register);
			} else if(type.isFloat()) {
				//i think we can leave it as a getvalue for now. WRONG
				//generateASM(Strings.two_param, Instructions.set, "" + sto.offset, register);
				generateASM(Strings.two_param, Instructions.set, sto.offset, Registers.l0);
				generateASM(Strings.three_param, Instructions.add, sto.base, Registers.l0, Registers.l0);
				
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", register);
			}
		} else {
			generateASM(Strings.two_param, Instructions.set, sto.offset, Registers.l1);
			generateASM(Strings.three_param, Instructions.add, sto.base, Registers.l1, Registers.l1);
			if(sto.isReference) {
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.l1);
			}
			
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", register);
		}
	}

	public void doCoutEndl() {
		// TODO Auto-generated method stub
		generateASM(Strings.two_param, Instructions.set, Strings.endl, Registers.o0);
		generateASM(Strings.call_op, Strings.printf);
		generateASM(Strings.nop);
	}
	
	//whoops, assemblestring is already here.
	public String generateString(String fmt, String ... args) {
		StringBuilder str = new StringBuilder();
		str.append(String.format(fmt, (Object[])args));
		return str.toString();
		
	}
	
	public void printString(String s) {
		generateComment("printing string");
		dQueue.add(assembleString(Strings.init, "str_" + stringLits + ":", ".asciz", "\"" + s + "\""));
		generateASM(Strings.two_param, Instructions.set, Strings.strfmt, Registers.o0);
		generateASM(Strings.two_param, Instructions.set, Strings.string + stringLits++, Registers.o1);
		generateASM(Strings.call_op, Strings.printf);
		generateASM(Strings.nop);
		generateComment("Done printing string.");
	}
	
	public void printInt(STO sto) {
		generateComment("Printing int " + sto.getName());
		generateASM(Strings.two_param, Instructions.set, Strings.intfmt, Registers.o0);
		this.loadVariable(Registers.o1, sto);
		generateASM(Strings.call_op, Strings.printf);
		generateASM(Strings.nop);
		generateComment("Done printing int.");
		
	}
	
	public void printFloat(STO sto) {
		generateComment("printing float " + sto.getName());
		this.loadVariable(Registers.f0, sto);
		generateASM(Strings.call_op, Strings.printfloat);
		generateASM(Strings.nop);
		generateComment("Done printing float.");
	}
	
	public void printBool(STO sto) {
		generateComment("Printing bool " + sto.getName());
		this.loadVariable(Registers.l0, sto);
		//comparing
		generateASM(Strings.two_param, Instructions.set, Strings.strfmt, Registers.o0);
		generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
		generateASM(Strings.one_param, Instructions.be, Strings.printFalse + branches);
		generateASM(Strings.nop);
		//debugging purposes.
		//printing true
		generateASM(Strings.label, Strings.printTrue + branches);
		generateASM(Strings.two_param, Instructions.set, Strings.boolt, Registers.o1);
		generateASM(Strings.one_param, Instructions.ba, Strings.branchEnd + branches);
		generateASM(Strings.nop);
		
		//false
		generateASM(Strings.label, Strings.printFalse + branches);
		generateASM(Strings.two_param, Instructions.set, Strings.boolf, Registers.o1);
		
		//printing the damn thing.
		generateASM(Strings.label, Strings.branchEnd + branches++);
		generateASM(Strings.call_op, Strings.printf);
		generateASM(Strings.nop);
		
		generateComment("Done printing bool.");
		
	}

	public void prepareArguments(STO argument, VarSTO parameter, int argCounter) {
		// TODO Auto-generated method stub
		if(parameter.getIsReference()) {
			//do reference stuff here.
		} else {
			if(argument.getType().isFloat()) {
				this.loadVariable("%f" + argCounter, argument);
			} else {
				this.loadVariable("%o" + argCounter, argument);
			}
		}
	}

	public void executeFunction(STO functionBeingExecuted) {
		// TODO Auto-generated method stub
		if(functionBeingExecuted.isFunc()) {
			generateASM(Strings.call_op, functionBeingExecuted.offset);
		} else {
			//function pointer, dereference?
			loadVariable(Registers.l0, functionBeingExecuted);
			generateASM(Strings.call_op, Registers.l0);
		}
		generateASM(Strings.nop);
	}

	public void saveReturn(STO returnSTO) {
		// TODO Auto-generated method stub
		generateComment("Saving return value");
		String storeString = "[" + returnSTO.base + "+" + returnSTO.offset + "]";
		if(returnSTO.getType().isFloat()) {
			generateASM(Strings.two_param, Instructions.store, Registers.f0, storeString);
		} else {
			generateASM(Strings.two_param, Instructions.store, Registers.o0, storeString);
		}
	}

	public ConstSTO assignFloat(ConstSTO sto) {
		this.dQueue.add(this.generateString(Strings.init, Strings.assignFloat + this.stringLits++ + ":", Strings.single, "0r" + sto.getFloatValue()));
		return sto;
	}

	public void constantInit(STO id, STO sto) {
		// TODO Auto-generated method stub
		
	}

	public void assignFloat(STO des, STO value) {
		this.dQueue.add(this.generateString(Strings.init, Strings.assignFloat + this.stringLits++ + ":", Strings.single, "0r" + ((ConstSTO) value).getFloatValue()));
		
	}
	
	//do static guard, forgot that we needed this.
	public void staticerino(STO sto) {
		dQueue.add(assembleString(Strings.init, Strings.staticGuard + sto.offset + ":", Strings.word, "0"));
		generateASM(Strings.two_param, Instructions.set, Strings.staticGuard + sto.offset, Registers.l0);
		generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.l1);
		generateASM(Strings.two_param, Instructions.cmp, Registers.g0, Registers.l1);
		generateASM(Strings.one_param, Instructions.bne, Strings.staticGuardLabel + sto.offset);
		generateASM(Strings.nop);
	}
	
	public void staticerino_end(STO sto) {
		generateASM(Strings.two_param, Instructions.set, Strings.staticGuard + sto.offset, Registers.l2);
		generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
		generateASM(Strings.two_param, Instructions.store, Registers.l3, "[" + Registers.l2 + "]");
		generateASM(Strings.label, Strings.staticGuardLabel + sto.offset);
	}

	public void doBinaryOp(STO result) {
		// TODO Auto-generated method stub
		generateComment("Doing binary expression");
		generateASM(Strings.two_param, Instructions.set, result.offset, Registers.l0);
		generateASM(Strings.three_param, Instructions.add, result.base, Registers.l0, Registers.l0);
		generateASM(Strings.two_param, Instructions.store, String.valueOf(((ConstSTO) result).getValue()), "[" + Registers.l0 + "]");
	}

	public void evaluateBinary(STO left, STO right, BinaryOp op, STO sto) {
		// TODO Auto-generated method stub
		boolean leftFloat = left.getType().isFloat();
		boolean rightFloat = right.getType().isFloat();
		String register = "";
		generateComment("Prepping Arithmetic Calculations by loading");
		if(!leftFloat) {
			this.loadVariable(Registers.l0, left);
		}
		
		boolean isBothInt = !leftFloat && !rightFloat;
		if(!rightFloat) {
			this.loadVariable(Registers.l1,  right);
		}
		//this is pretty bad
		if(op.getName().equals("+")) {
			generateComment("Adding");
			//both are ints, just add them. fck floats.
			if(isBothInt) {
				this.generateASM(Strings.three_param, Instructions.add, Registers.l0, Registers.l1, Registers.l3);
				register = Registers.l3;
			} else {
				STO temp = new ExprSTO("", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, temp);
				} else {
					this.loadVariable(Registers.f0, left);
				}
				
				if(right.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, temp);
				} else {
					this.loadVariable(Registers.f1, right);
				}
				
				//left int right float
				if(leftFloat && !rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				}
				
				//left flat right int
				if(!leftFloat && rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.three_param, Instructions.fadd, Registers.f0, Registers.f1, Registers.f3);
				register = Registers.f3;
			}
		} else if(op.getName().equals("-")) {
			generateComment("Subtracting");
			//both are ints, just add them. fck floats.
			if(isBothInt) {
				this.generateASM(Strings.three_param, Instructions.sub, Registers.l0, Registers.l1, Registers.l3);
				register = Registers.l3;
			} else {
				STO temp = new ExprSTO("", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, temp);
				} else {
					this.loadVariable(Registers.f0, left);
				}
				
				if(right.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, temp);
				} else {
					this.loadVariable(Registers.f1, right);
				}
				
				//left int right float
				if(leftFloat && !rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				}
				
				//left flat right int
				if(!leftFloat && rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.three_param, Instructions.fsub, Registers.f0, Registers.f1, Registers.f3);
				register = Registers.f3;
			}
		} else if(op.getName().equals("/")) {
			generateComment("Dividing");
			if(!leftFloat && !rightFloat) {
				this.doMove(Registers.l0, Registers.o0);
				this.doMove(Registers.l1, Registers.o1);
				
				generateASM(Strings.call_op, Instructions.div);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.move, Registers.o0, Registers.l0);
				register = Registers.l0;
			} else {
				STO temp = new ExprSTO("", new FloatType());
				
				temp.offset = "4";
				temp.base = Registers.fp;
				
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, temp);
				} else {
					this.loadVariable(Registers.f0, left);
				}
				
				if(right.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, temp);
				} else {
					this.loadVariable(Registers.f1, right);
				}
				
				//left int right float
				if(leftFloat && !rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				}
				
				//left flat right int
				if(!leftFloat && rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.three_param, Instructions.fdiv, Registers.f0, Registers.f1, Registers.f3);
				register = Registers.f3;
			}
		} else if(op.getName().equals("*")) {
			generateComment("Multiplying");
			if(!leftFloat && !rightFloat) {
				this.doMove(Registers.l0, Registers.o0);
				this.doMove(Registers.l1, Registers.o1);
				
				generateASM(Strings.call_op, Instructions.mul);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.move, Registers.o0, Registers.l0);
				register = Registers.l0;
			} else {
				STO temp = new ExprSTO("", new FloatType());
				
				temp.offset = "4";
				temp.base = Registers.fp;
				
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, temp);
				} else {
					this.loadVariable(Registers.f0, left);
				}
				
				if(right.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, temp);
				} else {
					this.loadVariable(Registers.f1, right);
				}
				
				//left int right float
				if(leftFloat && !rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				}
				
				//left flat right int
				if(!leftFloat && rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.three_param, Instructions.fmul, Registers.f0, Registers.f1, Registers.f3);
				register = Registers.f3;
			}
		} else if(op.getName().equals("%")) {
			generateComment("Modding");
			this.doMove(Registers.l0, Registers.o0);
			this.doMove(Registers.l1, Registers.o1);
			generateASM(Strings.call_op, Instructions.mod);
			generateASM(Strings.nop);
			generateASM(Strings.two_param, Instructions.move, Registers.o0, Registers.l0);
			register = Registers.l0;
		} else if(op.getName().equals("&")) {
			generateComment("Anding");
			generateASM(Strings.three_param, Instructions.and, Registers.l0, Registers.l1, Registers.l2);
			register = Registers.l2;
		} else if(op.getName().equals("|")) {
			generateComment("Oring");
			generateASM(Strings.three_param, Instructions.or, Registers.l0, Registers.l1, Registers.l2);
			register = Registers.l2;
		} else if(op.getName().equals("^")) {
			generateComment("Xoring");
			generateASM(Strings.three_param, Instructions.xor, Registers.l0, Registers.l1, Registers.l2);
			register = Registers.l2;
		} else {
			generateComment("Whoops, Executing Binary Op broke on " + left.getName() + " " + op.getName() + " " + right.getName());
		}
		
		
		generateComment("Storing result of Binary Op");
		generateASM(Strings.two_param, Instructions.set, sto.offset, Registers.l4);
		generateASM(Strings.three_param, Instructions.add, sto.base, Registers.l4, Registers.l4);
		generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l4 + "]");
	}

	public void doArrayDesignator(STO array, STO index, STO accessSTO) {
		// TODO Auto-generated method stub
		generateComment("Starting array access");
		loadVariable(Registers.l0, index);
		
		generateASM(Strings.two_param, Instructions.set, array.offset, Registers.l1);
		generateASM(Strings.three_param, Instructions.add, array.base, Registers.l1, Registers.l1);
		
		//trying out annuled branch. not sure.
		generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
		generateASM(Strings.one_param, Instructions.bl, Strings.arrayOutBounds + arrayDecl);
		generateASM(Strings.nop);
		
		generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Integer.toString(((ArrayType) array.getType()).getArraySize()));
		generateASM(Strings.one_param, Instructions.bge, Strings.arrayOutBounds + arrayDecl);
		generateASM(Strings.nop);
		
		generateASM(Strings.label, Strings.arrayInBounds + arrayDecl);
		//generateASM(Strings.three_param, Instructions.add, "1", Registers.l0, Registers.l0);
		this.doMove(Registers.l0, Registers.o0);
		
		generateASM(Strings.two_param, Instructions.set, Integer.toString(((ArrayType) array.getType()).getContainingType().getSize()), Registers.o1);
		generateASM(Strings.call_op, Instructions.mul);
		generateASM(Strings.nop);
		
		this.doMove(Registers.o0, Registers.l2);
		generateASM(Strings.three_param, Instructions.add, Registers.l1, Registers.l2, Registers.l4);
		generateASM(Strings.two_param, Instructions.set, accessSTO.offset, Registers.l5);
		generateASM(Strings.three_param, Instructions.add, accessSTO.base, Registers.l5, Registers.l6);
		generateASM(Strings.two_param, Instructions.store, Registers.l4, "[" + Registers.l6 + "]");
		generateASM(Strings.one_param, Instructions.ba, Strings.arrayEnd + this.arrayDecl);
		generateASM(Strings.nop);
		
		//if array index out of bounds, exit with error status
		generateASM(Strings.label, Strings.arrayOutBounds + arrayDecl);
		
		generateASM(Strings.two_param, Instructions.set, "arrayOutOfBounds" , Registers.o0);
		generateASM(Strings.two_param, Instructions.move, Registers.l0, Registers.o1);
		generateASM(Strings.two_param, Instructions.set, Integer.toString(((ArrayType) array.getType()).getArraySize()), Registers.o2);
		generateASM(Strings.call_op,Strings.printf);
		generateASM(Strings.nop);
		
		generateASM(Strings.two_param, Instructions.set, "1", Registers.o0);
		generateASM(Strings.call_op, Strings.exit);
		generateASM(Strings.nop);
		
		generateASM(Strings.label, Strings.arrayEnd + arrayDecl++);
	}

	public void doIfStmt(STO expression) {
		this.loadVariable(Registers.l0, expression);
		generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
		generateASM(Strings.one_param, Instructions.be, Strings.elseStmt + this.ifElseStmts);
		generateASM(Strings.nop);
		generateASM(Strings.label, Strings.ifStmt + this.ifElseStmts);
		//THERE CAN BE NESTED IF STATEMENTS
		//you have to make sure with a stack, or something. i think
		//stack is the best
		
		this.ifElseStack.push(ifElseStmts++);
	}

	public void enterIf() {
		// TODO Auto-generated method stub
		generateASM(Strings.one_param, Instructions.ba, Strings.endIf + this.ifElseStmts);
		generateASM(Strings.nop);
		generateASM(Strings.label, Strings.elseStmt + this.ifElseStack.pop());
		//push again 
		this.ifElseStack.push(this.ifElseStmts++);
	}

	public void enterElse() {
		// TODO Auto-generated method stub
		generateASM(Strings.label, Strings.endIf + this.ifElseStack.pop());
	}

	public void evaluateComparison(STO left, ComparisonOp op, STO right, STO result) {
		// TODO Auto-generated method stub
		boolean leftFloat = left.getType().isFloat();
		boolean rightFloat = right.getType().isFloat();
		String register = "";
		generateComment("Prepping Comparison Calculations by loading");
		if(!leftFloat) {
			this.loadVariable(Registers.l0, left);
		}
		
		boolean isBothInt = !leftFloat && !rightFloat;
		if(!rightFloat) {
			this.loadVariable(Registers.l1,  right);
		}
		
		if(op.getName().equals("<")) {
			generateComment("Starting Less than");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.bl, Strings.lessThan + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.lessThanEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.lessThan + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.lessThanEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
			}
		} else if(op.getName().equals("<=")) {
			generateComment("Starting Less than Equal");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.ble, Strings.lessEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.lessEqualEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.lessEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.lessEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
			}
		} else if(op.getName().equals(">")) {
			generateComment("Starting greater than");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.bg, Strings.greaterThan + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.greaterThanEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.greaterThan + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.greaterThanEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
			}
		} else if(op.getName().equals(">=")) {
			generateComment("Starting greater than equal");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.bge, Strings.greaterEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.greaterEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.greaterEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.greaterEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
			}
		} else if(op.getName().equals("!=")) {
			generateComment("Starting not equal");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.bne, Strings.nEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.nEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.nEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.nEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
			}
		} else {
			generateComment("whoops, Comparison Operator broke on " + left.getName() + " " + op.getName() + " " + right.getName());
		}
		
		generateComment("Storing result of Comparison Op");
		generateASM(Strings.two_param, Instructions.set, result.offset, Registers.l4);
		generateASM(Strings.three_param, Instructions.add, result.base, Registers.l4, Registers.l4);
		generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l4 + "]");
	}

	public void doUnaryOp(UnaryOp op, STO origin, STO result, String data) {
		// TODO Auto-generated method stub
		String register = "";
		boolean isFloat = result.getType().isFloat();
		if(op.getName().equals("--")) {
			generateComment("Decrementing");
			if(!isFloat) {
				loadVariable(Registers.l0, result);
				
				generateASM(Strings.one_param, Instructions.dec, Registers.l0);
				
				register = Registers.l0;
				
				generateASM(Strings.two_param, Instructions.set, origin.offset, Registers.l2);
				generateASM(Strings.three_param, Instructions.add, origin.base, Registers.l2, Registers.l2);
				
				if(result.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l2 + "]", Registers.l2);
				}
				
				generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l2 + "]");
				
				//increment after, so we return l0 to original value.
				//hacky. might want to change.
				if(data == "post") {
					generateASM(Strings.one_param, Instructions.inc, register);
				}
			}
		} else if(op.getName().equals("++")) {
			generateComment("Incrementing");
			if(!isFloat) {
				loadVariable(Registers.l0, origin);
				
				generateASM(Strings.one_param, Instructions.inc, Registers.l0);
				
				register = Registers.l0;
				
				generateASM(Strings.two_param, Instructions.set, origin.offset, Registers.l2);
				generateASM(Strings.three_param, Instructions.add, origin.base, Registers.l2, Registers.l2);
				
				if(result.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l2 + "]", Registers.l2);
				}
				
				generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l2 + "]");
				
				//increment after, so we return l0 to original value.
				//hacky. might want to change.
				if(data == "post") {
					generateASM(Strings.one_param, Instructions.dec, register);
				}
			}
		} else if(op.getName().equals("!")) {
			generateComment("Negating");
			loadVariable(Registers.l0, origin);
			
			generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
			generateASM(Strings.one_param, Instructions.be, Strings.increment + numNots);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.decrement + numNots);
			generateASM(Strings.one_param, Instructions.dec, Registers.l0);
			generateASM(Strings.two_param, Instructions.ba, Strings.negEnd + numNots);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.increment + numNots);
			generateASM(Strings.one_param, Instructions.inc, Registers.l0);
			generateASM(Strings.label, Strings.negEnd + numNots);
			
			numNots++;
			register = Registers.l0;
		} else {
			generateComment("Unary Op broken on " + op.getName() + " " + result.getName());
		}	
		
		generateASM(Strings.two_param, Instructions.set, result.offset, Registers.l1);
		generateASM(Strings.three_param, Instructions.add, result.base, Registers.l1, Registers.l1);
		generateASM(Strings.two_param, Instructions.load, Registers.l1, "[" + Registers.l1 + "]");
	}
	
	public void doReturn(STO returnSTO, FuncSTO func) {
		// TODO Auto-generated method stub
		generateComment("Returning value from " + func.getName());
		
		//check if reference
		//if(refernece) {}
		
		if(returnSTO.isConst()) {
			if(func.getReturnType().isFloat()) {
				if(returnSTO.getType().isFloat()) {
					loadVariable(Registers.f0, returnSTO);
				} else {
					generateASM(Strings.two_param, Instructions.set, String.valueOf(((ConstSTO) returnSTO).getIntValue()), Registers.f0);
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
			} else {
				//can return as is if const int
				generateASM(Strings.two_param, Instructions.set, String.valueOf(((ConstSTO) returnSTO).getIntValue()), Registers.i0);
			}
		} else {
			if(func.getReturnType().isFloat()) {
				loadVariable(Registers.f0, returnSTO);
				if(!returnSTO.getType().isFloat()) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
			} else {
				loadVariable(Registers.i0, returnSTO);
			}
		}
		
		generateASM(Strings.one_param, Instructions.ba, func.offset + Strings.functionEnd);
		generateASM(Strings.nop);
	}
}