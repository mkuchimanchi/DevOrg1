@isTest
Public class TestMybookClass{

  public static testMethod Void main(){
    Book__c b = new Book__c(Name='Java tutorial',Price__c=100);
    System.debug('The price of the book before insert '+ b.Price__c);
    insert b;
    b = [select Price__c from Book__c where id = :b.Id];
    System.debug('The price of the book after insert ' + b.Price__c);
    System.assertEquals(90,b.Price__c);
  }
  
}