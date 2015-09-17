public without sharing class EntityOpportunitiesByRecTypeExt {
      public List<Opportunity> listOpps {get; private set;}
      public Account acc {get; set;}
      public boolean hasRecordAccess {get;set;}
       public List<Opportunity> listOppsMain {get; private set;}
             public List<SelectOption> OppStageOptions {get; private set;}   
       public Integer noOfOpps {get; private set;}
       public String selectedOppStage {get; set;}
      public Integer countViewAllOpps {get;set;}
      String WhereQuery = '';
      
       public String selectedLOB {get; set;}      public EntityOpportunitiesByRecTypeExt(ApexPages.StandardController sc) {
     
        try{
          hasRecordAccess = [SELECT RecordId, HasReadAccess FROM UserRecordAccess WHERE UserId = : UserInfo.getUserId() AND RecordId = : sc.getId()].HasReadAccess;
          acc = [SELECT Id, Name FROM Account WHERE Id =: sc.getId()];
        }catch(Exception e){                         
                //ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Error in fetching account : No account found');
                ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.INFO, System.Label.NoAccFetchedError); // Change: Avoided hardcoding
                ApexPages.addMessage(errMsg);
        }
         OppStageOptions = new List<SelectOption>();
        OppStageOptions.add(new SelectOption(StaticVariablesUtility.SELECTED_LOB_ALL ,StaticVariablesUtility.SELECTED_LOB_ALL));
        OppStageOptions.add(new SelectOption(StaticVariablesUtility.STAGE_OPEN ,StaticVariablesUtility.STAGE_OPEN));
        OppStageOptions.add(new SelectOption(StaticVariablesUtility.STAGE_WON ,StaticVariablesUtility.STAGE_WON));
        OppStageOptions.add(new SelectOption(StaticVariablesUtility.STAGE_LOST ,StaticVariablesUtility.STAGE_LOST));         
         
          if(selectedOppStage == StaticVariablesUtility.STAGE_WON) {
            WhereQuery += ' AND Common_Stage__c = \''+ StaticVariablesUtility.STAGE_CLOSED_WON +'\'';
        }
        else if(selectedOppStage == StaticVariablesUtility.STAGE_LOST){
            WhereQuery += ' AND Common_Stage__c = \''+ StaticVariablesUtility.STAGE_CLOSED_LOST + '\'';
        }
        else if(selectedOppStage == StaticVariablesUtility.STAGE_OPEN){
            WhereQuery += ' AND Common_Stage__c Not IN (\''+ StaticVariablesUtility.STAGE_CLOSED_WON +'\',\''+StaticVariablesUtility.STAGE_CLOSED_LOST+ '\')';
        }
          
 selectedOppStage = StaticVariablesUtility.SELECTED_LOB_ALL;

        String oppIds = '('; 
  oppIds = oppIds.subString(0,oppIds.length()-1);
        oppIds += ')';
        
        
        //Contructing a dynamic query for fetching the Opportunities based on business logic and LOB
        //Change Tag: Start
        //Description: Added fields in the query
        String qryStr = 'SELECT Name, AccountId, StageName, RecordType.DeveloperName, Probability, Amount, CloseDate, OwnerId, Owner.Name,'; 
        //Change Tag: End
        //ENT CRM Production Release - 10/11/2013 - Starts
        qryStr += ' Size_of_Deal__c,';
        //ENT CRM Production Release - 10/11/2013 - Ends
        qryStr += ' Line_of_Business_Lookup__c, Line_of_Business_Lookup__r.Name';
        qryStr += ' FROM Opportunity';      
       // qryStr += ' WHERE AccountId = \'' + acc.Id + '\'';
        // Change: Changing the previous logic to include records via 'Other Applicants'
        string strAccountId=  ' WHERE AccountId = \'' ; //qryStr += ' WHERE AccountId = \'' + acc.Id + '\'';
           string strSpace= '\'' ;
           // Integer size=listotherapp.size();
        Integer size ;         
        if (size == 0){
            qryStr += strAccountId + String.escapeSingleQuotes(acc.Id) + strSpace;
        }
        else{
            qryStr += ' WHERE (AccountId = \'' + string.escapeSingleQuotes(acc.Id) + '\' OR Id IN '+ oppIds + ')';
        }
        qryStr += ' AND Line_of_Business_Lookup__r.Active__c = True';
         String WhereQuery = '';
     /* Change- Begin: Commented as part of refactoring
        if(selectedLOB != 'All') {
            qryStr += ' AND Line_of_Business_Lookup__r.Name = \'' + selectedLOB + '\'';
        }*/ //Change strSpace= '\'' ;
          
        
        if(selectedLOB != 'All') {
            qryStr += ' AND Line_of_Business_Lookup__r.Name = \'' + selectedLOB + '\'';
        }//Change- End: Commented as part of refactoring       
         if(selectedOppStage == StaticVariablesUtility.STAGE_WON) {
            WhereQuery+= ' AND Common_Stage__c = \''+ StaticVariablesUtility.STAGE_CLOSED_WON +'\'';
        }
        else if(selectedOppStage == StaticVariablesUtility.STAGE_LOST){
            WhereQuery+= ' AND Common_Stage__c = \''+ StaticVariablesUtility.STAGE_CLOSED_LOST + '\'';
        }
        else if(selectedOppStage == StaticVariablesUtility.STAGE_OPEN){
            WhereQuery+= ' AND Common_Stage__c Not IN (\''+ StaticVariablesUtility.STAGE_CLOSED_WON +'\',\''+StaticVariablesUtility.STAGE_CLOSED_LOST+ '\')';
        }
        //Satish - 22/04/2013 -End
    
    
    qryStr += WhereQuery;
        qryStr += ' ORDER BY CreatedDate DESC';
        //change tag: End
        //executing the dynamic query and putting the generated Opportunities into a list
        try{
          system.debug('***Query string in LOB EXT'+ qryStr);
        listOpps = Database.query(qryStr); 
        //Change tag: to get the above queried result in the main page: Start
        if(listOpps <> null)
          listOppsMain.addAll(listOpps);
        //Change Tag: to get the above queried result in the main page: End  
        //Change Tag: This is commented as the check for M&A profile and isWon is done in the dynamic query: Start -[Abhinav G]-06/04/2014 - Retaining the commented code as it is present in prod
        /*
         // @Anil- BEGIN: Added this part of code (to fix defect related to opportunities on inline vfp based on permission set of user)
        if(listOpps <> null){
            for(Opportunity opp: listOpps){
            
                if(!haspermission){  
                    //@UTkarsh Dixit: Avoiding the hardcoding by using static variables.
                    if(opp.RecordType.DeveloperName == StaticVariablesUtility.MA_RECTYPE_DEV_NAME && opp.stagename <> StaticVariablesUtility.STAGE_CLOSED_WON){
                        // do not add in the list..
                    }
                    
                    else{
                        listOppsMain.add(opp);
                    }
                }
                
                else{
                    listOppsMain.add(opp);
                }
                
                
            }
         } // @Anil- END: Added this part of code (to fix defect related to opportunities on inline vfp based on permission set of user)
           */
           //Change Tag: This is commented as the check for M&A profile and isWon is done in the dynamic query: End
        }catch(Exception e){   
            // Added the label instead of the hardcoding.
            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.INFO, System.Label.NoOppFound);
            ApexPages.addMessage(errMsg);
        }        //calling the method where the opportunities that are related to that particular account are fetched        
        
            noOfOpps= listOppsMain.size(); //noOfOpps= listOpps.size();       
      countViewAllOpps=0;       if(acc <> NULL)
        getOpportunitiesByStage();
        
     
       }
       public void getopportunitiesByStage(){
        listOpps = new List<Opportunity>();
        String qryStr = 'SELECT Name, AccountId, StageName, RecordType.DeveloperName, Probability, Amount, CloseDate, OwnerId, Owner.Name,'; 
       
        qryStr += ' Size_of_Deal__c,';
        qryStr += ' Stage_Lookup__c, Stage__r.Name';
        qryStr += ' FROM Opportunity';      
        // Change: Changing the previous logic to include records via 'Other Applicants'
        string strAccountId=  ' WHERE AccountId = \'' ; 
        string strSpace= '\'' ;
       
       }
       }