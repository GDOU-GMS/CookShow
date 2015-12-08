package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


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
}
