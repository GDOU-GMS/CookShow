package com.blueshit.cookshow.install;

import com.blueshit.cookshow.common.utils.UUIDCreator;
import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.service.AdminService;
import com.blueshit.cookshow.shiro.ShiroMD5;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;

import java.util.Date;

/**
 * Created by Seven on 2015/11/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class InstallAdmin {

    @Autowired
    private AdminService adminService;

    @Test
    public void installAdmin(){
        Admin admin = new Admin();
        admin.setUsername("admin");
        String salt =  UUIDCreator.generateUUID();
        String password = ShiroMD5.getMd5WithSalt("admin",salt);
        admin.setPassword(password);
        admin.setSalt(salt);
        admin.setCreateDate(new Date());
        admin.setUpdateDate(new Date());
        adminService.save(admin);


    }


}
