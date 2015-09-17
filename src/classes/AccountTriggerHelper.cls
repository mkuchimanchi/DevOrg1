public class AccountTriggerHelper{
   public static void updateContactAcct(List <Account> triggernew,List<Account> triggerold){
      Map<Id,Account> acctsWithNewContacts = new Map<Id,Account>(); 
      for (Integer i = 0 ; i < triggernew.size();i++) {
          if ( triggernew[i].Contactacct__c <> NULL &&  triggernew[i].Contactacct__c <> triggerold[i].Contactacct__c ){
               acctsWithNewContacts.put(triggerold[i].id,triggernew[i]);
          }                     
      } 
      
      //List<Contact> updatedContacts  = new List<Contact>();
      List<Contact> Contacts  = [select id, accountId, Contactacct__c FROM contact 
                                        where accountId in : acctsWithNewContacts.keySet()];
      List<Contact> updatedContacts = new List<Contact>();
      
      //for (Contact c : [select id, accountId, Contactacct__c FROM contact 
      //                  where accountId in : acctsWithNewContacts.keySet()]) {
      for (Contact c: Contacts){
           c.Contactacct__c = acctsWithNewContacts.get(c.accountId).Contactacct__c;
           updatedContacts.add(c);
      }
      update updatedContacts;
   }   
}