@isTest
Public Class SampleSetTest{
    public static testMethod void main(){
        set<Integer> s1 = new set<Integer>{10,20,30,40,50};
        for(Integer i:s1){
            System.debug(i);
        }
        s1.add(50);
        s1.add(60);
        s1.add(15);
        for(Integer i:s1){
            System.debug(i);
        }
    }
}