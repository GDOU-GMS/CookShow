package com.blueshit.cookshow.web.controller.common;

import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Seven on 2015/11/27.
 */
@Controller
public class IndexController extends BaseController{

    @RequestMapping("/")
    public String index(Model model){

        //查询所有分类信息
        List<ClassificationVo> topClassificationVoList = classificationService.getAllClassification();
        model.addAttribute("topClassificationVoList",topClassificationVoList);
        return "customer/index";

    }

    @RequestMapping("/login")
    public String login(){
        return "customer/login";
    }



}
