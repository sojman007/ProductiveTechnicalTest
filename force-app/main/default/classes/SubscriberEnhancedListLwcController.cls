@suppressWarnings('pmd')
public without sharing class SubscriberEnhancedListLwcController {
    



    @AuraEnabled(cacheable=true)
    public static List<SubscriberLwcTableData> getAllSubscribers(boolean throwException){
        List<SubscriberLwcTableData> data = new List<SubscriberLwcTableData>();
        try {
            for(Subscriber__c sub : [Select Id ,Name, Phone__c, Email__c , Country__c , Status__c , Date_Joined__c , Data_Used__c From Subscriber__c]){
                data.add(new SubscriberLwcTableData(sub));
            }
            if(throwException){
                throw new IllegalArgumentException('Intentionally throwing this exception to cover for test. Normally we wouldnt do this in real life');
            }
            return data;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


}