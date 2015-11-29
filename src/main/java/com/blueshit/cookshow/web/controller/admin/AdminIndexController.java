package com.blueshit.cookshow.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/28.
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController{

    @RequestMapping("/index")
    public String index(){
        return "admin/index";
    }


}
