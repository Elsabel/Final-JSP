/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ASUS
 */
public class HtmlSendMail {

    public void sendHtmlEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException,
            MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setContent(message, "text/html");

        // sends the e-mail
        Transport.send(msg);

    }

    /**
     * Test the send html e-mail method
     *
     */
    public void send(String to, String id) {
        // SMTP server information
        String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "bootcamp32java@gmail.com";
        String password = "ProgrammerJava";

        // outgoing message information
//        String mailTo = "jafarshodiq0412@gmail.com";
        String mailTo = to;
        String subject = "verification Email";

        // message contains HTML markups
        String message = "<html>\n"
                + "<head>\n"
                + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n"
                + "    <title>Verification Email</title>\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n"
                + "        <link href=\"assets/assets/libs/bootstrap/dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n"
                + "</head>\n"
                + "<body style=\"margin:0; padding:10px 0 0 0;\" bgcolor=\"#F8F8F8\">\n"
                + "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"95%%\">\n"
                + "    <tr>\n"
                + "        <td align=\"center\">\n"
                + "            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"\n"
                + "                   style=\"border-collapse: separate; border-spacing: 2px 5px; box-shadow: 1px 0 1px 1px #B8B8B8;\"\n"
                + "                   bgcolor=\"#FFFFFF\">\n"
                + "                <tr>\n"
                + "                    <td align=\"center\" style=\"padding: 5px 5px 5px 5px;\">\n"
                + "                        <a href=\"http://url-goes-here\" target=\"_blank\">\n"
                + "                            <img src=\"https://www.metrodataonline.com/media/logo/websites/1/Logo_MOL_-_Header_-_355_x_120_pixel.png\" alt=\" Metrodata Logo\"  style=\"width:186px;border:0;\"/>\n"
                + "                            <!--<img src=\"C:\\Users\\HP\\Pictures\\coba header.png\" alt=\" Metrodata Logo\"  style=\"width:186px;border:0;\"/>-->\n"
                + "                        </a>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr>\n"
                + "                    <td align=\"center\">\n"
                + "                        <!-- Initial relevant banner image goes here under src-->\n"
                + "                        <img src=\"https://miro.medium.com/max/5766/1*GQYxK_6eNpDdO8JPj73zMA.png\" alt=\"Verification Banner\" style=\"display: block;border:0;\" height=\"20%%\" width=\"600\"/>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr>\n"
                + "                    <td bgcolor=\"#ffffff\" style=\"padding: 40px 30px 40px 30px;\">\n"
                + "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%%\">\n"
                + "                            <tr>\n"
                + "                                <td style=\"padding: 10px 0 10px 0; font-family: Avenir, sans-serif; font-size: 16px;\">\n"
                + "                                    <!-- Initial text goes here-->\n"
                + "                                    <h1 align=\"center\">Hello</h1>\n"
                + "                                    <p align=\"center\">\n"
                + "                                        One more step you can start enjoying the HR system.<br>\n"
                + "                                        Please click the verification button below.\n"
                + "                                    </p>\n"
                + "                                    <center>\n"
                + "<a href='http://localhost:8084/JSP/userAccountServlet?action=verification&id=" + id + "'>Verification</a>"
                + "                                    </center>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                        </table>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr>\n"
                + "                    <td bgcolor=\"#E8E8E8\">\n"
                + "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%%\" style=\"padding: 20px 10px 10px 10px;\">\n"
                + "                            <tr>\n"
                + "                                <td width=\"260\" valign=\"top\" style=\"padding: 0 0 15px 0;\">\n"
                + "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%%\">\n"
                + "                                        <tr>\n"
                + "                                            <td align=\"center\">\n"
                + "                                                <a href=\"tel:phone number goes here\" target=\"_blank\">\n"
                + "                                                    <img src=\"http://assets.stickpng.com/thumbs/5a452570546ddca7e1fcbc7d.png\" alt=\"Call us\"\n"
                + "                                                         style=\"display: block;\" width=\"50\"/>\n"
                + "                                                </a>\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                        <tr>\n"
                + "                                            <td align=\"center\"\n"
                + "                                                style=\"font-family: Avenir, sans-serif; color:#707070;font-size: 13px;padding: 10px 0 0 0;\">\n"
                + "                                                GIVE US A CALL\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                    </table>\n"
                + "                                </td>\n"
                + "                                <td style=\"font-size: 0; line-height: 0;\" width=\"20\">\n"
                + "                                    &nbsp;\n"
                + "                                </td>\n"
                + "                                <td width=\"260\" valign=\"top\">\n"
                + "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%%\" >\n"
                + "                                        <tr>\n"
                + "                                            <td align=\"center\">\n"
                + "                                                <a href=\"mailto:emailgoeshere@gmail.com\">\n"
                + "                                                    <img src=\"https://www.freeiconspng.com/uploads/email-icon-23.png\" alt=\"Email us\"\n"
                + "                                                         style=\"display: block;\" width=\"50\"/>\n"
                + "                                                </a>\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                        <tr>\n"
                + "                                            <td align=\"center\"\n"
                + "                                                style=\"font-family: Avenir, sans-serif; color:#707070;font-size: 13px;padding: 10px 0 0 0;\">\n"
                + "                                                EMAIL US\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                    </table>\n"
                + "                                </td>\n"
                + "                                <td style=\"font-size: 0; line-height: 0;\" width=\"20\">\n"
                + "                                    &nbsp;\n"
                + "                                </td>\n"
                + "                                <td width=\"260\" valign=\"top\">\n"
                + "                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%%\">\n"
                + "                                        <tr>\n"
                + "                                            <td align=\"center\">\n"
                + "                                                <a href=\"url to faq page goes here\" target=\"_blank\">\n"
                + "                                                    <img src=\"https://www.freeiconspng.com/uploads/to-do-list-icon-buy-this-icon-for--0-48-1.png\" alt=\"FAQ Page\"\n"
                + "                                                         style=\"display: block;\" width=\"50\"/>\n"
                + "                                                </a>\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                        <tr>\n"
                + "                                            <td align=\"center\"\n"
                + "                                                style=\"font-family: Avenir, sans-serif; color:#707070;font-size: 13px;padding: 10px 0 0 0;\">\n"
                + "                                                BROWSE FAQ PAGE\n"
                + "                                            </td>\n"
                + "                                        </tr>\n"
                + "                                    </table>\n"
                + "                                </td>\n"
                + "                            </tr>\n"
                + "                        </table>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "            </table>\n"
                + "        </td>\n"
                + "    </tr>\n"
                + "</table>\n"
                + "</body>\n"
                + "</html>";
                

        HtmlSendMail mailer = new HtmlSendMail();

        try {
            mailer.sendHtmlEmail(host, port, mailFrom, password, mailTo,
                    subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to sent email.");
            ex.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        HtmlSendMail hsm = new HtmlSendMail();
//        hsm.send(to, id);
//    }
}
