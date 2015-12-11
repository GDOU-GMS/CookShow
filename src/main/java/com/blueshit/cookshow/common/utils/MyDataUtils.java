package com.blueshit.cookshow.common.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

    /**
     * 获取上一周时间
     * @return
     */
    public static Date[] getLastWeakDate(){
        Calendar calendar = Calendar.getInstance();
        Date[] dates = new Date[7];
        calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE)-7);
        for(int i=0;i<7;i++){
            calendar.add(Calendar.DATE,1);
            dates[i] = MyDataUtils.StringToDate(MyDataUtils.DateToString(calendar.getTime(),"yyyy-MM-dd"),"yyyy-MM-dd");
        }
        return dates;
    }


    public static Date[] getLastYearMonth(){
        Calendar calendar = Calendar.getInstance();
        Date[] dates = new Date[12];
        calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH)-12,calendar.get(Calendar.DATE));
        for(int i=0;i<12;i++){
            calendar.add(Calendar.MONTH,1);
            dates[i] = MyDataUtils.StringToDate(MyDataUtils.DateToString(calendar.getTime(),"yyyy-MM"),"yyyy-MM");
        }
        return dates;
    }

    public static Date getNextMonth(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        return MyDataUtils.StringToDate(MyDataUtils.DateToString(calendar.getTime(),"yyyy-MM"),"yyyy-MM");
    }


    public static void main(String[] args) {
        Date[] dates = getLastYearMonth();
        for(Date date : dates){
            System.out.println(MyDataUtils.DateToString(date,"yyyy-MM-dd HH:mm:SS"));
            System.out.println(MyDataUtils.DateToString(getNextMonth(date),"yyyy-MM-dd HH:mm:SS"));
            System.out.println("=============");
        }

    }


}
