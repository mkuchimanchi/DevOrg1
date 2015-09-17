public class Retrievetrxs {

    public List<Bank_Transaction__c> trans;
    public List<Bank_Transaction__c> getTrans(){
       trans=[select Name,amount__c,bank_acct_nbr__c,tran_date__c,tran_type__c from Bank_Transaction__c where bank_acct_nbr__c =:SearchAccount.acct_nbr];
       return trans;
    }
}