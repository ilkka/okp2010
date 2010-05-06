package exceptiontest;

class Small {
    public void fun2() throws OtherException { 
        try { 
            try { 
                Big.fun1(); 
                throw new OtherException();
                //throw new SomeException(); 
            } 
            catch(SomeException e) {
                System.out.println("Inner exception handler in Small::fun2() caught SomeException");
            } 
        } 
        catch(OtherException e) {
            System.out.println("Outer exception handler in Small::fun2() caught OtherException");
        }
    } 
} 

