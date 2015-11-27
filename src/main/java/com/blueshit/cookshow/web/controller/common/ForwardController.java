package com.blueshit.cookshow.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
public class ForwardController {

    @RequestMapping("/forward/{dir}/{url}")
    public String forwardUrl1(@PathVariable String dir,@PathVariable String url){
        return dir+"/"+url;
    }

    @RequestMapping("/forward/{url}")
    public String forwardUrl2(@PathVariable String url){
        return url;
    }

    @RequestMapping("/forward/{dir1}/{dir2}/{url}")
    public String forwardUrl3(@PathVariable String dir1,@PathVariable String dir2,@PathVariable String url){
        return dir1+"/"+dir2+"/"+url;
    }




}
