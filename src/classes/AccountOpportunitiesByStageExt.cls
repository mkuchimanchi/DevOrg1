/*
*--------------------------------BB&T SFDC Project----------------------------------------------
* @Name             AccountOpportunitiesByStageExt
* @author           Karthik
* @date             10-Oct-2012
* @description      This is the extension class for AccountOpportunitiesByStage
 page. 
* ----------------------------------------------------------------------------------------------
* Modification Log:
* ----------------------------------------------------------------------------------------------
* Developer                      Date                    Description                 
* ---------                      ----                    -----------                 
* Madhav K                 19-Aug-2014              Created                     
                                                         
* ----------------------------------------------------------------------------------------------
* Review Log:
* ----------------------------------------------------------------------------------------------
* Reviewer                       Review Date             Review Comments
* --------                       -----------             ---------------
* 
*-----------------------------------------------------------------------------------------------
*/
public with sharing class AccountOpportunitiesByStageExt{

    
    //variables for the class  
    public List<Opportunity> listOpps {get; private set;}
//Change Tag: Start                         
//Added new variable
    public List<Opportunity> listOppsMain {get; private set;} // @Anil: Added this new variable (to fix defect related to opportunities on inline vfp based on permission set of user)
//Change Tag: End
    //Satish - 23/4/2013 - Start
    //public List<Opportunity> listViewAllOpps ;
    //Satish - 23/4/2013 - End
    public List<SelectOption> stageOptions {get; private set;}
    public String selectedStage {get; set;}
    //public Integer noOfOpps {get; private set;}
    //Satish - 23/4/2013 - Strat
    //public Integer noOfViewAllOpps {get;set;}
    //Satish - 23/4/2013 - End
    public Account acc {get; set;}
    //public String userLOB;
    
    
    //controller
    public AccountOpportunitiesByStageExt(ApexPages.StandardController sc) {
        
        //Fetching all the accounts of that particular account id
        try{
        acc = [SELECT Id, Name FROM Account WHERE Id =: sc.getId()];
        }catch(Exception e){
                ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Error in fetching account : No account found');
                ApexPages.addMessage(errMsg);
        }
        
        
        stageOptions = new List<SelectOption>();
        //stageOptions.add(new SelectOption('Prospecting', 'Prospecting'));     
        List<Schema.PicklistEntry> stagePicklistEntry = Opportunity.StageName.getDescribe().getPicklistValues();
        for(Schema.Picklistentry p : stagePicklistEntry)
            stageOptions.add(new SelectOption(p.getValue(), p.getValue()));
        
        //calling the sort method for sorting the lob options alphabetically
        stageOptions.sort();
        
        selectedStage = 'Prospecting';
        //calling the method where the opportunities that are related to that particular account are fetched        
        getOpportunitiesByStage();
    }
    /**
    * @description method for fetching the opportunities based on the line of business  
    * @param 
    * @return 
    */ 
    public void getOpportunitiesByStage() {
        //variables for the method
        listOpps = new List<Opportunity>();
        String stage;
        stage = selectedStage;
        system.debug('Stage ' + stage);
        //Contructing a dynamic query for fetching the Opportunities based on business logic and LOB
        //Change Tag: Start
        //Description: Added fields in the query
        String qryStr = 'SELECT Name,AccountId,StageName,Amount, CloseDate';
        qryStr += ' FROM Opportunity';
        qryStr += ' WHERE AccountId = \'' + acc.Id + '\'';
        //qryStr += ' WHERE AccountId = \'001i000000uraKKAAY\' ';
        qryStr += ' AND StageName = \'' + stage + '\'';
        //qryStr += ' AND StageName = \'Prospecting\' ';
        qryStr += ' ORDER BY CreatedDate DESC';
        system.debug('query'+ qryStr);
        system.debug('selected stage ' + selectedStage);
        //change tag: End
        //executing the dynamic query and putting the generated Opportunities into a list
        try{
        listOpps = Database.query(qryStr); 
        system.debug(qryStr);
        system.debug(listOpps );
        }catch(Exception e){
            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'Error in fetching Opportunities : No Opportunities fetched for the given conditions');
            ApexPages.addMessage(errMsg);
        }
        //Satish - 23/4/2013 - Strat
        //noOfOpps = listOpps.size();
        //@neha(12/11/2013) : removing the count logic as this effects clashes with the capIQ permission set logic and use only size o the resultant list for count
        /*
        //String CountQuery;
        //CountQuery = 'Select Count(id)cnt from Opportunity WHERE Line_of_Business_Lookup__r.Active__c = True and AccountId = \'' + acc.Id + '\'';
        //CountQuery += ' AND Line_of_Business_Lookup__r.Name = \'' + selectedStage + '\'';
        //AggregateResult[] RecordCount = Database.query(CountQuery);
        //noOfOpps = (integer)RecordCount[0].get('cnt');

        */
        //noOfOpps= listOpps.size();
       
        //Satish - 23/4/2013 - End
}
    /**
    * @description page reference method to go the new opportunity page when the user clicks on new opportunity
    * @param 
    * @return pg page redirect
    */ 
   
    public PageReference newOpportunityRedirect() {
        
        /**************Defect 01070  changes start************/
        //Id lobId;
        String pgUrl = '/setup/ui/recordtypeselect.jsp?ent=Opportunity&retURL=%2F' + acc.Id;
        pgUrl += '&save_new_url=%2F006%2Fe%3FretURL%3D%252F' + acc.Id;
        pgUrl += '%26accid%3D' + acc.Id;
        pgUrl += '&nooverride=0';
        PageReference pg = new PageReference(pgUrl);
        return pg;
       
       
    }
}