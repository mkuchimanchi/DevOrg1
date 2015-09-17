//Test class to check collections
@isTest
public class MyCollectionTest{
    public static testMethod void main(){
        //collections ===> create insert remove navigate
        //List Class
        //Create
        List<integer> numbers = new List<integer> ();
        //Insert
        numbers.add(10);
        numbers.add(40);
        numbers.add(20);
        numbers.add(30);
        numbers.add(10);
        //Navigate - Display
        System.debug('Values in the list are ->' + numbers);
        //Set Class
        Set<String> names = new Set<String> ();
        //Insert
        names.add('Madhav');
        names.add('Shanmuga');
        names.add('Sriram');
        names.add('Sriram');
        
        //Navigate Display
        System.debug('Values in the set are ->' + names);
        //Map Class
        Map<String,Integer> area_pin = new Map<String,Integer> ();
        //Insert
        area_pin.put('Hyd',500001);
        area_pin.put('Rjy',533105);
        area_pin.put('Blr',400001);
        //Navigate -Display
        System.debug('The values in the map are -->' + area_pin);
        
        
        
        
            
    
    }
}