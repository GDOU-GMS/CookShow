<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/personwork.css">


    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/resources/customer/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.SuperSlide.2.1.js"></script>
</head>

<body>
<div class="csw">
    <div id="top">
        <div id="navigation">
            <div  class="navcenter">
                <div class="seach" >
                    <input type="text" class="form-control" id="exampleInputName2" placeholder="搜索商品或菜单" >
                    <button class="btn btn-default" >搜索</button>
                </div>
                <div class="landr">
                    <div style="float:left;">
                        <a class="btn btn1" href="#" role="button">登录</a>
                        <a class="btn btn1" href="#" role="button">注册</a>
                    </div>

                    <ul id="personcenter" style="float:left;">
                        <li style="width:110px;"><a class="btn btn1" href="#" role="button">个人中心</a>
                            <ul>
                                <li><a href="userinfo.html">账号设置</a></li>
                                <li><a href="personwork.html">我的菜单</a></li>
                                <li><a href="myfriends.html">关注的好友</a></li>
                                <li><a href="#">退出</a></li>
                            </ul>
                        </li>

                    </ul>

                </div><!--landr-->

            </div>
        </div>
    </div>
    <div id="navfont">
        <div id="navcontent">

            <ul class="nav nav-pills">
                <li role="presentation" class="cbook "><span>全部分类</span></li>
                <li role="presentation" class="active"><a href="index.html">首页</a></li>
                <li role="presentation"><a href="cookmenu.html">菜单</a></li>
                <li role="presentation"><a href="#">健康饮食</a></li>
                <li role="presentation"><a href="#">作品动态</a></li>
            </ul>

        </div>

    </div>

    <div id="content">
        <div class="cscontent">
            <div class="media mediainfo" style="margin-top:20px;">
                <div class="media-left mediainfoleft" >
                    <a href="#">
                        <img class="media-object" src="${userInfo.face}" alt="...">
                    </a>
                </div>
                <div class="media-body  mediainforight">
                    <h2 class="media-heading" >${userInfo.username}的厨房</h2>
                    <div class="intro">
                        <span><fmt:formatDate value="${userInfo.createDate}" pattern="yyyy-MM-dd"/>加入 </span>
                        <p>${userInfo.intro}</p>
                    </div>
                </div>
                <div class="media-body">
                    <a class="btn btn-default createcss">关注</a>
                   <div class="media-body mediainforight">
                       <a class="mediainforight">关注的人</a>
                       <a class="mediainforight">被关注</a>
                   </div>
                </div>
            </div><!--end  media-->


            <div>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active"><a href="#gaikuang" aria-controls="gaikuang" role="tab" data-toggle="tab">概况</a></li>
                    <li role="presentation" ><a href="#mymenu" aria-controls="home" role="tab" data-toggle="tab">菜单</a></li>

                    <li role="presentation"><a href="#pwd" aria-controls="messages" role="tab" data-toggle="tab">菜谱</a></li>
                    <li role="presentation"><a href="#personimage" aria-controls="settings" role="tab" data-toggle="tab">收藏</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content tagstyle">


                    <div role="tabpanel" class="tab-pane active" id="gaikuang">
                        <div class="creatediv">

                            <div class="row showimg">
                                <div class="col-sm-6 col-md-4"style="width:100%;padding:0px;">
                                    <div class="thumbnail">
                                        <img src="images/255.png" alt="..." style="margin:0px 30x;margin-top:25px;">
                                        <div class="caption">

                                            <h4>美美哒</h4>
                                            <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  		<p>
                                            				 btn-default" role="button">Button</a></p>-->
                                            <p>简介</p>
                                            <span style="color:#ccc;font-size:12px;">2015/01/01</span>
                                        </div>
                                    </div>
                                </div>

                            </div><!--  end row-->


                            <div class="row showimg imgright">
                                <div class="col-sm-6 col-md-4"style="width:100%;padding:0px;">
                                    <div class="thumbnail">
                                        <img src="images/255.png" alt="..." style="margin:0px 30x;margin-top:25px;">
                                        <div class="caption">

                                            <h4>美美哒</h4>
                                            <p>简介</p>
                                            <span style="color:#ccc;font-size:12px;">2015/01/01</span>
                                        </div>
                                    </div>
                                </div>

                            </div><!--  end row-->


                            <div class="row showimg imgright">
                                <div class="col-sm-6 col-md-4"style="width:100%;padding:0px;">
                                    <div class="thumbnail">
                                        <img src="images/255.png" alt="..." style="margin:0px 30x;margin-top:25px;">
                                        <div class="caption">

                                            <h4>美美哒</h4>
                                            <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn
                                            				 btn-default" role="button">Button</a></p>-->
                                            <p>简介</p>
                                            <span style="color:#ccc;font-size:12px;">2015/01/01</span>
                                        </div>
                                    </div>
                                </div>

                            </div><!--  end row-->


                        </div>

                    </div><!-- mymenu-->



                    <div role="tabpanel" class="tab-pane" id="mymenu">
                        <div class="creatediv">
                            <a class="btn btn-default createcss" href="createnewmenu.html" role="button">创建新菜单</a>
                        </div>
                        <div class="menuname">
                            <a  href="#" role="button">菜单名称</a>

                            <a  href="#" role="button">菜单名称</a>
                            <a  href="#" role="button">菜单名称</a>
                        </div>

                    </div><!-- mymenu-->

                    <div role="tabpanel" class="tab-pane" id="pwd">
                        <a class="btn btn-default createcss" href="${pageContext.request.contextPath}/cookbook/createCookbook" role="button">创建新菜谱</a>

                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <a href="cookbook.html"><img src="images/255.png" alt="..."></a>
                                    <div class="caption">
                                        <h3>最佳情书</h3>
                                        <p>早就想做这个菜了，一直都是在川菜馆里才会点的菜，因为口感太辣，家里也没敢真尝试着做，昨天LG说，今天休息可以在家吃饭，猫很开心，就做了这</p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="personimage">


                    </div>

                    <div role="tabpanel" class="tab-pane" id="settings">...</div>
                </div>

            </div>



        </div><!--end cscontent -->
    </div><!--end  content-->


    <div id="pagebottom">
        <div class="cspagebottom">
            <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
        </div>
    </div><!--pagebottom-->



</div>

</body>
</html>