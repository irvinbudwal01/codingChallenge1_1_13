public with sharing class ContactHelper {
    public ContactHelper() {

    }

    public static void PreventSaves(List<Contact> conList) {
        Set<Id> cId = new Set<Id>();

        for(Contact c : conList) {
            cId.add(c.AccountId);
        }

        List<Account> accList = [SELECT Id, (SELECT Id, Email FROM Contacts) FROM Account WHERE Id IN :cId];


        Map<Id, List<Contact>> AccConMap = new Map<Id, List<Contact>>();

        for(Integer i = 0; i < accList.size(); i++) {
            AccConMap.put(accList[i].Id, accList[i].Contacts);
        }

        for(Contact c : conList) {
            List<Contact> cList = new List<Contact>();
            cList.addAll(AccConMap.get(c.AccountId));
            for(Contact relatedCon : cList) {
                String domain = relatedCon.Email.substringAfter('@');
                if(!domain.equals(c.Email.substringAfter('@'))) {
                    c.email.addError('Email does not match previously identified domain!');
                }
            }
            // if(c.AccountId != null) {
            // for(Account acc : accList) {
            //     if(acc.Id == c.AccountId) {
            //         List<Contact> cons = [SELECT Email FROM Contact WHERE AccountId = :acc.Id];
            //         if(!cons.isEmpty()) {
            //             String domain = cons[0].Email.substringAfter('@');
            //             if(!domain.equals(c.Email.substringAfter('@'))) {
            //                 c.email.addError('Email does not match previously identified domain!');
            //             }
            //         }
            //     }
            // }
        //}
        }

    }
}