public with sharing class C9Controller {

    public List<Account> accList {get; set;}

    public C9Controller() {
        this.accList = [SELECT Name, (SELECT Contact.Name FROM Contacts) FROM Account];
    }
    
    // public C8Extension(ApexPages.StandardSetController ssc) {
    //     this.ssc = ssc;
    //     this.accList = [SELECT Name, (SELECT Contact.Name FROM Contacts) FROM Account];
    // }
}