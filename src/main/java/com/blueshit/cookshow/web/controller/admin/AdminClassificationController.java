package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.utils.CreateCode;
import com.blueshit.cookshow.common.utils.EntityToVo;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.listener.DataCacheListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/admin/classification")
public class AdminClassificationController extends BaseController {


    @RequestMapping("/list")
    public String list(Model model){

        //查询所有分类
        List<ClassificationVo> topClassificationVoList = classificationService.getAllClassification();

        model.addAttribute("topClassificationVoList",topClassificationVoList);


        return "admin/classification/list";
    }

    @RequestMapping("/add")
    public String add(String name,String parentCode){
        System.out.println(name+"==============="+parentCode);
        Classification classification = new Classification();
        classification.setCreateDate(new Date());
        classification.setUpdateDate(new Date());
        if(name!=null&&!name.trim().equals("")){
            if(parentCode==null||parentCode.trim().equals("")){
                //top分类
                classification.setName(name);
                classification.setCode(CreateCode.getTopCode(classificationService.getTopClassificationNum()));
            }else{
                //子分类
                //找出该父分类
                Classification c = classificationService.getByCode(parentCode);
                if(c!=null){
                    classification.setName(name);
                    if(c.getCode().trim().length()==2){
                        classification.setCode(CreateCode.getSecondeCode(classificationService.getSecondClassificationNum()));
                        classification.setParentCode(c.getCode());
                    }else if(c.getCode().trim().length()==3){
                        classification.setCode(CreateCode.getThirdCode(classificationService.getThirdClassificationNum()));
                        classification.setParentCode(c.getCode());
                    }
                }
            }
            classificationService.save(classification);
            //更新缓存
            updateClassificationCache();
        }
        return "redirect:/admin/classification/list";
    }


    @RequestMapping("/update")
    public String update(String classificationId,String name){
        if(classificationId!=null&&!"".equals(classificationId.trim())&&name!=null&&!"".equals(name.trim())){
            //找出数据库中的实体
            Classification c = classificationService.findById(Long.parseLong(classificationId));
            if(c!=null){
                c.setName(name);
                classificationService.update(c);
                //更新缓存
                updateClassificationCache();
            }
        }
        return "redirect:/admin/classification/list";
    }

    @RequestMapping("/disable")
    public String disable(String classificationId){
        if(classificationId!=null&&!"".equals(classificationId.trim())){
            //先找出原先的
            Classification c = classificationService.findById(Long.parseLong(classificationId));
            if(c!=null){
                //让其本身失效和所有子分类失效
                c.setDeleted(1);
                classificationService.update(c);
                classificationService.setAllChildrenDeleteState(c.getCode(),1);
                //更新缓存
                updateClassificationCache();
            }
        }
        return "redirect:/admin/classification/list";
    }

    @RequestMapping("/recover")
    public String recover(String classificationId){
        if(classificationId!=null&&!"".equals(classificationId.trim())){
            //先找出原先的
            Classification c = classificationService.findById(Long.parseLong(classificationId));
            if(c!=null){
                //让其本身失效和所有子分类失效
                c.setDeleted(0);
                classificationService.update(c);
                classificationService.setAllChildrenDeleteState(c.getCode(),0);
                //更新缓存
                updateClassificationCache();
            }
        }
        return "redirect:/admin/classification/list";
    }



    private void updateClassificationCache(){
        DataCacheListener.classificationList.clear();
        DataCacheListener.classificationList.addAll(classificationService.getAllClassification());
    }

}
