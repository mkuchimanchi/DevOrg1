@isTest
public class TestMyChildClass{

public static testMethod void main(){
//MyChildClass.setStaticValue(100);
MyChildClass p1 = new MyChildClass();
//MyParentClass p1 = new MyChildClass();
p1.getValues();
p1.setValues(1001,2001,10,20);
//p1.setValues(1001,2001);
p1.getValues();
System.debug('The sum of two numbers '+ p1.addValues());
System.debug('The multipication of two numbers '+ p1.multiply());
}
}