//Define Test Class to check the behaviour of Business Class MyBankApplication.
   @isTest
   public class TestMyBankApplication{
      public static testMethod void main () {
      
      MyBankApplication bank_app = new MyBankApplication();
      bank_app.displayBankAccount();
      System.debug('Initialization Ends');
      bank_app.createBankAccount(12345,1000,'Madhav K');
      bank_app.displayBankAccount();
      bank_app.depositAcct(12345,1000);
      bank_app.displayBankAccount();
      bank_app.withdrawAcct(12345,500);
      bank_app.displayBankAccount();
      
      }
   } //End of Test Class