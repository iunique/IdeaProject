package service;
import com.sun.mail.util.MailSSLSocketFactory;
import entity.User;
import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
@Service
public class Mail
 {
    @Autowired
     UserMapper userMapper;
     @Transactional
     public  void sendCode(User user)
   {
     try
     {
       Properties prop = new Properties();
       prop.setProperty("mail.debug", "true");//设置debug信息打印
       prop.setProperty("mail.host", "smtp.qq.com");
       prop.setProperty("mail.smtp.auth", "true");
       prop.setProperty("mail.transport.protocol", "smtp");
       MailSSLSocketFactory sf = new MailSSLSocketFactory();
       sf.setTrustAllHosts(true);
       prop.put("mail.smtp.ssl.enable", "true");
       prop.put("mail.smtp.ssl.socketFactory", sf);
       Session session = Session.getInstance(prop);
       Transport ts = session.getTransport();
       ts.connect("smtp.qq.com", "qq号", "这里填邮箱里的授权码(没有的要去qq邮箱那设置)");
       Message message = createSimpleMail(user, session);
       ts.sendMessage(message, message.getAllRecipients());
       ts.close();
     }
     catch (Exception e) {
       e.printStackTrace();
     }
   }
   @Transactional
   public  MimeMessage createSimpleMail(User user, Session session) throws Exception
   {
     MimeMessage message = new MimeMessage(session);
     message.setFrom(new InternetAddress("这里填发件人的邮箱"));
     message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getMail()));
     message.setSubject("OJ账号找回");
     Random rand = new Random();
     Integer t = Integer.valueOf(rand.nextInt(90000) + 10000);//生成5位随机数
     user.setCode(t.toString());
     userMapper.insertUser(user);
     message.setContent("本次的修改密码验证码为:" + t + "，2分钟内有效。若非本人操作，请尽快联系WUSTOJ管理员，qq:845723932 ", "text/html;charset=UTF-8");
     return message;
   }
 }