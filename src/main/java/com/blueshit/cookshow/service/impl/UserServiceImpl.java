package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class UserServiceImpl extends DaoSupportImpl<User> implements UserService {


    /**
     * 根据用户名查找.
     * @param username
     * @return
     */
    public User findByUsername(String username) {
        return null;
    }
}
