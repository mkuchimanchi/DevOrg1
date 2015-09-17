public with sharing class SearchAccount {

    public Boolean accountfound { get; set; }

    //public String searchval { get; set; }

    
    
    public PageReference addRecord() {
        PageReference pr = new PageReference('/apex/addaccount');
        pr.setRedirect(False);
        return pr;  
    }


    public PageReference withdrawAmt() {
        Bank_Transaction__c trx = new Bank_Transaction__c();
        datetime myDateTime = datetime.now();
        trx.Name = 'Wthw';
        trx.amount__c = amount;
        trx.bank_acct_nbr__c = bank_acct_nbr;
        trx.tran_type__c ='Withdraw';
        trx.tran_date__c = myDateTime;
        insert trx;
        return null;
    }


    public PageReference depositAmt() {
        Bank_Transaction__c trx = new Bank_Transaction__c();
        datetime myDateTime = datetime.now();
        trx.Name = 'Dep';
        trx.amount__c = amount;
        trx.bank_acct_nbr__c = bank_acct_nbr;
        trx.tran_type__c ='Deposit';
        trx.tran_date__c = myDateTime;
        insert trx;
        return null;
    }


    public Decimal amount { get; set; }

    public PageReference back() {
        PageReference pr = new PageReference('/apex/SearchAccount');
        return pr;     
        
    }


    public PageReference deposit() {
        PageReference pr = new PageReference('/apex/depositpage');
        pr.setRedirect(False);
        return pr;        
       
    }
    public PageReference trxhistory() {
        PageReference pr = new PageReference('/apex/trxhistpage');
        pr.setRedirect(False);
        return pr;        
        
    }

    public PageReference withdraw() {
        PageReference pr = new PageReference('/apex/withdrawpage');
        pr.setRedirect(False);
        return pr;         
       
    }


    public Decimal bank_acct_bal { get; set; }
    public Decimal bank_acct_nbr { get; set; }
    
    public String acct_name { get; set; }
    public List<Bank_Transaction__c> trans;
    //public Boolean accountfound;
    public void searchRecord() {
      accountfound=true; 
      try{
         Bank_Account__c acct = [select name,Bank_bal__c,Bank_Account_Nbr__c,account_name__c from Bank_Account__c where Bank_Account_Nbr__c = :bank_acct_nbr ];
         acct_name = acct.account_name__c;
         bank_acct_nbr = acct.Bank_Account_Nbr__c;
         bank_acct_bal = acct.Bank_bal__c;
         
         //return accountfound;
      }catch(Exception e) {
         ApexPages.Message myMSG = new ApexPages.Message(ApexPages.Severity.Error,'Bank Account number is not found ! Please reenter correct one ');
         ApexPages.addMessage(myMSG);
         accountfound = false;
         //return accountfound;
      } 
          
    }

    public List<Bank_Transaction__c> getTrans(){
       trans=[select Name,amount__c,bank_acct_nbr__c,tran_date__c,tran_type__c from Bank_Transaction__c where bank_acct_nbr__c =:bank_acct_nbr];
       return trans;
    }   
}