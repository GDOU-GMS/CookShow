package com.blueshit.cookshow.service.impl;


import java.util.List;

import javax.mail.Session;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
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
     /*
      * 得到报表信息
      * (non-Javadoc)
      * @see com.blueshit.cookshow.service.CookbookService#getReport()
      */
	public List<Cookbook> getReport() {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
	   String sql="select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-01-01 00:00:00' and '2015-01-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-02-01 00:00:00' and '2015-02-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-03-01 00:00:00' and '2015-03-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-04-01 00:00:00' and '2015-04-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-05-01 00:00:00' and '2015-05-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-06-01 00:00:00' and '2015-06-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-07-01 00:00:00' and '2015-07-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-08-01 00:00:00' and '2015-08-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-09-01 00:00:00' and '2015-09-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-10-01 00:00:00' and '2015-10-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-11-01 00:00:00' and '2015-11-31 23:59:59' union all "
	   		      + "select count(*) from  t_cookbook "
	   		      + "where createDate between '2015-12-01 00:00:00' and '2016-01-01 23:59:59'";
	  List list=getSession().createSQLQuery(sql)
				 			.list();
				 	

		return list;
	}
    

	public List<Cookbook> getHeadlineCookbooks() {
		return getSession().createQuery("from Cookbook c where c.isHeadline = true and deleted = 0 order by createDate desc")
                .setMaxResults(5)
                .list();
	}


}
