public with sharing class myControllr1 {

    public String OutPutString { get; set; }

    Public myControllr1 (){
    OutPutString = 'Test value set in Constructor';
  }
   
  Public void ShowBlockMethod(){
   OutPutString = 'value set in methode called by button click' ;
  }
}