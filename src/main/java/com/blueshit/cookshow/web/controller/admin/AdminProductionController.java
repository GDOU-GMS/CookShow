package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.model.entity.Production;
import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/12/9.
 */
@Controller
@RequestMapping("/admin/production")
public class AdminProductionController extends BaseController {


    @RequestMapping("/list")
    public String list(Integer pageNum,Model model){
        pageNum = pageNum==null||pageNum<=0?1:pageNum;
        QueryHelper queryHelper = new QueryHelper(Production.class,"p");
        Page page = productionService.getPage(pageNum,queryHelper);
        model.addAttribute("page",page);
        return "admin/production/list";
    }



    @RequestMapping("/lock")
    public String lock(String id,String state,int pageNum){
        if(id!=null&&state!=null){
            Production production = productionService.findById(Long.parseLong(id));
            if(production!=null){
                if(state.equals("1")){
                    //lock
                    production.setDeleted(1);
                    productionService.update(production);
                }else{
                    //unlock
                    production.setDeleted(0);
                    productionService.update(production);
                }
            }
        }
        return "redirect:/admin/production/list?pageNum="+pageNum;
    }



    @RequestMapping("/query")
    public String query(String keyword,Model model){

        Page page = productionService.getQueryProduction(keyword);

        model.addAttribute("page",page);

        return "admin/production/list";
    }


}
