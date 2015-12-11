package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.model.entity.CommentProduction;
import com.blueshit.cookshow.model.entity.Production;
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
@RequestMapping("/commentProduction")
public class CommentProductionController extends BaseController {


    @RequestMapping("/publicComment")
    @ResponseBody
    public ResultEntity publishComment(HttpServletRequest request,Long productionId,String comment){
        ResultEntity resultEntity = new ResultEntity();
        if(productionId!=null&&comment!=null){
            //找出当前用户
            User user = getCurrentUser(request.getSession());
            //找出该cookbook
            Production production = productionService.findById(productionId);
            if(user!=null&&production!=null){
                CommentProduction commentProduction = new CommentProduction();
                commentProduction.setCreateDate(new Date());
                commentProduction.setUpdateDate(new Date());
                commentProduction.setUser(user);
                commentProduction.setContent(comment);
                commentProduction.setProduction(production);
                commentProduction.setUsername(user.getUsername());
                commentProductionService.save(commentProduction);
                resultEntity.setSuccessMsg("success");
            }
        }
        return resultEntity;
    }


}

