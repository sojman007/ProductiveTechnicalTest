@isTest
public without sharing class OpportunityTriggerOperationTests {
    

    @TestSetup
    static void makeData(){
        Account acc = new Account(Name='Test Account');
        acc.AccountNumber='1234567890';
        acc.Website='https://mysite.com';

        insert acc;
    }

    @isTest
    static void testOpportunityLinkSuccess(){

        Account acc = [Select Id From account LIMIT 1];
        List<Opportunity> opps = new List<Opportunity>();
        decimal totalAmount = 0;
        for(integer i =1; i <= 5 ; i++){
            Opportunity testOpp = new Opportunity();
            testOpp.Name ='Test Opp '+ i;
            testOpp.amount = 50;
            totalAmount += testOpp.amount;
            testOpp.AccountId = acc.Id;
            opps.add(testOpp);
        }
        Test.startTest();
        insert opps;
        Test.stopTest();

        Account updatedAccount = [Select Id, Total_Amount_On_Opportunities__c From Account LIMIT 1];
        System.assertEquals(totalAmount, updatedAccount.Total_Amount_on_Opportunities__c,'Amounts are not equal');

    }



}