package com.blueshit.cookshow.qiniu;

import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;


/**
 * Created by Seven on 2015/11/29.
 */
public class QiniuToken {

    public static final String  ACCESS_KEY = "eKnAYfYG150-ok9jeV6Fkkc2HAqUilsq0DmJuiMz";
    public static final String  SECRET_KEY = "CcmoTOJatmViSZXsNzjBULwaS8Tw4w9eNDLwKT0p";




    public static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);


    // 简单上传，使用默认策略
    public static String getUpTokenDefault(){
        return auth.uploadToken("cookshow");
    }

    // 覆盖上传
    public static String getUpTokenOver(){
        return auth.uploadToken("cookshow", "key");
    }

    // 设置指定上传策略
    public static String getUpTokenWithCallbackUrlBody(){
        return auth.uploadToken("bucket", null, 3600, new StringMap()
                .put("callbackUrl", "call back url").putNotEmpty("callbackHost", "")
                .put("callbackBody", "key=$(key)&hash=$(etag)"));
    }

    public static void main(String[] args) {
        System.out.println(getUpTokenDefault());
    }

}
