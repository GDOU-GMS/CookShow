package com.blueshit.cookshow.service.impl;


import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.service.CookbookService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class CookbookServiceImpl extends DaoSupportImpl<Cookbook> implements CookbookService {


    /**
     * 根据用户id查询对应的cookBook
     * @param userId
     * @return
     */
    public Page findByUserId(Long userId,int pageNum) {
        QueryHelper queryHelper = new QueryHelper(Cookbook.class,"c");
        queryHelper.addWhereCondition("c.User.id = ?",userId)
                .addWhereCondition("c.deleted = 0")
                .addOrderByProperty("createDate",false);
        return getPage(pageNum,queryHelper);
    }


}
