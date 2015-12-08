package com.blueshit.cookshow.service;

import java.util.List;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Menu;

/**
 * Created by Seven on 2015/11/26.
 */
public interface MenuService extends DaoSupport<Menu> {

	public List<Menu> getRecentPopular();

    public Page getMenuByUserId(Long userId,int pageNum);

    public List<Menu> getAllMenuByUserId(Long userId);

    public void addCookbook(Long menuId,Long cookbookId);

    public boolean cookBookExistInMenu(Long cookbookId,Long menuId);

//	public List<Menu> query(String name);
    public List<Menu> getDetail(Long menuId);
}
