<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/27
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>秀厨网</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/csnav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/csimg.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/resources/customer/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.SuperSlide.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customer/js/owl.carousel.js"></script>


</head>

<body>
<div class="csw">
    <div id="top">
        <div id="navigation">
            <div style="float:left;margin-left:190px;width:320px;height:112px;padding-top:40px;">
                <img style="width:200px;height:75px;"src="${pageContext.request.contextPath}/resources/customer/images/newlogo.png">
            </div>
            <div class="navcenter">
                <form action="${pageContext.request.contextPath}/cookbook/findByTitle" method="post">
                    <div class="seach">
                        <input type="text" name="title" class="form-control" id="exampleInputName2"
                               placeholder="搜索菜单或菜谱">
                        <button class="btn btn-default">搜索</button>
                    </div>
                </form>
                <div class="landr" style="">
                    <div style="float: left;">
                        <div style="float:left;">
                            <c:if test="${user!=null}">
                                <a class="btn btn1" href="${pageContext.request.contextPath}/user/personCenter">
                                    欢迎，${user.username}
                                </a>
                            </c:if>
                            <c:if test="${user==null}">
                                <a class="btn btn1"
                                   href="${pageContext.request.contextPath}/user/forwardToLogin"
                                   role="button">登录/注册</a>
                            </c:if>
                        </div>
                    </div>
                    <c:if test="${!empty user }">
                        <ul id="personcenter" style="float: left;">
                            <li style="width: 110px;"><a class="btn btn1"
                                                         href="${pageContext.request.contextPath}/user/personWork/${user.id==null ? 0 : user.id}"
                                                         role="button">个人中心</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/user/personCenter">账号设置</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/personWork/${user.id==null ? 0 : user.id}">我的厨房</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/personWork/${user.id==null ? 0 : user.id}?target=mymenu">我的菜单</a></li>
                                    <li><a href="${pageContext.request.contextPath}/relation/getAllrelation/${user.id==null ? 0 : user.id}">关注的好友</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/logout">退出</a></li>
                                </ul></li>

                        </ul>
                    </c:if>
                </div>
            </div>

        </div>
        <div id="navfont">
            <div id="navcontent">
            <ul class="nav nav-pills">
                <li role="presentation" class="cbook"><a title="点击查看所有分类" href="${pageContext.request.contextPath}/classification/allClassification">全部分类</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/cookbook/listAllCookbook">菜谱</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
            </ul>
            </div>
        </div>
        <div id="content">
            <div class="cscontent">

                <h3>编辑作品</h3>
                <form class="form-horizontal" METHOD="post" action="${pageContext.request.contextPath}/production/modifyProduction" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${production.id}">
                    <div class="form-group">
                        <label for="file0" class="col-sm-2 control-label">选择文件</label>
                        <div class="col-sm-10">
                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="titleImg" id="file0" multiple required="required"  /><br>
                            <img class="media-object" src="${production.titleImage}"  alt="..." style="width:748px;height:475px;cursor:pointer;background:url(${pageContext.request.contextPath}/resources/customer/images/tj.png)"  id="img0" onClick="tempClick0('file0')" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="intro" class="col-sm-2 control-label">心得</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="intro" rows="3" name="intro" style="width:600px" required="required">${production.intro}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-10 col-md-offset-2">
                            <button type="submit" class="btn btn-default btnpublic">确认编辑</button>
                        </div>
                    </div>
                </form>

            </div><!--end cscontent -->

        </div>
        <!--中间内容结束-->

        <div id="pagebottom">
            <div class="cspagebottom">
                <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
            </div>
        </div>
        <!--pagebottom-->

    </div>


</div>

<script>
    $(document).ready(function(){

    });
    function tempClick0(id){
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */

            //IE浏览器实现点击图片出现文件上传界面
        document.getElementById(id).click();            //调用main_img的onclick事件
    }

    $("#file0").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#img0").attr("src", objUrl) ;
        }
    }) ;

    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
</body>
</html>
