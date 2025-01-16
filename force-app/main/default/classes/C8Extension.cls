public with sharing class C8Extension {

    public List<Account> accList {get; set;}

    public C8Extension() {
        this.accList = [SELECT Name, (SELECT Contact.Name FROM Contacts) FROM Account];
    }
    
    // public C8Extension(ApexPages.StandardSetController ssc) {
    //     this.ssc = ssc;
    //     this.accList = [SELECT Name, (SELECT Contact.Name FROM Contacts) FROM Account];
    // }
}