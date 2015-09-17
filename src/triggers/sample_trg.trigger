trigger sample_trg on SampleTest__c (before update) {  
   
      
   for(SampleTest__c s1:trigger.new){
       
       SampleTest__c s3 = new SampleTest__c();    
       SampleTest__c sold = System.Trigger.oldMap.get(s1.Id);        
       if (s1.Status__c == 'InActive'){
                 
           s3.Sample_field1__c = s1.Sample_field1__c;
           s3.Sample_field2__c = s1.Sample_field2__c;
           s3.Status__c ='Active';
           s1.Sample_field1__c = sold.Sample_field1__c;
           s1.Sample_field2__c = sold.Sample_field2__c;
           insert s3;
           
        }
    }
    
    
}       












      /*  
      if(trigger.isAfter){
         
          for(SampleTest__c s1:trigger.new){
          SampleTest__c s2 = new SampleTest__c();
          

                                   
          if (s1.Status__c == 'InActive'){
          //     s3.id = sold.id;
          //     s3.Sample_field1__c = sold.Sample_field1__c;
          //     s3.Sample_field2__c = sold.Sample_field2__c;
          //     s3.Status__c = s1.Status__c;
                             
          //     update s3;

              s2.Sample_field1__c = s1.Sample_field1__c;
              s2.Sample_Field2__c = s1.Sample_Field2__c;
              s2.status__c = 'Active';
              system.debug('s2 new values'+s2);

              insert s2;
          }
          }
       }
}
              //s1.Sample_field1__c = s1.Sample_field1__c;
               //s3.Sample_Field2__c = s1.Sample_Field2__c;
            
           }
       }

  
}    
    //SampleTest__c s2 = trigger.old[0];
    //SampleTest__c s1 = trigger.new[0];
    //SampleTest__c s4  = new SampleTest__c();
    //TriggerContextUtility.setFirstRunFalse();
    //if(TriggerContextUtility.isFirstRun()){
    //Boolean isFirstRun = true;
    //  if(trigger.isBefore && trigger.isUpdate && isFirstrun){
    
         //for(SampleTest__c s1:trigger.new){
    //     SampleTest__c s1 = trigger.new[0];

         //    SampleTest__c s2 = [Select Sample_field1__c,Sample_Field2__c from SampleTest__c
         //                         where id = :s1.id];
         //    if (s1.status__c == 'Inactive') {
         //        s2.status__c = s1.status__c;
         //    }
//         update s1;        
         //}
 //        isFirstRun = false;
 //     }
    
   //  if(trigger.isAfter && trigger.isUpdate && isFirstRun){
   
  */