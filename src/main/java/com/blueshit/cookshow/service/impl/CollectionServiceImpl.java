package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Collection;
import com.blueshit.cookshow.qiniu.QiniuUpload;
import com.blueshit.cookshow.service.CollectionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class CollectionServiceImpl extends DaoSupportImpl<Collection> implements CollectionService {


    /**
     * 根据objecid查询
     * @param objectId
     * @param type
     * @return
     */
    public Collection findByObjectId(Long objectId, int type,Long userId) {
        return (Collection)getSession().createQuery("from Collection c where objectId = ? and type = ? and c.User.id = ?")
                .setParameter(0,objectId)
                .setParameter(1,type)
                .setParameter(2,userId)
                .uniqueResult();
    }

    /**
     * 删除收藏
     * @param objectId
     * @param type
     * @param userId
     */
    public void deleteCollection(Long objectId, int type, Long userId) {
        getSession().createQuery("delete from Collection c where objectId = ? and type = ? and c.User.id = ?")
                .setParameter(0,objectId)
                .setParameter(1, type)
                .setParameter(2, userId)
                .executeUpdate();
    }

    public Page findByUserId(Long userId,int type,int pageNum,int pageSize){
        QueryHelper queryHelper = new QueryHelper(Collection.class,"c");
        queryHelper.addWhereCondition("c.User.id = ?",userId)
                .addWhereCondition("c.type = ?",type)
                .addOrderByProperty("createDate",false);
        return getPage(pageNum,pageSize,queryHelper);
    }


}
