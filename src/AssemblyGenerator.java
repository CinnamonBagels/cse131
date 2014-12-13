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
	public List<String> bssQueue = new Vector<String>();
	public Stack<Integer> ifElseStack = new Stack<Integer>();
	public Stack<Integer> whileStack = new Stack<Integer>();
	public Stack<Integer> loopStack = new Stack<Integer>();
	public Stack<Integer> forStack = new Stack<Integer>();
	public Stack<String> structMemberStack = new Stack<String>();
	public int stringLits = 0;
	public int branches = 0;
	public int arrayDecl = 0;
	public int ifElseStmts = 0;
	public int comparisons = 0;
	public int numNots = 0;
	public int andCount = 0;
	public int orCount = 0;
	public int whileStmts = 0;
	public int forStmts = 0;
	public int noWhiles = 0;
	public int finalWhileStmts = 0;
	public int finalForStmts = 0;
	public int noFors = 0;
	public boolean globalVarsInit = false;
	public boolean staticVarsInit = false;
	public static final int mainGuard = 5;
	public int mainCounter = 0;
	public int lineNumber = 0;
	public boolean isStatic = false;
	public boolean bssInit = false; 
	
	public FuncSTO currentFunction = null;
	
	private List<String> executeBuffer = new Vector<String>();
	private List<String> globalBuffer = new Vector<String>();
	private List<String> staticBuffer = new Vector<String>();
	private List<String> floatQueue = new Vector<String>();
	private List<String> stringQueue = new Vector<String>();
	
	public AssemblyGenerator(String fileName) {
		try {
			fileWriter = new FileWriter(fileName);
		} catch(IOException e) {
			System.out.println("nope.");
			e.printStackTrace();
		}
	}
	
	public void setLineNumber(int line) {
		this.lineNumber = line;
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
		write(assembleString(Strings.init, Strings.floatForceOne + ":", Strings.single, "0r1.0"));
	}
	
	public void beginBSS(){
		generateASM(Strings.section, ".section", "\".bss\"");
	}
	
	public void doData(STO lhs, STO rhs){
		boolean isFloat = false;
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
				isFloat = true;
			}
		}else{
			if(lhs.getType().isFloat()){
				str = assembleString(Strings.init, lhs.offset + ":", ".single", "0r0");
				isFloat = true;
			}else{
				str = assembleString(Strings.init, lhs.offset + ":", ".word", "0");
			}
			//TODO do the store
			//x
			//x .word 0
			storeVariable(lhs, rhs);
		}
		
		if(isFloat) {
			floatQueue.add(str);
		} else {
			dQueue.add(str);	
		}
		
	}
	
	public void doBSS(STO sto){
		if(!bssInit) {
			bssQueue.add(assembleString(Strings.section, ".section", "\".bss\""));
			bssQueue.add(assembleString(Strings.falign, Strings.align));
			bssInit = true;
		}
		bssQueue.add(assembleString(Strings.init, sto.getName() + ":", ".skip", String.valueOf(sto.getType().getSize())));
		gVars.add(sto.getName());
		bssQueue.add("\n");
	}
	
	public void flushText(){
		
		for(String t : tQueue){
			//just write the code as is
			
			write(t);
			//hacky way of initing the global vars 
			if(!globalVarsInit && ++this.mainCounter > 5) {
				
				for(String i : this.staticBuffer) {
					write(i);
				}
				this.globalVarsInit = true;
				
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
		
		for(String str : floatQueue) {
			write(str);
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
		floatQueue.add(assembleString(Strings.init, Strings.assignFloat + stringLits++ + ":", Strings.single, "0r" + str));
		
		generateASM(Strings.newline);
	}
	
	public void beginFunction(FuncSTO fsto){
		inGlobalScope = false;
		this.currentFunction = fsto;
		String fname = fsto.getName();
		generateASM(Strings.section, ".section", "\".text\"");
		generateASM(Strings.falign, Strings.align);
		generateASM(Strings.section, ".global ", fname);		
		generateASM(Strings.label, fname);
		generateASM(Strings.two_param, "set", "SAVE." + fname, "%g1");
		generateASM(Strings.three_param, "save", "%sp", "%g1", "%sp");
		if(fsto.getName().equals("main")) {
			this.doGlobalInit();
			for(String str : this.executeBuffer) {
				generateASM(str);
			}
			this.globalInitEnd();
		}
	}
	
	
	public void endFunction(FuncSTO fsto){
		this.currentFunction = fsto;
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
		generateASM(Strings.two_param, Instructions.set, sto.offset, Registers.l0);
		generateASM(Strings.three_param, Instructions.add, sto.base, Registers.l0, Registers.l0);
		String register = "";
		//we'll have to check if in struct later
		//should make a new method for this.
		if(sto.isReference) {
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.l0);
		}
		
		if(sto.getType().isInt() || sto.getType().isBool()){
			generateASM(Strings.two_param, Instructions.set, String.valueOf(csto.getIntValue()), Registers.l1);
			generateASM(Strings.two_param, Instructions.store, Registers.l1, "[" + Registers.l0 + "]");
		}else{
			this.assignFloat(csto);
			if(csto.getType().isInt()) {
				register = this.promoteIntToFloat(sto, csto);
				generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l0 + "]");
			} else {
				generateASM(Strings.two_param, Instructions.set, csto.offset, Registers.l1);
				generateASM(Strings.three_param, Instructions.add, csto.base, Registers.l1, Registers.l1);
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.f0);
				generateASM(Strings.two_param, Instructions.store, Registers.f0, "[" + Registers.l0 + "]");
			}
		}
		
	}
	
	public void generateASM(String temp, String ... args){
		StringBuilder str = new StringBuilder();		
		str.append(String.format(temp, (Object[])args));
		if(!inGlobalScope){
			tQueue.add(str.toString());
		} else if(isStatic){
			this.staticBuffer.add(str.toString());
		} else {
			this.executeBuffer.add(str.toString());
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
			tQueue.add("/* line number " + this.lineNumber + "*/\n");
			tQueue.add(str.toString());
		} else {
			executeBuffer.add("/* line number " + this.lineNumber + "*/\n");
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
			dQueue.add(assembleString(Strings.init, Strings.globalInit + ":", Strings.word, "0"));
			if(dQueue.size() > 0){
				flushData();
			}		
			if(bssQueue.size() > 0) {
				flushBSS();
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
	
	private void flushBSS() {
		// TODO Auto-generated method stub
		for(String i : bssQueue) {
			write(i);
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
			storeConvertedVar(left,right);
		} else if (!left.getType().isPointer()){
			generateComment("setting " + left.getName() + " = " + right.getName());	
			
			if(right.isConst()) {
				if(right.getType().isInt() || right.getType().isBool()) {
					
					generateASM(Strings.two_param, Instructions.set, String.valueOf(((ConstSTO) right).getIntValue()), Registers.l0);
					generateASM(Strings.two_param, Instructions.store, Registers.l0, "[" +Registers.fp + left.offset + "]");
				} else if(right.getType().isFloat()) {
					assignFloat((ConstSTO)right);
					generateASM(Strings.two_param, Instructions.set, left.offset, Registers.l0);
					generateASM(Strings.three_param, Instructions.add, left.base, Registers.l0, Registers.l0);
					
					
					generateComment("setting float");
					generateASM(Strings.two_param, Instructions.set, right.offset , Registers.l1);
					//l1 f0, l0
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.f0);
					generateASM(Strings.two_param, Instructions.store, Registers.f0, "[" + Registers.l0 + "]");
					
				}
			} else {
				generateASM(Strings.two_param, Instructions.set, left.offset, Registers.l0);
				generateASM(Strings.three_param, Instructions.add, left.base, Registers.l0, Registers.l0);
				generateASM(Strings.two_param, Instructions.set, right.offset, Registers.l1);
				generateASM(Strings.three_param, Instructions.add, right.base, Registers.l1, Registers.l1);
				if(right.isReference || right.isDereferenced) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.l1);
				}
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
		//initialized pointers
		else if(left.getType().isPointer()){
			Type leftPtrType = ((PointerType)left.getType()).getContainingType();
			Type rightType = right.getType();
			
			if(right.getType().isPointer()){
				generateASM("/* initializing pointer " + left.getName() + " with the value of " + right.getName() + " */\n");
//				generateASM(Strings.two_param, Instructions.load, "[" + right.base + right.offset + "]", Registers.o0);
//				generateASM(Strings.two_param, Instructions.store, Registers.o0, "[" + left.base + left.offset + "]");
				loadVariable(Registers.o0,right);
				storeVariable(Registers.o0,left);
			}
			else if(right.isConst()){
				
				generateASM(Strings.two_param, Instructions.set, ((ConstSTO)right).getValue().toString(), Registers.o0);
				generateASM(Strings.two_param, Instructions.store, Registers.o0, "[" + left.base + left.offset + "]");
			}
			
			//generateASM(Strings.three_param, Instructions.sub)
		}
		
	}
	
	public void doAddressOf(STO sto1, STO sto2){
		
		generateASM("/* getting address of " + sto1.getName() + " */\n");
		generateASM(Strings.three_param, Instructions.add, Registers.fp, sto1.offset, Registers.o0);
		
	}
	
	public String promoteIntToFloat(STO left, STO right) {
		generateComment("promoting");
		STO tmp = new ExprSTO("promoteCasting", new FloatType());
		tmp.base = Registers.fp;
		tmp.offset = "-4";
		
		if(right.isConst()) {
			storeVariable(tmp, right);
			loadVariable(Registers.f1, tmp);
		} else {
			loadVariable(Registers.f1, right);
		}
		
		generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
		generateComment("done promoting" );
		return Registers.f1;
	}
	
	public String promoteIntToFloat(STO left, STO right, String register) {
		generateComment("promoting");
		STO tmp = new ExprSTO("promoteCasting", new FloatType());
		tmp.base = Registers.fp;
		tmp.offset = "-4";
		
		if(right.isConst()) {
			storeVariable(tmp, right);
			loadVariable(register, tmp);
		} else {
			loadVariable(register, right);
		}
		
		generateASM(Strings.two_param, Instructions.fitos, register, register);
		generateComment("done promoting" );
		return register;
	}
	
	public void storeVariable(String register, STO sto){
		
		generateComment("Storing value of register " + register + " into " + sto.getName());
		generateASM(Strings.two_param, Instructions.store, register, "[" + sto.base + sto.offset + "]");
		
	}
	
	public void storeVariable(STO dest, STO value) {
		
		String dest_register = "";
		
		if(value.getType().isFloat()) {
			dest_register += Registers.f1;
		} else {
			dest_register += Registers.l5;
		}
		generateComment("Storing variable " + value.getName() + " into " + dest.getName());
		//setting destination
			generateASM(Strings.two_param, Instructions.set, dest.offset, Registers.l5);
			generateASM(Strings.three_param, Instructions.add, dest.base, Registers.l5, Registers.l5);
		if(dest.isReference) {
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l5 + "]", Registers.l5);
		}
		
		if(value.isConst() && !value.getType().isFloat()) {
			generateASM(Strings.two_param, Instructions.set, "" + ((ConstSTO) value).getIntValue(), Registers.l3);
			generateASM(Strings.two_param, Instructions.store, Registers.l3, "[" + dest_register + "]");
		} else {
			//setting value.
			generateASM(Strings.two_param, Instructions.set, value.offset, Registers.l3);
			generateASM(Strings.three_param, Instructions.add, value.base, Registers.l3, Registers.l3);
			if(value.getType().isFloat()) {
				if(value.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l3 + "]", Registers.l3);
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l3 + "]", dest_register);
				} else {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l3 + "]", dest_register);
				}
				
				generateASM(Strings.two_param, Instructions.store, dest_register, "[" + Registers.l5 + "]");
			} else {
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l3 + "]", Registers.l3);
				if(value.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l3 + "]", Registers.l3);
				}
				generateASM(Strings.two_param, Instructions.store, Registers.l3, "[" + Registers.l5 + "]");
			}
			

		}
		
		
	}
	
	public void storeConvertedVar(STO dest, STO source){
		
		String register = Registers.f1;
		
		if(source.getType() instanceof IntegerType){
			generateComment("Converting int " + source.getName() + " to float.");
			register = promoteIntToFloat(dest,source);
		}
//		else{
//			generateComment("Converting float " + source.getName() + " to int.");
//		}
		
		generateComment("Assigning converted " + source.getName() + " to " + dest.getName());
			generateASM(Strings.two_param, Instructions.set, dest.offset, Registers.l2);
			generateASM(Strings.three_param, Instructions.add, dest.base, Registers.l2, Registers.l2);
		
		generateASM(Strings.two_param, Instructions.store, register, "[" + register + "]");
		
	}

	public void loadVariable(String register, STO sto) {
		generateComment("Loading " + sto.getName() + " to " + register);
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
			
			if(sto.isReference || sto.isDereferenced) {
				//generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + sto.offset +"]", Registers.l1);
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.l1);
			}
			
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", register);
		}
		
	}
	
	public String basePlusOffset(String base, String offset, boolean negative){
		return "[" + base + (negative ? offset : "+" + offset.substring(1)) + "]";
	}
	
	public String mem(String register){
		return "[" + register + "]";
	}
	
	public void doDereference(STO sto, STO dereferencedSTO){
		generateComment("Dereferencing " + sto.getName());
		loadVariable(Registers.l0, sto);		
		//generateASM(Strings.two_param, Instructions.set, dereferencedSTO.offset, Registers.l1);
		//generateASM(Strings.three_param, Instructions.add, dereferencedSTO.base, Registers.l1, Registers.l1);
		//generateASM(Strings.two_param, Instructions.store, Registers.l0, "[" + Registers.l1 + "]");
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
		generateComment("printing float " + sto);
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
	
	public void storeParameters(STO sto, int num){
		generateComment("Storing parameter " + sto.getName());
		if(!sto.getType().isFloat() || sto.isReference){
			//generateASM(Strings.two_param, Instructions.store, "%i" + num, "[" + sto.base + "+" + sto.offset + "]");
			generateASM(Strings.two_param, Instructions.store, "%i" + num, "[" + sto.base + "+" + sto.offset + "]");
		} else {
			generateASM(Strings.two_param, Instructions.store, "%f" + num, "[" + sto.base + "+" + sto.offset + "]"); 
		}
	}

	public void prepareArguments(STO argument, VarSTO parameter, int argCounter) {
		
		if(argument.isConst() && argument.getType().isFloat() && (argument.base == null || argument.offset == null)) {
			assignFloat((ConstSTO)argument);
		}

		// TODO Auto-generated method stub
		boolean bothInt = !argument.getType().isFloat() && !parameter.getType().isFloat();
		boolean bothFloat = argument.getType().isFloat() && parameter.getType().isFloat();
		boolean argFloat = argument.getType().isFloat() && !parameter.getType().isFloat();
		boolean paramFloat = !argument.getType().isFloat() && parameter.getType().isFloat();
		generateComment("Preparing argument " + argument.getName());
		
		if(parameter.isReference) {
			if(argument.isReference) {
				this.storeReference(argument, "%o" + argCounter);
			} else {
				this.setAdd(argument, "%o" + argCounter);
			}
		} else {
			if(bothInt) {
				loadVariable("%o" + argCounter, argument);
			} else {
				if(bothFloat) {
					//
					loadVariable("%f" + argCounter, argument);
				} else {
					this.promoteIntToFloat(parameter, argument, "%f" + argCounter);
				}
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
		generateComment("Saving return value on to stack");
		String storeString = "[" + returnSTO.base + "+" + returnSTO.offset + "]";
		if(returnSTO.getType().isFloat()) {
			generateASM(Strings.two_param, Instructions.store, Registers.f0, storeString);
		} else {
			generateASM(Strings.two_param, Instructions.store, Registers.o0, storeString);
		}
	}

	public ConstSTO assignFloat(ConstSTO sto) {
		sto.offset = Strings.assignFloat + stringLits;
		sto.base = Registers.g0;
		this.floatQueue.add(this.generateString(Strings.init, Strings.assignFloat + this.stringLits++ + ":", Strings.single, "0r" + sto.getFloatValue()));
		return sto;
	}
	
	public void assignFloat(STO des, STO value) {
		this.floatQueue.add(this.generateString(Strings.init, Strings.assignFloat + this.stringLits++ + ":", Strings.single, "0r" + ((ConstSTO) value).getFloatValue()));
		
	}

	public void constantInit(STO id, STO sto) {
		// TODO Auto-generated method stub
		
	}	
	
	//do static guard, forgot that we needed this.
	public void staticerino(STO sto) {
		dQueue.add(assembleString(Strings.init, Strings.staticGuard + sto.offset + ":", Strings.word, "0"));
		this.staticBuffer.add(assembleString(Strings.two_param, Instructions.set, Strings.staticGuard + sto.offset, Registers.l0));
		this.staticBuffer.add(assembleString(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.l1));
		this.staticBuffer.add(assembleString(Strings.two_param, Instructions.cmp, Registers.g0, Registers.l1));
		this.staticBuffer.add(assembleString(Strings.one_param, Instructions.bne, Strings.staticGuardLabel + sto.offset));
		this.staticBuffer.add(assembleString(Strings.nop));
	}
	
	public void staticerino_end(STO sto) {
		this.staticBuffer.add(assembleString(Strings.two_param, Instructions.set, Strings.staticGuard + sto.offset, Registers.l2));
		this.staticBuffer.add(assembleString(Strings.two_param, Instructions.set, "1", Registers.l3));
		this.staticBuffer.add(assembleString(Strings.two_param, Instructions.store, Registers.l3, "[" + Registers.l2 + "]"));
		this.staticBuffer.add(assembleString(Strings.label, Strings.staticGuardLabel + sto.offset));
	}

	public void doBinaryOp(STO result) {
		
		// TODO Auto-generated method stub
		generateComment("Doing binary expression");
		generateASM(Strings.two_param, Instructions.set, result.offset, Registers.l0);
		generateASM(Strings.three_param, Instructions.add, result.base, Registers.l0, Registers.l0);
		generateASM(Strings.two_param, Instructions.store, String.valueOf(((ConstSTO) result).getValue()), "[" + Registers.l0 + "]");
	}

	public void evaluateBinary(STO left, STO right, BinaryOp op, STO sto) {
		if(right.isConst() && right.getType().isFloat() && (right.base == null || right.offset == null)) {
			assignFloat((ConstSTO)right);
		}
		
		if(left.isConst() && left.getType().isFloat() && (left.base == null || left.offset == null)) {
			assignFloat((ConstSTO)left);
		}
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
				
				//left float right int
				if(leftFloat && !rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				}
				
				//left int right float
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
				
				//left float right int
				if(leftFloat && !rightFloat) {
					this.generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				}
				
				//left int right float
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
		} else if(op.getName().equals("&&")){
			generateComment("&&-ing");
			generateASM(Strings.two_param, Instructions.cmp, Registers.l1, Registers.g0);
			generateASM(Strings.one_param, Instructions.bne, Strings.andT + andCount);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.andF + andCount);
			generateASM(Strings.two_param, Instructions.set, "0", Registers.l2);
			generateASM(Strings.one_param, Instructions.ba, Strings.andEnd + andCount);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.andT + andCount);
			generateASM(Strings.two_param, Instructions.set, "1", Registers.l2);
			generateASM(Strings.label, Strings.andEnd + andCount);
			andCount++;
			register = Registers.l2;
		} else if(op.getName().equals("||")){
			generateComment("||-ing");
			generateASM(Strings.two_param, Instructions.cmp, Registers.l1, Registers.g0);
			generateASM(Strings.one_param, Instructions.bne, Strings.orT + orCount);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.orF + orCount);
			generateASM(Strings.two_param, Instructions.set, "0", Registers.l2);
			generateASM(Strings.one_param, Instructions.ba, Strings.orEnd + orCount);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.orT + orCount);
			generateASM(Strings.two_param, Instructions.set, "1", Registers.l2);
			generateASM(Strings.label, Strings.orEnd + orCount);
			orCount++;
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
		//address of array
		generateASM(Strings.two_param, Instructions.set, array.offset, Registers.l1);
		generateASM(Strings.three_param, Instructions.add, array.base, Registers.l1, Registers.l1);
		
		//storing into array
		
		//
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
		
		if(right.isConst() && right.getType().isFloat() && (right.base == null || right.offset == null)) {
			assignFloat((ConstSTO)right);
		}
		
		if(left.isConst() && left.getType().isFloat() && (left.base == null || left.offset == null)) {
			assignFloat((ConstSTO)left);
		}
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
				boolean onlyLeftFloat = left.getType().isFloat() && !right.getType().isFloat();
				boolean onlyRightFloat = !left.getType().isFloat() && right.getType().isFloat();
				STO temp = new ExprSTO("temp", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				
				//load right
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, left);
				} else {
					loadVariable(Registers.f0, left);
				}
				
				//load left
				if(left.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, right);
				} else {
					loadVariable(Registers.f1, right);
				}
				
				if(onlyLeftFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				} else if(onlyRightFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.two_param, Instructions.fcmps, Registers.f0, Registers.f1);
				generateASM(Strings.one_param, Instructions.fbl, Strings.lessThan + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.lessThanEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.lessThan + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.lessThanEnd + comparisons);
				comparisons++;
				register = Registers.l3;
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
				boolean onlyLeftFloat = left.getType().isFloat() && !right.getType().isFloat();
				boolean onlyRightFloat = !left.getType().isFloat() && right.getType().isFloat();
				STO temp = new ExprSTO("temp", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				
				//load right
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, left);
				} else {
					loadVariable(Registers.f0, left);
				}
				
				//load left
				if(left.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, right);
				} else {
					loadVariable(Registers.f1, right);
				}
				
				if(onlyLeftFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				} else if(onlyRightFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.two_param, Instructions.fcmps, Registers.f0, Registers.f1);
				generateASM(Strings.one_param, Instructions.fble, Strings.lessEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.lessEqualEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.lessEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.lessEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
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
				//handle floats
				boolean onlyLeftFloat = left.getType().isFloat() && !right.getType().isFloat();
				boolean onlyRightFloat = !left.getType().isFloat() && right.getType().isFloat();
				STO temp = new ExprSTO("temp", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				
				//load right
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, left);
				} else {
					loadVariable(Registers.f0, left);
				}
				
				//load left
				if(left.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, right);
				} else {
					loadVariable(Registers.f1, right);
				}
				
				if(onlyLeftFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				} 
				if(onlyRightFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.two_param, Instructions.fcmps, Registers.f0, Registers.f1);
				generateASM(Strings.one_param, Instructions.fbg, Strings.greaterThan + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.greaterThanEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.greaterThan + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.greaterThanEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			}
		} else if(op.getName().equals(">=")) {
			generateComment("Starting greater than equal");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.bge, Strings.greaterEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.greaterEqualEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.greaterEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.greaterEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
				//handle floats
				boolean onlyLeftFloat = left.getType().isFloat() && !right.getType().isFloat();
				boolean onlyRightFloat = !left.getType().isFloat() && right.getType().isFloat();
				STO temp = new ExprSTO("temp", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				
				//load right
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, left);
				} else {
					loadVariable(Registers.f0, left);
				}
				
				//load left
				if(left.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, right);
				} else {
					loadVariable(Registers.f1, right);
				}
				
				if(onlyLeftFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				} else if(onlyRightFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.two_param, Instructions.fcmps, Registers.f0, Registers.f1);
				generateASM(Strings.one_param, Instructions.fbge, Strings.greaterEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.greaterEqualEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.greaterEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.greaterEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			}
		} else if(op.getName().equals("!=")) {
			generateComment("Starting not equal");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.bne, Strings.nEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.nEqualEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.nEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.nEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
				boolean onlyLeftFloat = left.getType().isFloat() && !right.getType().isFloat();
				boolean onlyRightFloat = !left.getType().isFloat() && right.getType().isFloat();
				STO temp = new ExprSTO("temp", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				
				//load right
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, left);
				} else {
					loadVariable(Registers.f0, left);
				}
				
				//load left
				if(left.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, right);
				} else {
					loadVariable(Registers.f1, right);
				}
				
				if(onlyLeftFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				} else if(onlyRightFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.two_param, Instructions.fcmps, Registers.f0, Registers.f1);
				generateASM(Strings.one_param, Instructions.fbne, Strings.nEqual + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.nEqualEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.nEqual + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.nEqualEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			}
		} else if(op.getName().equals("==")) {
			generateComment("Starting == equal");
			if(isBothInt) {
				generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.l1);
				generateASM(Strings.one_param, Instructions.be, Strings.equal + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.equalEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.equal + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.equalEnd + comparisons);
				comparisons++;
				register = Registers.l3;
			} else {
				//handle floats
				boolean onlyLeftFloat = left.getType().isFloat() && !right.getType().isFloat();
				boolean onlyRightFloat = !left.getType().isFloat() && right.getType().isFloat();
				STO temp = new ExprSTO("temp", new FloatType());
				temp.offset = "4";
				temp.base = Registers.fp;
				
				//load right
				if(left.isConst()) {
					this.storeVariable(temp, left);
					this.loadVariable(Registers.f0, left);
				} else {
					loadVariable(Registers.f0, left);
				}
				
				//load left
				if(left.isConst()) {
					this.storeVariable(temp, right);
					this.loadVariable(Registers.f1, right);
				} else {
					loadVariable(Registers.f1, right);
				}
				
				if(onlyLeftFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f1, Registers.f1);
				} else if(onlyRightFloat) {
					generateASM(Strings.two_param, Instructions.fitos, Registers.f0, Registers.f0);
				}
				
				generateASM(Strings.two_param, Instructions.fcmps, Registers.f0, Registers.f1);
				generateASM(Strings.one_param, Instructions.fbe, Strings.equal + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.two_param, Instructions.set, "0", Registers.l3);
				generateASM(Strings.one_param, Instructions.ba, Strings.equalEnd + comparisons);
				generateASM(Strings.nop);
				generateASM(Strings.label, Strings.equal + comparisons);
				generateASM(Strings.two_param, Instructions.set, "1", Registers.l3);
				generateASM(Strings.label, Strings.equalEnd + comparisons);
				comparisons++;
				register = Registers.l3;
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
				loadVariable(Registers.l0, origin);
				
				generateASM(Strings.one_param, Instructions.dec, Registers.l0);
				
				register = Registers.l0;
				
				generateASM(Strings.two_param, Instructions.set, origin.offset, Registers.l2);
				generateASM(Strings.three_param, Instructions.add, origin.base, Registers.l2, Registers.l2);
				
				if(origin.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l2 + "]", Registers.l2);
				}
				
				generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l2 + "]");
				
				//increment after, so we return l0 to original value.
				//hacky. might want to change.
				if(data.equals("post")) {
					generateComment("Post decrement");
					generateASM(Strings.one_param, Instructions.inc, register);
				}
			} else {
				loadVariable(Registers.f0, origin);
				//oh god we probably need a constant float here or something
				generateASM(Strings.two_param, Instructions.set, Strings.floatForceOne, Registers.l6);
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l6 + "]", Registers.f1);
				generateASM(Strings.three_param, Instructions.fsub, Registers.f0, Registers.f1, Registers.f2);
				
				generateASM(Strings.two_param, Instructions.set, origin.offset, Registers.l1);
				generateASM(Strings.three_param, Instructions.add, origin.base, Registers.l1, Registers.l1);
				
				if(origin.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.l1);
				}
				
				generateASM(Strings.two_param, Instructions.store, Registers.f2, "[" + Registers.l1 + "]");
				
				if(data.equals("post")) {
					generateASM(Strings.three_param, Instructions.fadd, Registers.f2, Registers.f1, Registers.f2);
				}
				
				register = Registers.f2;
			}
		} else if(op.getName().equals("++")) {
			generateComment("Incrementing");
			if(!isFloat) {
				loadVariable(Registers.l0, origin);
				
				generateASM(Strings.one_param, Instructions.inc, Registers.l0);
				
				register = Registers.l0;
				
				generateASM(Strings.two_param, Instructions.set, origin.offset, Registers.l2);
				generateASM(Strings.three_param, Instructions.add, origin.base, Registers.l2, Registers.l2);
				
				if(origin.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l2 + "]", Registers.l2);
				}
				
				generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l2 + "]");
				
				//increment after, so we return l0 to original value.
				//hacky. might want to change.
				if(data.equals("post")) {
					generateComment("Post Increment");
					generateASM(Strings.one_param, Instructions.dec, register);
				}
			} else {
				loadVariable(Registers.f0, origin);
				//oh god we probably need a constant float here or something
				generateASM(Strings.two_param, Instructions.set, Strings.floatForceOne, Registers.l6);
				generateASM(Strings.two_param, Instructions.load, "[" + Registers.l6 + "]", Registers.f1);
				generateASM(Strings.three_param, Instructions.fadd, Registers.f0, Registers.f1, Registers.f2);
				
				generateASM(Strings.two_param, Instructions.set, origin.offset, Registers.l1);
				generateASM(Strings.three_param, Instructions.add, origin.base, Registers.l1, Registers.l1);
				
				if(origin.isReference) {
					generateASM(Strings.two_param, Instructions.load, "[" + Registers.l1 + "]", Registers.l1);
				}
				
				generateASM(Strings.two_param, Instructions.store, Registers.f2, "[" + Registers.l1 + "]");
				
				if(data.equals("post")) {
					generateASM(Strings.three_param, Instructions.fsub, Registers.f2, Registers.f1, Registers.f2);
				}
				
				register = Registers.f2;
			}
		} else if(op.getName().equals("!")) {
			generateComment("Negating");
			loadVariable(Registers.l0, origin);
			
			generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
			generateASM(Strings.one_param, Instructions.be, Strings.increment + numNots);
			generateASM(Strings.nop);
			generateASM(Strings.label, Strings.decrement + numNots);
			generateASM(Strings.one_param, Instructions.dec, Registers.l0);
			generateASM(Strings.one_param, Instructions.ba, Strings.negEnd + numNots);
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
		generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l1 + "]");
	}
	
	public void doReturn(STO returnSTO, FuncSTO func) {
		// TODO Auto-generated method stub
		generateComment("Returning value from " + func.getName());
		
		//check if reference
		//if(refernece) {}
		
		if(returnSTO.isConst()) {
			if(func.getReturnType().isFloat()) {
				if(returnSTO.getType().isFloat()) {					
					assignFloat((ConstSTO) returnSTO);
					loadVariable(Registers.f0, returnSTO);
				} else {
					
					//gotta do that damn stupid float conversion
					generateASM(Strings.two_param, Instructions.set, String.valueOf(((ConstSTO) returnSTO).getIntValue()), Registers.l0);
					generateASM(Strings.two_param, Instructions.store, Registers.l0, Strings.floatOffset);
					generateASM(Strings.two_param, Instructions.load, Strings.floatOffset, Registers.f0);
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
	
	public void DoCIN(STO sto){
		generateComment("Starting cin");
		generateASM(Strings.two_param,Instructions.set,sto.offset,Registers.l5);
		generateASM(Strings.three_param,Instructions.add,sto.base,Registers.l5,Registers.l5);
		
		if(!(sto.getType() instanceof FloatType)){
			//cin going to int
			generateASM(Strings.call_op, "inputInt");
			generateASM(Strings.nop);
			generateASM(Strings.two_param, Instructions.store, Registers.o0, "[" + Registers.l5 + "]");
		}else{
			//cin going to float
			generateASM(Strings.call_op, "inputFloat");
			generateASM(Strings.nop);
			generateASM(Strings.two_param, Instructions.store, Registers.f0, "[" + Registers.l5 + "]");		
		}
	}

	public void DoExitStmt(STO expr) {
		// TODO Auto-generated method stub
		loadVariable(Registers.o0, expr);
		
		generateASM(Strings.call_op, Strings.exit);
		generateASM(Strings.nop);
	}

	public void doVoidReturn(FuncSTO func) {
		generateASM(Strings.one_param, Instructions.ba, func.getName() + Strings.functionEnd);
		generateASM(Strings.nop);
		
	}

	public void doGlobalInit() {
		// TODO Auto-generated method stub
		generateASM(Strings.two_param, Instructions.set, Strings.globalInit, Registers.l0);
		generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0 + "]", Registers.l0);
		generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
		generateASM(Strings.one_param, Instructions.bne, Strings.globalInit + "end");
		generateASM(Strings.nop);
	}
	
	public void globalInitEnd() {
		generateASM(Strings.two_param, Instructions.set, Strings.globalInit, Registers.l0);
		generateASM(Strings.two_param, Instructions.set, "1", Registers.l1);
		generateASM(Strings.two_param, Instructions.store, Registers.l1, "[" + Registers.l0 + "]");
		generateASM(Strings.label, Strings.globalInit + "end");
	}
	
	public STO doNegate(STO sto, STO returnSTO) {
		generateComment("negating...");
		String register = "";
		generateASM(Strings.two_param, Instructions.set, sto.offset, Registers.l0);
		generateASM(Strings.three_param, Instructions.add, sto.base, Registers.l0, Registers.l0);
		if(sto.getType().isFloat()) {
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0  + "]", Registers.f0);
			generateASM(Strings.one_param, Instructions.fnegs, Registers.f0);
			register = Registers.f0;
		} else {
			generateASM(Strings.two_param, Instructions.load, "[" + Registers.l0  + "]", Registers.l1);
			generateASM(Strings.one_param, Instructions.neg, Registers.l1);
			register = Registers.l1;
		}
		
		generateASM(Strings.two_param, Instructions.set, returnSTO.offset, Registers.l2);
		generateASM(Strings.three_param, Instructions.add, returnSTO.base, Registers.l2, Registers.l2);
		generateASM(Strings.two_param, Instructions.store, register, "[" + Registers.l2 + "]");
		
		return returnSTO;
	}

	public void doWhile(STO expr) {
		// TODO Auto-generated method stub
		loadVariable(Registers.l0, expr);
		generateASM(Strings.two_param, Instructions.cmp, Registers.l0, Registers.g0);
		generateASM(Strings.one_param, Instructions.be, Strings.whileEnd + whileStmts);
		generateASM(Strings.nop);
		
		whileStack.push(whileStmts);
		loopStack.push(0);
		finalWhileStmts = whileStmts;
		whileStmts++;
		
		
	}
	
	public void endWhile() {
		noWhiles = whileStack.pop();
		
		generateASM(Strings.one_param, Instructions.ba, Strings.whileStmt + noWhiles);
		generateASM(Strings.nop);
		generateASM(Strings.label, Strings.whileEnd + noWhiles);
		finalWhileStmts--;
	}
	
	public void startWhile() {
		generateASM(Strings.label, Strings.whileStmt + whileStmts);
	}

	public void doBreak() {
		// TODO Auto-generated method stub
		int loop = loopStack.pop();
		
		if(loop == 0) {
			doWhileBreak();
		} else {
			doForBreak();
		}
	}
	
	public void doWhileBreak() {
		generateComment("Breaking out of while loop");
		generateASM(Strings.one_param, Instructions.ba, Strings.whileEnd + finalWhileStmts);
		generateASM(Strings.nop);
	}
	
	public void doForBreak() {
		generateComment("breaking out of for loop");
		generateASM(Strings.one_param, Instructions.ba, Strings.forEnd + finalForStmts);
		generateASM(Strings.nop);
	}

	public void doContinue() {
		// TODO Auto-generated method stub
		int loop = loopStack.peek();
		
		if(loop == 0) {
			doWhileContinue();
		} else {
			doForContinue();
		}
		
		
	}

	private void doForContinue() {
		// TODO Auto-generated method stub
		generateComment("Continuing for loop");
		generateASM(Strings.one_param, Instructions.ba, Strings.forStart + finalForStmts);
		generateASM(Strings.nop);
	}

	private void doWhileContinue() {
		// TODO Auto-generated method stub
		generateComment("Continuing while loop");
		generateASM(Strings.one_param, Instructions.ba, Strings.whileStmt + finalWhileStmts);
		generateASM(Strings.nop);
	}

	public void doStructDesignatorLoad(STO struct, STO member, FuncSTO func) {
		// TODO Auto-generated method stub
		String accessName = member.getName();
		StructType structType = (StructType) struct.getType();
		int offset = Integer.parseInt(struct.offset);
		Scope scope = structType.getScope();
		int accumulator = 0;
		int totalOffset = 0;
		
		for( STO mem : scope.accessAll()) {
			String memberName = mem.getName();
			if(accessName.equals(memberName)) {
				break;
			}
			
			if(mem.isFunc() == false) {
				accumulator += mem.getType().getSize();
			}
			
		}
		totalOffset = offset + accumulator;
	}

	public void storeStruct(STO dest, STO origin) {
		// TODO Auto-generated method stub
		generateComment("Assigning struct " + origin.getName() + " to " + dest.getName());
		setAdd(origin, Registers.o1);
		setAdd(dest, Registers.o0);
		generateASM(Strings.two_param, Instructions.set, String.valueOf(dest.getType().getSize()), Registers.o2);
		generateASM(Strings.call_op, Strings.memcpy);
		generateASM(Strings.nop);
	}
	
	public String setAdd(STO sto, String register) {
		generateASM(Strings.two_param, Instructions.set, sto.offset, register);
		generateASM(Strings.three_param, Instructions.add, sto.base, register, register);
		
		if(sto.isDereferenced || sto.isReference) {
			generateASM(Strings.two_param, Instructions.load, "[" + register + "]", register);
		}
		
		return register;
	}
	
	public void storeReference(STO sto, String register) {
		this.setAdd(sto, Registers.l0);
		generateASM(Strings.two_param, Instructions.move, Registers.l0, register);
	}
}