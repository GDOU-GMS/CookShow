package com.blueshit.cookshow.service;

import java.util.List;

import com.alibaba.druid.support.logging.Log;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Relation;

/**
 * Created by Seven on 2015/11/26.
 */
public interface RelationService extends DaoSupport<Relation> {
	
	//获得所关注的人
	public List<Relation> getPersonRelations(Long userid);
	
	public Relation getFocusOnFriend(Long followerId,Long byFollowerId);
	//获得被关注的人
	public List<Relation> getBeRelation(Long userid);
}
