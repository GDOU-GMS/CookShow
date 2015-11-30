<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/27
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>秀厨网登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${pageContext.request.contextPath}/resources/customer/css/login2.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/customer/js/login.js"></script>
</head>
<body>
<h1>秀厨网-CookShow</h1>

<div class="login" style="margin-top:50px;">

    <div class="header">
        <div class="switch" id="switch">
            <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
            <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>

            <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>

    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
        <!--登录-->
        <div class="web_login" id="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form action="${pageContext.request.contextPath}/user/login" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">帐号：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="u" name="username" class="inputstyle" required/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">密码：</label>
                            <div class="inputOuter" id="pArea">
                                <input type="password" id="p" name="password" class="inputstyle" required/>
                            </div>
                        </div>
                        <div class="rememberMe" id="rememberMe" style="display: block">
                            <input type="checkbox" name="rememberMe" value="1" />记住我<a  href="javascript:void(0);" style="margin-left: 50%;">忘记密码？</a>
                        </div>

                        <div style="padding-left:50px;margin-top:20px;">
                        <input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
                    </form>
                </div>
            </div>
        </div>
        <!--登录end-->
    </div>

    <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
        <div class="web_login">
            <form name="form2" id="regUser" accept-charset="utf-8" action="${pageContext.request.contextPath}/user/register" method="post">
                <ul class="reg_form" id="reg-ul">
                    <div id="userCue" class="cue">快速注册请注意格式</div>
                    <li>
                        <label for="user" class="input-tips2">用户名：</label>
                        <div class="inputOuter2">
                            <input type="text" id="user" name="username" maxlength="16" class="inputstyle2" required/>
                        </div>
                    </li>
                    <li>
                        <label for="passwd" class="input-tips2">密码：</label>
                        <div class="inputOuter2">
                            <input type="password" id="passwd" name="password" maxlength="16" class="inputstyle2" required/>
                        </div>
                    </li>
                    <li>
                        <label for="passwd2" class="input-tips2">确认密码：</label>
                        <div class="inputOuter2">
                            <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" required/>
                        </div>
                    </li>
                    <li>
                        <label for="qq" class="input-tips2">邮箱：</label>
                        <div class="inputOuter2">
                            <input type="email" id="qq" name="email" class="inputstyle2" required/>
                        </div>
                    </li>
                    <li>
                        <div class="inputArea">
                            <input type="button" id="reg" style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/>
                            <a href="javascript:void(0);" class="zcxy" target="_blank">注册协议</a>
                        </div>
                    </li>
                    <div class="cl"></div>
                </ul>
            </form>
        </div>
    </div>
    <!--注册end-->
</div>
<script>
    $(function(){
       if(${resultEntity}!=null){
            alert(${resultEntity.msg});
        }
    })

</script>
</body>
</html>
