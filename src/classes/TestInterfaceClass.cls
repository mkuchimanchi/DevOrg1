@isTest
public class TestInterfaceClass{
    public static testMethod void main(){
        Fridge f = new Fridge('MX', 200);
        Toaster t = new Toaster('FZ');
        List<KitchenUtility> utilities = new List<KitchenUtility> { f, t };
        String model1 = utilities[0].getModelNumber();
        System.debug('Fridge model number starts with F and model number is  '+ model1);
        String model2 = utilities[1].getModelNumber();
        System.debug('Toaster model number starts with T and model number is '+ model2);
    }
}