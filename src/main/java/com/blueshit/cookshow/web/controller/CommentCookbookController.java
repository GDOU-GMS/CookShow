package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.model.entity.CommentCookbook;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/commentCookbook")
public class CommentCookbookController extends BaseController {


    @RequestMapping("/publicComment")
    @ResponseBody
    public ResultEntity publishComment(HttpServletRequest request,Long cookbookId,String comment){
        ResultEntity resultEntity = new ResultEntity();
        if(cookbookId!=null&&comment!=null){
            //找出当前用户
            User user = getCurrentUser(request.getSession());
            //找出该cookbook
            Cookbook cookbook = cookbookService.findById(cookbookId);
            if(user!=null&&cookbook!=null){
                CommentCookbook commentCookbook = new CommentCookbook();
                commentCookbook.setCreateDate(new Date());
                commentCookbook.setUpdateDate(new Date());
                commentCookbook.setUser(user);
                commentCookbook.setContent(comment);
                commentCookbook.setCookbook(cookbook);
                commentCookbook.setUsername(user.getUsername());
                commentCookbookService.save(commentCookbook);
                resultEntity.setSuccessMsg("success");
            }
        }
        return resultEntity;
    }
}
