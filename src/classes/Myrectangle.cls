public class  Myrectangle{
Private Integer Length;
Private Integer Breadth;

Public  Myrectangle()
{
Length=0;
Breadth=0;
}
public Myrectangle(Integer Len,Integer Bre)
{
Length=len;
Breadth=bre;
}
Public void Input(Integer len,Integer bre) {
Length=len;
Breadth=bre;
return;
    }
Public void Output()
    {
System.debug('Length='+length);
System.debug('Breadth1='+breadth);
return;
    }
public Integer area(){
   Integer a;
   a = length * breadth;
   return a;
   }
public Integer perimeter(){
Integer p;
p=length+breadth;
return p;   
    
}}