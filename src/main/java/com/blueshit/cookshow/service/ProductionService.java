package com.blueshit.cookshow.service;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Production;

import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
public interface ProductionService extends DaoSupport<Production> {

    Page getProductionByUserId(Long userId,int pageNum,int pageSize);

    Page getAllProduction(int pageNum,int pageSize);

    Page getQueryProduction(String keyword);

    List<Object[]> getProductionChartData(Date[] dates);

}
