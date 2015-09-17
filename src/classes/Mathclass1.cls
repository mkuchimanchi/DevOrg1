public with sharing class Mathclass1 {
Integer Num1;
Integer Num2;
Integer Res;
Integer diff;
public Mathclass1(){
Num1=Num2=Res=diff=10;
}
Public void setNum1(Integer N1){

Num1=N1;}
Public void setNum2(Integer N2)
{
Num2=N2;
}
/*Public void SetRes(Integer N2)
{
Res=N2;
}
*/
public Integer getNum1()
{

return num1;
}
Public Integer getNum2()
{

return num2;
}
Public Integer getRes()
{
Res=Num1+Num2;
Return Res;
}
Public Integer getdiff()
{
diff=Num1 - Num2;
Return diff;
}

}