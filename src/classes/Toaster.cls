public class Toaster implements KitchenUtility {
private String modelNumber;

public Toaster(String model1){
    modelNumber=model1;
    return;
}
public String getModelNumber() {
    return 'T' + modelNumber;
}
}