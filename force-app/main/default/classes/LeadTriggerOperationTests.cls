@suppressWarnings('pmd')
@isTest
public with sharing class LeadTriggerOperationTests {

    @IsTest
    static void testCreateLeads(){
        Test.setMock(System.HttpCalloutMock.class, new LogCalloutMock());
        Test.startTest();
        insert TestDataFactory.getTestLeads(4,'ej90');
        Test.stopTest();

        integer logCount = [Select COUNT() from Lead_Callout_Log__c ];
        System.assertEquals(4, logCount);

        
    }

    @IsTest
    static void testUpdateLeads(){
        Test.setMock(System.HttpCalloutMock.class, new LogCalloutMock());
        List<Lead> testPreviousLeads = TestDataFactory.getTestLeads(4,'ej100');
        insert testPreviousLeads;
        Test.startTest();
        for(Lead l : testPreviousLeads){
            l.Bot_Script__c ='ej90';
        }
        update testPreviousLeads;
        Test.stopTest();
        
    }




}