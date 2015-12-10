package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.model.entity.Favour;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Seven on 2015/12/3.
 */
@Controller
@RequestMapping("/favour")
public class FavourController extends BaseController {


    @RequestMapping("/addToMyFavour")
    @ResponseBody
    public ResultEntity addToMyFavour(HttpServletRequest request,String objectId,Integer type){
        ResultEntity resultEntity = new ResultEntity();
        if(objectId!=null&&type!=null){
            //获取当前用户
            User user = getCurrentUser(request.getSession());
            //查询数据库是否存在
            Object object = favourService.findByObjectIdAndTypeAndUserId(Long.parseLong(objectId),type,user.getId());
            if(object==null){
                //保存
                Favour favour = new Favour();
                favour.setCreateDate(new Date());
                favour.setUpdateDate(new Date());
                favour.setObjectId(Long.parseLong(objectId));
                favour.setType(type);
                favour.setUser(user);
                favourService.save(favour);
                resultEntity.setSuccessMsg("success");
            }else {
                resultEntity.setFailureMsg("你已经点赞过了!");
            }
        }else{
            resultEntity.setFailureMsg("非法访问!");
        }
        return  resultEntity;
    }






}
