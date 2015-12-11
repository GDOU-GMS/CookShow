package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Production;
import com.blueshit.cookshow.service.ProductionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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


    public Page getQueryProduction(String keyword){
        long count = (Long)getSession().createQuery("select count(*) from Production p where p.title like ?")
                .setParameter(0,"%"+keyword+"%")
                .uniqueResult();

        QueryHelper queryHelper = new QueryHelper(Production.class,"p")
                    .addWhereCondition("p.title like ?","%"+keyword+"%");
        return getPage(1,(int)count,queryHelper);
    }



    public List<Object[]> getProductionChartData(Date[] dates){
        List<Object[]> list = new ArrayList<Object[]>();

        Long[] counts = new Long[dates.length];
        String[] dateStrs = new String[dates.length];

        for(int i=0;i<dates.length;i++){

            Long l = (Long)getSession().createQuery("select  count(*) from Production where createDate < ? and createDate>?")
                    .setParameter(0, MyDataUtils.getNextMonth(dates[i]))
                    .setParameter(1,dates[i])
                    .uniqueResult();
            counts[i] = l;
            dateStrs[i] = MyDataUtils.DateToString(dates[i], "yyyy-MM");
        }
        list.add(dateStrs);
        list.add(counts);
        return list;



    }




    public List<Production> getProductionByUserId(Long userId){
        return getSession().createQuery("from Production p where p.User.id = ? order by createDate desc ")
                .setParameter(0,userId)
                .setMaxResults(5)
                .list();
    }
}
