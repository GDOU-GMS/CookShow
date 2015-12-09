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
                                        </ul>
                                    </div>
                                </li>
								<c:forEach items="${topClassificationVoList}" var="topClassification" varStatus="loop">
                                    <c:if test="${loop.index lt 10}">
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
                                    </c:if>
								</c:forEach>
                                <li id="mainCate-1" class="mainCate">
                                    <h3>
                                        <span>&gt;</span><a href="${pageContext.request.contextPath}/classification/allClassification">更多</a>
                                    </h3>
                                </li>
							</ul>
						</div>
					</div>
					<div class="csright">
						<div id="owl-demo" class="owl-carousel">
                            <c:forEach items="${headlineCookbooks}" var="cookbook">
                                <a class="item" href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}">
                                    <img src="${cookbook.titleImage}" style="width: 750px; height: 455px;" alt="">
                                    <b></b>
                                    <span>${cookbook.title}</span>
                                </a>
                            </c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--中间内容结束-->
			<div class="contentbottom">
                <div class="csbottom">
                    <h4 class="cstitle" >新秀菜谱</h4>
                    <c:forEach items="${newCreateCookbook}" var="cookbook">
                        <div class="row showimg" style="width:332px;heihgt:320px;">
                            <div class="col-sm-6 col-md-4" style="width:332px; padding: 0px;">
                                <div class="thumbnail" style="width:332px;height:320px;">
                                    <img src="${cookbook.titleImage}"  alt="..." style="width:256px;height:230px;margin:10px 30px;">
                                    <div class="caption"width:="width:320px;height:70px;margin-top:20px;">
                                        <h4 ><a class="captionhref" href="#">${cookbook.title}</a></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  end row-->
                    </c:forEach>

                    <h4 class="cstitle" >本周最受欢迎</h4>
                    <c:forEach items="${popularCookbooks}" var="cookbook">
                        <div class="row showimg "style="width:332px;heihgt:320px;">
                            <div class="col-sm-6 col-md-4" style="width:332px; padding: 0px;">
                                <div class="thumbnail"  style="width:332px;height:320px;">
                                    <img src="${cookbook.titleImage}" alt="..."style="width:256px;height:230px;margin:10px 30px;">
                                    <div class="caption"width:="width:320px;height:70px;margin-top:20px;">
                                        <h4>${cookbook.title}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  end row-->
                    </c:forEach>
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
