package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.model.entity.Collection;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.model.enums.CollectionEnum;
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
@RequestMapping("/collection")
public class CollectionController extends BaseController {


    /**
     * 添加到我的收藏.
     * @return
     */
    @RequestMapping("/addToMyCollection")
    public ResultEntity addToMyCollection(HttpServletRequest request,String objectId,String type){
        ResultEntity resultEntity = new ResultEntity();
        if(objectId !=null &&!"".equals(objectId) && type!=null && !"".equals(type)){
            addCollection(objectId,type,getCurrentUser(request.getSession()));
        }else{
            resultEntity.setFailureMsg("非法访问");
        }
        return resultEntity;
    }

    @RequestMapping("/checkCollection")
    @ResponseBody
    public ResultEntity checkCollection(HttpServletRequest request,String objectId,String type){
        ResultEntity resultEntity = new ResultEntity();
        User user = getCurrentUser(request.getSession());
        if(user==null){
            return resultEntity.setFailureMsg("未登录");
        }
        if(objectId!=null&&type!=null){
            Collection collection = collectionService.findByObjectId(Long.parseLong(objectId),Integer.parseInt(type),user.getId());
            if(collection!=null){
                resultEntity.setSuccessMsg("yes");
            }else{
                resultEntity.setSuccessMsg("no");
            }
        }else{
            resultEntity.setFailureMsg("非法访问！");
        }
        return resultEntity;
    }

    @RequestMapping("/doCollection")
    @ResponseBody
    public ResultEntity doCollection(HttpServletRequest request,String objectId,String type,String state){
        ResultEntity resultEntity = new ResultEntity();
        User user = getCurrentUser(request.getSession());
        if(objectId!=null&&type!=null&&state!=null){
            if(user!=null){
                if(Boolean.parseBoolean(state)){
                    //取消收藏
                    collectionService.deleteCollection(Long.parseLong(objectId),Integer.parseInt(type),user.getId());
                }else{
                    //收藏
                    addCollection(objectId,type,getCurrentUser(request.getSession()));
                }
                resultEntity.setSuccessMsg("success");
            }else{
                resultEntity.setFailureMsg("请先登录!");
            }
        }else{
            resultEntity.setFailureMsg("非法访问！");
        }

        return resultEntity;
    }


    /**
     * 添加收藏！
     * @param objectId
     * @param type
     * @param user
     */
    private void addCollection(String objectId,String type,User user){
        //判断objecId是否存在
        Object object = null;
        if(Integer.parseInt(type) == CollectionEnum.COOKBOOK.getCode()){
            object = cookbookService.findById(Long.parseLong(objectId));
        }else if(Integer.parseInt(type) ==CollectionEnum.MENU.getCode()){
            object = menuService.findById(Long.parseLong(objectId));
        }
        if(object!=null) {
            Collection collection = new Collection();
            collection.setUser(user);
            collection.setCreateDate(new Date());
            collection.setUpdateDate(new Date());
            collection.setObjectId(Long.parseLong(objectId));
            collection.setType(Integer.parseInt(type));
            collectionService.save(collection);
        }
    }
}
