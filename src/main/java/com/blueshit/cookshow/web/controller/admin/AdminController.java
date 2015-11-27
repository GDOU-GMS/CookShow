package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseController {

    @RequestMapping("/login")
    public String login(String username,String password){
        if(username==null||"".equals(username)||password==null||"".equals(password)){

        }
        return "admin/index";
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute Admin admin){

        if(admin==null){

        }else{
            Admin a = adminService.findByUsername(admin.getUsername());
            if(a!=null){

            }
        }

        adminService.save(admin);

        return "";
    }



}
