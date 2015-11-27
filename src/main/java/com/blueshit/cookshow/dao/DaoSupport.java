package com.blueshit.cookshow.dao;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;

import java.util.List;




public interface DaoSupport<T>{
	
public abstract void save(T t);
	
	public abstract void delete(Long id);
	
	public abstract void update(T t);
	
	public abstract T findById(Long id);
	
	public abstract List<T> findByIds(Long[] ids);
	
	public abstract List<T> findAll();
	
	public abstract Page getPage(int pageNum, QueryHelper queryHelper);

    public abstract void disable(Long id);
}
