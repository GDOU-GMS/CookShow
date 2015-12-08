package com.blueshit.cookshow.test;

import com.blueshit.cookshow.common.utils.CaptchaCreator;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

/**
 * Created by Seven on 2015/12/5.
 */
public class TestCaptchaCreator {

    @Test
    public void test(){

        try {
            BufferedImage bufferedImage = CaptchaCreator.getCaptchaCodeImage(CaptchaCreator.getCaptchaCode(10));


            File file = new File("d://test.jpg");

            FileOutputStream fileOutputStream = new FileOutputStream(file);

            ImageIO.write(bufferedImage, "jpg", fileOutputStream);

        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
