 package service;

 import java.util.Date;

 import entity.User;
 import mapper.UserMapper;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Service;
 import org.springframework.transaction.annotation.Transactional;


 @Service
 public class CodeHandle
 {
     @Autowired
     private UserMapper userMapper;
     @Autowired
     @Transactional
      public  boolean CheckValid(User user)
       {
           User user1 = userMapper.findUser(user.getId());
         if (user.equals(user1))
         {
           return true;
         }
         return false;
       }
       @Autowired
       @Transactional
       public boolean CheckRepeat(User user)
       {
         User user1 = userMapper.findUser(user.getId());
         if (user1 == null)
           return false;
         Date d1 = new Date();
         Date d2 = user1.getTime();
         if (d1.getTime() - d2.getTime() >= 120000)
         {
           userMapper.deleteUser(user.getId());
           return false;
         }
         return true;
       }
 }