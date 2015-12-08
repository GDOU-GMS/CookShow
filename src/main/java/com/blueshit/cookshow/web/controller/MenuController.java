package com.blueshit.cookshow.web.controller;

import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.service.MenuService;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {
   
	
    @RequestMapping("/createMenu")
    public String createMenu(){
        return "customer/menu/createnewmenu";
    }

    @RequestMapping("/menuDetail/{id}")
    public String menuDetail(@PathVariable String id){
        return "customer/menu/menuDetail";
    }

    @RequestMapping("/cookmenu")
    public String cookmenu(Integer pageNum,Model model){
        //查询所有分类信息
        List<ClassificationVo> topClassificationVoList = classificationService.getAllClassification();
        model.addAttribute("topClassificationVoList",topClassificationVoList);
        //查询所有菜谱
        pageNum = pageNum==null||pageNum==0?1:pageNum;
        QueryHelper queryHelper = new QueryHelper(Cookbook.class,"cb");
        Page page = cookbookService.getPage(pageNum, queryHelper);
        model.addAttribute("page",page);
        List<Menu> menuList=menuService.getRecentPopular();
        model.addAttribute("menuList", menuList);
        return "customer/menu/cookmenu";
    }
   

}
