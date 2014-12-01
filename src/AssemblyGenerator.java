import java.util.*;
import java.io.*;

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
	
	private List<String> executeBuffer = new Vector<String>();
	
	public AssemblyGenerator(String fileName) {
		try {
			internalConstants();
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
		write(assembleString(Strings.init, Strings.boolt + ":", ".asciz", "\"true\""));
		write(assembleString(Strings.init, Strings.boolf + ":", ".asciz", "\"false\""));
		
		write(assembleString("\n"));
	}
	
	public void beginText(){
		// from slides
		generateASM(Strings.section, ".section", "\".text\"");
		generateASM(Strings.falign, Strings.align, "4");
	}
	
	public void beginData(){
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
		}
	}
	
	public void flushData(){
		//TODO fuck
	}
	
	public void doConstInt(String str){
		generateASM(Strings.tab + Strings.two_param, Instructions.set, Strings.intfmt, Registers.o0);
		generateASM(Strings.tab + Strings.two_param, Instructions.set, str, Registers.o1);
		generateASM(Strings.tab + Strings.call_op, Strings.printf);
		generateASM(Strings.tab + Strings.nop);
		generateASM("\n");
	}
	
	public void doConstBool(String str){
		generateASM(Strings.tab + Strings.two_param, Instructions.set, Strings.intfmt, Registers.o0);
		generateASM(Strings.tab + Strings.two_param, Instructions.set, str.equals("true") ? Strings.boolt : Strings.boolf, Registers.o1);
		generateASM(Strings.tab + Strings.call_op, Strings.printf);
		generateASM(Strings.tab + Strings.nop);
		generateASM("\n");
	}
	
	public void doConstFloat(String str){
		//TODO not sure
	}
	
	public void doMove(String r1, String r2){
		generateASM(Strings.two_param, Instructions.move, r1, r2);
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
	
	public void write(String str){
		try{
			fileWriter.write(str);
		}
		catch(IOException e){
			System.out.println("Error writing to file");
			e.printStackTrace();
		}
	}
	
	public void end(){
		try{
			//TODO flush data
			write("\n");
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

}