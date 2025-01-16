public with sharing class C6Extension {
    
    ApexPages.standardController sd;
    
    public Boolean visible {get; set;}

    public C6Extension() {

    }

    public C6Extension(ApexPages.StandardController stdController) {
        sd = stdController;
        this.visible = false;
    }

    public void displayName() {
        this.visible = !visible;
    }
}