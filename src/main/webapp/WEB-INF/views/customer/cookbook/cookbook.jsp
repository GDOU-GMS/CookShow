<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:43
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/cookmenu.css">

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
                <div class="seach">
                    <input type="text" class="form-control" id="exampleInputName2" placeholder="搜索商品或菜单">
                    <button class="btn btn-default">搜索</button>
                </div>
                <div class="landr">
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

                    <ul id="personcenter" style="float: left;">
                        <li style="width: 110px;"><a class="btn btn1"
                                                     href="${pageContext.request.contextPath}/user/personWork/${user.id==null ? 0 : user.id}"
                                                     role="button">个人中心</a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/user/personCenter">账号设置</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/personWork/${user.id==null ? 0 : user.id}?target=mymenu">我的菜单</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/logout">退出</a></li>
                            </ul></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="navfont">
        <div id="navcontent">
            <ul class="nav nav-pills">
                <li role="presentation" class="cbook"><span></span></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation"><a href="#">健康饮食</a></li>
                <li role="presentation"><a href="#">作品动态</a></li>
            </ul>
        </div>
    </div>
    <div id="content">
        <div class="cscontent">
            <div class="menuleft">
                <div class="menuimg">
                    <p>${cookbook.title}</p>
                    <div class="imgcontent">
                        <div class="imagetext">
                            <img src="${cookbook.titleImage}">
                            <div class="menushare">
                                <span>分享</span>
                                <div class="shareimg">
                                    <a href="javascript:void(0);" alt=""> <img src="${pageContext.request.contextPath}/resources/customer/images/weibo.png" style="width:36px;height:29px;"></a>
                                </div>
                            </div>
                            <a class="btn btn-default acss" href="javascript:void(0)" role="button">收藏</a>
                        </div>
                        <!--end imagetext -->
                    </div>
                    <!--imgcontent-->
                </div>
                <!--menuimg -->

                <div class="menuinfo">
                    <div class="menusubinfo">
                        <p>简介</p>
                            <span>${cookbook.intro}</span>
                    </div>
                    <div class="menusubinfo">
                        <p>用料</p>

                        <div class="table-responsive" style="width:500px;">
                            <table class="table">
                                <c:forEach items="${materialList}" var="material">
                                    <tr>
                                        <td>${material.kind}</td>
                                        <td>${material.num}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </div>

                    <div class="menusubinfo">
                        <p>做法</p>
                    </div>
                    <c:forEach items="${stepList}" var="step" varStatus="loop">
                        <div class="menusubinfo">
                            <span class="cooktag1">${loop.index + 1}</span>
                            <span class="cooktag2">${step.intro}</span>
                            <div class="cookimg">
                                <img src="${step.image}"style="width:200px;height:200px;">
                            </div>
                        </div>
                    </c:forEach>

                    <a class="btn btn-default col-md-2 col-md-offset-5" href="${pageContext.request.contextPath}/production/forwardToCreateProduction?cookbookId=${cookbook.id}" role="button">上传我的作品</a>

                </div>
                <!--menuinfo-->
                <div class="menucomment">
                    <div class="eachcomment">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk">
                                <textarea class="form-control">
                                     [随意吐槽]:
                                </textarea>

                        </div>
                        <div class="personsubmt">
                            <a class="btn btn-default" href="#" role="button">评论</a>
                        </div>
                    </div>

                    <div style="float:left;width:718px;">

                        <span style="color:#999;font-size:16px;">评论</span>


                    </div>

                    <div class="eachcomment">
                        <hr style="color:#ccc;width:718px;">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk1">

                            <span>[随意吐槽：]</span>

                            <p>都是我爱吃的哦</p>
                            <span class="fromcss">来自秀厨网</span>
                            <a href=""><span class="glyphicon glyphicon-thumbs-up dianzan"
                                             aria-hidden="true"></span></a>

                        </div>

                    </div>


                    <div class="eachcomment">
                        <hr style="color:#ccc;width:718px;">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk1">

                            <span>[随意吐槽：]</span>

                            <p>都是我爱吃的哦</p>
                            <span class="fromcss">来自秀厨网</span>
                            <a href=""><span class="glyphicon glyphicon-thumbs-up dianzan"
                                             aria-hidden="true"></span></a>

                        </div>

                    </div>
                    <div class="eachcomment">
                        <hr style="color:#ccc;width:718px;">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk1">

                            <span>[随意吐槽：]</span>

                            <p>都是我爱吃的哦</p>
                            <span class="fromcss">来自秀厨网</span>
                            <a href=""><span class="glyphicon glyphicon-thumbs-up dianzan"
                                             aria-hidden="true"></span></a>

                        </div>

                    </div>

                </div>
                <!--menucomment-->


            </div>


            <div class="cbookside">
                <div class="cbooksidecss">
                    <p>相关菜单</p>
                    <ul>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                    </ul>
                </div>
            </div>

        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->
    <div id="pagebottom">
        <div class="cspagebottom">
            <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
        </div>
    </div>
    <!--pagebottom-->

</div>
<script type="text/javascript">
    jQuery("#csnav").slide({
        type: "menu",
        titCell: ".mainCate",
        targetCell: ".subCate",
        delayTime: 0,
        triggerTime: 0,
        defaultPlay: false,
        returnDefault: true
    });
</script>
</body>
</html>

