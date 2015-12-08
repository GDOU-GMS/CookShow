package com.blueshit.cookshow.service.impl;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.service.CookbookService;

import org.hibernate.Query;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
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

    
    
	public List<Cookbook> getReport() {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		 List<Cookbook> report=getSession()
				 .createQuery("SELECT count(*) FROM Cookbook c "
				 		+ "WHERE createDate>='2015-01-01 00:00:00'and createDate<='2015-01-31 23:59:59:59'"
				 		+ "union all "
				 		+ "SELECT count(*) FROM Cookbook c WHERE createDate>='2015-02-01 00:00:00'and createDate<='2015-02-29 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-03-01 00:00:00'and createDate<='2015-03-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-04-01 00:00:00' and createDate<='2015-04-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-05-01 00:00:00' and createDate<='2015-05-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-6-01 00:00:00' and createDate<='2015-06-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-07-01 00:00:00' and createDate<='2015-07-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-08-01 00:00:00' and createDate<='2015-08-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-09-01 00:00:00' and createDate<='2015-09-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-10-01 00:00:00' and createDate<='2015-10-31 23:59:59:59'"
				 		+ "union all SELECT count(*) FROM Cookbook c"
				 		+ "WHERE createDate>='2015-11-01 00:00:00' and createDate<='2015-11-31 23:59:59:59'")
				 		.list();
		System.out.println(report);
		return report;
	}


/*
 * 模糊查询菜谱
 * (non-Javadoc)
 * @see com.blueshit.cookshow.service.CookbookService#query(java.lang.String, java.lang.String)
 */
	public List<Cookbook> query(String title,String classificationCode) {
		// TODO Auto-generated method stub
	  @SuppressWarnings("unchecked")
	List<Cookbook>  query=getSession()
			.createQuery("from Cookbook c where c.title like '%"+title+"%' or c.classificationCode like '%"+classificationCode+"%'")
			.list();
      
		return query;
	}


    
    
}
