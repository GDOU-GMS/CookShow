package com.blueshit.cookshow.web.basic;

import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    @Resource
    protected ProductionService productionService;
    @Resource
    protected FavourService favourService;


    public User getCurrentUser(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return null;
        }else{
            return userService.findByUsername(user.getUsername());
        }
    }


    public Admin getCurrentAdmin(HttpSession session){
        Admin admin = (Admin)session.getAttribute("admin");
        if(admin==null){
            return null;
        }else{
            return adminService.findByUsername(admin.getUsername());
        }
    }

    public String getDomainName(HttpServletRequest request){

        String http = "http://";

        String server = request.getServerName();

        int port = request.getServerPort();

        return http+server+":"+port;

    }

}
