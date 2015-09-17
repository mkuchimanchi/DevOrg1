public virtual class MyParentClass{
    private static Integer var2;
    protected Integer var3;
    protected Integer var4;
    public static Integer count = 0;
    
    
    Public MyParentClass(){
    count++;
    var3=var4=0;
    }
    Public MyParentClass(Integer var3,Integer var4){
    count++;
    this.var3= var3;
    this.var4=var4;
    }
    
    public void setValues(Integer var3,Integer var4){
    this.var3=var3;
    this.var4=var4;
    }
    public Integer addValues(){
    Integer add1;
    add1 = var3 + var4;
    return add1;
    }
    
    public virtual void getValues(){
    System.debug('Object#'+Count);
    System.debug('Non static variables ' +var3+','+var4);
    System.debug('Static variable ' + var2);
    }
    
    public static void setStaticValue(Integer v1){
    var2 = v1;
    }
}