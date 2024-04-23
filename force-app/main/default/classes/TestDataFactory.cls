@isTest
public without sharing class TestDataFactory {
   

    public static Account getTestAccount(){
        Account acc = new Account(Name='Test Account');
        acc.AccountNumber='1234567890';
        acc.Website='https://mysite.com';

        return acc;
    }

    public static List<Lead> getTestLeads(integer numberOfLeads, string testScript){
        List<Lead> myLeads = new List<Lead>();
        
        for(integer i =1 ; i <= numberOfLeads ;i++){
            Lead myLead = new Lead();
            mylead.FirstName ='Test Lead ';
            mylead.LastName = String.valueOf(i);
            myLead.Bot_Script__c=testScript;
            myLead.Company='Test Company' + i;
            myLead.Email ='TestLead'+i+'@testmaildomain.com';
            myLead.phone= '+123'+String.join(new List<Integer>{i,i,i,i,i,i,i,i,i,i},'');
            myLeads.add(myLead);

        }
        return myLeads;

    }
}