package com.blueshit.cookshow.test;

import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.service.AdminService;
import com.blueshit.cookshow.service.MenuService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;

import java.util.List;

/**
 * Created by Seven on 2015/11/25.
 */



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class TestConfiguration {

    @Autowired
    private AdminService adminService;

    @Autowired
    private MenuService menuService;

    @Test
    public void testInit(){
        List<Admin> admins = adminService.findAll();

        System.out.println(admins.size());
    }


    @Test
    public void testConfiguration(){

    }

    @Test
    public void testSaveManyToMany(){

        menuService.addCookbook((long)4,(long)18);


    }



}
