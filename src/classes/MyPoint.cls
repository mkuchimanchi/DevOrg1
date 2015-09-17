public class MyPoint{
   private Integer x;
   private Integer y;
   private Integer distance;

   Public MyPoint(){
      x = 0;
      y = 0;
   }

   Public MyPoint(Integer a,Integer b){
      x = a;
      y = b;
   }

/*   Public Integer calcDistance{
      if (x > y)
         distance = x - y ;
      else
         distance = y - x;
      return distance;
   }
   
*/
   Public void getDistance (){
   
      distance = x - y ;
      if (distance < 0) {
         distance = y -x ;
      }   
      System.debug('X-axis is' + x);
      System.debug('Y-axis is' + y);
      System.debug('The distance between two points' + distance);
   }   
}