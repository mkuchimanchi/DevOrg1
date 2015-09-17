@isTest
public class TestMyTrg{
 public static  testMethod void main(){
 
    SampleTest__c s1= new SampleTest__c();
    String sname='A-0007';
    s1 = [select Sample_field1__c,Sample_field2__c,Status__c from SampleTest__c where Name=:sname];
    s1.Sample_field1__c = 'Test';                       
    System.Debug('s1.Sample_field1__c'+s1.Sample_field1__c);
    update s1;
 }

}