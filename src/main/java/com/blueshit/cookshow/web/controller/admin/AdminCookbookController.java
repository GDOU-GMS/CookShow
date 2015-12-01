package com.blueshit.cookshow.web.controller.admin;

import java.util.List;

import com.blueshit.cookshow.model.entity.Cookbook;
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
	public String list(Model model){
		// TODO Auto-generated method stub
		List<Cookbook> cookbook=cookbookService.findAll();
		model.addAttribute("cookbooklist",cookbook);
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




}
