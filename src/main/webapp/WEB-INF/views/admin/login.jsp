<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/27
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
Beyond Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3
Version: 1.0.0
Purchase: http://wrapbootstrap.com
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<!--Head-->
<head>
    <meta charset="utf-8" />
    <title>登录</title>

    <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/fonts_useso_com.css" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/beyond.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css" rel="stylesheet" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/skins.min.js"></script>
</head>
<!--Head Ends-->
<!--Body-->
<body>
<div class="login-container animated fadeInDown">
    <div class="loginbox bg-white">
        <form id="loginForm"  method="post">
            <div class="loginbox-title">秀厨网后台管理系统</div>
            <div class="loginbox-social">
                <div class="social-title ">欢迎</div>
            </div>
            <div class="loginbox-or">
            </div>
            <div class="loginbox-textbox">
                <input type="text" class="form-control" name="username" id="username" placeholder="用户名" required />
            </div>
            <div class="loginbox-textbox">
                <input type="password" class="form-control" name="password" id="password" placeholder="密码" required />
            </div>
            <div class="loginbox-forgot">
                <a href="">忘记密码</a>
            </div>
            <div class="loginbox-submit">
                <input type="submit" class="btn btn-primary btn-block" value="登录"/>
            </div>
        </form>
    </div>

</div>

<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>

<!--Beyond Scripts-->
<script src="${pageContext.request.contextPath}/resources/assets/js/beyond.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery_form/jquery.form.min.js"></script>

<script>

    $(document).ready(function(){
        var options = {
            beforeSubmit:  showRequest,  //提交前处理
            success:       showResponse,  //处理完成
            resetForm:     true,
            url:           '/adminLogin',
            dataType:      'json'
        };

        $('#loginForm').submit(function() {
            $(this).ajaxSubmit(options);
            // !!! Important !!!
            // always return false to prevent standard browser submit and page navigation
            return false;
        });

        function showRequest(formData, jqForm, options) {
            return true;
        }

        function showResponse(responseText, statusText,xhr, $form)  {
            var result = responseText.result;
            if(result==0||result==-1){
                alert(responseText.msg)
            }else{
                window.location.href="/admin/index";
            }
        }
    })

</script>
</body>
<!--Body Ends-->
</html>

