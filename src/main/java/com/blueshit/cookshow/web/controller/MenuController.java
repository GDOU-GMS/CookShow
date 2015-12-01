package com.blueshit.cookshow.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {
   
     
	private int pageNum = 1;
	
	public Map<String, Object> jsonMap;
	
	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	
	
	@RequestMapping("/getAllMenu")
	public String getAllMenu(Long[] ids,HttpServletRequest request)  throws Exception{
    	 List<Menu> menu=menuService.findByIds(ids);
         request.setAttribute("menuList", menu);  
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
