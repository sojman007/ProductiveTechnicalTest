public with sharing class AccountQueueableNode extends QueueableBaseNode {
    
    private string accountId;
    private Account updateResult;
    
    
    public AccountQueueableNode(string accountId) {
        this.accountId = accountId;

    }

    

    public override void execute(){
        decimal totalAmount = 0;
        for(Opportunity opp : [Select Amount From Opportunity Where AccountId =:accountId WITH SECURITY_ENFORCED]){
            totalAmount += opp.Amount;
        }
        updateResult = new Account(Id = accountId , Total_Amount_On_Opportunities__c = totalAmount);
    }

    
    public override void finish(){
        parent.addResult(updateResult);
    }

}