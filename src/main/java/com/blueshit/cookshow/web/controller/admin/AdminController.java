package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseController {

    @RequestMapping("/login")
    public String login(){
        return "admin/index";
    }




}
