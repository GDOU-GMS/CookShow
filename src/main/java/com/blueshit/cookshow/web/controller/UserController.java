package com.blueshit.cookshow.web.controller;

import com.blueshit.cookshow.common.helper.Page;
import com.blueshit.cookshow.common.mail.MailUtils;
import com.blueshit.cookshow.common.utils.MyDataUtils;
import com.blueshit.cookshow.common.utils.UUIDCreator;
import com.blueshit.cookshow.model.entity.Collection;
import com.blueshit.cookshow.model.entity.Relation;
import com.blueshit.cookshow.model.entity.User;
import com.blueshit.cookshow.model.enums.CollectionEnum;
import com.blueshit.cookshow.qiniu.QiniuUpload;
import com.blueshit.cookshow.shiro.ShiroMD5;
import com.blueshit.cookshow.web.basic.BaseController;
import com.blueshit.cookshow.web.controller.common.ResultEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Seven on 2015/11/26.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @RequestMapping("/forwardToLogin")
    public String forwardToLogin(ServletRequest request,HttpSession session){

        User user = (User)session.getAttribute("user");
        if(user!=null){
            return "redirect:/";
        }
        return "customer/login";
    }

    @RequestMapping("/personCenter")
    public String personCenter(){
        return "customer/user/userinfo";
    }

    @RequestMapping("/login")
    @ResponseBody
    public ResultEntity login(@ModelAttribute User user,HttpServletRequest request,HttpSession session) throws Exception{
        ResultEntity resultEntity = new ResultEntity();
        if(user.getUsername()!=null&&user.getPassword()!=null){
            User u = userService.findByUsernameOrEmail(user.getUsername());
            if(u!=null){
                //判断邮箱是否验证
                if(u.getAuthentication()==0){
                    //发送邮件
                    MailUtils.sendVerifyMail(u.getEmail(), u.getUsername(), getDomainName(request) + "/user/validateEmail");
                    resultEntity.setFailureMsg("请认证邮箱之后再登录");
                }else{
                    if(u.getPassword().equals(ShiroMD5.getMd5WithSalt(user.getPassword(),u.getSalt()))){
                        //登录成功
                        session.setAttribute("user",u);
                        //成功
                        resultEntity.setSuccessMsg("登录成功");
                    }else{
                        resultEntity.setFailureMsg("账号或密码错误！");
                    }
                }
            }
        }else{
            resultEntity.setFailureMsg("账号或密码错误");
        }
        return resultEntity;
    }


    @RequestMapping("/register")
    @ResponseBody
    public ResultEntity register(HttpServletRequest request,@ModelAttribute User user,String captcha,Model model) {
        ResultEntity resultEntity = new ResultEntity();
        try{
            if (user != null && user.getUsername() != null && user.getPassword() != null && user.getEmail() != null) {
            //判断用户名是否存在
            User olduser = userService.findByUsername(user.getUsername());
            //校验邮箱是否存在
            User oldemailUser = userService.findByEmail(user.getEmail());
            //校验邮箱是否验证
            //验证码
            String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
            if (olduser != null) {
                resultEntity.setFailureMsg("用户名已经存在！");
            } else if (oldemailUser != null) {
                resultEntity.setFailureMsg("邮箱已经存在！");
            } else if (sessionCaptcha == null || !sessionCaptcha.equals(captcha)) {
                resultEntity.setFailureMsg("验证码不正确！");
            } else {
                User u = new User();
                String salt = UUIDCreator.generateUUID();
                u.setSalt(salt);
                u.setCreateDate(new Date());
                u.setUpdateDate(new Date());
                u.setUsername(user.getUsername());
                u.setPassword(ShiroMD5.getMd5WithSalt(user.getPassword(), salt));
                u.setEmail(user.getEmail());
                userService.save(u);
                //发送邮件
                MailUtils.sendVerifyMail(u.getEmail(), u.getUsername(), getDomainName(request) + "/user/validateEmail");
                resultEntity.setSuccessMsg("注册成功,请及时认证邮箱！");
            }
            model.addAttribute("resultEntity", resultEntity);
        } else {
            resultEntity.setFailureMsg("非法提交!");
        }
    }catch(Exception e) {
        e.printStackTrace();
        resultEntity.setExceptionMsg("服务器异常");
    }
        return resultEntity;
    }

    @RequestMapping("/validateEmail")
    public String validateEmail(String token,String username,Model model){

        ResultEntity resultEntity = new ResultEntity();

        String validateStr = ShiroMD5.getMd5WithSalt(username,MailUtils.SALT);

        if(validateStr.equals(token)){
            //找出该用户
            User user = userService.findByUsername(username);
            if(user.getAuthentication()==0){
                //更新
                user.setAuthentication(1);
                userService.update(user);
                resultEntity.setSuccessMsg("邮箱验证成功！");
            }else{
                //已经失效
                resultEntity.setFailureMsg("该链接已经失效！");
            }
        }else{
            //非法修改url
            return "redirect:/error_404";
        }
        model.addAttribute("resultEntity",resultEntity);
        return "customer/common/msg";
    }



    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(@ModelAttribute User user,String userBirthday,HttpSession session){
        //从session中获取user
        User u = (User)session.getAttribute("user");
        //日期特殊处理
        if(u!=null){
            System.out.println();
            User oldUser = userService.findByUsername(u.getUsername());
            oldUser.setRealName(user.getRealName());
            oldUser.setPhone(user.getPhone());
            oldUser.setBirthday(MyDataUtils.StringToDate(userBirthday,"yyyy-MM-dd"));
            oldUser.setIntro(user.getIntro());
            oldUser.setGender(user.getGender());
            //更新
            userService.update(oldUser);
            //更新session的user
            session.setAttribute("user", oldUser);
        }
        return "redirect:/user/personCenter";
    }


    @RequestMapping("/updatePassword")
    @ResponseBody
    public ResultEntity updatePassword(String oldpassword,String newpassword,HttpSession session){

        ResultEntity resultEntity = new ResultEntity();
        if(oldpassword!=null&&newpassword !=null){
            //从session找出该用户
            User u = (User)session.getAttribute("user");
            //从数据库中找出该用户
            User user = userService.findByUsername(u.getUsername());
            //校验旧的密码是否正确
            if(user.getPassword().equals(ShiroMD5.getMd5WithSalt(oldpassword,user.getSalt()))){
                //修改密码
                user.setPassword(ShiroMD5.getMd5WithSalt(newpassword,user.getSalt()));
                userService.update(user);
                resultEntity.setSuccessResult();
            }else{
                resultEntity.setFailureMsg("密码输入错误！");
            }
        }else{
            resultEntity.setFailureMsg("不能为空！");
        }
        return resultEntity;
    }


    @RequestMapping("/validateOldPassword")
    @ResponseBody
    public ResultEntity validateOldPassword(String oldPassword){
        ResultEntity resultEntity = new ResultEntity();



        return resultEntity;
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){

        //移除session
        session.removeAttribute("user");

        return "redirect:/";
    }

    @RequestMapping("/uploadFace")
    @ResponseBody
    public ResultEntity uploadFace(HttpServletRequest request) throws Exception{
        ResultEntity resultEntity = new ResultEntity();
        // 设置上下方文
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 检查form是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 由CommonsMultipartFile继承而来,拥有上面的方法.
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    String originalFilename =file.getOriginalFilename();
                    String fileName = MyDataUtils.DateToString(new Date(),"yyyyMMddHHmmSS")+originalFilename;
                    String url = QiniuUpload.upload(file,fileName);
                    User user = getCurrentUser(request.getSession());
                    user.setFace(url);
                    userService.update(user);
                    //更新session
                    request.getSession().setAttribute("user", user);
                    resultEntity.setSuccessMsg("上传成功!");
                }
            }
        }
        return resultEntity;
    }

    @RequestMapping("/personWork/{userId}")
    public String personWork(@PathVariable String userId,
                             Model model,
                             String target,
                             Integer cookbookpageNum,
                             Integer menupageNum,
                             Integer productionpageNum,
                             Integer collectionCookbookpageNum,
                             Integer collectionMenupageNum,
                             HttpServletRequest request){
        cookbookpageNum = cookbookpageNum==null||cookbookpageNum<=0?1:cookbookpageNum;
        menupageNum = menupageNum==null||menupageNum<=0?1:menupageNum;
        productionpageNum = productionpageNum==null||productionpageNum<=0?1:productionpageNum;
        collectionCookbookpageNum = collectionCookbookpageNum==null||collectionCookbookpageNum<=0?1:collectionCookbookpageNum;
        collectionMenupageNum = collectionMenupageNum==null||collectionMenupageNum<=0?1:collectionMenupageNum;

        User user = userService.findById(Long.parseLong(userId));
        if(user!=null){
            //处理target，跳转到指定标签页
            if(!"".equals(target)){
                model.addAttribute("target",target);
            }
            //用户信息
            model.addAttribute("userInfo",user);
            //查询菜谱
            Page cookbookPage = cookbookService.findByUserId(user.getId(),cookbookpageNum);
            model.addAttribute("cookbookPage",cookbookPage);
            //查询菜单
            Page menuPage = menuService.getMenuByUserId(user.getId(),menupageNum);
            model.addAttribute("menuPage",menuPage);
            //查询作品
            Page productionPage = productionService.getProductionByUserId(user.getId(),productionpageNum,20);
            model.addAttribute("productionPage",productionPage);
            //查询我收藏的菜谱
            Page collectionCookbookPage = collectionService.findByUserId(user.getId(), CollectionEnum.COOKBOOK.getCode(),collectionCookbookpageNum,20);
            collectionCookbookPage = getCollectionObject(collectionCookbookPage);
            model.addAttribute("collectionCookbookPage",collectionCookbookPage);
            //查询我收藏的菜单

            Page collectionMenuPage = collectionService.findByUserId(user.getId(),CollectionEnum.MENU.getCode(),collectionMenupageNum,20);
            collectionMenuPage = getCollectionObject(collectionMenuPage);
            model.addAttribute("collectionMenuPage",collectionMenuPage);
            //查询是否已关注
            User currentUser=(User) request.getSession().getAttribute("user");
            if(currentUser!=null){
            	  if(currentUser.getId()!=Long.parseLong(userId)){
                   	model.addAttribute("tag", 1);
            	  }
	            Relation relation=relationService.getFocusOnFriend(currentUser.getId(), user.getId());
	            model.addAttribute("relation",relation);
            }
        }else{
            return "redirect:/error_404";
        }
        return "customer/user/personwork";
    }


    @RequestMapping("/validateLogin")
    @ResponseBody
    public ResultEntity validateLogin(HttpServletRequest request,String username,String email,String captcha){
        ResultEntity resultEntity = new ResultEntity();
        //用户名
        User user = userService.findByUsername(username);
        if(user!=null){
            resultEntity.setFailureMsg("用户名已经存在!");
            return resultEntity;
        }
        //邮箱
        user = userService.findByEmail(email);
        if(user!=null){
            resultEntity.setFailureMsg("邮箱已经存在!");
            return resultEntity;
        }
        //验证码
        String sessionCaptcha = (String)request.getSession().getAttribute("captcha");
        if(sessionCaptcha==null||!sessionCaptcha.equals(captcha)){
            resultEntity.setFailureMsg("验证码不正确");
            return resultEntity;
        }
        //如果以上都成立
        resultEntity.setSuccessMsg("success");
        return resultEntity;

    }


    @RequestMapping("/forgetPassword")
    @ResponseBody
    public ResultEntity forgetPassword(HttpServletRequest request,String username) throws Exception{
        ResultEntity resultEntity = new ResultEntity();
        if(username!=null){
            User user = userService.findByUsernameOrEmail(username);
            if(user!=null){
                //发送邮件
                MailUtils.sendForgetPasswordMail(user.getEmail(), user.getUsername(), getDomainName(request) + "/user/resetPassword");

                resultEntity.setSuccessMsg("我们已经发邮件到您注册的邮箱，请注意查收！");
            }else{
                resultEntity.setFailureMsg("您输入的用户名不存在！");
            }
        }else{
            resultEntity.setFailureMsg("非法访问！");
        }
        return resultEntity;
    }

    @RequestMapping("/resetPassword")
    public String  resetPassword(String token,String username,Model model){

        ResultEntity resultEntity = new ResultEntity();

        String validateStr = ShiroMD5.getMd5WithSalt(username,MailUtils.SALT);

        if(validateStr.equals(token)){
            //找出该用户
            User user = userService.findByUsername(username);
            //重置密码
            user.setPassword(ShiroMD5.getMd5WithSalt("123456",user.getSalt()));
            userService.update(user);
            resultEntity.setSuccessMsg("您好，您的密码重置为123456，请及时登录然后到个人中心修改自己的密码");
        }else{
            //非法修改url
            return "redirect:/error_404";
        }
        model.addAttribute("resultEntity",resultEntity);
        return "customer/common/msg";
    }

    /**
     * 获取收藏实体
     * @param page
     * @return
     */
    private Page getCollectionObject(Page page){

        List<Collection> list = page.getList();
        List<Object> resultList = new ArrayList<Object>();
        for(Collection collection : list){
            if(collection.getType()==CollectionEnum.COOKBOOK.getCode()){
                resultList.add(cookbookService.findById(collection.getObjectId()));
            }else{
                resultList.add(menuService.findById(collection.getObjectId()));
            }
        }
        page.setList(resultList);
        return page;
    }




}
