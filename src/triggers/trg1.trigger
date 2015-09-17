trigger trg1 on Bank_Transaction__c (before insert , before update) {
   for (Bank_Transaction__c b:Trigger.new){
       Bank_Account__c acct = [select Bank_bal__c,Bank_Account_Nbr__c from Bank_Account__c where Bank_Account_Nbr__c = :b.bank_acct_nbr__c];   
       if (b.tran_type__c == 'WithDraw'){
          acct.Bank_bal__c -= b.amount__c;
          acct.Bank_Account_Nbr__c =  b.bank_acct_nbr__c; 
       }
       else{
          acct.Bank_bal__c += b.amount__c;
          acct.Bank_Account_Nbr__c =  b.bank_acct_nbr__c;
       }
        
       update acct;
   }
}