package com.blueshit.cookshow.web.controller.listener;

import com.blueshit.cookshow.model.entity.Classification;
import com.blueshit.cookshow.model.vo.ClassificationVo;
import com.blueshit.cookshow.service.ClassificationService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Seven on 2015/12/1.
 */

/**
 * 数据缓存监听器
 */
public class DataCacheListener implements ServletContextListener {

    public static List<ClassificationVo> classificationList = new ArrayList<ClassificationVo>();


    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //获取spring 的 applicationcontext
        ServletContext servletContext = servletContextEvent.getServletContext();
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(servletContext);

        //缓存所有分类
        ClassificationService classificationService = (ClassificationService)ac.getBean("classificationService");
        classificationList = classificationService.getAllClassification();
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
