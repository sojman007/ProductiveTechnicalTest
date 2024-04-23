@suppressWarnings('pmd')
@isTest
public without sharing class SubscriberLwcControllerTest {
    
    @TestSetup
    static void makeData(){
        insert TestDataFactory.getTestSubscribers(10);   
    }

    @IsTest
    static void testControllerGetData(){
        
        Test.startTest();
        List<SubscriberLwcTableData> data = SubscriberEnhancedListLwcController.getAllSubscribers(false);
        Test.stopTest();
        System.assertEquals(10, data.size());
        
    }


    @IsTest
    static void testControllerGetDataException(){
        
        Test.startTest();
        List<SubscriberLwcTableData> data = SubscriberEnhancedListLwcController.getAllSubscribers(true);
        Test.stopTest();
        
        
    }



}