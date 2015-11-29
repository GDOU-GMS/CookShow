package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.shiro.ShiroMD5;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Seven on 2015/11/27.
 */
@Controller
public class AdminLoginController extends BaseController {

    @RequestMapping("/adminLogin")
    @ResponseBody
    public ResultEntity adminLogin(String username,String password,HttpSession session){
        ResultEntity resultEntity = new ResultEntity();

        if(username==null||"".equals(username.trim())||password==null||"".equals(password.trim())){
            resultEntity.setFailureMsg("不可为空！");
        }else{
            //找出数据库中的admin
            Admin admin = adminService.findByUsername(username);
            if(admin==null){
                resultEntity.setFailureMsg("账号或者密码错误！");
            }else if(ShiroMD5.getMd5WithSalt(password,admin.getSalt()).equals(admin.getPassword())){
                //是否被锁定
                if(admin.getDeleted() == 1){
                    resultEntity.setFailureMsg("该用户已经被锁定");
                }else{
                    //成功，放到session
                    session.setAttribute("admin",admin);
                    resultEntity.setSuccessResult();
                }
            }else{
                resultEntity.setFailureMsg("账号或者密码错误！");
            }
        }
        return resultEntity;
    }


}
