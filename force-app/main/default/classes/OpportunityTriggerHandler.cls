public with sharing class OpportunityTriggerHandler {
    

    private static void executeAccountAggregation(List<string> accountIds){
        System.enqueueJob(new AccountAggregationLink(accountIds));
    }

    public static void handleOpportunities(List<Opportunity> records){
        List<string> accountIds = new List<string>();
        for(Opportunity opp : records){
            accountIds.add(opp.AccountId);
        }
        executeAccountAggregation(accountIds);
    }


}