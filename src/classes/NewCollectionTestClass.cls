@isTest
public  class NewCollectionTestClass{
   public static testMethod void main(){
   	  List<Integer> numbers = new List<Integer>();
   	  Integer num1 = 15;
   	  Integer num2 = 20;
   	  Integer num3 = 25;
   	  numbers.add(num1);
   	  numbers.add(num2);
   	  numbers.add(num3);
   	  System.debug('The values in the collection are ' + numbers);
   }

}