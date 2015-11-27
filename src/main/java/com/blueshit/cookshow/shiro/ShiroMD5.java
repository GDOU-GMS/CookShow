package com.blueshit.cookshow.shiro;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * Created by SevenLin on 2015/9/9.
 */
public class ShiroMD5 {

    /**
     * 自定义哈希次数MD5加盐加密
     * @param source
     * @param salt
     * @param hashIterations
     * @return
     */
    public static String getMd5WithSalt(String source,String salt,int hashIterations){
        Md5Hash md5Hash = new Md5Hash(source,salt,hashIterations);
        return md5Hash.toString();
    }

    /**
     * MD5加盐加密
     * @param source
     * @param salt
     * @return
     */
    public static String getMd5WithSalt(String source,String salt){
        Md5Hash md5Hash = new Md5Hash(source,salt);
        return md5Hash.toString();
    }

    /**
     * MD5加密
     * @param source
     * @return
     */
    public static String getMd5(String source){
        Md5Hash md5Hash = new Md5Hash(source);
        return md5Hash.toString();
    }

    public static void main(String[] args) {
        System.out.println(getMd5WithSalt("admin","1b8a3a77-37a1-480c-95d0-35e58dad773b",1));
    }

}
