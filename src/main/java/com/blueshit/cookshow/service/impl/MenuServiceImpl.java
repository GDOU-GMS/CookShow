package com.blueshit.cookshow.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.entity.Menu;
import com.blueshit.cookshow.service.MenuService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
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
}
