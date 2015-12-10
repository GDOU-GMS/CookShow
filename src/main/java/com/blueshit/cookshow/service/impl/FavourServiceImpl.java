package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Favour;
import com.blueshit.cookshow.service.FavourService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/12/3.
 */
@Service
@Transactional
public class FavourServiceImpl extends DaoSupportImpl<Favour> implements FavourService{


    public Favour findByObjectIdAndTypeAndUserId(Long objectId,int type,Long userId){
        return (Favour)getSession().createQuery("from Favour where objectId =? and type = ? and User.id = ?")
                .setParameter(0,objectId)
                .setParameter(1,type)
                .setParameter(2,userId)
                .uniqueResult();
    }


}
