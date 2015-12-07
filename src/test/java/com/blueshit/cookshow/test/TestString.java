package com.blueshit.cookshow.test;

import org.junit.Test;
/**
 * Created by Seven on 2015/12/5.
 */
public class TestString {


    @Test
    public void testString(){
        String str = "sevenlin";

        for(int i=0;i<str.length();i++){
            String num = str.substring(i,i+1);
            System.out.println(num);
        }


    }

}
