public with sharing class myController2 {

    public Account account { get; set; }
    
    public  myController2(){
       account = [select name from Account where id = :ApexPages.currentpage().getParameters().get('id')];
    }
    
    
  

    public PageReference save() {
    
        update account;
        PageReference pr = new PageReference('/'+account.id+'?nooverride=1');
        pr.setRedirect(true);
        return pr;
    }

}