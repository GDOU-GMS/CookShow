package com.blueshit.cookshow.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {
   
	
	@RequestMapping("/getAllMenu")
	public String getAllMenu(Long[] ids,Model model)  throws Exception{
    	 List<Menu> menu=menuService.findByIds(ids);
         model.addAttribute("menuList", menu); 
         //System.out.println("menulist");
    	 return "/getAllMenu";
     }

    @RequestMapping("/myMenu")
    public String myMenu(){
        return "customer/menu/personwork";
    }

    @RequestMapping("/createMenu")
    public String createMenu(){
        return "customer/menu/createnewmenu";
    }

    @RequestMapping("/cookmenu")
    public String cookmenu(){
        return "customer/menu/cookmenu";
    }
}
