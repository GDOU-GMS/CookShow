package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @RequestMapping("/list")
    public String list(Model model,Integer pageNum){

        pageNum = (pageNum==null||pageNum==0)?1:pageNum;

        Page page = adminService.getPage(pageNum, new QueryHelper(Admin.class, "a"));

        model.addAttribute("page",page);

        return "admin/admin/list";
    }

}
