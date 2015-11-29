package com.blueshit.cookshow.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
public class ForwardController {

    @RequestMapping("/forward/adminLogin")
    public String forwardToAdminLogin(){
        return "admin/login";
    }



}
