public with sharing class Regisclass {

    public String re_pass { get; set; }

    public String upass { get; set; }

    public String uname { get; set; }

    public String sanswer { get; set; }

    public String squestion { get; set; }

    public String hphone { get; set; }

    public String lname { get; set; }

    public String fname { get; set; }

    public String email_id { get; set; }

    public String acct_nbr { get; set; }
    
    Online_Reg__c reg;
    public Regisclass(){
       reg = new Online_Reg__c();
    }
    public PageReference register(){
    
    
    PageReference pr = new PageReference('https://c.na15.visual.force.com/apex/welpage');
    reg.Name = acct_nbr;
    reg.Email__c = email_id;
    reg.First_Name__c = fname;
    reg.Home_Phone__c = hphone;
    reg.Last_Name__c = lname;
    reg.Password__c = upass;
    reg.Re_enter_Password__c = re_pass;
    reg.Secret_Answer__c = sanswer;
    reg.Secret_Question__c = squestion;
    reg.User_Name__c = uname;
    insert reg;
    return pr;
    }
    
    
    
    
}