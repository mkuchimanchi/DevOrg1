@isTest
Public class TestEmployeeClass{
    Public Static testMethod void main(){
        EmployeeClass emp = new EmployeeClass(12345,'Madhav',5000,500,'02/01/2013');
        emp.calcDa();
        emp.calcGross();
        emp.getEmployee();
        date mydate = date.today();
        System.debug('Todays date is '+mydate);
        
     
    }
}