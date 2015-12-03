package com.blueshit.cookshow.service;

import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.vo.ClassificationVo;

import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
public interface ClassificationService extends DaoSupport<Classification> {

    int getTopClassificationNum();

    int getSecondClassificationNum();

    int getThirdClassificationNum();

    Classification getByCode(String code);

    List<Classification> getAllChildrenClassification(String code);

    void setAllChildrenDeleteState(String code,int deleted);

    List<ClassificationVo> getAllClassification();

    List<Classification> findByCodes(String[] codes);

}
