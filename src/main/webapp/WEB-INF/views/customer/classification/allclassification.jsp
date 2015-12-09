<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/12/4
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>秀厨网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/csnavbook.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/imagestyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/cookbookstyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/userinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/allmenukinds.css">


    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/resources/customer/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.SuperSlide.2.1.js"></script>
</head>

<body>
<div class="csw">
    <div id="top">
        <div id="navigation">
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
    </div>
    <div id="navfont">
        <div id="navcontent">
             <ul class="nav nav-pills">
                <li role="presentation" class="cbook active"><a title="点击查看所有分类" href="${pageContext.request.contextPath}/classification/allClassification">全部分类</a></li>
                 <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">首页</a></li>
                 <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                 <li role="presentation"><a href="${pageContext.request.contextPath}/cookbook/listAllCookbook">菜谱</a></li>
                 <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
            </ul>
        </div>
    </div>

    <div id="content">
        <div class="cscontent">
            <br>
            <c:forEach items="${topClassificationList}" var="topClassification">
                <div class="panel panel-default kindsdiv">
                    <div class="panel-heading"><a href="#"><span class="firstmenu">${topClassification.name}</span></a></div>
                <c:forEach items="${topClassification.list}" var="secondClassification">
                    <div class="panel-body menukinds ">
                        <a href="#"><span class="secmenu">${secondClassification.name}</span></a> <a href="#"><span class="secmenu">:</span></a>
                    <c:forEach items="${secondClassification.list}" var="thirdClassification">
                            <a href="${pageContext.request.contextPath}/cookbook/findByClassificationCode/${thirdClassification.code}"><span>${thirdClassification.name}</span></a>
                    </c:forEach>
                    </div>
                </c:forEach>
                </div>
            </c:forEach>

        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->


</div>
</body>
</html>

