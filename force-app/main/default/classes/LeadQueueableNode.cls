public with sharing class LeadQueueableNode extends QueueableBaseNode {
    
    private Lead lead;
    private HttpResponse resp;
    public LeadQueueableNode(Lead lead) {
        this.lead = lead;
    }

    public override object get(){
        return this.lead;
    }

    public override void execute(){
        Lead mylead = (Lead)this.get();
        SendLeadRequest request = new SendLeadRequest(mylead);
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Lead_Callout');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(request));
        req.setMethod('POST');
        resp = new Http().send(req);

    }

    public override void finish(){

        Lead_Callout_Log__c log = new Lead_Callout_Log__c();
        log.status__c = resp.getStatus();
        log.Dump__c = resp.getBody();

        parent.addResult(log);

    }
}