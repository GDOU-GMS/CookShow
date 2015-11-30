package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.common.utils.EntityToVo;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.service.ClassificationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class ClassificationServiceImpl extends DaoSupportImpl<Classification> implements ClassificationService {
    public int getTopClassificationNum() {
        long l = (Long)getSession().createQuery("select count(*) from Classification c where length(c.code)=2").uniqueResult();
        return (int)l;
    }

    public int getSecondClassificationNum() {
        long l = (Long)getSession().createQuery("select count(*) from Classification c where length(c.code)=3").uniqueResult();
        return (int)l;
    }

    public int getThirdClassificationNum() {
        long l = (Long)getSession().createQuery("select count(*) from Classification c where length(c.code)=4").uniqueResult();
        return (int)l;
    }

    public Classification getByCode(String code){
        return (Classification)getSession().createQuery("from Classification where code = ?")
                .setParameter(0,code)
                .uniqueResult();
    }

    /**
     * 获取所有的子分类
     * @param code
     * @return
     */
    public List<Classification> getAllChildrenClassification(String code) {

        List<Classification> allChildrenClassification = new ArrayList<Classification>();

        List<Classification> childrenClassification = getSession()
                                                        .createQuery("from Classification where parentCode = ?")
                                                        .setParameter(0,code)
                                                        .list();
        allChildrenClassification.addAll(childrenClassification);
        for(Classification classification:childrenClassification){
            List<Classification> list = getSession()
                    .createQuery("from Classification where parentCode = ?")
                    .setParameter(0,classification.getCode())
                    .list();
            allChildrenClassification.addAll(list);
        }
        return allChildrenClassification;


    }

    /**
     * 让所有的子分类失效
     * @param code
     */
    public void setAllChildrenDeleteState(String code,int deleted) {
        List<Classification> list = getAllChildrenClassification(code);
        for(Classification classification : list){
            classification.setDeleted(deleted);
            update(classification);
        }
    }


    /**
     * 获取所有的分类信息
     * @return
     */
    public List<ClassificationVo> getAllClassification() {

        List<Classification> classificationList = this.findAll();

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


        return topClassificationVoList;
    }


}
