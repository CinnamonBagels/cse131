import java.util.*;
import java.io.*;

import STO.*;
import Types.*;

public class AssemblyGenerator {
	//output writer
	private FileWriter fileWriter;
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
		write("! DEFINING INTERNAL CONSTANTS --\n");
		write(assembleString(Strings.section,".section","\".rodata\""));
		write(assembleString(Strings.interc, Strings.endl + ":", ".asciz", "\"\\n\""));
		write(assembleString(Strings.interc, Strings.intfmt + ":", ".asciz", "\"%d\""));
		write(assembleString(Strings.interc, Strings.boolt + ":", ".asciz", "\"true\""));
		write(assembleString(Strings.interc, Strings.boolf + ":", ".asciz", "\"false\""));
		
		write(assembleString("\n"));
	}
	
	public void beginText(){
		generateASM(Strings.section, ".section", "\".text\"");
		generateASM(Strings.falign, Strings.align, "4");
	}
	
	public void beginData(){
		write(assembleString(Strings.section, ".section", "\".data\""));
		write(assembleString(Strings.falign, Strings.align, "4"));
	}
	
	public void beginBSS(STO sto){
		generateASM(Strings.section, ".section", "\".bss\"");
		generateASM(Strings.falign, Strings.align);
		generateASM(Strings.interc, sto.getName() + ":", ".skip", "4");
		gVars.add(sto.getName());
		generateASM("\n");
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
	
	public String assembleString(String temp, String ... args){
		StringBuilder str = new StringBuilder();
		str.append(String.format(temp, (Object[])args));
		return str.toString();
	}

}