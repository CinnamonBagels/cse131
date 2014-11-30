public class Strings {
	public static final String FILE_HEADER = 
			"/*\n" + 
			" * Generated %s\n" + 
			" */\n\n";

	public static final String tab = "    ";
	public static final boolean noindent = true;
	public static final boolean skip = true;
	
	public static final String section = "%24s" + tab + " %s\n";
    public static final String label = "%s:\n";
    public static final String interc = "%-12s" + tab + "%-12s %-12s\n";
    public static final String one_param = "%-4s" + tab + "%s\n";
    public static final String two_param = "%-8s" + tab + "%s, %s\n";
    public static final String three_param = "%-8s" + tab + "%s, %s, %s\n";
    public static final String call_op = "call" + tab + "%s\n";
    public static final String save = "SAVE.%s = -(92+%s) & -8\n";
    public static final String ret = "%-4s\n";
    public static final String restore = "%-4s\n";
    public static final String nop = "nop\n";
    public static final String exit = "exit\n";
    
    public static final String array_out_of_bounds_fmt = "_aOfBFmt";
    public static final String array_out_of_bounds_label = "_arrayOutOfBoundsLabel";
    public static final String null_deref_ptr_fmt = "_nullPtrFmt";
    public static final String null_pointer_deref_label ="_nullPointerDerefLabel";
    public static final String memory_leak_label = "_memoryLeakCheck";
    public static final String memory_leak_fmt = "_memLeakFmt";
    public static final String nullpointer = "_nullPointer";

    public static final String printf = "printf";
    public static final String printfloat = "printFloat";
    
    public static final String intfmt = "_intFmt";
    public static final String strfmt = "_strFmt";
    public static final String boolt = "_boolT";
    public static final String boolf = "_boolF";
    public static final String endl = "_endl";
    
    public static final String falign = "%24s\n";
    public static final String align = ".align 4";
}
