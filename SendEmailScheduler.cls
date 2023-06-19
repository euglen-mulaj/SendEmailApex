public class SendEmailScheduler implements Schedulable {
    //in order to schedule this class to send the email
    //every month at day 8, on 12:00 run the following
    //command in anonymous---------->>>>>>>>>>>>>>>>>>
    //String cronExpression = '0 0 12 8 * ?';
	//System.schedule('Send Email Job', cronExpression, new SendEmailScheduler());


    public void execute(SchedulableContext context) {
        SendEmail.sendEmailMsg();
    }
}
