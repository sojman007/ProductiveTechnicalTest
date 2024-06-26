@suppressWarnings('pmd')
public with sharing class AccountAggregationLink extends QueueableBaseLink {
    

    private List<Account> accountUpdateList = new List<Account>();

    public AccountAggregationLink(List<string> accountIds){
        for(string accountId :  accountIds){
            super.addNode(new AccountQueueableNode(accountId).setParent(this));
        }
    }

    public override void addResult(Object obj){
        accountUpdateList.add((Account)obj);
    }

    public override void finish(){
        system.debug(accountUpdateList);
        update accountUpdateList;

    }




}