public with sharing class customcontroller1 {

    public PageReference next() {
        PageReference nextpage = new PageReference('/apex/Vfpage2');
        nextpage.setRedirect(False);
        return nextpage; 
    }


    public String EmployeeName { get; set; }
}