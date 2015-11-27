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
    <link rel="shortcut icon" href="/resources/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="/resources/assets/css/font-awesome.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link href="/resources/assets/css/beyond.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/demo.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="/resources/assets/js/skins.min.js"></script>
</head>
<!--Head Ends-->
<!--Body-->
<body>
<div class="login-container animated fadeInDown">
    <div class="loginbox bg-white">
        <div class="loginbox-title">秀厨网后台管理系统</div>
        <div class="loginbox-social">
            <div class="social-title ">WELCOME</div>

        </div>
        <div class="loginbox-or">
        </div>
        <div class="loginbox-textbox">
            <input type="text" class="form-control" placeholder="UserName" />
        </div>
        <div class="loginbox-textbox">
            <input type="text" class="form-control" placeholder="Password" />
        </div>
        <div class="loginbox-forgot">
            <a href="">忘记密码</a>
        </div>
        <div class="loginbox-submit">
            <input type="button" class="btn btn-primary btn-block" value="登录">
        </div>
    </div>
    <div class="logobox">
    </div>
</div>

<!--Basic Scripts-->
<script src="/resources/assets/js/jquery-2.0.3.min.js"></script>
<script src="/resources/assets/js/bootstrap.min.js"></script>

<!--Beyond Scripts-->
<script src="/resources/assets/js/beyond.js"></script>

<!--Google Analytics::Demo Only-->
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-52103994-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
<!--Body Ends-->
</html>

