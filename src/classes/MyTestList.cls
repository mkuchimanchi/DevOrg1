//test class to create list,display list and insert list 
@isTest
  public class MyTestList{
    testMethod static public void main(){
      Integer[] myList = new List<Integer>();
      List<Integer> myList1 = new List<Integer>();
      List<String> myStrings = new List<String> {'one','two'};
      Integer i,j;
      myList.add(10);
      myList1.add(20);
      myList[0]=15;
      myList.set(0,16);
      i = myList[0];
      j = myList1.get(0);
      System.debug('First element in List using myList[0] -->' + i);
      System.debug('First element in List1 using myList1.get(0)-->'+ j);
      System.debug('Display of all elements in the List of mystrings() using myStrings -->' + myStrings);
      System.debug('Runnning in Eclipse');
      System.debug('Hello Eclipse World!');
      
    }
  }