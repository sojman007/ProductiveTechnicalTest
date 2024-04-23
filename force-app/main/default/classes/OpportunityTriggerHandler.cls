public with sharing class OpportunityTriggerHandler {
    

    private static void executeAccountAggregation(List<string> accountIds){
        if(accountIds.size() > 0){
            System.enqueueJob(new AccountAggregationLink(accountIds));
        }

    }

    public static void handleOpportunities(List<Opportunity> records){
        Set<string> accountIds = new Set<string>();
        for(Opportunity opp : records){
            accountIds.add(opp.AccountId);
        }
        executeAccountAggregation(new List<String>(accountIds));
    }


}