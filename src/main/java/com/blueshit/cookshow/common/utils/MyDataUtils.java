package com.blueshit.cookshow.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Seven on 2015/12/1.
 */
public class MyDataUtils {


    public static Date StringToDate(String source,String format) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format);
            return dateFormat.parse(source);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static String DateToString(Date source,String format) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format);
            return dateFormat.format(source);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

}
