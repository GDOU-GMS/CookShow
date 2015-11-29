<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <script src="js/jquery.min.js"></script>

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
                    <div style="float:left;">
                        <a class="btn btn1" href="#" role="button">登录</a>
                        <a class="btn btn1" href="#" role="button">注册</a>
                    </div>

                    <ul id="personcenter" style="float:left;">
                        <li style="width:110px;"><a class="btn btn1" href="#" role="button">个人中心</a>
                            <ul>
                                <li><a href="#">账号设置</a></li>
                                <li><a href="#">我的菜单</a></li>
                                <li><a href="#">退出</a></li>
                            </ul>
                        </li>

                    </ul>

                </div>
                <!--landr-->

            </div>
        </div>
    </div>
    <div id="navfont">
        <div id="navcontent">

            <ul class="nav nav-pills">
                <li role="presentation" class="cbook "><span>全部分类</span></li>
                <li role="presentation" class="active"><a href="#">首页</a></li>
                <li role="presentation"><a href="#">菜谱大全</a></li>
                <li role="presentation"><a href="#">菜单</a></li>
                <li role="presentation"><a href="#">作品动态</a></li>
                <li role="presentation"><a href="#">我的菜单</a></li>
            </ul>
        </div>

    </div>

    <div id="content">
        <div class="cscontent">
            <h3>我的菜单</h3>

            <div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#mymenu" aria-controls="home" role="tab"
                                                              data-toggle="tab">菜单</a></li>

                    <li role="presentation"><a href="#pwd" aria-controls="messages" role="tab" data-toggle="tab">菜谱</a>
                    </li>
                    <li role="presentation"><a href="#personimage" aria-controls="settings" role="tab"
                                               data-toggle="tab">收藏</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content tagstyle">
                    <div role="tabpanel" class="tab-pane active" id="mymenu">
                        <div class="creatediv">
                            <a class="btn btn-default createcss" href="createnewmenu.html" role="button">创建新菜单</a>
                        </div>
                        <div class="menuname">
                            <a href="#" role="button">菜单名称</a>

                            <a href="#" role="button">菜单名称</a>
                            <a href="#" role="button">菜单名称</a>
                        </div>

                    </div>
                    <!-- mymenu-->

                    <div role="tabpanel" class="tab-pane" id="pwd">
                        <a class="btn btn-default createcss" href="createnewmenu.html" role="button">创建新菜谱</a>

                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="images/255.png" alt="...">

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


        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->


</div>

</body>
</html>
