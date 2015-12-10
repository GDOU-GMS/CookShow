package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.utils.UUIDCreator;
import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.shiro.ShiroMD5;
import com.blueshit.cookshow.web.basic.BaseController;

import com.blueshit.cookshow.web.controller.common.ResultEntity;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;


/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @RequestMapping("/list")
    public String list(Model model,Integer pageNum){

        pageNum = (pageNum==null||pageNum==0)?1:pageNum;

        Page page = adminService.getPage(pageNum, new QueryHelper(Admin.class, "a"));

        model.addAttribute("page",page);

        return "admin/admin/list";
    }

    
/*
 * 模糊查询管理员信息
 */
	
     @RequestMapping("/query")
     public String query(@ModelAttribute Admin admin,Integer pageNum,Model model){
    	 pageNum = pageNum==null||pageNum==0?1:pageNum;
		  QueryHelper queryHelper=new QueryHelper(Admin.class, "a")
	   	  .addWhereCondition(admin.getUsername()!=null&&!"".equals(admin.getUsername()),"a.username like '%"+admin.getUsername()+"%'")
	   	  .addOrderByProperty("createDate",true);
		   Page page = adminService.getPage(pageNum, queryHelper);
	      //Page page = cookbookService.getPage(pageNum, list);
		  model.addAttribute("page",page);
		  return "admin/admin/list";
    	 
     }


    @RequestMapping("/forwordToAddAdmin")
    public String forwordToAddAdmin(){
        return "admin/admin/addAdmin";
    }


    @RequestMapping("/createAdmin")
    public String createAdmin(HttpServletRequest request,String username){
        //判断当前管理员是不是超级管理员
        Admin admin = getCurrentAdmin(request.getSession());
        if("admin".equals(admin.getUsername())&&username!=null){
            //校验username是否存在
            Admin oldAdmin = adminService.findByUsername(username);
            if(oldAdmin==null){
                Admin a = new Admin();
                String salt = UUIDCreator.generateUUID();
                a.setSalt(salt);
                a.setCreateDate(new Date());
                a.setUpdateDate(new Date());
                a.setUsername(username);
                a.setPassword(ShiroMD5.getMd5WithSalt("123456",a.getSalt()));
                adminService.save(a);
            }
        }
        return "redirect:/admin/list";
    }


    @RequestMapping("/checkExist")
    @ResponseBody
    public ResultEntity checkExist(String username){
        ResultEntity resultEntity = new ResultEntity();
        if(username!=null){
           Admin oldAdmin = adminService.findByUsername(username);
           if(oldAdmin==null){
               resultEntity.setSuccessMsg("yes");
           }else {
               resultEntity.setFailureMsg("no");
           }
        }
        return resultEntity;
    }

    @RequestMapping("/resetPassword")
    @ResponseBody
    public ResultEntity resetPassword(String adminId){
        ResultEntity resultEntity = new ResultEntity();
        if(adminId!=null){
            Admin admin = adminService.findById(Long.parseLong(adminId));
            if(admin!=null){
                admin.setPassword(ShiroMD5.getMd5WithSalt("123456",admin.getSalt()));
                adminService.update(admin);
                resultEntity.setSuccessMsg("success");
            }
        }
        return resultEntity;
    }


    @RequestMapping("/lock")
    public String lock(String id,String state,int pageNum){

        if(id!=null&&state!=null){
            Admin admin = adminService.findById(Long.parseLong(id));
            if(admin!=null){
                if(state.equals("1")){
                    //lock
                    admin.setDeleted(1);
                    adminService.update(admin);
                }else{
                    //unlock
                    admin.setDeleted(0);
                    adminService.update(admin);
                }
            }
        }

        return "redirect:/admin/list?pageNum="+pageNum;
    }


    @RequestMapping("/forwordToUpdatePassword")
    public String forwordToUpdatePassword(){
        return "admin/admin/updatePassword";
    }

    @RequestMapping("/validatePassword")
    @ResponseBody
    public ResultEntity validatePassword(HttpServletRequest request,String oldPassword){
        ResultEntity resultEntity = new ResultEntity();
        Admin admin = getCurrentAdmin(request.getSession());
        if(admin.getPassword().equals(ShiroMD5.getMd5WithSalt(oldPassword,admin.getSalt()))){
            resultEntity.setSuccessMsg("success");
        }
        return resultEntity;
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(HttpServletRequest request,String oldPassword,String newPassword){
        if(oldPassword!=null&&newPassword!=null){
            Admin admin = getCurrentAdmin(request.getSession());
            if(admin.getPassword().equals(ShiroMD5.getMd5WithSalt(oldPassword,admin.getSalt()))){
                admin.setPassword(ShiroMD5.getMd5WithSalt(newPassword,admin.getSalt()));
                adminService.update(admin);
                //修改session
                request.getSession().setAttribute("admin",admin);
            }
        }
        return "redirect:/admin/list";
    }
}
