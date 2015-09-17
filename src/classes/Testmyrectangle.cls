@istest
Public class Testmyrectangle
{
 public static testmethod void main()
 {
     Myrectangle board=new Myrectangle();
     
     board.output();
     board.input(10,20);
     board.output();
     System.assertequals(200,board.area());
     Myrectangle slate=new Myrectangle(12,17);
     slate.output();
     System.assertequals(29,slate.perimeter());
     
     
     }
     
     
     
 }