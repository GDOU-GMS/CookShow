package com.blueshit.cookshow.service;

import com.blueshit.cookshow.dao.DaoSupport;
import com.blueshit.cookshow.model.entity.User;

import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
public interface UserService extends DaoSupport<User> {

    User findByUsername(String username);

    User findByEmail(String email);

    User findByUsernameOrEmail(String token);

    List<Object[]> getLastWeekUserDate(Date[] dates);
    
}
