Public class EmployeeClass{
   Private Integer eno;
   Private String  ename;
   Private Decimal bsal;
   Private Decimal hra;
   Private Decimal da;
   Private Decimal gsal;
   Private Date hdate;
   
   
   Public EmployeeClass(Integer eno1 ,String name1,Decimal bsal1,Decimal hra1,String hdate1){
       
       eno = eno1;
       ename = name1;
       bsal = bsal1;
       hra = hra1;
       date hdate2 = date.parse(hdate1);
       //date hdate2 = date.valueOf(hdate1);
       hdate = hdate2;
   }
   
   Public Decimal calcDa(){
       da = bsal * 0.25;
       return da;
   }
   
   Public Decimal calcGross(){
   
       gsal = bsal + da + hra ;
       return gsal;
   }
   
   Public void getEmployee(){
   
       System.debug('The employee number is ' + eno);
       System.debug('The employee name   is ' + ename);
       System.debug('The employee hiring date is ' + hdate);
       System.debug('The employee basic salary is ' + bsal);
       System.debug('The employee HRA is ' + hra);
       System.debug('The employee DA is ' + da);
       System.debug('The employee Gross Salary is ' + gsal);
   }
}