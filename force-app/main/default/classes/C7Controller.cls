public with sharing class C7Controller {

    ApexPages.standardSetController sd;

    public String inputValue {get; set;}

    public Account acct {get; set;}

    public C7Controller() {
 
    }

    public C7Controller(ApexPages.StandardSetController stdController) {
        this.sd = stdController;
    }

    public void search() {
        String queryKey = '%' + inputValue + '%';
        List<Account> temp = [SELECT Name FROM Account WHERE Name LIKE :queryKey LIMIT 1];
        if(!temp.isEmpty()) { 
            this.acct = temp[0];
        }
        else {
            this.acct = null;
        }
    }
}