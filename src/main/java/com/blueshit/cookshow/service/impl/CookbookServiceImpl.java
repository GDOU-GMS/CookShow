package com.blueshit.cookshow.service.impl;


import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Cookbook;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.service.CookbookService;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
     /*
      * 得到报表信息
      * (non-Javadoc)
      * @see com.blueshit.cookshow.service.CookbookService#getReport()
      */
	public List<Cookbook> getReport() {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Cookbook> list=getSession().createQuery("SELECT count(*) FROM Cookbook c "
		 		+ "WHERE to_days(createDate)>='2015-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-01-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c "
		 		+ "WHERE to_days(createDate)>=to_days('2015-02-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-02-29 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-03-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-03-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-04-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-04-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-05-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-05-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-6-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-06-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-07-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-07-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-08-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-08-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-09-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-09-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-10-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-10-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')"
		 		+ "union all SELECT count(*) FROM Cookbook c"
		 		+ "WHERE to_days(createDate)>=to_days('2015-11-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_days(createDate)<=to_days('2015-11-31 23:59:59:59','yyyy-mm-dd hh24:mi:ss')")
		 		.list();
		return list;
	}
    

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

    /**
     * 获取所有分类头条
     * @return
     */
    public List<Cookbook> getHeadlineCookbooks(){
        return getSession().createQuery("from Cookbook where isHeadline = true order by publishDate desc ")
	public List<Cookbook> getHeadlineCookbooks() {
		return getSession().createQuery("from Cookbook c where c.isHeadline = true and deleted = 0 order by createDate desc")
                .setMaxResults(5)
                .list();
    }
	}
	public Page findByTitle(String title, int pageNum, int pageSize) {
		
		QueryHelper queryHelper=new QueryHelper(Cookbook.class, "c")
    	.addWhereCondition("c.title like ? ", "%"+title+"%");
    	return getPage(pageNum,pageSize,queryHelper);
	}


}
