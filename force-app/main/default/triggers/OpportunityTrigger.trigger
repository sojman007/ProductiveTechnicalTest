trigger OpportunityTrigger on Opportunity (after insert , after update) {
    OpportunityTriggerHandler.handleOpportunities(Trigger.new);
}