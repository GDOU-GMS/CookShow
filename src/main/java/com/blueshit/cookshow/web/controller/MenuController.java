package com.blueshit.cookshow.web.controller;

import java.util.Date;
import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.service.MenuService;
import com.blueshit.cookshow.web.basic.BaseController;

import com.blueshit.cookshow.web.controller.common.ResultEntity;
import com.blueshit.cookshow.web.controller.listener.DataCacheListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping("/addMenu")
    public String addMenu(HttpServletRequest request,@ModelAttribute Menu menu){
        if(menu.getName()!=null){
            menu.setCreateDate(new Date());
            menu.setUpdateDate(new Date());
            menu.setUser(getCurrentUser(request.getSession()));
            menuService.save(menu);
        }
        //返回个人中心
        return "redirect:/user/personWork/"+getCurrentUser(request.getSession()).getId()+"?target=mymenu";
    }

    @RequestMapping("/menuDetail/{id}")
    public String menuDetail(@PathVariable String id,Model model,Integer pageNum){

        pageNum = pageNum==null||pageNum<=0?1:pageNum;

        Menu menu = menuService.findById(Long.parseLong(id));
        if(menu!=null){
            model.addAttribute("menu",menu);
            //查处该菜单的所有菜谱，分页
            int pageSize = 10;
            Page cookbookPage = cookbookService.findByMenuId(menu.getId(),pageNum,pageSize);
            model.addAttribute("cookbookPage",cookbookPage);
        }

        return "customer/menu/menuDetail";
    }

    @RequestMapping("/cookmenu")
    public String cookmenu(Integer pageNum,Model model){
        //查询所有分类信息
        model.addAttribute("topClassificationVoList", DataCacheListener.classificationList);
        //查询所有菜谱
        pageNum = pageNum==null||pageNum==0?1:pageNum;
        QueryHelper queryHelper = new QueryHelper(Cookbook.class,"cb");
        Page page = cookbookService.getPage(pageNum, queryHelper);
        model.addAttribute("page",page);
        List<Menu> menuList=menuService.getRecentPopular();
        model.addAttribute("menuList", menuList);
        return "customer/menu/cookmenu";
    }

    @RequestMapping("/addCookbook")
    @ResponseBody
    public ResultEntity addCookbook(String menuId,String cookbookId){
        ResultEntity resultEntity = new ResultEntity();
        if(menuId!=null&&!menuId.equals("")&&cookbookId!=null&&!cookbookId.equals("")){
            //找出cookbook
            Cookbook cookbook = cookbookService.findById(Long.parseLong(cookbookId));
            if(cookbook!=null){
                //找出menu
                Menu menu = menuService.findById(Long.parseLong(menuId));
                if(menu!=null){
                    //如果不存在
                    if(!menuService.cookBookExistInMenu(cookbook.getId(),menu.getId())){
                        menuService.addCookbook(menu.getId(),cookbook.getId());
                        return resultEntity.setSuccessMsg("保存成功");
                    }else{
                        return resultEntity.setFailureMsg("该菜谱已经存在您选中的菜单了");
                    }
                }
            }
        }

        return resultEntity.setFailureMsg("非法访问！");
    }
   

}
