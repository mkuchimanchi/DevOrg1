public with sharing class SearchAccount1 {

    public Decimal bank_acct_bal { get; set; }

    public String bank_acct_name { get; set; }
    public Decimal bank_acct_nbr { get; set; }

    public PageReference searchRecord() {
      Bank_Account__c acct = [select name,Bank_bal__c,Bank_Account_Nbr__c from Bank_Account__c where Bank_Account_Nbr__c = :bank_acct_nbr ];
      bank_acct_name = acct.name;
      bank_acct_nbr = acct.Bank_Account_Nbr__c;
      bank_acct_bal = acct.Bank_bal__c;
        return null;
    }


    
}