package com.blueshit.cookshow.web.controller.admin;

import com.blueshit.cookshow.common.utils.CreateCode;
import com.blueshit.cookshow.common.utils.EntityToVo;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.web.basic.BaseController;
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

        List<Classification> classificationList = classificationService.findAll();

        List<ClassificationVo> topClassificationVoList = new ArrayList<ClassificationVo>();
        List<ClassificationVo> secondClassificationVoList = new ArrayList<ClassificationVo>();
        List<ClassificationVo> thirdClassificationVoList = new ArrayList<ClassificationVo>();

        for(Classification classification:classificationList){
            //一级
            if(classification.getParentCode()==null){
                topClassificationVoList.add(EntityToVo.classificationToVo(classification));
            }else if(classification.getCode().trim().length()==3){
            //二级
                secondClassificationVoList.add(EntityToVo.classificationToVo(classification));
            }else if(classification.getCode().trim().length()==4){
            //三级
                thirdClassificationVoList.add(EntityToVo.classificationToVo(classification));
            }
        }

        for(ClassificationVo secondClassificationVo:secondClassificationVoList){
            for (ClassificationVo thirdClassificationVo : thirdClassificationVoList){
                if(thirdClassificationVo.getParentCode().equals(secondClassificationVo.getCode())){
                    secondClassificationVo.getList().add(thirdClassificationVo);
                }
            }
        }

        for(ClassificationVo topClassificationVo:topClassificationVoList){
            for (ClassificationVo secondClassificationVo : secondClassificationVoList){
                if(secondClassificationVo.getParentCode().equals(topClassificationVo.getCode())){
                    topClassificationVo.getList().add(secondClassificationVo);
                }
            }
        }

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
        }
        return "redirect:/admin/classification/list";
    }


    public String update(){
        return null;
    }


}
