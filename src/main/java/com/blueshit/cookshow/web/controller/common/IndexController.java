package com.blueshit.cookshow.web.controller.common;

import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.listener.DataCacheListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by Seven on 2015/11/27.
 */
@Controller
public class IndexController extends BaseController{

    @RequestMapping("/")
    public String index(Model model){
        //从缓存中获取
        model.addAttribute("topClassificationVoList", DataCacheListener.classificationList);
        //获取首页轮播
        List<Cookbook>  headlineCookbooks = cookbookService.getHeadlineCookbooks();
        model.addAttribute("headlineCookbooks",headlineCookbooks);
        return "customer/index";

    }

    @RequestMapping("/login")
    public String login(){
        return "customer/login";
    }

    @RequestMapping("/error_404")
    public String error_404(){
        return "error_404";
    }


    @RequestMapping("/checkLogin")
    @ResponseBody
    public ResultEntity checkLogin(HttpServletRequest request){
        ResultEntity resultEntity = new ResultEntity();
        User user = getCurrentUser(request.getSession());
        if(user==null){
            resultEntity.setResult(0);
        }else{
            resultEntity.setResult(1);
        }
        return resultEntity;
    }

}
