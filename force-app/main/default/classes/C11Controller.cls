public with sharing class C11Controller {
    
    ApexPages.standardSetController sd;

    public List<Account> accounts {get; set;}

    public String inputSearch {get; set;}
    
    public C11Controller() {

    }

    public C11Controller(ApexPages.StandardSetController stdController) {
        this.sd = stdController;
    }

    public void search() {
        String queryKey = '%' + inputSearch + '%';
        this.accounts = [SELECT Name FROM Account WHERE Name LIKE :queryKey];
    }

    public void save() {
        sd.save();
    }

}