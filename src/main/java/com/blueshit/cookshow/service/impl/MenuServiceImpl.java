package com.blueshit.cookshow.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.service.MenuService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class MenuServiceImpl extends DaoSupportImpl<Menu> implements MenuService {

	

	/**
	 * 获得流行菜单
	 */
	public List<Menu> getRecentPopular() {
		// TODO Auto-generated method stub
		
        List<Menu> recentMenuList = new ArrayList<Menu>();
		@SuppressWarnings("unchecked")

		List<Menu> menuList = getSession()
                  .createQuery("from  Menu  order by createDate desc")
                  .setMaxResults(10)
                  .list();
		recentMenuList.addAll(menuList);
		return recentMenuList;
	
	}

     public List<Menu> query(String name){
		List<Menu> query=getSession().createQuery("from Menu m where m.name like '%"+name+"%'")
				.list();
		return query;
		
	}

}
