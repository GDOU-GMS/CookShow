package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.UserService;
import com.blueshit.cookshow.web.basic.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserController extends BaseController {

    @RequestMapping("/list")
    public String list(Integer pageNum,Model model){
        pageNum = pageNum==null||pageNum==0?1:pageNum;

        QueryHelper queryHelper = new QueryHelper(User.class,"u").addOrderByProperty("createDate",true);

        Page page = userService.getPage(pageNum, queryHelper);

        model.addAttribute("page",page);
       
        return "admin/user/list";

    }


}
