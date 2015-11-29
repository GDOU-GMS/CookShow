package com.blueshit.cookshow.common.utils;

/**
 * Created by Seven on 2015/11/29.
 */
public class CreateCode {

    public static String getTopCode(int num){
        String numStr = String.valueOf(num);
        if(numStr.length()==1){
            return "0"+numStr;
        }else{
            return numStr;
        }
    }

    public static String getSecondeCode(int num){
        String numStr = String.valueOf(num);
        if(numStr.length()==1){
            return "00"+numStr;
        }else if(numStr.length()==2){
            return "0"+numStr;
        }else{
            return numStr;
        }
    }

    public static String getThirdCode(int num){
        String numStr = String.valueOf(num);
        if(numStr.length()==1){
            return "000"+numStr;
        }else if(numStr.length()==2){
            return "00"+numStr;
        }else if(numStr.length()==3){
            return "0"+numStr;
        }else{
            return numStr;
        }
    }


    public static void main(String[] args) {
        System.out.println(getTopCode(11));
        System.out.println(getSecondeCode(22));
        System.out.println(getThirdCode(33));
    }


}
