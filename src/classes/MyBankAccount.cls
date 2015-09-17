public class MyBankAccount implements MyBankInterface{
    //non static data members
    private Integer acct_no;
    private String  acct_name;
    private Date acct_odate;
    private Date acct_cdate;
    private Decimal acct_bal;
    private enum status {OPEN,ACTIVE,CLOSED}
    private status acct_status;
    private String acct_type;
    // static data members
    public static Decimal rate_int;
    public static Decimal min_bal;
    
    //default constructor
    
    public MyBankAccount(){
        acct_no = 0;
        acct_odate = Date.today();
        acct_bal = 0;
    //    acct_status = status.OPEN;
    }
   
   public MyBankAccount(Integer acct_no1,String  acct_name1,Date acct_odate1,Decimal acct_bal1,String acct_status1,String acct_type1){
        acct_no = acct_no1;
        acct_name = acct_name1;
        acct_odate = acct_odate1;
        acct_bal = acct_bal1;
        if (acct_status1 == 'OPEN'){
           acct_status = status.OPEN;
        }
        acct_type = acct_type1;
        
    }
    
   //action methods
   public void getAccountBal(Integer acct_no1){
   
       acct_no = acct_no1;
       System.debug('Bank account nbr -> ' + acct_no);
       System.debug('Bank account balance -> ' + acct_bal);
       return;
   }
   
   
   public void accountWithdraw(Integer acct_no1,Decimal amt){
   
       acct_no = acct_no1;
       acct_bal = acct_bal - amt;
       System.debug('The amount withdrawn from Account is ---> '+ amt);
       return;
   } 
   
   public void accountDeposit(Integer acct_no1,Decimal amt){
   
       acct_no = acct_no1;
       acct_bal = acct_bal + amt;
       System.debug('The amount deposited into the Account is ---> '+ amt);
       return;
   } 
   
   public void getBankAccount(){
       System.debug('Bank account nbr -> ' + acct_no);
       System.debug('Bank account holder name -> ' + acct_name);
       System.debug('Bank account open date -> ' + acct_odate);
       System.debug('Bank account balance -> ' + acct_bal);
       System.debug('Bank account status -> ' + acct_status);
       System.debug('Bank account type -> ' + acct_type);
       System.debug('Bank Minimum balance -> ' + min_bal);
       System.debug('Bank loan Rate of interest -> ' + rate_int);
       
       return;
   }       
   public static Decimal get_min_bal(){
       min_bal = 1000;
       return min_bal;
   }
   
   public static Decimal get_rate_int(){
       rate_int=8;
       return rate_int;
   }
}