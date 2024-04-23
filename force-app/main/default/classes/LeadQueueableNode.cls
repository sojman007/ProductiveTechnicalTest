public without sharing class LeadQueueableNode extends QueueableBaseNode {
    
    private Lead lead;
    private HttpResponseWrapper resp;
    private static final string ENDPOINT ='https://httpdump.app/dumps/b20b1a16-63dd-4d8d-96eb-bdd53179d5ff';

    public LeadQueueableNode(Lead lead) {
        this.lead = lead;
    }


    public override void execute(){
        SendLeadRequest request = new SendLeadRequest(this.lead);
        HttpRequest req = new HttpRequest();
        req.setEndpoint(ENDPOINT);
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(request));
        req.setMethod('POST');
        resp = new HttpResponseWrapper(new Http().send(req));

    }

    public override void finish(){

        Lead_Callout_Log__c log = new Lead_Callout_Log__c();
        log.status__c = resp.status;
        log.Dump__c = resp.body;

        parent.addResult(log);

    }

    public class HttpResponseWrapper{
        public string status;
        public string body;

        public HttpResponseWrapper(HttpResponse resp){
            status = resp.getStatus();
            body = resp.getBody();

        }
    }
}