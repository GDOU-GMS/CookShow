package com.blueshit.cookshow.service;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Collection;

/**
 * Created by Seven on 2015/11/26.
 */
public interface CollectionService extends DaoSupport<Collection> {


    public Collection findByObjectId(Long objectId,int type,Long userId);

    public void deleteCollection(Long objectId,int type,Long userId);

    public Page findByUserId(Long userId,int type,int pageNum,int pageSize);


}
