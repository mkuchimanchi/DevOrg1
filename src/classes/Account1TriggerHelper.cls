public class Account1TriggerHelper{
public static void Updatecontact(Map<ID,Account> mapaccts)
{
List<contact> Contactslist = [select id,accountid,contactacct__c from contact where accountid in :mapaccts.keySet()];
System.debug('size of the contact list ' + Contactslist.size());                                  
List<contact> conslist = new List<Contact>();
for(Contact con: ContactsList)
    {
    con.contactacct__c = mapaccts.get(con.accountId).contactacct__c;
    System.debug('con.contactacct__c'+con.contactacct__c);
    conslist.add(con);
    System.debug('con.contactacct__c***'+con.contactacct__c);
    }
if(conslist.size()>0)
   update conslist; 
}
}