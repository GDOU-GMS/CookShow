package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Admin;
import com.blueshit.cookshow.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/25.
 */
@Service
@Transactional
public class AdminServiceImpl extends DaoSupportImpl<Admin> implements AdminService {


}
