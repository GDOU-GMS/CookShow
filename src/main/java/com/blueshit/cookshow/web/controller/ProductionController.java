package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Production;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.qiniu.QiniuUpload;
import com.blueshit.cookshow.web.basic.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/12/7.
 */
@Controller
@RequestMapping("/production")
public class ProductionController extends BaseController {

    @RequestMapping("/productionIndex")
    public String productionIndex(Integer pageNum,Model model){
        int pageSize = 10;
        pageNum = pageNum==null||pageNum<=0?1:pageNum;

        //查处最所有的作品动态
        Page page = productionService.getAllProduction(pageNum,pageSize);
        model.addAttribute("page",page);
        return "customer/product/workdynamic";
    }

    @RequestMapping("/forwardToCreateProduction")
    public String forwardToCreateProduction(String cookbookId,Model model,HttpServletRequest request){
        if(cookbookId==null||"".equals(cookbookId)){
            return "redirect:"+request.getRequestURI();
        }
        model.addAttribute("cookbookId",cookbookId);

        return "customer/product/createProduction";
    }


    @RequestMapping("/createProduction")
    public String createProduction(HttpServletRequest request,String cookbookId,@RequestParam MultipartFile titleImg,String intro){
        User user = getCurrentUser(request.getSession());
        if(cookbookId!=null&&titleImg!=null&&intro!=null){
            //找出cookbook
            Cookbook cookbook = cookbookService.findById(Long.parseLong(cookbookId));
            if (cookbook != null) {
                Production production = new Production();
                //基本属性
                production.setCreateDate(new Date());
                production.setUpdateDate(new Date());
                production.setTitle(cookbook.getTitle());
                production.setIntro(intro);
                production.setCookbookId(cookbook.getId());
                production.setCookbookTitle(cookbook.getTitle());
                production.setUser(user);
                //图片
                String url = QiniuUpload.upload(titleImg);
                production.setTitleImage(url);
                //保存
                productionService.save(production);
            }
        }else{
            return "redirect:/";
        }
       return "redirect:/user/personWork/"+user.getId()+"?target=production";
    }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable String id,Model model,String productionId,Integer pageNum){
        pageNum = pageNum==null||pageNum<=0?1:pageNum;
        int pageSize = 10;
        Production production = productionService.findById(Long.parseLong(id));
        model.addAttribute("production",production);
        //评论
        Page page = commentProductionService.findByProductionId(production.getId(), pageNum, pageSize);
        model.addAttribute("page",page);
        //该用户其他作品
        List<Production> productionList = productionService.getProductionByUserId(production.getUser().getId());
        model.addAttribute("productionList",productionList);

        return "customer/product/productionDetail";
    }

    @RequestMapping("/forwardToModify")
    public String forwardToModify(String productionId,Model model){
        if(productionId!=null&&!"".equals(productionId)){
            Production production = productionService.findById(Long.parseLong(productionId));
            if(production!=null){
                model.addAttribute("production",production);
                return "customer/product/modifyProduction";
            }
        }
        return "redirect:/";
    }


    @RequestMapping("/modifyProduction")
    public String modifyProduction(HttpServletRequest request,String id,@RequestParam MultipartFile titleImg,String intro){
        if(id!=null&&titleImg!=null&&intro!=null){
            //找出原来Production
            Production production = productionService.findById(Long.parseLong(id));
            if(production!=null){
                production.setIntro(intro);
                //上传图片
                String url = QiniuUpload.upload(titleImg);
                production.setTitleImage(url);
                productionService.update(production);
                return "redirect:/user/personWork/"+getCurrentUser(request.getSession()).getId()+"?target=production";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/disableProduction")
    public String disableProduction(String productionId,HttpServletRequest request){

        productionService.disable(Long.parseLong(productionId));

        return "redirect:/user/personWork/"+getCurrentUser(request.getSession()).getId()+"?target=production";
    }




}
