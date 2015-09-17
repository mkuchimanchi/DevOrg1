public class Fridge implements KitchenUtility {
private String modelNumber;
private Integer numberInStock;
public static final Integer STOCK_THRESHOLD = 5;

public Fridge() {
modelNumber = 'XX-XX';
numberInStock = 0;
}
public Fridge(String theModelNumber, Integer theNumberInStock) {
modelNumber = theModelNumber;
numberInStock = theNumberInStock;
}

public void updateStock(Integer justSold) {
numberInStock = numberInStock - justSold;
}

public void setModelNumber(String theModelNumber) {
modelNumber = theModelNumber;
}

public String getModelNumber() {

return 'F'+ modelNumber;
}

public static void toDebug(Fridge aFridge) {
System.debug ('ModelNumber = ' + aFridge.modelNumber);
System.debug ('Number in Stock = ' + aFridge.numberInStock);
}
}