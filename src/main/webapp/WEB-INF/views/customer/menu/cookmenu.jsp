<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    </div>
    <div id="navfont">
        <div id="navcontent">

           <ul class="nav nav-pills">
                <li role="presentation" class="cbook"><a title="点击查看所有分类" href="${pageContext.request.contextPath}/classification/allClassification">全部分类</a></li>
               <li role="presentation"><a href="${pageContext.request.contextPath}/">首页</a></li>
               <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
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
            <!--csleft-->
            <div class="cbookright">
                <div class="cbooktop">
                	<c:forEach items="${page.list}" var="menu" varStatus="loop">
                    <div class="feat_prod_box cbookcontent" style="margin-bottom:5px;border_bottom:none;background-color: #F4F3F1">
                        <div class="">
                            <div class="box_center" >
                                <div class="prod_title" style="text-align: center">
                                    <h3><a href="${pageContext.request.contextPath}/menu/menuDetail/${menu.id}">${menu.name}</a></h3>
                                </div>
                                <p style="margin:0px 5px;padding:0px;height:60px;overflow:hidden;text-overflow:ellipsis;font-family:宋体;">&nbsp;&nbsp;${menu.title}</p>
								<div style="margin-left: 15px;">
                                    <a href="${pageContext.request.contextPath}/user/personWork/${menu.user.id}" class="cbuser"><p style="margin:0px 5px;padding:0px;color:#EB8C24;font-family:宋体;">${menu.user.username}</p></a>
                                    <p style="margin:0px 5px;padding:0px;color:#EB8C24;"><ftm:formatDate value="${menu.createDate}" pattern="yyyy-MM-dd"/> </p>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                	</c:forEach>
                </div>
                <div class="cbookbottom">
                    <nav>
                        <ul class="pagination">
                            <c:if test="${page.pageNum gt 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${page.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${page.totalPage gt 1}">
                                <c:forEach begin="${page.startPage-1}" end="${page.endPage-1}" step="1" var="index" >
                                     <li><a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${index+1}" <c:if test="${index+1 eq page.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${page.pageNum lt page.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${page.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>


            </div>
            <!--end cbookright-->

            <div class="cbookside">
                <div class="cbooksidecss">
                    <p>相关菜单</p>
                    <ul>
                    <c:forEach items="${menuList}" var="menu">
						<li><a href="${pageContext.request.contextPath}/menu/menuDetail/${menu.id}">${menu.title}</a></li>
					</c:forEach>

                    </ul>
                </div>
            </div>
        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->
    <div id="pagebottom" style="float:left;width:100%">
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
