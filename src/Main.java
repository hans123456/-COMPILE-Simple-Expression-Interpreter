
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class Main
{

	public static void main (String[] args)	throws IOException, InterruptedException, Exception
	{

		SimpleParser.RContext start	=	new SimpleParser(
											new CommonTokenStream(
												new SimpleLexer(
													new ANTLRInputStream(
														new FileInputStream(
															new File(
																"test cases//test case 1.txt"
															)
														)
													)
												)
											)
										).r();

		ParseTreeWalker walker = new ParseTreeWalker();
		SimpleBaseListener listener = new SimpleBaseListener();
		walker.walk(listener, start);

	}

}
