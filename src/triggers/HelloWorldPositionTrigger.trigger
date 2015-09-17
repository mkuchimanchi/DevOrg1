trigger HelloWorldPositionTrigger on Position__c (before insert, before update) {
	HelloWorldPositionClass.helloWorld(Trigger.new);
}