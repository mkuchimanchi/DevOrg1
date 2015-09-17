/* @Class Name   : ProductTriggerHelper  
*  @Description  : This is a Helper Class for the Trigger on Product. 
*  The methods of this class does the following functions:
*  Method will keep the multi pick-list LOB values in sync with a text field called LOB(Text). 
*  The LOB(Text) field is used in Opportunity_Product__c custom object's Product lookup field filter.
*  @Created By   : Madhav Kuchimanchi 
*  @Created On   : 11/10/2014
*  @Modification Log:
*  ----------------------------------------------------------------------------- 
*  @Developer                Date                 Description 
*  @Madhav Kuchimanchi       11/10/2014           Created
*  ----------------------------------------------------------------------------- 
*/
 public with sharing class ProductTriggerHelper{
    public static void UpdateLOBText(List<Product2> Product2TriggerNew){
       for(Product2 Prod: Product2TriggerNew){
           if(Prod.Line_of_Business_MP__c <> NULL && Prod.Line_of_Business_MP__c<>Prod.LOB_Text__c){
                  if(Prod.Line_of_Business_MP__c.length()>255)                    
                     Prod.LOB_Text__c = Prod.Line_of_Business_MP__c.substring(0,255);                
                  else 
                     Prod.LOB_Text__c = Prod.Line_of_Business_MP__c; 
           }
           else{
              if (Prod.Line_of_Business_MP__c == NULL && Prod.Line_of_Business_MP__c<>Prod.LOB_Text__c)
                      Prod.LOB_Text__c = Prod.Line_of_Business_MP__c; 
           }  
            
        }
     
    }
 }