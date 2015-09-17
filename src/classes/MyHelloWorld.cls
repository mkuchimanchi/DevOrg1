public class MyHelloWorld{

   public static void applyDiscount(Book__c[] books){
      for (Book__c b1:books){
         b1.Price__c *= 0.9;
      }     
   }

}