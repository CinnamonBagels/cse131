import java.util.*;
import java.io.*;

import STO.*;
import Types.*;

public class AssemblyGenerator {
	//output writer
	private FileWriter fileWriter;
	
	public AssemblyGenerator(String fileName) {
		try {
			fileWriter = new FileWriter(fileName);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
}
