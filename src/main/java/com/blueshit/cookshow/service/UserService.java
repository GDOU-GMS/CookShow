package com.blueshit.cookshow.service;

import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.User;

/**
 * Created by Seven on 2015/11/26.
 */
public interface UserService extends DaoSupport<User> {

    User findByUsername(String username);

}
