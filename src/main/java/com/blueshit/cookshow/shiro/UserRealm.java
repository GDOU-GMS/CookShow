package com.blueshit.cookshow.shiro;

/**
 * Created by SevenLin on 2015/9/1.
 */

import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.SimpleByteSource;

import javax.annotation.Resource;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public class UserRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;

    @Override
    public String getName() {
        return "userRealm";
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
       return null;
    }

    /**
     * 认证回调函数,登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        try{
            System.out.println("进入：doGetAuthenticationInfo...");

            String username = (String)token.getPrincipal();

            //从数据库中查找对应用户名的用户信息
            User user = userService.findByUsername(username);

            if(user == null) {
                throw new UnknownAccountException();//没找到帐号
            }

            if(user.getDeleted()==1) {
                throw new LockedAccountException(); //帐号锁定
            }

            SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                    username, //存放principal信息
                    user.getPassword(), //密码
                    SimpleByteSource.Util.bytes(user.getSalt()),//salt
                    getName()  //realm name
            );

            System.out.println("退出：doGetAuthenticationInfo...");
            return authenticationInfo;
        }catch (Exception e){
            e.printStackTrace();
            try {
                throw e;
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}