package com.blueshit.cookshow.service;

import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.Admin;

/**
 * Created by Seven on 2015/11/25.
 */
public interface AdminService extends DaoSupport<Admin>{

    Admin findByUsername(String username);

}
