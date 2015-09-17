public class AddAccount {

    public Boolean acctexist { get; set; }
    public PageReference back() {
        PageReference pr = new PageReference('/apex/searchaccount');
        return pr;
    }



    public String acct_name { get; set; }

    public Decimal bank_acct_bal { get; set; }

    public String bank_acct_name { get; set; }

    public Decimal bank_acct_nbr { get; set; }   

    public PageReference addRecord() {
       try{
           acctexist=true;
           Bank_Account__c acct = new  Bank_Account__c();
           acct.name = acct.name;
           acct.account_name__c = acct_name;
           acct.Bank_bal__c = bank_acct_bal;
           acct.Bank_Account_Nbr__c =  bank_acct_nbr;
           insert acct;
           return null;
       }catch(Exception e){
           acctexist=false;
           ApexPages.Message myMsg= new ApexPages.Message(ApexPages.Severity.Error,'Duplicate Account cannot be inserted! Please try new one ');
           ApexPages.addMessage(myMsg);
           return null;
       }    
       
    }


    
}