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
private class ContactHelper_Test {


    @TestSetup
    static void makeData(){

        // Account testAcc = new Account(Name='Test Account');

        // insert testAcc;

        // Contact testC = new Contact(LastName='testC', AccountId=testAcc.Id, Email='testC@temp.com');
        // Contact testC2 = new Contact(LastName='testC2', AccountId=testAcc.Id, Email='testC2@ege.com');

        // List<Contact> toAdd = new List<Contact>();

        // toAdd.add(testC);
        // toAdd.add(testC2);

        // insert toAdd;
    }

    @isTest
    static void TestPreventSaves() {
        // TO DO: implement unit test

        Account testAcc = new Account(Name='Test Account');

        insert testAcc;

        Contact testC = new Contact(LastName='testC', AccountId=testAcc.Id, Email='testC@temp.com');
        Contact testC2 = new Contact(LastName='testC2', AccountId=testAcc.Id, Email='testC2@ege.com');

        List<Contact> toAdd = new List<Contact>();

        toAdd.add(testC);
        toAdd.add(testC2);

        try {
        List<Database.SaveResult> sr = Database.insert(toAdd);
        }
        catch(DmlException e) {  
            Assert.areEqual(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION, e.getDmlType(1));
        }
        
        //List<Contact> conList = [SELECT LastName, Email, AccountId FROM Contact WHERE LastName LIKE 'test%']; 

        // System.debug('***********************************' + conList.size());
        // System.debug('***********************************' + conList[0].Email);
        // System.debug('***********************************' + conList[1].Email);
        // Assert.areEqual(1, successfulAttempt);
        // Assert.areEqual(1, failedAttempt);

    }
}