public class MyTextbookClass{

   public static void applyDiscount(List<Textbook__c> books){
      for(Textbook__c b:books){
          b.Price__c*=0.9;
      }
   }
}