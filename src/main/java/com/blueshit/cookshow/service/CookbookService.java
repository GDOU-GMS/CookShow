package com.blueshit.cookshow.service;

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

	public List<Cookbook> query(String title, String classificationCode);

	public List<Cookbook> getHeadlineCookbooks();

	
}
