package com.smart.service;

import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import com.smart.domain.User;
import static org.testng.Assert.*;

@ContextConfiguration("classpath*:/smart-context.xml")
public class UserServiceTest extends AbstractTransactionalTestNGSpringContextTests{
    private UserService userService;
    @Autowired
    public void setUserService(UserService userService)
    {
        this.userService=userService;
    }
    @Test
    public void hasMatchUser(){
        boolean b1=userService.hasMatchUser("admin","123456");
        boolean b2=userService.hasMatchUser("admin","1111");
        assertEquals(b1,true);
        //assertEquals(b2,true);
    }
    @Test
    public void findUserByUserName() {
        User user=userService.findUserByUserName("admin");
        assertEquals(user.getUserName(),"admin");
    }
}