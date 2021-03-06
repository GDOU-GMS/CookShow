package com.blueshit.cookshow.web.basic;

import com.blueshit.cookshow.model.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Seven on 2015/11/30.
 */
public class CheckUserLoginInterception implements HandlerInterceptor {

    public static List<String> list = new ArrayList<String>();

    static {
        list.add("/user/personCenter");
        list.add("/user/updateUserInfo");
        list.add("/user/updatePassword");
        list.add("/user/uploadFace");
        list.add("/user/logout");
        list.add("/user/personWork/0");//0的时候代表没登录
        list.add("/cookbook/createCookbook");
        list.add("/cookbook/addCookbook");
        list.add("/cookbook/forwardModifyCookbook");
        list.add("/cookbook/modifyCookbook");
        list.add("/cookbook/deleteCookbook");
        list.add("/menu/createMenu");
        list.add("/menu/addMenu");
        list.add("/menu/addCookbook");
        list.add("/production/forwardToCreateProduction");
        list.add("/production/createProduction");
        list.add("/production/forwardToModify");
        list.add("/production/modifyProduction");
        list.add("/production/disableProduction");
    }

    /**
     * 在这个方法做校验.
     * @param request
     * @param response
     * @param o
     * @return
     * @throws Exception
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        if(list.contains(request.getRequestURI())){
            User user = (User) request.getSession().getAttribute("user");
            if(user==null){
                response.sendRedirect("/user/forwardToLogin");
                return false;
            }else{
                return true;
            }
        }else{
            return true;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
