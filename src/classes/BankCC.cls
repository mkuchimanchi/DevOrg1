public with sharing class BankCC {

    public PageReference addRecord() {
        return null;
    }


    public Decimal bank_acct_nbr { get; set; }
    public String  acct_name { get; set; }
    public Decimal bank_acct_bal { get; set; } 
    public void searchRecord(){
      //REtrives a record
      Bank_Account__c acct = [select name,Bank_bal__c,Bank_Account_Nbr__c from Bank_Account__c where Bank_Account_Nbr__c = :bank_acct_nbr ];
      acct_name = acct.name;
      bank_acct_nbr = acct.Bank_Account_Nbr__c;
      bank_acct_bal = acct.Bank_bal__c;
      //return null;
     //Only SOQL / SOSL operations are allowed on Constructor of a Controller CLass
     
      
    }

    
}