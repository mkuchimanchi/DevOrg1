public with sharing class RerenderNoAction1 {   
  public RerenderNoAction1() {
     viewMeCnt = 0;   
  }        
  public Integer viewMeCnt { get; set; }
  public String parentOpt { get; set; }
  public List<SelectOption> getParentOptions() {        
     List<SelectOption> opts = new List<SelectOption>();        
     opts.add(new SelectOption('',''));        
     opts.add(new SelectOption('1', '2'));        
     opts.add(new SelectOption('3', '4'));        
     return opts;    
  }        
  public String opt { get; set; }    
  public List<SelectOption> getOptions() {        
     viewMeCnt = viewMeCnt + 1;        
     List<SelectOption> opts = new List<SelectOption>();               
     if (parentOpt == '1') {            
         opts.add(new SelectOption('1111', '2222'));            
         opts.add(new SelectOption('3333', '4444'));        
     } 
     else {            
        opts.add(new SelectOption('7777', '8888'));            
        opts.add(new SelectOption('9999', '0000'));        
     } 
     return opts;    
   }
   
}