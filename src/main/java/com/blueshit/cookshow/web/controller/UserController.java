package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.common.utils.UUIDCreator;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.qiniu.QiniuUpload;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.Iterator;

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
                    session.setAttribute("user",u);
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



    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(@ModelAttribute User user,String userBirthday,HttpSession session){
        //从session中获取user
        User u = (User)session.getAttribute("user");
        //日期特殊处理
        if(u!=null){
            System.out.println();
            User oldUser = userService.findByUsername(u.getUsername());
            oldUser.setRealName(user.getRealName());
            oldUser.setPhone(user.getPhone());
            oldUser.setBirthday(MyDataUtils.StringToDate(userBirthday,"yyyy-MM-dd"));
            oldUser.setIntro(user.getIntro());
            oldUser.setGender(user.getGender());
            //更新
            userService.update(oldUser);
            //更新session的user
            session.setAttribute("user",oldUser);
        }
        return "redirect:/user/personCenter";
    }


    @RequestMapping("/updatePassword")
    @ResponseBody
    public ResultEntity updatePassword(String oldpassword,String newpassword,HttpSession session){

        ResultEntity resultEntity = new ResultEntity();
        if(oldpassword!=null&&newpassword !=null){
            //从session找出该用户
            User u = (User)session.getAttribute("user");
            //从数据库中找出该用户
            User user = userService.findByUsername(u.getUsername());
            //校验旧的密码是否正确
            if(user.getPassword().equals(ShiroMD5.getMd5WithSalt(oldpassword,user.getSalt()))){
                //修改密码
                user.setPassword(ShiroMD5.getMd5WithSalt(newpassword,user.getSalt()));
                userService.update(user);
                resultEntity.setSuccessResult();
            }else{
                resultEntity.setFailureMsg("密码输入错误！");
            }
        }else{
            resultEntity.setFailureMsg("不能为空！");
        }
        return resultEntity;
    }


    @RequestMapping("/validateOldPassword")
    @ResponseBody
    public ResultEntity validateOldPassword(String oldPassword){
        ResultEntity resultEntity = new ResultEntity();

        return resultEntity;
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){

        //移除session
        session.removeAttribute("user");

        return "redirect:/";
    }

    @RequestMapping("/uploadFace")
    @ResponseBody
    public ResultEntity uploadFace(HttpServletRequest request) throws Exception{
        ResultEntity resultEntity = new ResultEntity();
        // 设置上下方文
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 检查form是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 由CommonsMultipartFile继承而来,拥有上面的方法.
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    String originalFilename =file.getOriginalFilename();
                    String fileName = MyDataUtils.DateToString(new Date(),"yyyyMMddHHmmSS")+originalFilename;
                    String url = QiniuUpload.upload(file,fileName);
                    User user = getCurrentUser(request.getSession());
                    user.setFace(url);
                    userService.update(user);
                    //更新session
                    request.getSession().setAttribute("user", user);
                    resultEntity.setSuccessMsg("上传成功!");
                }
            }
        }
        return resultEntity;
    }

    @RequestMapping("/personWork/{id}")
    public String personWork(@PathVariable String id,Model model){
        User user = userService.findById(Long.parseLong(id));
        if(user!=null){
            model.addAttribute("userInfo",user);
        }else{
            return "redirect:/error_404";
        }
        return "customer/user/personwork";
    }

}
