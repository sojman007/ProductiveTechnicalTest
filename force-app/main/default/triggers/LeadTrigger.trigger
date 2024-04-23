trigger LeadTrigger on Lead (after insert, after update) {
    LeadTriggerHandler.handleLeads(trigger.oldMap, trigger.newMap, Trigger.OperationType);

}