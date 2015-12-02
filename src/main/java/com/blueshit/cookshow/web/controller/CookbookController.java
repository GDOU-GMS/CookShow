package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.common.helper.entity.Material;
import com.blueshit.cookshow.common.helper.entity.Step;
import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.qiniu.QiniuUpload;
import com.blueshit.cookshow.web.basic.BaseController;

import com.blueshit.cookshow.web.controller.listener.DataCacheListener;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/cookbook")
public class CookbookController extends BaseController {

    @RequestMapping("/createCookbook")
    public String createCookbook(Model model){

        model.addAttribute("topClassificationList", DataCacheListener.classificationList);


        return "customer/cookbook/createcookbook";
    }


	@RequestMapping("/addCookbook")
	public String addCookbook(String title,
                              String intro,
                              String classifications,
                              @RequestParam("titleImg")CommonsMultipartFile titleImg,
                              String[] material_kind,
                              String[] material_num,
                              String[]  step_intro,
                              @RequestParam("step_image")ArrayList<CommonsMultipartFile>  step_image,
                              HttpServletRequest request){

        ObjectMapper objectMapper = new ObjectMapper();
        //获取当前用户
        User user = getCurrentUser(request.getSession());
        try {
            //校验
            //todo

            //新建cookbook
            Cookbook cookbook = new Cookbook();
            //设置一般属性
            cookbook.setTitle(title);
            cookbook.setIntro(intro);
            cookbook.setCreateDate(new Date());
            cookbook.setUpdateDate(new Date());
            //处理分类
            cookbook.setClassificationCode(classifications);
            //设置用户
            cookbook.setUser(user);
            //图片上传
            //1.封面图片
            String titleImage = QiniuUpload.upload(titleImg, MyDataUtils.DateToString(new Date(), "yyyyMMddHHmmSS"));
            cookbook.setTitleImage(titleImage);
            //2.步骤图片
            List<Step> stepList = new ArrayList<Step>();
            for (int i = 0; i < step_image.size(); i++) {
                Step step = new Step();
                String url = QiniuUpload.upload(step_image.get(i));
                step.setIntro(step_intro[i]);
                step.setImage(url);
                stepList.add(step);
            }
            cookbook.setStep(objectMapper.writeValueAsString(stepList));
            //封装材料属性
            List<Material> materials = new ArrayList<Material>();
            for (int i = 0; i < material_kind.length; i++) {
                Material material = new Material();
                material.setKind(material_kind[i]);
                material.setNum(material_num[i]);
                materials.add(material);
            }
            cookbook.setMaterial(objectMapper.writeValueAsString(materials));
            //保存
            cookbookService.save(cookbook);
        }catch (Exception e){
            e.printStackTrace();
        }
        //重定向到个人中心
		return "redirect:/user/personWork/"+ user.getId();
    }
	
	@RequestMapping("/deleteCookbook")
	public String deleteCookbook(@ModelAttribute Cookbook cookbook){
		
		cookbookService.save(cookbook);
		
		return "customer/cookbook/";
	}
	
	@RequestMapping("/modifyCookbook")
	public String modifyCookbook(@ModelAttribute Cookbook cookbook){
		
		
		
		cookbookService.save(cookbook);
		
		return "customer/cookbook/";
	}
}
	
