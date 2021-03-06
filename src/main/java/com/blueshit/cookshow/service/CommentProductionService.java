package com.blueshit.cookshow.service;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.CommentProduction;

/**
 * Created by Seven on 2015/11/26.
 */
public interface CommentProductionService extends DaoSupport<CommentProduction> {


    Page findByProductionId(Long productionId,int pageNum,int pageSize);
}
