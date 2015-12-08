package com.blueshit.cookshow.common.utils;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * Created by Seven on 2015/12/5.
 */
public class CaptchaCreator {

    public static final int HIGHT=25;

    public static final String IMAGETYPE_JPG="jpg";
    public static final String IMAGETYPE_PNG="png";
    public static final String IMAGETYPE_GIF="gif";


    //获得指定位数的验证码
    public static String getCaptchaCode(int num){
        //默认四位
        if(num<4&&num>10){
            num = 4;
        }
        StringBuilder sb = new StringBuilder();
        for(int i =0;i<num;i++){
            sb.append(new Random().nextInt(9));
        }
        return sb.toString();
    }

    //获得默认验证码
    public static String getCaptchaCode(){
        StringBuilder sb = new StringBuilder();
        for(int i =0;i<4;i++){
            sb.append(new Random().nextInt(9));
        }
        return sb.toString();
    }

    public static BufferedImage getCaptchaCodeImage(String captchaCode){

        int width = (captchaCode.length()+2)*15;

        BufferedImage bufferedImage = new BufferedImage(width,HIGHT,BufferedImage.TYPE_INT_BGR);

        //得到图片
        Graphics2D  g =  (Graphics2D) bufferedImage.getGraphics();
        //设置图片背景色
        setBackground(g,width);
        //设置边框
        setBorder(g,width);
        //画干扰线
        drawRandomLine(g,width);
        //向图片上写数据
        drawRandomNum(g,captchaCode);

        return bufferedImage;
    }

    /**设置图片背景色**/
    private static void setBackground(Graphics2D g,int width) {
        g.setColor( Color.WHITE);
        g.fillRect(0, 0, width, HIGHT);
    }
    /**设置边框**/
    private static void  setBorder(Graphics2D g,int width) {
        g.setColor(Color.BLUE);
        g.drawRect(1, 1, width-2, HIGHT-2);
    }
    /**画干扰线**/
    private static void drawRandomLine(Graphics2D g,int width) {
        g.setColor(Color.GREEN);
        for(int i=0;i<5;i++){
            //起始坐标
            int x1 = new Random().nextInt(width);
            int y1 = new Random().nextInt(HIGHT);
            //结束坐标
            int x2 = new Random().nextInt(width);
            int y2= new Random().nextInt(HIGHT);

            g.drawLine(x1, y1, x2, y2);
        }
    }
    /**向图片上写数据**/
    private static void drawRandomNum(Graphics2D g,String captchaCode) {

        g.setColor(Color.RED);
        g.setFont(new Font("微软雅黑",Font.BOLD,16));

        int x=15;
        for(int i=0;i<captchaCode.length();i++){
            String num = captchaCode.substring(i,i+1);
            int degree = new Random().nextInt()%30;
            g.rotate(degree*Math.PI/180, x, 20);
            g.drawString(num, x, 20);
            g.rotate(-degree*Math.PI/180, x, 20);
            x+=15;
        }
    }



}
