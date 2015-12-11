package com.blueshit.cookshow.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javassist.expr.NewArray;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Production;
import com.blueshit.cookshow.model.entity.Relation;
import com.blueshit.cookshow.model.vo.RelationVo;
import com.blueshit.cookshow.service.RelationService;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class RelationServiceImpl extends DaoSupportImpl<Relation> implements RelationService{

	
	public List<Relation> getPersonRelations(Long userid) {
		
		List<Relation> relation=getSession().createQuery("from Relation where Follower.id = ?")
		.setParameter(0, userid)
		.list();
		return relation;
		
	}

	public Relation getFocusOnFriend(Long followerId, Long byFollowerId) {
		return (Relation) getSession().createQuery("from Relation r where r.Follower.id=? and r.ByFollower.id=?")
		.setParameter(0, followerId)
		.setParameter(1, byFollowerId)
		.uniqueResult();
		
	}
	
	
	public List<Relation> getBeRelation(Long userid){
		List<Relation> relation=getSession().createQuery("from Relation  where ByFollower.id = ?")
				.setParameter(0, userid)
				.list();
		return relation;
	}

	public Page getRelationDynamic(Long[] ids,int pageSize,int pageNum) {
		
//		  QueryHelper queryHelper = new QueryHelper(Production.class,"p")
//          .addWhereCondition("p.User.id in ? ",ids)
//          .addOrderByProperty("p.publicDate",false);
//		 return getPage(pageNum,pageSize,queryHelper);
		List<Production> production=getSession().createQuery("from Production p where p.User.id in (:ids) order by p.publicDate desc ")
		.setParameterList("ids",ids)
		.list();
		int totalRecord=production.size();
		Page page=new Page(pageSize, pageNum, totalRecord);
		page.setList(production);
		return  page;
        
	}
	
}
