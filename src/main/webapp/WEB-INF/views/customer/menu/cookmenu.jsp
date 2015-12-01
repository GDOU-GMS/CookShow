<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                </div>
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
            <div class="csleft">
                <div class="banner cookmenubanner">
                    <ul id="csnav">
                        <li id="mainCate-1" class="mainCate">
                            <h3><span>&gt;</span><a href="http://sc.admin5.com/">往期头条</a></h3>
 			<div id="content">
				<div class="cscontent">
					<div class="csleft">
						<div class="banner">
							<ul id="csnav">
								<c:forEach items="${topClassificationVoList}" var="topClassification">
									<li id="mainCate-1" class="mainCate">
										<h3>
											<span>&gt;</span><a href="http://sc.admin5.com/">${topClassification.name }</a>
										</h3>
										<!-- <p>
											<a href="http://sc.admin5.com/">茅台</a><a
												href="http://sc.admin5.com/">五粮液</a><a
												href="http://sc.admin5.com/">国窖1573</a>
										</p>

                            <p><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                    href="http://sc.admin5.com/">国窖1573</a></p>

                            <p><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a
                                    href="http://sc.admin5.com/">贵州</a><a href="http://sc.admin5.com/">四川</a></p>

                            <div class="subCate" style="display: none;">
                                <ul id="sub-ul-1">
                                    <h4>品牌</h4>
                                    <li><span><a href="http://sc.admin5.com/">茅台</a><a
                                            href="http://sc.admin5.com/">五粮液 </a><a
                                            href="http://sc.admin5.com/">国窖1573</a><a
                                            href="http://sc.admin5.com/">郎酒</a><a
                                            href="http://sc.admin5.com/">汾酒</a></span> <span><a
                                            href="http://sc.admin5.com/" class="sub_width">剑南春</a><a
                                            href="http://sc.admin5.com/">泸州老窖</a><a href="http://sc.admin5.com/">水井坊</a><a
                                            href="http://sc.admin5.com/">洋河</a><a href="http://sc.admin5.com/"
                                                                                  class="sub_width">金六福</a></span><span><a
                                            href="http://sc.admin5.com/">牛栏山</a><a href="http://sc.admin5.com/">丰谷</a><a
                                            href="http://sc.admin5.com/">杜康</a><a href="http://sc.admin5.com/">景芝</a><a
                                            href="http://sc.admin5.com/" class="sub_width1">河套</a><a
                                            href="http://sc.admin5.com/" class="sub_width">红楼梦</a></span></li>
                                    <li><span><a href="http://sc.admin5.com/">古贝春</a><a
                                            href="http://sc.admin5.com/">宋河</a><a href="http://sc.admin5.com/">泰山</a><a
                                            href="http://sc.admin5.com/">青花瓷</a><a
                                            href="http://sc.admin5.com/">董酒</a></span><span><a
                                            href="http://sc.admin5.com/" class="sub_width">唐王宴</a><a
                                            href="http://sc.admin5.com/">红星</a><a href="http://sc.admin5.com/">皖酒</a><a
                                            href="http://sc.admin5.com/">古井</a><a href="http://sc.admin5.com/">西凤</a><a
                                            href="http://sc.admin5.com/" class="sub_width">伊力特</a></span></li>
                                </ul>
                                <!--<ul id="sub-ul-2">
                                   <h4>香型</h4>
                                   <li> <span><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a href="http://sc.admin5.com/">清香型</a><a href="http://sc.admin5.com/">馥郁香型</a></span><span><a href="http://sc.admin5.com/" class="sub_width">兼香型</a><a href="http://sc.admin5.com/">特香型</a><a href="http://sc.admin5.com/">芝麻香型</a><a href="http://sc.admin5.com/">豉香型</a></span><span><a href="http://sc.admin5.com/">董香型</a><a href="http://sc.admin5.com/">凤香型</a><a href="http://sc.admin5.com/">老白干香型</a><a href="http://sc.admin5.com/">復合香</a></span><span><a href="http://sc.admin5.com/" class="sub_width">荞香型</a><a href="http://sc.admin5.com/">青稞清香型</a><a href="http://sc.admin5.com/">米香型</a><a href="http://sc.admin5.com/">其他</a></span> </li>
                              </ul>-->
                            </div>
                            <!-- end subCate-->
                        </li>
                        <li id="mainCate-2" class="mainCate evenLeval">
                            <h3><span>&gt;</span><a href="http://sc.admin5.com/">月度最佳</a></h3>

                            <p><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                    href="http://sc.admin5.com/">国窖1573</a></p>

                            <p><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a
                                    href="http://sc.admin5.com/">贵州</a><a href="http://sc.admin5.com/">四川</a></p>

                            <div class="subCate" style="display: none;">
                                <ul id="sub-ul-1">
                                    <h4>品牌</h4>
                                    <li><span><a href="http://sc.admin5.com/">茅台</a><a
                                            href="http://sc.admin5.com/">五粮液 </a><a
                                            href="http://sc.admin5.com/">国窖1573</a><a
                                            href="http://sc.admin5.com/">郎酒</a><a
                                            href="http://sc.admin5.com/">汾酒</a></span> <span><a
                                            href="http://sc.admin5.com/" class="sub_width">剑南春</a><a
                                            href="http://sc.admin5.com/">泸州老窖</a><a href="http://sc.admin5.com/">水井坊</a><a
                                            href="http://sc.admin5.com/">洋河</a><a href="http://sc.admin5.com/"
                                                                                  class="sub_width">金六福</a></span><span><a
                                            href="http://sc.admin5.com/">牛栏山</a><a href="http://sc.admin5.com/">丰谷</a><a
                                            href="http://sc.admin5.com/">杜康</a><a href="http://sc.admin5.com/">景芝</a><a
                                            href="http://sc.admin5.com/" class="sub_width1">河套</a><a
                                            href="http://sc.admin5.com/" class="sub_width">红楼梦</a></span></li>
                                    <li><span><a href="http://sc.admin5.com/">古贝春</a><a
                                            href="http://sc.admin5.com/">宋河</a><a href="http://sc.admin5.com/">泰山</a><a
                                            href="http://sc.admin5.com/">青花瓷</a><a
                                            href="http://sc.admin5.com/">董酒</a></span><span><a
                                            href="http://sc.admin5.com/" class="sub_width">唐王宴</a><a
                                            href="http://sc.admin5.com/">红星</a><a href="http://sc.admin5.com/">皖酒</a><a
                                            href="http://sc.admin5.com/">古井</a><a href="http://sc.admin5.com/">西凤</a><a
                                            href="http://sc.admin5.com/" class="sub_width">伊力特</a></span></li>
                                </ul>
                            </div>
                            <!-- end subCate-->
                        </li>
                        <li id="mainCate-1" class="mainCate">
                            <h3><span>&gt;</span><a href="http://sc.admin5.com/">厨房101</a></h3>

                            <p><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                    href="http://sc.admin5.com/">国窖1573</a></p>

                            <p><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a
                                    href="http://sc.admin5.com/">贵州</a><a href="http://sc.admin5.com/">四川</a></p>

                            <div class="subCate" style="display: none;">
                                <ul id="sub-ul-1">
                                    <h4>品牌</h4>
                                    <li><span><a href="http://sc.admin5.com/">茅台</a><a
                                            href="http://sc.admin5.com/">五粮液 </a><a
                                            href="http://sc.admin5.com/">国窖1573</a><a
                                            href="http://sc.admin5.com/">郎酒</a><a
                                            href="http://sc.admin5.com/">汾酒</a></span> <span><a
                                            href="http://sc.admin5.com/" class="sub_width">剑南春</a><a
                                            href="http://sc.admin5.com/">泸州老窖</a><a href="http://sc.admin5.com/">水井坊</a><a
                                            href="http://sc.admin5.com/">洋河</a><a href="http://sc.admin5.com/"
                                                                                  class="sub_width">金六福</a></span><span><a
                                            href="http://sc.admin5.com/">牛栏山</a><a href="http://sc.admin5.com/">丰谷</a><a
                                            href="http://sc.admin5.com/">杜康</a><a href="http://sc.admin5.com/">景芝</a><a
                                            href="http://sc.admin5.com/" class="sub_width1">河套</a><a
                                            href="http://sc.admin5.com/" class="sub_width">红楼梦</a></span></li>
                                    <li><span><a href="http://sc.admin5.com/">古贝春</a><a
                                            href="http://sc.admin5.com/">宋河</a><a href="http://sc.admin5.com/">泰山</a><a
                                            href="http://sc.admin5.com/">青花瓷</a><a
                                            href="http://sc.admin5.com/">董酒</a></span><span><a
                                            href="http://sc.admin5.com/" class="sub_width">唐王宴</a><a
                                            href="http://sc.admin5.com/">红星</a><a href="http://sc.admin5.com/">皖酒</a><a
                                            href="http://sc.admin5.com/">古井</a><a href="http://sc.admin5.com/">西凤</a><a
                                            href="http://sc.admin5.com/" class="sub_width">伊力特</a></span></li>
                                </ul>
                            </div>
                            <!-- end subCate-->
                        </li>
                        <li id="mainCate-2" class="mainCate evenLeval">
                            <h3><span>&gt;</span><a href="http://sc.admin5.com/">小吃</a></h3>

                            <p><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                    href="http://sc.admin5.com/">国窖1573</a></p>

                            <p><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a
                                    href="http://sc.admin5.com/">贵州</a><a href="http://sc.admin5.com/">四川</a></p>

                            <div class="subCate" style="display: none;">
                                <ul id="sub-ul-1">
                                    <h4>品牌</h4>
                                    <li><span><a href="http://sc.admin5.com/">茅台</a><a
                                            href="http://sc.admin5.com/">五粮液 </a><a
                                            href="http://sc.admin5.com/">国窖1573</a><a
                                            href="http://sc.admin5.com/">郎酒</a><a
                                            href="http://sc.admin5.com/">汾酒</a></span> <span><a
                                            href="http://sc.admin5.com/" class="sub_width">剑南春</a><a
                                            href="http://sc.admin5.com/">泸州老窖</a><a href="http://sc.admin5.com/">水井坊</a><a
                                            href="http://sc.admin5.com/">洋河</a><a href="http://sc.admin5.com/"
                                                                                  class="sub_width">金六福</a></span><span><a
                                            href="http://sc.admin5.com/">牛栏山</a><a href="http://sc.admin5.com/">丰谷</a><a
                                            href="http://sc.admin5.com/">杜康</a><a href="http://sc.admin5.com/">景芝</a><a
                                            href="http://sc.admin5.com/" class="sub_width1">河套</a><a
                                            href="http://sc.admin5.com/" class="sub_width">红楼梦</a></span></li>
                                    <li><span><a href="http://sc.admin5.com/">古贝春</a><a
                                            href="http://sc.admin5.com/">宋河</a><a href="http://sc.admin5.com/">泰山</a><a
                                            href="http://sc.admin5.com/">青花瓷</a><a
                                            href="http://sc.admin5.com/">董酒</a></span><span><a
                                            href="http://sc.admin5.com/" class="sub_width">唐王宴</a><a
                                            href="http://sc.admin5.com/">红星</a><a href="http://sc.admin5.com/">皖酒</a><a
                                            href="http://sc.admin5.com/">古井</a><a href="http://sc.admin5.com/">西凤</a><a
                                            href="http://sc.admin5.com/" class="sub_width">伊力特</a></span></li>
                                </ul>
                            </div>
                            <!-- end subCate-->
                        </li>
                        <li id="mainCate-1" class="mainCate">
                            <h3><span>&gt;</span><a href="http://sc.admin5.com/">肉类</a></h3>

                            <p><a href="http://sc.admin5.com/">茅台</a><a href="http://sc.admin5.com/">五粮液</a><a
                                    href="http://sc.admin5.com/">国窖1573</a></p>

                            <p><a href="http://sc.admin5.com/">酱香型</a><a href="http://sc.admin5.com/">浓香型</a><a
                                    href="http://sc.admin5.com/">贵州</a><a href="http://sc.admin5.com/">四川</a></p>

                            <div class="subCate" style="display: none;">
                                <ul id="sub-ul-1">
                                    <h4>品牌</h4>
                                    <li><span><a href="http://sc.admin5.com/">茅台</a><a
                                            href="http://sc.admin5.com/">五粮液 </a><a
                                            href="http://sc.admin5.com/">国窖1573</a><a
                                            href="http://sc.admin5.com/">郎酒</a><a
                                            href="http://sc.admin5.com/">汾酒</a></span> <span><a
                                            href="http://sc.admin5.com/" class="sub_width">剑南春</a><a
                                            href="http://sc.admin5.com/">泸州老窖</a><a href="http://sc.admin5.com/">水井坊</a><a
                                            href="http://sc.admin5.com/">洋河</a><a href="http://sc.admin5.com/"
                                                                                  class="sub_width">金六福</a></span><span><a
                                            href="http://sc.admin5.com/">牛栏山</a><a href="http://sc.admin5.com/">丰谷</a><a
                                            href="http://sc.admin5.com/">杜康</a><a href="http://sc.admin5.com/">景芝</a><a
                                            href="http://sc.admin5.com/" class="sub_width1">河套</a><a
                                            href="http://sc.admin5.com/" class="sub_width">红楼梦</a></span></li>
                                    <li><span><a href="http://sc.admin5.com/">古贝春</a><a
                                            href="http://sc.admin5.com/">宋河</a><a href="http://sc.admin5.com/">泰山</a><a
                                            href="http://sc.admin5.com/">青花瓷</a><a
                                            href="http://sc.admin5.com/">董酒</a></span><span><a
                                            href="http://sc.admin5.com/" class="sub_width">唐王宴</a><a
                                            href="http://sc.admin5.com/">红星</a><a href="http://sc.admin5.com/">皖酒</a><a
                                            href="http://sc.admin5.com/">古井</a><a href="http://sc.admin5.com/">西凤</a><a
                                            href="http://sc.admin5.com/" class="sub_width">伊力特</a></span></li>
                                </ul>
                            </div>
                            <!-- end subCate-->
                        </li>


                    </ul>
                </div>
                <!--end banner-->
            </div>
            <!--csleft-->
            <div class="cbookright">
                <div class="cbooktop">
                    <div class="feat_prod_box cbookcontent" style="border_bottom:none;">
                        <div class="prod_img"><a href="details.html"><img src="${pageContext.request.contextPath}/resources/customer/images/dg.png" alt="" title=""
                                                                          border="0"/>
                        </a>
                        </div>
                        <div class="prod_det_box">


                            <div class="box_center">
                                <div class="prod_title"><h4><a href="cookbook.html">蓝莓糕点</a></h4></div>
                                <p style="margin:0px 5px;padding:0px;">材料：蓝莓，面，糖，水
                                    感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠</p>

                                <div class="clear"></div>

                            </div>
                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>


                    <div class="feat_prod_box cbookcontent" style="border_bottom:none;">
                        <div class="prod_img"><a href="details.html"><img src="${pageContext.request.contextPath}/resources/customer/images/dg.png" alt="" title=""
                                                                          border="0"/>
                        </a>
                        </div>
                        <div class="prod_det_box">


                            <div class="box_center">
                                <div class="prod_title"><h4><a href="cookbook.html">蓝莓糕点</a></h4></div>
                                <p style="margin:0px 5px;padding:0px;">材料：蓝莓，面，糖，水
                                    感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠</p>

                                <div class="clear"></div>

                            </div>
                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>


                    <div class="feat_prod_box cbookcontent" style="border_bottom:none;">
                        <div class="prod_img"><a href="details.html"><img src="${pageContext.request.contextPath}/resources/customer/images/dg.png" alt="" title=""
                                                                          border="0"/>
                        </a>
                        </div>
                        <div class="prod_det_box">


                            <div class="box_center">
                                <div class="prod_title"><h4><a href="cookbook.html">蓝莓糕点</a></h4></div>
                                <p style="margin:0px 5px;padding:0px;">材料：蓝莓，面，糖，水
                                    感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠</p>

                                <div class="clear"></div>

                            </div>
                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>


                    <div class="feat_prod_box cbookcontent" style="border_bottom:none;">
                        <div class="prod_img"><a href="details.html"><img src="${pageContext.request.contextPath}/resources/customer/images/dg.png" alt="" title=""
                                                                          border="0"/>
                        </a>
                        </div>
                        <div class="prod_det_box">


                            <div class="box_center">
                                <div class="prod_title"><h4><a href="cookbook.html">蓝莓糕点</a></h4></div>
                                <p style="margin:0px 5px;padding:0px;">材料：蓝莓，面，糖，水
                                    感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠感恩节特惠</p>

                                <div class="clear"></div>

                            </div>
                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="cbookbottom">

                    <nav>
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">上一页</span>
                                </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">下一页</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>


            </div>
            <!--end cbookright-->

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
