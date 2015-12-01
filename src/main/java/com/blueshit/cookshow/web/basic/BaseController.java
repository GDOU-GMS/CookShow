package com.blueshit.cookshow.web.basic;

import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Seven on 2015/11/26.
 */
public class BaseController {

    @Resource
    protected AdminService adminService;
    @Resource
    protected ClassificationService classificationService;
    @Resource
    protected CollectionService collectionService;
    @Resource
    protected CommentCookbookService commentCookbookService;
    @Resource
    protected CommentProductionService commentProductionService;
    @Resource
    protected CookbookService cookbookService;
    @Resource
    protected MenuService menuService;
    @Resource
    protected RelationService relationService;
    @Resource
    protected UserService userService;


    public User getCurrentUser(HttpSession httpSession){
        User user = (User)httpSession.getAttribute("user");
        return userService.findByUsername(user.getUsername());
    }


    public Admin getCurrentAdmin(){
        //todo:
        return null;
    }


}
