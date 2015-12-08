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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer/css/csnav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer/css/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer/css/csimg.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script
	src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="${pageContext.request.contextPath}/resources/customer/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customer/js/jquery.SuperSlide.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customer/js/owl.carousel.js"></script>
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
						<input type="text" class="form-control" id="exampleInputName2"
							placeholder="搜索商品或菜单">
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
			<div id="navfont">
				<div id="navcontent">
					<ul class="nav nav-pills">
						<li role="presentation" class="cbook"><a title="点击查看所有分类" href="${pageContext.request.contextPath}/classification/allClassification">全部分类</a></li>
						<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">首页</a></li>
						<li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
						<li role="presentation"><a href="#">健康饮食</a></li>
						<li role="presentation"><a href="#">作品动态</a></li>
					</ul>
				</div>
			</div>
			<div id="content">
				<div class="cscontent">
					<div class="csleft">
						<div class="banner">
							<ul id="csnav">
                                <li id="mainCate-1" class="mainCate">
                                    <h3>
                                        <span>&gt;</span><a href="javascript:void(0);">热门分类</a>
                                    </h3>
                                    <div class="subCate" style="display: none;">
                                        <ul id="sub-ul-1">
                                            <a href="${pageContext.request.contextPath}/menu/cookmenu"><span>最新菜谱</span></a>
                                            <a href="${pageContext.request.contextPath}/classification/allClassification"><span>所有分类</span></a>
                                            <a href="javascript:void(0)"><span>往期头条</span></a>
                                            <%--<li>
                                                <span>
                                                    <a href="javascript:void(0);">111</a>
                                                </span>
                                            </li>--%>
                                        </ul>
                                    </div>
                                </li>
								<c:forEach items="${topClassificationVoList}" var="topClassification">
									<li id="mainCate-1" class="mainCate">
										<h3>
											<span>&gt;</span><a href="http://sc.admin5.com/">${topClassification.name }</a>
										</h3>
    									<div class="subCate" style="display: none;">
											<c:forEach items="${topClassification.list }" var="secondClassification">
												<ul id="sub-ul-1">
												<h4>${secondClassification.name }</h4>
													<li>
														<span>
															<c:forEach items="${secondClassification.list }" var="thirdClassification">
																<a href="${pageContext.request.contextPath}/cookbook/findByClassificationCode/${thirdClassification.code}">${thirdClassification.name }</a>
															</c:forEach>
														</span>
													</li>
												</ul>
											</c:forEach>
										</div>
									</li>
								</c:forEach>
							</ul>

						</div>

					</div>
					<div class="csright">
						<div id="owl-demo" class="owl-carousel">
                            <c:forEach items="${headlineCookbooks}" var="cookbook">
                                <a class="item" href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}">
                                    <img src="${cookbook.titleImage}" style="width: 750px; height: 435px;" alt="">
                                    <b></b>
                                    <span>${cookbook.title}</span>
                                </a>
                            </c:forEach>
							<%--&lt;%&ndash;<a class="item" href="" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/customer/images/北京烤鸭.gif"
								style="width: 750px; height: 435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
							<a class="item" href="" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/customer/images/海鲜.gif"
								style="width: 750px; height: 435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>&ndash;%&gt;
							<a class="item" href="" target="_blank"><img
								style="width: 750px; height: 435px;"
								src="${pageContext.request.contextPath}/resources/customer/images/鸡翅.gif"
								alt=""><b></b><span>秀厨网美食狂欢登场</span></a> <a class="item"
								href="" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/customer/images/丸子.gif"
								style="width: 750px; height: 435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
							<a class="item" href="" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/customer/images/寿司.gif"
								style="width: 750px; height: 435px;" alt=""><b></b><span>锐秀厨网美食狂欢登场</span></a>
							<a class="item" href="" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/customer/images/虾.gif"
								style="width: 750px; height: 435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>
							<a class="item" href="" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/customer/images/扒.gif"
								style="width: 750px; height: 435px;" alt=""><b></b><span>秀厨网美食狂欢登场</span></a>--%>
						</div>


					</div>


				</div>

			</div>
			<!--中间内容结束-->
			<div class="contentbottom">
				<div class="csbottom">
					<div class="row showimg">
						<div class="col-sm-6 col-md-4" style="width: 100%; padding: 0px;">
							<div class="thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/customer/images/1.gif"
									alt="..." style="margin: 0px 30px; margin-top: 25px;">

								<div class="caption">

									<h4>甜品</h4>
									<!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
								</div>
							</div>
						</div>

					</div>
					<!--  end row-->

					<div class="row showimg imgright">
						<div class="col-sm-6 col-md-4" style="width: 100%; padding: 0px;">
							<div class="thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/customer/images/2.gif"
									alt="..." style="margin: 0px 30px; margin-top: 25px;">

								<div class="caption">

									<h4>麻辣小龙虾</h4>
									<!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
								</div>
							</div>
						</div>

					</div>
					<!--  end row-->
					<div class="row showimg imgright">
						<div class="col-sm-6 col-md-4" style="width: 100%; padding: 0px;">
							<div class="thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/customer/images/3.gif"
									alt="..." style="margin: 0px 30px; margin-top: 25px;">

								<div class="caption">

									<h4>绿茶饼</h4>
									<!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
								</div>
							</div>
						</div>

					</div>
					<!--  end row-->


					<div class="row showimg">
						<div class="col-sm-6 col-md-4" style="width: 100%; padding: 0px;">
							<div class="thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/customer/images/4.gif"
									alt="..." style="margin: 0px 30px; margin-top: 25px;">

								<div class="caption">

									<h4>小炒</h4>
									<!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
								</div>
							</div>
						</div>

					</div>
					<!--  end row-->

					<div class="row showimg imgright">
						<div class="col-sm-6 col-md-4" style="width: 100%; padding: 0px;">
							<div class="thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/customer/images/5.gif"
									alt="..." style="margin: 0px 30px; margin-top: 25px;">

								<div class="caption">

									<h4>鱼香肉丝</h4>
									<!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn 							  						 btn-default" role="button">Button</a></p>-->
								</div>
							</div>
						</div>

					</div>
					<!--  end row-->
					<div class="row showimg imgright">
						<div class="col-sm-6 col-md-4" style="width: 100%; padding: 0px;">
							<div class="thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/customer/images/6.gif"
									alt="..." style="margin: 0px 30px; margin-top: 25px;">

								<div class="caption">

									<h4>小炒</h4>
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
