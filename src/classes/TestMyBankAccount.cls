@isTest
public class TestMyBankAccount {
    public static testMethod void main(){
//        MyBankAccount.min_bal = 1000;
//        MyBankAccount.rate_int = 9;
        MyBankAccount.get_min_bal();
        MyBankAccount.get_rate_int();
        MyBankAccount acct= new MyBankAccount();
        MyBankAccount a = new MyBankAccount(560121099,'Aarush Kuchimanchi',Date.Today(),1000,'Open','Savings');
        a.getBankAccount();
        a.accountWithdraw(560121099,100);
        a.getAccountBal(560121099);
        a.accountDeposit(560121099,200);
        a.getAccountBal(560121099);
    }
}