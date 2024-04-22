public with sharing class LeadTriggerHandler {
    
    private static final string BOT_SCRIPT_TO_CHECK ='ej90';

    public static void handleLeads(map<Id,Lead> oldRecords , map<Id,Lead> newRecords){
        
        List<Lead> leadsToEnqueue = new List<lead>();

        for(Id leadId : newRecords.keySet()){
            Lead newRecord = newRecords.get(leadId);
            Lead oldRecord = oldRecords.get(leadId);
            if(!oldRecord.Bot_Script__c.equals(BOT_SCRIPT_TO_CHECK) && newRecord.Bot_Script__c.equals(BOT_SCRIPT_TO_CHECK)){
                leadsToEnqueue.add(newRecord);
            }
        }
        System.enqueueJob(new LeadCalloutService(leadsToEnqueue));
    }
    
    
}