package com.blueshit.cookshow.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/27.
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(){
        return "customer/index";
    }

    @RequestMapping("/login")
    public String login(){
        return "customer/login";
    }



}
