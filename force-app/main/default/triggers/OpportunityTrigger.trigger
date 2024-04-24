trigger OpportunityTrigger on Opportunity (after insert , after update, after delete) {
    
    if(Trigger.isDelete){
        OpportunityTriggerHandler.handleOpportunities(Trigger.old);
    }else{
        OpportunityTriggerHandler.handleOpportunities(Trigger.new);

    }

}