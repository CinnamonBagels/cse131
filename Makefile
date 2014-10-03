JAVACUP=$(PUBLIC)/Tools/java-cup-v11a.jar

SOURCES:sh = find src -type f -name '*.java' ! -name 'RC*.java'

bin/%.class : src/%.java
	@mkdir -p bin
	javac -classpath $(JAVACUP) -d bin -sourcepath src $<

#First target is the default target if "make" is run without a target
rc: src/parser.java bin/RC.class $(SOURCES:src/%.java=bin/%.class)

debug: src/parser.java bin/RCdbg.class $(SOURCES:src/%.java=bin/%.class)

new:
	make clean
	make rc

newdebug:
	make clean
	make debug

src/parser.java: src/rc.cup
	cd src; java -jar $(JAVACUP) < rc.cup

clean:
	cd src; rm -f *.class parser.java sym.java *.o
	rm -f rc.s a.out
	rm -rf bin/

