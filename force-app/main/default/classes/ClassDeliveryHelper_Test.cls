/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ClassDeliveryHelper_Test {

    @isTest
    static void CreateDeliveryTest() {
        // TO DO: implement unit test
        List<Class_Delivery__c> initial = [SELECT Id FROM Class_Delivery__c];
        
        ClassDeliveryHelper.CreateDelivery();

        List<Class_Delivery__c> after = [SELECT Id FROM Class_Delivery__c];
        Assert.areEqual(initial.size() + 1, after.size());
    }

    @isTest
    static void DeleteDeliveryTest() {
        // TO DO: implement unit test
        
        ClassDeliveryHelper.CreateDelivery();

        List<Class_Delivery__c> initial = [SELECT Id FROM Class_Delivery__c];

        Class_Delivery__c toDelete = initial.get(0);

        ClassDeliveryHelper.DeleteDelivery(toDelete.Id);

        List<Class_Delivery__c> after = [SELECT Id FROM Class_Delivery__c];

        Assert.areEqual(initial.size() - 1, after.size());
    }

    @isTest
    static void ChangeCourseTest() {
        // TO DO: implement unit test
        
        ClassDeliveryHelper.CreateDelivery();

        List<Class_Delivery__c> initial = [SELECT Course__c, Id FROM Class_Delivery__c];

        Class_Delivery__c toEdit = initial.get(0);

        ClassDeliveryHelper.ChangeCourse(toEdit.Id, '.Net');

        List<Class_Delivery__c> after = [SELECT Course__c, Id FROM Class_Delivery__c];

        Assert.areEqual('.Net', after.get(0).Course__c);
    }
}