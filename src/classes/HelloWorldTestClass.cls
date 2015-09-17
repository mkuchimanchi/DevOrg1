@isTest

private class HelloWorldTestClass {
   static testMethod void validateHelloWorld() {
      Book__c b = new Book__C(Name='Behind the Cloud',Price__c =100);
      System.debug('Price before inserting book -> ' + b.Price__c);
      // Insert b
      insert b;
      //Retrieve new book price
      System.debug('Price after inserting book -> ' + b.Price__c);
   }
}