public class SendEmail {
    
    public static void sendEmailMsg(){
        
        EmailTemplate emailTemplate = [SELECT Id,Subject, Description, HtmlValue, DeveloperName, Body
                                       FROM EmailTemplate
                                       WHERE Name = 'Monthly Reminder'];
        
        //String subject = emailTemplate.Subject;
        //String htmlBody = emailTemplate.htmlValue;
        //htmlBody = htmlBody.replace('{!Contact.Email}', aBody);
        //htmlBody = htmlBody.replace('{!Contact.FirstName}', res.getBody());
       
        String mMail = 'euglenmulaj97@gmail.com';
       

        List<String> sendTo = new List<String>();
        sendTo.add(mMail);
        //sendTo.add(mMail2);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(sendTo);
        mail.setReplyTo('noreply@salesforce.com');
        mail.setTemplateID(emailTemplate.Id);
        mail.setSaveAsActivity(false);
		mail.setTargetObjectId('0037S00000Oxbm9QAB');
        //mail.setSubject(subject);
        //mail.setHtmlBody(htmlBody);
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        mails.add(mail);
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(mails);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug(
                'The email failed to send: ' + results[0].errors[0].message
            );
        }
    }

}
