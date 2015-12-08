package com.blueshit.cookshow.web.controller.common;

import com.blueshit.cookshow.common.utils.CaptchaCreator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Seven on 2015/12/5.
 */
@Controller
public class CaptchaController {


    @RequestMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request,HttpServletResponse response){
        try {
            String captchaCode = CaptchaCreator.getCaptchaCode();
            //放到session
            request.getSession().setAttribute("captcha", captchaCode);
            //返回验证码
            ImageIO.write(CaptchaCreator.getCaptchaCodeImage(captchaCode),
                    CaptchaCreator.IMAGETYPE_GIF,
                    response.getOutputStream());
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
