<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/27
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript">
        $(function () {
            $('#owl-demo').owlCarousel({
                items: 1,
                navigation: true,
                navigationText: ["上一个", "下一个"],
                autoPlay: true,
                stopOnHover: true
            }).hover(function () {
                $('.owl-buttons').show();
            }, function () {
                $('.owl-buttons').hide();
            });


            $('#userinfo li').hover(function () {
                $(this).children('ul').stop(true, true).show('slow');
            }, function () {
                $(this).children('ul').stop(true, true).hide('slow');
            });

            $('#userinfo li').hover(function () {
                $(this).children('div').stop(true, true).show('slow');
            }, function () {
                $(this).children('div').stop(true, true).hide('slow');
            });
        });
    </script>


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
                    <!--
                    <ul id="userinfo">
                    <li ><a class="btn btn1" href="#" role="button">用户名</a></li>
                       <ul style="display:none;" >
                          <li><a href="">我的个人信息</a></li>
                          <li><a href="">我的收藏</a></li>
                       </ul>
                    </ul>
                    -->

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

                <div>

                </div>
            </div>
        </div>
        <div id="content">
            <div class="cscontent">
                <div class="csleft">
                    <div class="banner">
                        <ul id="csnav">
                            <li id="mainCate-1" class="mainCate">
                                <h3><span>&gt;</span><a href="http://sc.admin5.com/">白酒</a></h3>

                                <p><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                        href="http://sc.admin5.com/">国窖1573</a></p>

                                <p><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a
                                        href="http://sc.admin5.com/">贵州</a><a href="http://sc.admin5.com/">四川</a></p>

                                <div class="subCate" style="display: none;">
                                    <ul id="sub-ul-1">
                                        <h4>品牌</h4>
                                        <li><span><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                                href="http://sc.admin5.com/">国窖1573</a><a href="http://sc.admin5.com/">郎酒</a><a
                                                href="http://sc.admin5.com/">汾酒</a></span> <span><a
                                                href="http://sc.admin5.com/" class="sub_width">剑南春</a><a
                                                href="http://sc.admin5.com/">泸州老窖</a><a
                                                href="http://sc.admin5.com/">水井坊</a><a
                                                href="http://sc.admin5.com/">洋河</a><a href="http://sc.admin5.com/"
                                                                                      class="sub_width">金六福</a></span><span><a
                                                href="http://sc.admin5.com/">牛栏山</a><a
                                                href="http://sc.admin5.com/">丰谷</a><a
                                                href="http://sc.admin5.com/">杜康</a><a
                                                href="http://sc.admin5.com/">景芝</a><a href="http://sc.admin5.com/"
                                                                                      class="sub_width1">河套</a><a
                                                href="http://sc.admin5.com/" class="sub_width">红楼梦</a></span></li>
                                        <li><span><a href="http://sc.admin5.com/">古贝春</a><a
                                                href="http://sc.admin5.com/">宋河</a><a
                                                href="http://sc.admin5.com/">泰山</a><a
                                                href="http://sc.admin5.com/">青花瓷</a><a
                                                href="http://sc.admin5.com/">董酒</a></span><span><a
                                                href="http://sc.admin5.com/" class="sub_width">唐王宴</a><a
                                                href="http://sc.admin5.com/">红星</a><a
                                                href="http://sc.admin5.com/">皖酒</a><a
                                                href="http://sc.admin5.com/">古井</a><a
                                                href="http://sc.admin5.com/">西凤</a><a href="http://sc.admin5.com/"
                                                                                      class="sub_width">伊力特</a></span>
                                        </li>
                                        <li><span><a href="http://sc.admin5.com/">小糊涂仙</a><a
                                                href="http://sc.admin5.com/">醉卿</a><a
                                                href="http://sc.admin5.com/">诗仙太白</a><a
                                                href="http://sc.admin5.com/">沱牌</a><a href="http://sc.admin5.com/"
                                                                                      class="sub_width1">四特</a></span><span><a
                                                href="http://sc.admin5.com/">汾阳王 </a><a
                                                href="http://sc.admin5.com/">白云边</a><a
                                                href="http://sc.admin5.com/">珍酒</a><a href="http://sc.admin5.com/"
                                                                                      class="sub_width">扳倒井</a><a
                                                href="http://sc.admin5.com/">金门高粱</a></span><span><a
                                                href="http://sc.admin5.com/">永不分梨</a><a
                                                href="http://sc.admin5.com/">国台</a><a
                                                href="http://sc.admin5.com/">孔府家</a><a
                                                href="http://sc.admin5.com/">舍得</a><a
                                                href="http://sc.admin5.com/">今世缘</a></span>
                                        </li>
                                    </ul>
                                    <ul id="sub-ul-2">
                                        <h4>香型</h4>
                                        <li><span><a href="http://sc.admin5.com/">酱香型</a><a
                                                href="http://sc.admin5.com/">浓香型</a><a
                                                href="http://sc.admin5.com/">清香型</a><a
                                                href="http://sc.admin5.com/">馥郁香型</a></span><span><a
                                                href="http://sc.admin5.com/" class="sub_width">兼香型</a><a
                                                href="http://sc.admin5.com/">特香型</a><a
                                                href="http://sc.admin5.com/">芝麻香型</a><a
                                                href="http://sc.admin5.com/">豉香型</a></span><span><a
                                                href="http://sc.admin5.com/">董香型</a><a
                                                href="http://sc.admin5.com/">凤香型</a><a href="http://sc.admin5.com/">老白干香型</a><a
                                                href="http://sc.admin5.com/">復合香</a></span><span><a
                                                href="http://sc.admin5.com/" class="sub_width">荞香型</a><a
                                                href="http://sc.admin5.com/">青稞清香型</a><a href="http://sc.admin5.com/">米香型</a><a
                                                href="http://sc.admin5.com/">其他</a></span></li>
                                    </ul>
                                </div>
                            </li>
                            <li id="mainCate-2" class="mainCate evenLeval">
                                <h3><span>&gt;</span><a href="http://sc.admin5.com/">葡萄酒</a></h3>

                                <p><a href="http://sc.admin5.com/">法国</a><a href="http://sc.admin5.com/">德国</a><a
                                        href="http://sc.admin5.com/">意大利</a><a href="http://sc.admin5.com/">西班牙</a></p>

                                <p><a href="http://sc.admin5.com/">赤霞珠</a><a href="http://sc.admin5.com/">梅鹿辄</a><a
                                        href="http://sc.admin5.com/">西拉</a><a href="http://sc.admin5.com/">霞多丽</a></p>

                                <div class="subCate" style="display: none;">
                                    <div style="height:300px;"> 葡萄酒</div>
                                </div>
                            </li>
                            <li id="mainCate-3" class="mainCate">
                                <h3><span>&gt;</span><a href="http://sc.admin5.com/">洋酒</a></h3>

                                <p><a href="http://sc.admin5.com/">白兰地</a><a href="http://sc.admin5.com/">威士忌</a><a
                                        href="http://sc.admin5.com/">伏特加</a><a href="http://sc.admin5.com/">金酒</a></p>

                                <p><a href="http://sc.admin5.com/">人头马</a><a href="http://sc.admin5.com/">芝华士</a><a
                                        href="http://sc.admin5.com/">马爹利</a><a href="http://sc.admin5.com/">深蓝</a></p>

                                <div class="subCate" style="display: none;">
                                    <div style="height:300px;"> 洋酒</div>
                                </div>
                            </li>
                            <li id="mainCate-4" class="mainCate evenLeval">
                                <h3><span>&gt;</span><a href="http://sc.admin5.com/">啤酒</a></h3>

                                <p><a href="http://sc.admin5.com/">弗伦斯堡</a><a href="http://sc.admin5.com/">哈尔博</a><a
                                        href="http://sc.admin5.com/">喜力</a><a href="http://sc.admin5.com/">海特</a></p>

                                <p><a href="http://sc.admin5.com/">青岛啤酒</a><a href="http://sc.admin5.com/">百威</a><a
                                        href="http://sc.admin5.com/">雪花</a><a href="http://sc.admin5.com/">德国</a></p>

                                <div class="subCate" style="display: none;">
                                    <div style="height:300px;"> 啤酒</div>
                                </div>
                            </li>
                            <li id="mainCate-5" class="mainCate">
                                <h3><span>&gt;</span><a href="http://sc.admin5.com/">保健酒/</a><a
                                        href="http://sc.admin5.com/">黄酒</a></h3>

                                <p><a href="http://sc.admin5.com/">青梅</a><a href="http://sc.admin5.com/">竹叶青</a><a
                                        href="http://sc.admin5.com/">劲牌</a><a href="http://sc.admin5.com/">椰岛</a></p>

                                <p><a href="http://sc.admin5.com/">宁夏红</a><a href="http://sc.admin5.com/">唐宋</a><a
                                        href="http://sc.admin5.com/">即墨</a><a href="http://sc.admin5.com/">会稽山</a></p>

                                <div class="subCate" style="display: none;">
                                    <div style="height:300px;"> 保健酒</div>
                                </div>
                            </li>

                        </ul>
                    </div>

                </div>
                <div class="csright">
                    <div id="owl-demo" class="owl-carousel">
                        <a class="item" href="" target="_blank"><img
                                src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                style="width:750px;height:435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
                        <a class="item" href="" target="_blank"><img
                                src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                style="width:750px;height:435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
                        <a class="item" href="" target="_blank"><img style="width:750px;height:435px;"
                                                                     src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                                                     alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
                        <a class="item" href="" target="_blank"><img
                                src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                style="width:750px;height:435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
                        <a class="item" href="" target="_blank"><img
                                src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                style="width:750px;height:435px;" alt=""><b></b><span>锐秀厨网美食狂欢登场</span></a>
                        <a class="item" href="" target="_blank"><img
                                src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                style="width:750px;height:435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
                        <a class="item" href="" target="_blank"><img
                                src="${pageContext.request.contextPath}/resources/customer/images/13.jpg"
                                style="width:750px;height:435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
                    </div>


                </div>


            </div>

        </div>
        <!--中间内容结束-->
        <div class="contentbottom">
            <div class="csbottom">
                <div class="row showimg">
                    <div class="col-sm-6 col-md-4" style="width:100%;padding:0px;">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..."
                                 style="margin:0px 30x;margin-top:25px;">

                            <div class="caption">

                                <h4>美美哒</h4>
                                <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
                            </div>
                        </div>
                    </div>

                </div>
                <!--  end row-->

                <div class="row showimg imgright">
                    <div class="col-sm-6 col-md-4" style="width:100%;padding:0px;">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..."
                                 style="margin:0px 30x;margin-top:25px;">

                            <div class="caption">

                                <h4>美美哒</h4>
                                <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
                            </div>
                        </div>
                    </div>

                </div>
                <!--  end row-->
                <div class="row showimg imgright">
                    <div class="col-sm-6 col-md-4" style="width:100%;padding:0px;">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..."
                                 style="margin:0px 30x;margin-top:25px;">

                            <div class="caption">

                                <h4>美美哒</h4>
                                <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
                            </div>
                        </div>
                    </div>

                </div>
                <!--  end row-->


                <div class="row showimg">
                    <div class="col-sm-6 col-md-4" style="width:100%;padding:0px;">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..."
                                 style="margin:0px 30x;margin-top:25px;">

                            <div class="caption">

                                <h4>美美哒</h4>
                                <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
                            </div>
                        </div>
                    </div>

                </div>
                <!--  end row-->

                <div class="row showimg imgright">
                    <div class="col-sm-6 col-md-4" style="width:100%;padding:0px;">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..."
                                 style="margin:0px 30x;margin-top:25px;">

                            <div class="caption">

                                <h4>美美哒</h4>
                                <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
                            </div>
                        </div>
                    </div>

                </div>
                <!--  end row-->
                <div class="row showimg imgright">
                    <div class="col-sm-6 col-md-4" style="width:100%;padding:0px;">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..."
                                 style="margin:0px 30x;margin-top:25px;">

                            <div class="caption">

                                <h4>美美哒</h4>
                                <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
                            </div>
                        </div>
                    </div>

                </div>
                <!--  end row-->

            </div>
            <!--csbottom-->

        </div>
        <!-- end contentbottom-->

        <div id="pagebottom">
            <div class="cspagebottom">
                <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
            </div>
        </div>
        <!--pagebottom-->

    </div>


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
