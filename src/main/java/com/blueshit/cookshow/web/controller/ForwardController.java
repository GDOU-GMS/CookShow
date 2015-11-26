package com.blueshit.cookshow.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
public class ForwardController {

    @RequestMapping("/forward/{dir}/{url}")
    public String forwardUrl(@PathVariable String dir,@PathVariable String url){
        return dir+"/"+url;
    }




}
