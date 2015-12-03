package com.blueshit.cookshow.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javassist.expr.NewArray;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
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
	
}
