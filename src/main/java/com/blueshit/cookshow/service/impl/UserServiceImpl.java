package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
        return (User)getSession().createQuery("from User u where  u.username = ?")
                .setParameter(0,username)
                .uniqueResult();
    }

    public User findByEmail(String email){
        return (User)getSession().createQuery("from User u where u.email = ?")
                .setParameter(0,email)
                .uniqueResult();
    }

    public User findByUsernameOrEmail(String token){
        return (User)getSession().createQuery("from User u where u.username = ? or u.email = ?")
                .setParameter(0,token)
                .setParameter(1,token)
                .uniqueResult();

    }

    public List<Object[]> getLastWeekUserDate(Date[] dates){
        List<Object[]> list = new ArrayList<Object[]>();

        Long[] counts = new Long[dates.length];
        String[] dateStrs = new String[dates.length];

        for(int i=0;i<dates.length;i++){

            Long l = (Long)getSession().createQuery("select  count(*) from User where createDate < ? and createDate>?")
                    .setParameter(0,new Date(dates[i].getTime()+24*60*60*1000))
                    .setParameter(1,dates[i])
                    .uniqueResult();
            counts[i] = l;
            dateStrs[i] = MyDataUtils.DateToString(dates[i],"yyyy-MM-dd");
        }
        list.add(dateStrs);
        list.add(counts);
        return list;
    }
}
