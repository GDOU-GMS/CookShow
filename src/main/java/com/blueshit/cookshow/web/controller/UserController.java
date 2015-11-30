package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @RequestMapping("/forwardToLogin")
    public String forwardToLogin(){
        return "customer/login";
    }

    @RequestMapping("/personCenter")
    public String personCenter(){
        return "customer/user/userinfo";
    }


}
