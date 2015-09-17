@istest
public class Account1TriggerHelperTest{

/* This test method test the scenario for update accountcontact .
sdssdsd

*/
 
   static testMethod void positiveTestCreationofTask(){

      Account acc = new Account();
      acc.name = 'TCS';
      insert acc;
      Account acc1 = [select id,Contactacct__c from Account where name = :acc.name];
      Contact con = new Contact();
      con.lastname= 'Susee';
      con.Accountid = acc1.id;
      insert con;
      acc1.Contactacct__c = 'Test';
      update acc1;
      Contact con1=[select id,Contactacct__c from Contact where Accountid = :acc1.id];
      System.assertEquals('Test',con1.Contactacct__c);
   }
}