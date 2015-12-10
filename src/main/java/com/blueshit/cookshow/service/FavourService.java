package com.blueshit.cookshow.service;

import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Favour;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/12/3.
 */
public interface FavourService extends DaoSupport<Favour> {

    Favour findByObjectIdAndTypeAndUserId(Long object,int type,Long userId);



}
