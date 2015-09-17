trigger TextbookTrigger on Textbook__c (before insert ) {
   List<Textbook__c> books =trigger.new;
   MyTextbookClass.applyDiscount(books);
   
}