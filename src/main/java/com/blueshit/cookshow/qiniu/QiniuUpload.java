package com.blueshit.cookshow.qiniu;

import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Seven on 2015/11/29.
 */
public class QiniuUpload {

    public static final String  BASE_URL = "http://7xoqvb.com1.z0.glb.clouddn.com/";

    // 重用 uploadManager。一般地，只需要创建一个 uploadManager 对象
    public static UploadManager uploadManager = new UploadManager();

    public class MyRet {
        public long fsize;
        public String key;
        public String hash;
        public int width;
        public int height;
    }


    public static String upload(File file) {
        try {
            Response res = uploadManager.put(file, file.getName(), QiniuToken.getUpTokenDefault());
            MyRet ret = res.jsonToObject(MyRet.class);
            System.out.println(ret.toString());
            System.out.println(res.bodyString());
            return BASE_URL+file.getName();
        } catch (QiniuException e) {
            System.out.println(e);
            Response r = e.response;
            // 请求失败时简单状态信息
            try {
                // 响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
                System.out.println(e1);
            }
        }
        return null;
    }

    public static String upload(MultipartFile file) {
        try {
            String fileName = MyDataUtils.DateToString(new Date(),"yyyyMMddHHmmSS")+"_"+file.getOriginalFilename();
            Response res = uploadManager.put(file.getBytes(),fileName, QiniuToken.getUpTokenDefault());
            MyRet ret = res.jsonToObject(MyRet.class);
            System.out.println(ret.toString());
            System.out.println(res.bodyString());
            return BASE_URL+fileName;
        } catch (QiniuException e) {
            System.out.println(e);
            Response r = e.response;
            // 请求失败时简单状态信息
            try {
                // 响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
                System.out.println(e1);
            }
        }catch (Exception e1){
            e1.printStackTrace();
        }
        return null;
    }

    public static String upload(MultipartFile file,String fileName)  {
        try {
            Response res = uploadManager.put(file.getBytes(), fileName, QiniuToken.getUpTokenDefault());
            MyRet ret = res.jsonToObject(MyRet.class);
            System.out.println(ret.toString());
            System.out.println(res.bodyString());
            return BASE_URL+fileName;
        } catch (QiniuException e) {
            System.out.println(e);
            Response r = e.response;
            // 请求失败时简单状态信息
            try {
                // 响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
                System.out.println(e1);
            }
        }catch (IOException ioe){
            System.out.println(ioe);
        }
        return null;
    }


    public static void main(String[] args) {
        File file = new File("C:\\Users\\Seven\\Desktop\\sevenlin.jpg");
        String url = upload(file);
        System.out.println(url+"=============");
    }

}
