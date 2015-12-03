package com.blueshit.cookshow.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.entity.Relation;
import com.blueshit.cookshow.model.vo.RelationVo;
import com.blueshit.cookshow.web.basic.BaseController;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/relation")
public class RelationController extends BaseController {
	
	
	@RequestMapping("/getAllrelation/{id}")
	public String getAllRelation(@PathVariable String id,Model model)  throws Exception{
    	 List<Relation> relation=(List<Relation>) relationService.getPersonRelations(Long.parseLong(id));
    	 model.addAttribute("relationList", relation);
    	 return "customer/user/myrelation";
     }

}
