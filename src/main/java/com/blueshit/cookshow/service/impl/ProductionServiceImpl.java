package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Production;
import com.blueshit.cookshow.service.ProductionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/12/7.
 */
@Service
@Transactional
public class ProductionServiceImpl extends DaoSupportImpl<Production> implements ProductionService {

    /**
     * 根据用户id查找
     * @param userId
     * @param pageNum
     * @param pageSize
     * @return
     */
    public Page getProductionByUserId(Long userId, int pageNum, int pageSize) {
        QueryHelper queryHelper = new QueryHelper(Production.class,"p")
                .addWhereCondition("p.User.id = ?",userId)
                .addWhereCondition("deleted = 0")
                .addOrderByProperty("createDate",false);
        return getPage(pageNum,pageSize,queryHelper);
    }


    /**
     * 所有作品动态
     * @param pageNum
     * @param pageSize
     * @return
     */
    public Page getAllProduction(int pageNum,int pageSize){
        QueryHelper queryHelper = new QueryHelper(Production.class,"p")
                .addWhereCondition("deleted = 0")
                .addOrderByProperty("createDate",false);
        return getPage(pageNum,pageSize,queryHelper);
    }
}
