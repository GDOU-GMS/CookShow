package com.blueshit.cookshow.web.controller.admin;

import java.util.List;

import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController extends BaseController {

	
	
	/*
	 * 列出最近流行菜谱
	 */
	@RequestMapping("/recentmenu")
   public String list(Model model){
	 List<Menu> recentmenu=menuService.getRecentPopular();
	 model.addAttribute("recentmenu",recentmenu);
	 return "admin/menu/recentmenu";
  }

}
