trigger Accounttrigger on Account (After update) {
if(trigger.isupdate)
{
Account1triggerHelper.updatecontact(trigger.newmap);
}
}