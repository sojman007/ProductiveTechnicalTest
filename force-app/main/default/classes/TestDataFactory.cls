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

    public static List<Subscriber__c> getTestSubscribers(integer amount){
        List<Subscriber__c> subs = new List<Subscriber__c>();
        for(integer i = 1; i <= amount ; i++){
            Subscriber__c sub = new Subscriber__c();
            sub.Name = 'Test Sub ' + i;
            sub.Country__c = 'Nigeria';
            sub.Email__c = 'testsub'+i+'@testemaildomain.com';
            sub.Phone__c = '+234'+String.join(new List<Integer>{i,i,i,i,i,i,i,i,i,i}, '');
            sub.Status__c = i  < 3 ?  'ACTIVE' : Math.mod(i, 2) == 0 ? 'SUSPENDED' : 'DISCONNECTED';
            sub.Date_Joined__c = Date.today().addDays(i);
            sub.Data_Used__c = Math.random() * 50 * i;
            subs.add(sub);
        }

        return subs;


    }
}