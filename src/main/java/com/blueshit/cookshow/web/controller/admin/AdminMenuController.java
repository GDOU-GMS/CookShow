package com.blueshit.cookshow.web.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController extends BaseController {

	
	/*
	 * 列出菜单
	 */
	@RequestMapping("/list")
	public String list(Integer pageNum,Model model){
		// TODO Auto-generated method stub
        pageNum = pageNum==null||pageNum==0?1:pageNum;
        QueryHelper queryHelper = new QueryHelper(Menu.class,"m").addOrderByProperty("createDate",true);
        Page page = menuService.getPage(pageNum, queryHelper);
		model.addAttribute("page",page);
		return "admin/menu/list";
	}
	
	/*
	 * 锁定菜单
	 */
	@RequestMapping("/disable")
	public String disable(String menuId){
         
      Menu menu=menuService.findById(Long.parseLong(menuId));
      menu.setDeleted(1);
	  menuService.update(menu);
	  
	  return "redirect:list";
	}
	
	/*
	 * 解锁菜单
	 */
	@RequestMapping("/enable")
	public String enable(String menuId){
         
      Menu menu=menuService.findById(Long.parseLong(menuId));
      menu.setDeleted(0);
	  menuService.update(menu);
	  
	  return "redirect:list";
	}
	
	/*
	 * 获取详细信息
	 */
	@RequestMapping("/detail")
	public String detail(String menuId,Model model){
		
   	    Menu menu=menuService.findById(Long.parseLong(menuId));
   	    //menuList.addAll(menu.setCookbooks(menu.getCookbooks()));
   	    Set<Cookbook> menu1=menu.getCookbooks();
   	   // menuService.save(menu1);
		model.addAttribute("list",menu1);
		
		return "admin/menu/detail";
	}

	/*
	 * 模糊查询
	 */
	  @RequestMapping("/query")
	  public String query(@ModelAttribute Menu menu,Model model,Integer pageNum) {
	     
		  pageNum = pageNum==null||pageNum==0?1:pageNum;
		  QueryHelper queryHelper=new QueryHelper(Menu.class, "m")
	   	  .addWhereCondition(menu.getName()!=null&&!"".equals(menu.getName()),"m.name like '%"+menu.getName()+"%'")
	   	  .addOrderByProperty("createDate",true);
		   Page page = menuService.getPage(pageNum, queryHelper);
		  model.addAttribute("page",page);
          return "admin/menu/list";
	   	  
	}
}
