package tools;


import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.*;
import javax.mail.NoSuchProviderException;
import javax.mail.internet.AddressException;
/**
 *
 * @author USER
 */
public class SendMail {
    
  public void send(String to, String nama) {
        try {
             
            Properties properties=new Properties();
            properties.put("mail.smtp.host","smtp.gmail.com");
            properties.put("mail.smtp.auth","true");
            properties.put("mail.smtp.ssl.enable","true");
            properties.put("mail.smtp.port", "465");//default port dari smptp
             
            javax.mail.Session session=javax.mail.Session.getInstance(properties);
            session.setDebug(true);
             
            MimeMessage pesan=new MimeMessage(session);
            pesan.setFrom("bootcamp32java@gmail.com");//isi dengan gmail kalian sendiri, biasanya sama nanti dengan username
            pesan.setRecipient(Message.RecipientType.TO, new InternetAddress(to));//isi dengan tujuan email
            pesan.setSubject("verification Email");
//            pesan.setText("Selamat "+ nama+" Anda Sukses Registrasi.Email dikirim menggunakan Java Mail");
            pesan.setContent("<center><h2>Hello, "+nama+". Thank you for registering.<br>Please verify your account</h2>\"\n" +
"                    + \"<h4>In order to use an application, you must verify your account. \"\n" +
"                    + \"You can verify your account by click the button below.</h4>\"\n" +
"                    + \"<a href='www.mii.co.id' target='_BLANK'><button style='background-color:blue;'>Click Here to Verify</button>\"\n" +
"                    + \"</a><center>\", \n" ,
"                    \"text/html; charset=utf-8");
            String username="bootcamp32java@gmail.com"; //ganti dengan gmail kalian sendiri
            String password="ProgrammerJava"; //ganti dengan password kalian sendiri
            Transport.send(pesan, username, password);
             
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }
}