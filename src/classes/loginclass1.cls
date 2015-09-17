public with sharing class loginclass1 {

    public PageReference login() {
      PageReference pg = new PageReference('https://c.na15.visual.force.com/apex/loginpage');    
        return pg;
    }

}