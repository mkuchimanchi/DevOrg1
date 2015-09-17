public class DynamicPicklist{

   Public String city{get;set;}
   Public List<SelectOption> getCitynames(){
       List<SelectOption> options = new List<SelectOption>();
       List<DynamicPicklist__c> citylist = new List<DynamicPicklist__c>();
       citylist = [Select Id,PicklistValue__c from DynamicPicklist__c];
       options.add(new SelectOption('--None--','--None--'));
       for (Integer j=0;j<citylist.size();j++){
            options.add(new SelectOption(citylist[j].PicklistValue__c,citylist[j].PicklistValue__c));
       }
       return options;
   }
  Public String newpicklistvalue{get;set;}
  Public void saverec(){
     DynamicPicklist__c newrec = new DynamicPicklist__c(PicklistValue__c = newpicklistvalue);
     insert newrec;
     newpicklistvalue = NULL;
  }
}