package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.helper.entity.Material;
import com.blueshit.cookshow.common.helper.entity.Step;
import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.qiniu.QiniuUpload;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.listener.DataCacheListener;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
            String titleImage = QiniuUpload.upload(titleImg);
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

    @RequestMapping("/cookbook/{cookbookId}")
    public String cookbook(@PathVariable String cookbookId,Model model,HttpSession session){
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            if (!"".equals(cookbookId)) {
                Cookbook cookbook = cookbookService.findById(Long.parseLong(cookbookId));
                //用料
                List<Material> materialList = objectMapper.readValue(cookbook.getMaterial(), new TypeReference<List<Material>>() {});
                //做法
                List<Step> stepList = objectMapper.readValue(cookbook.getStep(), new TypeReference<List<Step>>(){});
                model.addAttribute("materialList",materialList);
                model.addAttribute("stepList",stepList);
                model.addAttribute("cookbook", cookbook);
            }
            if(getCurrentUser(session)!=null){
                List<Menu> menuList = menuService.getAllMenuByUserId(getCurrentUser(session).getId());
                model.addAttribute("menuList", menuList);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return "customer/cookbook/cookbook";
    }
	
	@RequestMapping("/deleteCookbook")
	public String deleteCookbook(HttpSession session,@RequestParam String id){
        User user = getCurrentUser(session);
        cookbookService.disable(Long.parseLong(id));
        //重定向到个人中心
        return "redirect:/user/personWork/"+ user.getId()+"?target=pwd";
	}

    @RequestMapping("/forwardModifyCookbook")
    public String forwardUpdateCookbook(@RequestParam String id,Model model){
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            Cookbook cookbook = cookbookService.findById(Long.parseLong(id));
            //用料
            List<Material> materialList = objectMapper.readValue(cookbook.getMaterial(), new TypeReference<List<Material>>() {});
            //做法
            List<Step> stepList = objectMapper.readValue(cookbook.getStep(), new TypeReference<List<Step>>() {});
            model.addAttribute("materialList", materialList);
            model.addAttribute("stepList", stepList);
            model.addAttribute("cookbook", cookbook);
            //分类
            model.addAttribute("topClassificationList", DataCacheListener.classificationList);
            //分类回显
            StringBuffer classificationBuffer = new StringBuffer();
            String[] classificationCodeStr = cookbook.getClassificationCode().split(",");
            List<Classification> classificationList = classificationService.findByCodes(classificationCodeStr);
            for(Classification classification : classificationList){
                classificationBuffer.append(classification.getName()+",");
            }
            model.addAttribute("classifications",classificationBuffer.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        return "customer/cookbook/modifyCookbook";
    }

	@RequestMapping("/modifyCookbook")
	public String modifyCookbook(String id,
                                 String title,
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

            //找出旧的数据
            Cookbook cookbook = cookbookService.findById(Long.parseLong(id));
            //设置一般属性
            cookbook.setTitle(title);
            cookbook.setIntro(intro);
            cookbook.setUpdateDate(new Date());
            //处理分类
            cookbook.setClassificationCode(classifications);
            //设置用户
            cookbook.setUser(user);
            //图片上传
            //1.封面图片
            String titleImage = QiniuUpload.upload(titleImg);
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
            cookbookService.update(cookbook);
        }catch (Exception e){
            e.printStackTrace();
        }
        //重定向到个人中心
        return "redirect:/user/personWork/"+ user.getId()+"?target=pwd";
	}


    @RequestMapping("/findByClassificationCode/{classificationCode}")
    public String findByClassificationCode(@PathVariable String classificationCode,Integer pageNum,Model model){
        pageNum = pageNum==null||pageNum==0?1:pageNum;
        int pageSize = 20;
        if(classificationCode!=null&&!"".equals(classificationCode)){
            Page page = cookbookService.findByClassification(classificationCode,pageNum,pageSize);
            model.addAttribute("page",page);
            //查询所有分类信息
            model.addAttribute("topClassificationVoList",DataCacheListener.classificationList);
            //相关菜谱
            List<Menu> menuList=menuService.getRecentPopular();
            model.addAttribute("menuList", menuList);
        }
        return "customer/menu/cookmenu";
    }
    @RequestMapping("/findByTitle")
    public String findByTitle(@ModelAttribute Cookbook cookbook,Integer pageNum,Model model){
    	 
    	 List<ClassificationVo> topClassificationVoList = classificationService.getAllClassification();
         model.addAttribute("topClassificationVoList",topClassificationVoList);
    	 pageNum = pageNum==null||pageNum==0?1:pageNum;
         int pageSize = 10;
         if(cookbook.getTitle()==null){
        	 cookbook.setTitle("");
         }
         Page page = cookbookService.findByTitle(cookbook.getTitle(), pageNum, pageSize);
         model.addAttribute("page",page);
         List<Menu> menuList=menuService.getRecentPopular();
         model.addAttribute("menuList", menuList);
         model.addAttribute("title",cookbook.getTitle());
         return "customer/menu/cookbooksearch";
    }
      
   


}
	
