package com.blueshit.cookshow.service.impl;


import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.service.CookbookService;

import org.hibernate.Query;
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

    /**
     * 根据菜单名称查找
     * @param menuId
     * @param pageNum
     * @return
     */
    public Page findByMenuId(Long menuId,int pageNum,int pageSize){

        long totalRecord = (Long)getSession()
                .createQuery("select count(*) from  Cookbook c join c.menus m where m.id = ?")
                .setParameter(0, menuId).uniqueResult();

        Page page = new Page(pageSize,pageNum,(int)totalRecord);

        Query query = getSession()
                .createQuery("select c from Cookbook c join fetch  c.menus m where m.id = ?")
                .setParameter(0,menuId)
                .setFirstResult((pageNum -1)*pageSize)
                .setMaxResults(pageSize);

        page.setList(query.list());

        return page;
    }


    /**
     * 根据分类编码查询.
     * @param classificationCode
     * @param pugeNum
     * @param pageSize
     * @return
     */
    public Page findByClassification(String classificationCode,int pugeNum,int pageSize){

        QueryHelper queryHelper = new QueryHelper(Cookbook.class,"c")
                .addWhereCondition("c.classificationCode like ? ","%,"+classificationCode+",%")
                .addOrderByProperty("createDate",false);
        return getPage(pugeNum,pageSize,queryHelper);

    }


}
