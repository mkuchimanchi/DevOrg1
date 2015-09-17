public with sharing class loginclass{


   
   public loginclass(){
          u_name = '';
          u_pass = '';
         
   } 
   public String u_name { get; set; }
   public String u_pass { get; set; }
   public PageReference login(){
     
     Online_Reg__c convertedreg = new Online_Reg__c();      
     List<Online_Reg__c> reg = [select id,First_Name__c ,Password__c from Online_Reg__c where User_Name__c = :u_name LIMIT 1];         
    // sObject reg  = [select id,First_Name__c ,Password__c from Online_Reg__c where User_Name__c = :u_name LIMIT 1];
     if (reg.isEmpty()) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid Username!'));
        return null;
     }
          
     else{
     
      convertedreg = reg[0];  
      
     }
     if (convertedreg.Password__c != u_pass)  {
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid Password!'));
             return null;
     }
     else {
         PageReference pr = new PageReference('https://c.na15.visual.force.com/apex/welcomepage');
         return pr;              
     }
   } 
     
      
   public PageReference register(){
        PageReference pr = new PageReference('https://c.na15.visual.force.com/apex/regispage');
        return pr;
    }
}


 /*
     if (u_name.length() == 0) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Username  Cannot be Blank!'));
        return null;   
     }
     
     if (u_name.length() > 8) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Incorrect username!'));
        return null;
     }
     
     if (u_pass.length() == 0) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Password Cannot be Blank!'));
        return null;   
     }
     if (u_pass.length() > 12) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Incorrect password!'));
        return null;
     }
     else {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Correct login!'));
        return null;
     }
     */