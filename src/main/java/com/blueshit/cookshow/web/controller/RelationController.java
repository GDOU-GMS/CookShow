package com.blueshit.cookshow.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.border.EmptyBorder;

import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.entity.Relation;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.model.vo.RelationVo;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/relation")
public class RelationController extends BaseController {
	
	
	@RequestMapping("/getAllrelation/{id}")
	public String getAllRelation(@PathVariable String id,Model model)  throws Exception{
    	 List<Relation> relation=(List<Relation>) relationService.getPersonRelations(Long.parseLong(id));
    	 if(relation!=null){
    	 model.addAttribute("relationList", relation);
    	 }
    	 model.addAttribute("relationstr", "关注的好友");
    	 return "customer/user/myrelation";
     }
	
	@RequestMapping("/addFocusOnFriend/{followerid}/{byfollowerid}")
	@ResponseBody
	public ResultEntity addFocusOnFriend(@PathVariable String followerid,@PathVariable String byfollowerid ,Model model)throws Exception{
		ResultEntity resultEntity = new ResultEntity();
		User follower=userService.findById(Long.parseLong(followerid));
		User byFollower=userService.findById(Long.parseLong(byfollowerid));
		Relation relation=new Relation();
		relation.setFollower(follower);
		relation.setByFollower(byFollower);
		relation.setCreateDate(new Date());
		relation.setUpdateDate(new Date());
		relation.setReadState(0);
		relation.setDeleted(0);
		relationService.save(relation);
		resultEntity.setSuccessMsg("已关注");
		model.addAttribute("user", byFollower);
		model.addAttribute("userInfo", follower);
		return resultEntity; 
		
		
	}
	@RequestMapping("/deleteFocusOnFriend/{followerid}/{byfollowerid}")
	@ResponseBody
	public ResultEntity deleteFocusOnFriend(@PathVariable String followerid,@PathVariable String byfollowerid ,Model model)throws Exception{
	
		ResultEntity resultEntity = new ResultEntity();
		Relation relation=relationService.getFocusOnFriend(Long.parseLong(followerid), Long.parseLong(byfollowerid));
		relationService.delete(relation.getId());
		resultEntity.setSuccessMsg("关注");
	    return resultEntity;
	}
   
	
	@RequestMapping("/getBeRelation/{id}")
	public String getBeRelation(@PathVariable String id,Model model)  throws Exception{
    	 List<Relation> relation=(List<Relation>) relationService.getBeRelation(Long.parseLong(id));
    	 if(relation!=null){
    		 model.addAttribute("relationList", relation);
    	 }
    	 model.addAttribute("relationstr", "被以下好友关注");
    	 return "customer/user/myrelation";
     }
   
}
