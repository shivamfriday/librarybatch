/*
 * package in.ineuron.util;
 * 
 * import java.util.*; import javax.mail.*; import javax.mail.internet.*; import
 * javax.activation.*;
 * 
 * public class SendEmail { public static void sendMail(String mailId){ String
 * to = "sonoojaiswal1988@gmail.com";//change accordingly String from =
 * "ram.shivam1995@gmail.com";//change accordingly String host = "9999";//or IP
 * address
 * 
 * //Get the session object Properties properties = System.getProperties();
 * properties.setProperty("mail.smtp.host", host); Session session =
 * Session.getDefaultInstance(properties);
 * //properties.setProperty("mail.smtp.host", "10.101.3.229");
 * 
 * //compose the message try{ MimeMessage message = new MimeMessage(session);
 * message.setFrom(new InternetAddress(from));
 * message.addRecipient(Message.RecipientType.TO,new InternetAddress(mailId));
 * message.setSubject("Here Is your Student Id");
 * message.setText("Hello, this is example of sending email  stu123");
 * 
 * // Send message Transport.send(message);
 * System.out.println("message sent successfully....");
 * 
 * }catch (MessagingException mex) {mex.printStackTrace();} } }
 */