package com.blueshit.cookshow.web.controller.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.CookbookService;
import com.blueshit.cookshow.web.basic.BaseController;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	  /*
	   * 详细菜谱信息
	   */
	  @RequestMapping("/detail")	
      public String detail(String cookbookId,Model model){
   	 
   	    Cookbook cookbook=cookbookService.findById(Long.parseLong(cookbookId));
   		model.addAttribute("cookbook",cookbook);
   		return "admin/cookbook/detail";
		
	}
	
	  @RequestMapping("/query")
	  public String query(@ModelAttribute Cookbook cookbook,Model model,Integer pageNum) {
	     
		  pageNum = pageNum==null||pageNum==0?1:pageNum;
		  QueryHelper queryHelper=new QueryHelper(Cookbook.class, "c")
	   	  .addWhereCondition(cookbook.getTitle()!=null&&!"".equals(cookbook.getTitle()),"c.title like '%"+cookbook.getTitle()+"%'")
	   	  .addWhereCondition(cookbook.getClassificationCode()!=null&&!"".equals(cookbook.getClassificationCode()),"c.classificationCode like '%"+cookbook.getClassificationCode()+"%'")
	   	  .addOrderByProperty("createDate",true);
		   Page page = cookbookService.getPage(pageNum, queryHelper);
	      //Page page = cookbookService.getPage(pageNum, list);
		  model.addAttribute("page",page);
          return "admin/cookbook/list";
	   	  
	}
	  
	  @RequestMapping("/cookbookreport")
	  public String cookbookReport(Model model){
		  List<Cookbook> report=cookbookService.getReport();
	      Map<String, Object> map = new HashMap<String, Object>();
		  map.put("report", report);
		  List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();  
		  list.add(map);  
	      Gson gson = new GsonBuilder().create();
	      String result = gson.toJson(list);
		  return "admin/cookbook/cookbookreport";
	  }

}
