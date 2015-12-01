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





}
