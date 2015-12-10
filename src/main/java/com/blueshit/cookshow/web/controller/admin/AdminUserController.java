package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.UserService;
import com.blueshit.cookshow.web.basic.BaseController;

import com.blueshit.cookshow.web.controller.common.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserController extends BaseController {

    @RequestMapping("/list")
    public String list(Integer pageNum,Model model){
        pageNum = pageNum==null||pageNum==0?1:pageNum;

        QueryHelper queryHelper = new QueryHelper(User.class,"u").addOrderByProperty("createDate",true);

        Page page = userService.getPage(pageNum, queryHelper);

        model.addAttribute("page",page);
       
        return "admin/user/list";

    }
    
    
	/*
	 * 锁定菜谱
	 */
	@RequestMapping("/disable")
	public String disable(String userId){
         
      User user=userService.findById(Long.parseLong(userId));
      user.setDeleted(1);
      userService.update(user);
	  
	  return "redirect:list";
	}

	
	/*
	 * 解锁菜谱
	 */
	@RequestMapping("/enable")
	public String enable(String userId){
		
		User user=userService.findById(Long.parseLong(userId));
		
		user.setDeleted(0);
		userService.update(user);
		  
		return "redirect:list";
		
	
     }
	
     @RequestMapping("/query")
     public String query(@ModelAttribute User user,Integer pageNum,Model model){
    	 pageNum = pageNum==null||pageNum==0?1:pageNum;
		  QueryHelper queryHelper=new QueryHelper(User.class, "u")
	   	  .addWhereCondition(user.getUsername()!=null&&!"".equals(user.getUsername()),"u.username like '%"+user.getUsername()+"%'")
	   	  .addWhereCondition(user.getRealName()!=null&&!"".equals(user.getRealName()),"u.realName like '%"+user.getRealName()+"%'")
	   	  .addOrderByProperty("createDate",true);
		   Page page = userService.getPage(pageNum, queryHelper);
	      //Page page = cookbookService.getPage(pageNum, list);
		  model.addAttribute("page",page);
		  return "admin/user/list";
    	 
     }


    @RequestMapping("/getUserChartData")
    @ResponseBody
    public ResultEntity getUserChartData(){
        ResultEntity resultEntity = new ResultEntity();
        List<Object[]> list = userService.getLastWeekUserDate(getLastWeakDate());
        resultEntity.setData(list);
        resultEntity.setSuccessMsg("success");
        return resultEntity;
    }


    private Date[] getLastWeakDate(){
        Calendar calendar = Calendar.getInstance();
        Date[] dates = new Date[7];
        calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE)-7);
        for(int i=0;i<7;i++){
            calendar.add(Calendar.DATE,1);
            dates[i] = MyDataUtils.StringToDate(MyDataUtils.DateToString(calendar.getTime(),"yyyy-MM-dd"),"yyyy-MM-dd");
        }
        return dates;
    }

}
