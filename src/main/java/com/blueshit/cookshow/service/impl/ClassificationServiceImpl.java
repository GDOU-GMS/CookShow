package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.service.ClassificationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
