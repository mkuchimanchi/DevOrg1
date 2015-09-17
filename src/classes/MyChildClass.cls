public class MyChildClass extends MyParentClass{
private Integer var5;
private Integer var6;
public MyChildClass(){
super();
var5=0;
var6=0;
}
public MyChildClass(Integer v3,Integer v4,Integer v5,Integer v6){
super(v3,v4);
var5=v5;
var6=v6;
}

public void setValues(Integer var3,Integer var4,Integer var5,Integer var6){
super.setValues(var3,var4);
this.var5=var5;
this.var6=var6;
}

public override void getValues(){
super.getValues();
System.debug('Non static variables ' +var5+' ' +var6);
}

public Integer multiply(){
Integer v6;
v6 = var5 * var6;
return v6;
}

}