public with sharing class HelloWorldPositionClass {
	Public static void helloWorld(List<Position__c> positions){
		for(Position__c p:positions){
			p.Hello__c='World';
		}
	}
}