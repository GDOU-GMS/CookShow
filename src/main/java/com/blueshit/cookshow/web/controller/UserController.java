package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.common.utils.UUIDCreator;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.shiro.ShiroMD5;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.Entity;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @RequestMapping("/forwardToLogin")
    public String forwardToLogin(ServletRequest request,HttpSession session){

        User user = (User)session.getAttribute("user");
        if(user!=null){
            return "redirect:/";
        }

        return "customer/login";
    }

    @RequestMapping("/personCenter")
    public String personCenter(){
        return "customer/user/userinfo";
    }

    @RequestMapping("/login")
    public String login(@ModelAttribute User user,ServletRequest request,HttpSession session){
        if(user.getUsername()!=null&&user.getPassword()!=null){
            User u = userService.findByUsername(user.getUsername());
            if(u!=null){
                if(u.getPassword().equals(ShiroMD5.getMd5WithSalt(user.getPassword(),u.getSalt()))){
                    //登录成功
                    session.setAttribute("user",user);
                    return "redirect:/";
                }
            }
        }
        return "redirect:/user/forwardToLogin";
    }


    @RequestMapping("/register")
    public String register(@ModelAttribute User user,Model model){
        if(user!=null&&user.getUsername()!=null&&user.getPassword()!=null&&user.getEmail()!=null){
            //判断用户名是否存在
            User olduser = userService.findByUsername(user.getUsername());
            if(olduser==null){
                User u = new User();
                String salt = UUIDCreator.generateUUID();
                u.setSalt(salt);
                u.setCreateDate(new Date());
                u.setUpdateDate(new Date());
                u.setUsername(user.getUsername());
                u.setPassword(ShiroMD5.getMd5WithSalt(user.getPassword(), salt));
                u.setEmail(user.getEmail());
                userService.save(u);
            }else{
                ResultEntity resultEntity = new ResultEntity();
                resultEntity.setFailureMsg("用户名已经存在！");
                model.addAttribute("resultEntity",resultEntity);
            }
        }
        return "redirect:/user/forwardToLogin";
    }


}
