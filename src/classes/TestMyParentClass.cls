@isTest
public class TestMyParentClass{

public static testMethod void main(){
MyParentClass.setStaticValue(100);
MyParentClass p1 = new MyParentClass();
p1.getValues();
p1.setValues(1001,2001);
p1.getValues();
}
}