@isTest
public class TestMyTextbookClass{
   public static testMethod void main(){
      Textbook__c book = new Textbook__c(Name='JDK',Price__c=100);
      System.Debug('Price before insert'+book.Price__c);
      insert book;
      book= [select Price__c from Textbook__c where id=:book.id];
      System.debug('Price after insert'+book.Price__c);
      System.assertEquals(90,book.Price__c);
         
      
   }
}