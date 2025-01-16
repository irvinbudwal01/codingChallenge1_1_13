public with sharing class C10Controller {

    public List<Account> accList {get; set;}

    public Boolean showResult {get; set;}
    
    public Boolean showSearch {get; set;}

    public String inputSearch {get; set;}

    public C10Controller() {
        // this.accList = [SELECT Name, (SELECT Contact.Name FROM Contacts) FROM Account];
        showSearch = true;
        showResult = false;
    }
    
    public void search() {
        
        showResult = true;
        showSearch = true;

        String queryKey = '%' + inputSearch + '%';

        this.accList = [SELECT Name, (SELECT Contact.Name FROM Contacts) FROM Account WHERE Name LIKE :queryKey];
    }
}