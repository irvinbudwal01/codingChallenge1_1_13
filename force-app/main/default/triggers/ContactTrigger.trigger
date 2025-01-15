trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete) {

    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            ContactHelper.PreventSaves(Trigger.new); //only sending triggering records
        }

        when BEFORE_UPDATE {
            ContactHelper.PreventSaves(Trigger.new); //only sending triggering records
        }

    }
}