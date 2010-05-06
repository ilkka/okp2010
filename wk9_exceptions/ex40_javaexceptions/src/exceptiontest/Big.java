package exceptiontest;

public class Big
{
    public static void fun1() throws SomeException { 
            //try { 
                    throw new SomeException(); 
                    //throw new OtherException(); 
            //} 
        //catch (OtherException e) {
        //    System.out.println("Exception handler in Big::fun1() caught OtherException");
       // }
    }
}

