//Define a class called MyBankApplication
 public class MyBankApplication{
  //Data members
  //syntax :Datatype Datamembers
  Integer bankaccount_nbr;
  Decimal account_balance;
  String  bankaccount_name;
  //Member Methods   
  //create
  
  
  //default constructor
  
  public MyBankApplication(){
  
  System.debug('Initialization Begins');
  bankaccount_nbr = 0;
  account_balance = 0;
  bankaccount_name = ' ' ;
     
  }
   
  //input
  public void createBankAccount(Integer acct_nbr,Decimal acct_bal,String acct_name){
     
     bankaccount_nbr   = acct_nbr;
     account_balance   = acct_bal;
     bankaccount_name  = acct_name;
     System.debug('New Bank Account is created .......');
     return;
  }
  
     //process or action methods
   
   public void withdrawAcct(Integer acct_nbr,Decimal wth_amt){
   
      account_balance = account_balance - wth_amt;
      System.debug('Amount withdrawn from Bank is  $' + wth_amt );
      return;
     
   }
  
  
   public void depositAcct(Integer acct_nbr,Decimal dep_amt){
   
     account_balance = account_balance + dep_amt;
     //System.debug('Amount deposited into Bank is $' + dep_amt);
     return;
   }
  
      

  
   //output
   
   public void displayBankAccount( ){    
  
     System.debug('Bank Account number          --->  ' + bankaccount_nbr); 
     System.debug('Bank account holder name     --->  ' + bankaccount_name);
     System.debug('Bank Account has Balance in  $ ' + account_balance );
     return;        
   } 

 }//End of Business Class