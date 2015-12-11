package com.blueshit.cookshow.web.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	/*
	 * 模糊查询菜谱信息
	 */
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
	  /*
	   * 获取月度上传菜谱数量
	   */
	  @RequestMapping("/cookbookreport")
	  @ResponseBody  //自动返回json格式数据到前台
	  public String cookbookReport(Model model,HttpServletResponse response){
		  List list=cookbookService.getReport();
	      Gson gson = new GsonBuilder().create();
	      String result = gson.toJson(list);
		  return "admin/cookbook/cookbookreport";
	  }

    @RequestMapping("/setIsHeadLine")
    public String setIsHeadLine(String cookbookId,Integer pageNum){
        //找出该菜谱
        Cookbook cookbook = cookbookService.findById(Long.parseLong(cookbookId));
        //更新属性
        cookbook.setIsHeadline(true);
        cookbookService.update(cookbook);
        return "redirect:/admin/cookbook/list?pageNum = "+pageNum;
    }
    @RequestMapping("/cancelHeadLine")
    public String cancelHeadLine(String cookbookId,Integer pageNum){
        //找出该菜谱
        Cookbook cookbook = cookbookService.findById(Long.parseLong(cookbookId));
        //更新属性
        cookbook.setIsHeadline(false);
        cookbookService.update(cookbook);
        return "redirect:/admin/cookbook/list?pageNum = "+pageNum;
    }


    @RequestMapping("/getCookbookChartData")
    @ResponseBody
    public ResultEntity getCookbookChartData(){
        ResultEntity resultEntity = new ResultEntity();
        List<Object[]> list = new ArrayList<Object[]>();
        //菜谱
        List<Object[]> cookbookList = cookbookService.getCookbookChartData(MyDataUtils.getLastYearMonth());
        //作品
        List<Object[]> productionList = productionService.getProductionChartData(MyDataUtils.getLastYearMonth());
        //所有数据合并到一个
        list.add(cookbookList.get(0));
        list.add(cookbookList.get(1));
        list.add(productionList.get(0));
        list.add(productionList.get(1));
        resultEntity.setData(list);
        resultEntity.setSuccessMsg("success");
        return resultEntity;
    }



}
