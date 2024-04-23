@suppressWarnings('pmd')
public without sharing class LeadCalloutService  extends QueueableBaseLink implements Database.AllowsCallouts{
    
    private List<Lead_Callout_Log__c> logs = new List<Lead_Callout_Log__c>();
    

    public LeadCalloutService(List<Lead> leads){
        System.debug(leads.size() + ' leads enqueued for callout');
        
        for(Lead lead : leads){
            super.addNode(new LeadQueueableNode(lead).setParent(this));
        }
    }

    public override void finish(){
        insert logs;
    }


    public override void addResult(Object log){
        logs.add((Lead_Callout_Log__c)log);
    }






}