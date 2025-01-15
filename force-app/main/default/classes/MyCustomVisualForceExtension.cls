public with sharing class MyCustomVisualForceExtension {
    
    public List<Account> acct;

    public ApexPages.StandardSetController ssc {get {
        if(ssc == null) {
            ssc = new ApexPages.StandardSetController([SELECT Name FROM Account]);
        }
        return ssc;
    } 
    set;
    }

    public MyCustomVisualForceExtension() {
        this.acct = ssc.getRecords();
    }

    public List<Account> getAcct() {
        return this.acct;
    }

}