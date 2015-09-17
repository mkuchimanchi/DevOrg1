@isTest
public class SampleListTest{
    public static testMethod void main (){
       List <Integer> li = new List<Integer>{10,20,30,40,50,60,70,80,90,100};
       li.add(100);
       li.add(110);
       for (Integer i:li) {
            System.debug(i);
       }
    
       li.set(10,110);
       li.set(11,120);
       
    
       for (Integer i:li) {
            System.debug(i);
       }
       System.debug('The second element in the list is ' + li[1]);
   
       for (Integer j =1;j<=10;j++){
            System.debug(j);
       }
    }
}