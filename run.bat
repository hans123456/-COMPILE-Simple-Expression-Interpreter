SET CLASSPATH=.;antlr-4.2-complete.jar;%CLASSPATH%
java org.antlr.v4.Tool Simple.g4 -o generated
javac -O -d generated -cp .;antlr-4.4-complete.jar;antlr-runtime-4.4.jar;generated; src/*.java
java -cp .;antlr-runtime-4.4.jar;generated; Main
pause
