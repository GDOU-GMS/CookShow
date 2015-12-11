package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.CommentProduction;
import com.blueshit.cookshow.service.CommentProductionService;
import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/commentProduction")
public class AdminCommentProductionController extends BaseController {

    @RequestMapping("/list")
    public String list(Integer pageNum,Model model){
        pageNum = pageNum==null||pageNum<=0?1:pageNum;
        QueryHelper queryHelper = new QueryHelper(CommentProduction.class,"c");
        Page page = commentCookbookService.getPage(pageNum,queryHelper);
        model.addAttribute("page",page);
        return "admin/commentProduction/list";
    }

    @RequestMapping("/lock")
    public String lock(Integer pageNum,Long id,Integer state){
        if(id!=null&&state!=null){
            //找出该实体
            CommentProduction commentProduction = commentProductionService.findById(id);
            if(commentProduction!=null){
                if(state==1){
                    commentProduction.setDeleted(1);
                }else if(state==0){
                    commentProduction.setDeleted(0);
                }
                commentProductionService.update(commentProduction);
            }
        }
        return "redirect:/admin/commentProduction/list?pageNum="+pageNum;
    }






}
