package com.blueshit.cookshow.web.basic;

import com.blueshit.cookshow.model.entity.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Seven on 2015/11/27.
 */
public class CheckAdminLoginInterception implements HandlerInterceptor{


    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        System.out.println("===============================已拦截："+httpServletRequest.getRequestURI()+"=================================");

        Admin admin = (Admin) httpServletRequest.getSession().getAttribute("admin");
        if(admin == null){
            httpServletRequest.getRequestDispatcher("/forward/admin/index").forward(httpServletRequest,httpServletResponse);
            return false;
        }else{
            return true;
        }

    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
