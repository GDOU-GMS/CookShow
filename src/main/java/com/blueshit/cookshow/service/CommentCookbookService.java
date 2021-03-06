package com.blueshit.cookshow.service;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.CommentCookbook;

/**
 * Created by Seven on 2015/11/26.
 */
public interface CommentCookbookService extends DaoSupport<CommentCookbook> {

    Page findByCookbookId(Long cookbookId,int pageNum,int pageSize);

}
