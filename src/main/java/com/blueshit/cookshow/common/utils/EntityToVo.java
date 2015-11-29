package com.blueshit.cookshow.common.utils;

import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.vo.ClassificationVo;

/**
 * Created by Seven on 2015/11/29.
 */
public class EntityToVo {




    public static ClassificationVo classificationToVo(Classification classification){
        ClassificationVo classificationVo = new ClassificationVo();
        classificationVo.setId(classification.getId());
        classificationVo.setUpdateDate(classification.getUpdateDate());
        classificationVo.setCreateDate(classification.getCreateDate());
        classificationVo.setCode(classification.getCode());
        classificationVo.setDeleted(classification.getDeleted());
        classificationVo.setParentCode(classification.getParentCode());
        classificationVo.setName(classification.getName());
        return classificationVo;
    }

}
