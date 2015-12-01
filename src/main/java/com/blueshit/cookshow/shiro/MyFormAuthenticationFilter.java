package com.blueshit.cookshow.shiro;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Created by SevenLin on 2015/9/23.
 */

/**
 * 自定义表单认证过滤器
 */
public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

    /**
     * 重写onLoginSuccess实现登录成功后自动跳转到首页.
     * @param token
     * @param subject
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
   /* @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {

        WebUtils.getAndClearSavedRequest(request);//会清理原先的地址

        WebUtils.redirectToSavedRequest(request, response, "/index.action");

        return false;
    }*/
}
