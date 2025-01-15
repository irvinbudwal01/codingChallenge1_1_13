public with sharing class MyVisualForceExtension {

    ApexPages.standardSetController sd;

    public MyVisualForceExtension() {
 
    }

    public MyVisualForceExtension(ApexPages.StandardSetController stdController) {
        sd = stdController;
        sd.setPageSize(5);
    }
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.

    public void previous(ApexPages.StandardSetController stdController) {
        stdController.previous();
    }

    public void next(ApexPages.StandardSetController stdController) {
        stdController.next();
    }
}