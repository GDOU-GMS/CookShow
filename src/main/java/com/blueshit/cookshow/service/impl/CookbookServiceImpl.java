package com.blueshit.cookshow.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.utils.MyDataUtils;
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
     /*
      * 得到报表信息
      * (non-Javadoc)
      * @see com.blueshit.cookshow.service.CookbookService#getReport()
      */
	public List<Cookbook> getReport() {
		// TODO Auto-generated method stub
	//	@SuppressWarnings("unchecked")
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
    



    /**
     * 根据分类编码查询.
     * @param classificationCode
     * @param pugeNum
     * @param pageSize
     * @return
     */
    public Page findByClassification(String classificationCode,int pugeNum,int pageSize){

        QueryHelper queryHelper = new QueryHelper(Cookbook.class,"c")
                .addWhereCondition("c.classificationCode like ? ","%"+classificationCode+",%")
                .addOrderByProperty("createDate",false);
        return getPage(pugeNum,pageSize,queryHelper);
    }

    /**
     * 获取所有分类头条
     * @return
     */
    public List<Cookbook> getHeadlineCookbooks(){
		return getSession().createQuery("from Cookbook c where c.isHeadline = true and deleted = 0 order by createDate desc")
                .setMaxResults(5)
                .list();
	}

	public Page findByTitle(String title, int pageNum, int pageSize) {
		QueryHelper queryHelper=new QueryHelper(Cookbook.class, "c")
    	.addWhereCondition("c.title like ? ", "%"+title+"%");
    	return getPage(pageNum,pageSize,queryHelper);
	}


    /**
     * 首页展示新秀菜谱
     * @return
     */
    public List<Cookbook> getNewCreateCookbooks(){
        return getSession().createQuery("from Cookbook where deleted=0 order by createDate desc ")
                .setMaxResults(6)
                .list();
    }


    /**
     * 获取本周最受欢迎的菜谱.
     * @return
     */
    public List<Cookbook> getPopularCookbooks(){
        return getSession().createQuery("from Cookbook where deleted=0 order by favourNum desc , createDate desc ")
                .setMaxResults(6)
                .list();
    }


    /**
     * 查询概况
     * @param userId
     * @return
     */
    public List<Cookbook> getRecentlyCookbookByUserId(Long userId){
        return getSession().createQuery("from Cookbook c where c.User.id = ? and deleted=0 order by createDate")
                .setParameter(0,userId)
                .setMaxResults(3)
                .list();
    }

    public List<Object[]> getCookbookChartData(Date[] dates){
        List<Object[]> list = new ArrayList<Object[]>();

        Long[] counts = new Long[dates.length];
        String[] dateStrs = new String[dates.length];

        for(int i=0;i<dates.length;i++){

            Long l = (Long)getSession().createQuery("select  count(*) from Cookbook where createDate < ? and createDate>?")
                    .setParameter(0,MyDataUtils.getNextMonth(dates[i]))
                    .setParameter(1,dates[i])
                    .uniqueResult();
            counts[i] = l;
            dateStrs[i] = MyDataUtils.DateToString(dates[i], "yyyy-MM");
        }
        list.add(dateStrs);
        list.add(counts);
        return list;
    }

}
