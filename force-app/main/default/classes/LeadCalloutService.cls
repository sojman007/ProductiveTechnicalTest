@suppressWarnings('pmd')
public without sharing class LeadCalloutService  extends QueueableBaseLink{
    
    private List<Lead_Callout_Log__c> logs = new List<Lead_Callout_Log__c>();
    

    public LeadCalloutService(List<Lead> leads){
        for(Lead lead : leads){
            super.addNode(new LeadQueueableNode(lead));
        }
    }

    public override void finish(){
        insert logs;
    }


    public override void addResult(Object log){
        logs.add((Lead_Callout_Log__c)log);
    }






}