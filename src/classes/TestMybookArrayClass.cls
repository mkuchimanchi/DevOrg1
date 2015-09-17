@isTest
Public class TestMybookArrayClass{

  public static testMethod Void main(){
    List<Book__c> li = new List<Book__c>();
    Integer i=100;
    for(Integer j=0;j<20;j++){
    li.add(new Book__c(Name='Java',Price__c=i));   
    i++;
    }
    
    insert li;
        
  } 
}