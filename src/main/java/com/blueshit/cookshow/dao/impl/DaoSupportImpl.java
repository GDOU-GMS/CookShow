package com.blueshit.cookshow.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;


import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.common.utils.Configuration;
import com.blueshit.cookshow.dao.DaoSupport;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class  DaoSupportImpl<T> implements DaoSupport<T> {
	@Resource
	private SessionFactory sessionFactory;

	protected Class<T> clazz = null;
	
	public DaoSupportImpl(){
		//通过反射获取T的真实类型.
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
	}
	
	/**
	 * 获取session
	 * @return
	 */
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 * 保存.
	 */
	public void save(T t) {
		getSession().save(t);
	}

	/**
	 * 删除
	 */
	public void delete(Long id) {
		if(id ==null){
			return;
		}
		getSession().delete(this.findById(id));
	}

	/**
	 * 更新.
	 */
	public void update(T t) {
		getSession().update(t);
	}

	/**
	 * 根据id查找
	 */
	public T findById(Long id) {
		if(id==null){
			return null;
		}
		return (T) getSession().get(clazz, id);
	}

	/**
	 * 根据多个id查找
	 */
	public List<T> findByIds(Long[] ids) {
		if(ids.length == 0||ids ==null){
			return null;
		}
		return getSession()
				.createQuery("from " + clazz.getSimpleName() + " where id IN(:ids)")
				.setParameterList("ids", ids)
				.list();
	}

	/**
	 * 查询所有.
	 */
	public List<T> findAll() {
		return getSession().createQuery("from "+clazz.getSimpleName()).list();
	}

	/**
	 * 分页查询
	 */
	public Page getPage(int pageNum, QueryHelper queryHelper) {

		//获取pageSize信息
		Configuration conf = new Configuration();
		int pageSize = conf.getPageSize();
		
		return getPage(pageNum,pageSize,queryHelper);

	}

    /**
     * 分页
     * @param pageNum
     * @param pageSize
     * @param queryHelper
     * @return
     */
    public Page getPage(int pageNum,int pageSize,QueryHelper queryHelper){

        //获取数据列表
        Query query  = getSession().createQuery(queryHelper.getQueryListHql());
        List<Object> args = queryHelper.getParameters();
        //设置参数
        if(args != null || args.size()>0){
            for(int i=0;i<args.size();i++){
                query.setParameter(i, args.get(i));
            }
        }
        query.setFirstResult((pageNum -1)*pageSize);
        query.setMaxResults(pageSize);
        List list = query.list();
		/*//如果为空.
		if(list.isEmpty()){
			return null;
		}*/

        //获得总记录数
        query = getSession().createQuery(queryHelper.getQueryCountHql());
        //设置参数
        if(args != null || args.size()>0){
            for(int i=0;i<args.size();i++){
                query.setParameter(i, args.get(i));
            }
        }

        Long count = (Long)query.uniqueResult();

        Page page = new Page(pageSize,pageNum,count.intValue());

        page.setList(list);

        return page;
    }

    /**
     * 设置无效
     * @param id
     */
    public void disable(Long id){



        getSession().createQuery("update "+clazz.getSimpleName()+" set deleted = 1 where id = ?")
                .setParameter(0,id)
                .executeUpdate();

    }

	
}
