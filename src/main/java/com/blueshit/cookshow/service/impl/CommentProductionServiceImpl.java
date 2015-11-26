package com.blueshit.cookshow.service.impl;

import com.blueshit.cookshow.dao.impl.DaoSupportImpl;
import com.blueshit.cookshow.model.entity.CommentProduction;
import com.blueshit.cookshow.service.CommentProductionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Seven on 2015/11/26.
 */
@Service
@Transactional
public class CommentProductionServiceImpl extends DaoSupportImpl<CommentProduction> implements CommentProductionService {
}
