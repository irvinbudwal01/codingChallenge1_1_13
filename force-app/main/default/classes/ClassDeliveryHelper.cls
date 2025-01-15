public with sharing class ClassDeliveryHelper {
    public ClassDeliveryHelper() {

    }

    public static void CreateDelivery() {
            Class_Delivery__c cd = new Class_Delivery__c();
            insert cd;
    }

    public static void DeleteDelivery(String sId) {
        List<Class_Delivery__c> cdDelete = [SELECT Id FROM Class_Delivery__c WHERE Id = :sId]; //probably use SOSL instead of SOQL

        if(!cdDelete.isEmpty()) {
            delete cdDelete[0];
        }
    }

    public static void ChangeCourse(String sId, String course) {
        List<Class_Delivery__c> courseUpdate = [SELECT Id FROM Class_Delivery__c WHERE Id = :sId]; //probably use SOSL instead of SOQL

        if(!courseUpdate.isEmpty()) {
            courseUpdate[0].Course__c = course;
            update courseUpdate[0];
        }
    }
}