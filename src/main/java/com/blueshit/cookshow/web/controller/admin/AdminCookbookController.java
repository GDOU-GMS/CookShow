package com.blueshit.cookshow.web.controller.admin;

import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/cookbook")
public class AdminCookbookController extends BaseController {

	
	/*
	 * 列出所有菜谱信息
	 */
	@RequestMapping("/list")
	public String list(Integer pageNum,Model model){
		// TODO Auto-generated method stub
        pageNum = pageNum==null||pageNum==0?1:pageNum;
        QueryHelper queryHelper = new QueryHelper(Cookbook.class,"c").addOrderByProperty("createDate",true);
        Page page = cookbookService.getPage(pageNum, queryHelper);
		model.addAttribute("page",page);
		return "admin/cookbook/list";
	}
	
	/*
	 * 锁定菜谱
	 */
	@RequestMapping("/disable")
	public String disable(String cookbookId){
         
      Cookbook cookbook=cookbookService.findById(Long.parseLong(cookbookId));
      cookbook.setDeleted(1);
	  cookbookService.update(cookbook);
	  
	  return "redirect:list";
	}

	
	/*
	 * 解锁菜谱
	 */
	@RequestMapping("/enable")
	public String enable(String cookbookId){
		
		Cookbook cookbook=cookbookService.findById(Long.parseLong(cookbookId));
		
		cookbook.setDeleted(0);
	    cookbookService.update(cookbook);
		  
		return "redirect:list";
		
	
     }
	
	  @RequestMapping("/detail")	
      public String detail(String cookbookId,Model model){
   	 
   	   Cookbook cookbook=cookbookService.findById(Long.parseLong(cookbookId));
   		model.addAttribute("cookbook",cookbook);
   		return "admin/menu/detail";
		
	}




}
