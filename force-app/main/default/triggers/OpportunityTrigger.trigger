trigger OpportunityTrigger on Opportunity (after insert) {
    OpportunityTriggerHandler.handleOpportunities(Trigger.new);
}