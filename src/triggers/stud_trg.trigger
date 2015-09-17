trigger stud_trg on Student__c (before insert) {
   
    for(Student__c s : Trigger.new){
      TrgClass.insertdata(s.name,s.ContactNo__c);
       
    }    
}