package com.blueshit.cookshow.test;

import com.blueshit.cookshow.common.utils.MyDataUtils;
import org.junit.Test;
import org.springframework.aop.support.AopUtils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by Seven on 2015/12/10.
 */
public class TestCalendar {

    @Test
    public void test1(){

        Calendar calendar = Calendar.getInstance();
        Date[] dates = new Date[7];
        calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),calendar.get(Calendar.DATE)-7);
        for(int i=0;i<7;i++){
            calendar.add(Calendar.DATE,1);
            dates[i] = calendar.getTime();
        }
        for(Date date : dates){
            System.out.println(MyDataUtils.DateToString(date,"yyyy-MM-dd HH:mm:SS"));
        }

    }


    @Test
    public void test2(){

    }



}
