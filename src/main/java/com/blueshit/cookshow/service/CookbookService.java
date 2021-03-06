package com.blueshit.cookshow.service;

import java.util.Date;
import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Cookbook;

/**
 * Created by Seven on 2015/11/26.
 */
public interface CookbookService extends DaoSupport<Cookbook> {

    public Page findByUserId(Long userId,int pageNum);

	public List<Cookbook> getReport();

    public Page findByClassification(String classificationCode,int pugeNum,int pageSize);

    public List<Cookbook> getHeadlineCookbooks();

	public Page findByTitle(String title,int pageNum,int pageSize);

    public Page findByMenuId(Long menuId,int pageNum,int pageSize);

    public List<Cookbook> getNewCreateCookbooks();

    public List<Cookbook> getPopularCookbooks();

    List<Cookbook> getRecentlyCookbookByUserId(Long userId);

    List<Object[]> getCookbookChartData(Date[] dates);

}
