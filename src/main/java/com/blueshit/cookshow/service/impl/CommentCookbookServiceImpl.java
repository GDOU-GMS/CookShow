package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.CommentCookbook;
import com.blueshit.cookshow.service.CommentCookbookService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class CommentCookbookServiceImpl extends DaoSupportImpl<CommentCookbook> implements CommentCookbookService{

    public Page findByCookbookId(Long cookbookId,int pageNum,int pageSize){
        QueryHelper queryHelper = new QueryHelper(CommentCookbook.class,"c");
        queryHelper.addWhereCondition("c.Cookbook.id = ?",cookbookId)
                .addWhereCondition("c.deleted = 0")
                .addOrderByProperty("createDate",false);
        return getPage(pageNum,pageSize,queryHelper);
    }
}
