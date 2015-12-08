package com.blueshit.cookshow.service.impl;

import java.lang.management.MemoryUsage;
import java.util.ArrayList;
import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.helper.QueryHelper;
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


    public Page getMenuByUserId(Long userId,int pageNum){

        int pageSize = 10;

        QueryHelper queryHelper = new QueryHelper(Menu.class,"m")
                                .addWhereCondition("m.User.id = ?",userId)
                                .addWhereCondition("deleted = 0")
                                .addOrderByProperty("createDate",false);
        return getPage(pageNum,pageSize,queryHelper);

    }


    public List<Menu> getAllMenuByUserId(Long userId){
        return getSession().createQuery("from Menu m where m.User.id = ?")
                .setParameter(0,userId)
                .list();
    }


    public void addCookbook(Long menuId,Long cookbookId){

        getSession().createSQLQuery("INSERT INTO t_menu_cookbook(menu_id, cookbook_id) VALUES(:menuId,:cookbookId)")
                .setParameter("menuId", menuId)
                .setParameter("cookbookId", cookbookId)
                .executeUpdate();

    }

    /**
     * 判断菜谱是否存在菜单里面.
     * @param cookbookId
     * @param menuId
     * @return
     */
    public boolean cookBookExistInMenu(Long cookbookId,Long menuId){

        int count = getSession()
                .createSQLQuery("SELECT  * FROM t_menu_cookbook WHERE menu_id = :menuId AND cookbook_id = :cookbookId")
                .setParameter("menuId",menuId)
                .setParameter("cookbookId",cookbookId)
                .list()
                .size();

        if(count>0){
            return true;
        }else {
            return false;
        }


    }

//     public List<Menu> query(String name){
//		List<Menu> query=getSession().createQuery("from Menu m where m.name like '%"+name+"%'")
//				.list();
//		return query;
		
	


}
