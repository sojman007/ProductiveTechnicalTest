public without sharing class SubscriberLwcTableData {
    @auraenabled
    public string name {get;set;}
    @auraenabled
    public string country {get;set;}
    @auraenabled
    public string email {get;set;}
    @auraenabled
    public string phone {get;set;}
    @auraenabled
    public string status {get;set;}
    @auraenabled
    public Date dateJoined {get;set;}
    @auraenabled
    public double dataUsed {get;set;}
    
    
    
    
    
    
    
    
    public SubscriberLwcTableData(Subscriber__c sub) {
        name = sub.Name;
        country = sub.Country__c;
        email = sub.Email__c;
        phone = sub.Phone__c;
        status = sub.Status__c;
        dateJoined = sub.Date_Joined__c;
        dataUsed = sub.Data_Used__c.setScale(2);

    }
}