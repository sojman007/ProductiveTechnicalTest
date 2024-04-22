public without sharing class SendLeadRequest {
    public string firstName {get;set;}
    public string lastName {get;set;}
    public string phone {get;set;}
    public string email {get;set;}
    
    public SendLeadRequest(Lead l) {

        this.firstName = l.FirstName;
        this.lastName = l.LastName;
        this.phone = l.MobilePhone;
        this.email = l.Email;
    }
}