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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/myfriends.css">

<script src="js/jquery.min.js"></script>

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
                                        <li><a href="${pageContext.request.contextPath}/relation/getRelationDynamic">好友动态</a></li>
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
                <li role="presentation" class="cbook"></li>
              <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/">首页</a></li>
              <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
              <li role="presentation"><a href="${pageContext.request.contextPath}/cookbook/listAllCookbook">菜谱</a></li>
              <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
            </ul>
            
          </div>
            
       </div>
       
       <div id="content">
       		<div class="cscontent" style="height:auto;">
            	<div class="media mediainfo" style="margin-top:20px;">
                  <div class="media-left mediainfoleft" >
                    <a href="#">
                      <img class="media-object" style="width:178px;height:178px;"src="${user.face}" alt="...">
                    </a>
                  </div>
                  <div class="media-body  mediainforight">
                    <h2 class="media-heading" ><a href="#">${user.username}</a></h2>
                  </div>
                </div><!--end  media-->
                <h4>${relationList[0].follower.username}${relationstr}</h4>
                <c:if test="${!empty relationList}">
	                <c:forEach var="relation" items="${relationList}">
	                <div class="media mediafriend">
	                  
	                  <div class="media-left mediafriendl">
	                    <a href="${pageContext.request.contextPath}/user/personWork/${relation.byFollower.id}">
	                      <img class="media-object" style="width:67px;height:67px;" src="${relation.byFollower.face}" alt="">
	                    </a>
	                  </div>
	                  <div class="media-body  mediafriendr">
	                   <h4 class="media-heading"><a href="#">${relation.byFollower.username}</a></h4>
	                    <span>${relation.createDate}</span><br/>
	                   <a href="#"><span></span></a>
	                  </div>
	                </div>
	                </c:forEach>
                </c:if>
                <c:if test="${empty relationList}">
                  		  <h4 style="color:#ccc" class="media-heading">目前还没有关注的好友，请赶块添加吧！</h4>
                </c:if>
              
              
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
