public with sharing class LeadTriggerHandler {
    
    private static final string BOT_SCRIPT_TO_CHECK ='ej90';

    public static void handleLeads(map<Id,Lead> oldRecords , map<Id,Lead> newRecords , System.TriggerOperation op){
        
        List<Lead> leadsToEnqueue = new List<lead>();

        switch on op{
            when AFTER_INSERT{
                for(Lead leadx : newRecords.values()){
                    if(leadx.Bot_Script__c.equals(BOT_SCRIPT_TO_CHECK)){
                        leadsToEnqueue.add(leadx);
                    }
                }
            }
            when AFTER_UPDATE{
                for(Id leadId : newRecords.keySet()){
                    Lead newRecord = newRecords.get(leadId);
                    Lead oldRecord = oldRecords.get(leadId);
                    if(!oldRecord.Bot_Script__c.equals(BOT_SCRIPT_TO_CHECK) && newRecord.Bot_Script__c.equals(BOT_SCRIPT_TO_CHECK)){
                        leadsToEnqueue.add(newRecord);
                    }
                }

            }
        }
        if(leadsToEnqueue.size() > 0){
            System.enqueueJob(new LeadCalloutService(leadsToEnqueue));
        }

    }
    
    
}