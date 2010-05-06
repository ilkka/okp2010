package exceptiontest;
public class ExceptionTest
{
    public static void main(String args[])
    {
    	Small s = new Small();
        try {
			s.fun2();
		} catch (OtherException e) {
			System.err.println("Top-level handler caught OtherException");
			e.printStackTrace();
		}
    }
}

