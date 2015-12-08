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
       		<div class="cscontent" style="height:auto;">
            	<div class="media mediainfo" style="margin-top:20px;">
                  <div class="media-left mediainfoleft" >
                  
                    <a href="#">
                      <img class="media-object" style="width:178px;height:178px;"src="${relationList[0].follower.face}" alt="...">
                    </a>
                  </div>
                  <div class="media-body  mediainforight">
                    <h2 class="media-heading" ><a href="#">${relationList[0].follower.username}</a></h2>
                    
                  </div>
                </div><!--end  media-->
                 
                <h4>${relationList[0].follower.username}${relationstr}</h4>
                <c:if test="${!empty relationList}">
	                <c:forEach var="relation" items="${relationList}">
	                <div class="media mediafriend">
	                  
	                  <div class="media-left mediafriendl">
	                    <a href="#">
	                      <img class="media-object" style="width:67px;height:67px;" src="${relation.byFollower.face}" alt="">
	                    </a>
	                  </div>
	                  <div class="media-body  mediafriendr">
	                   <h4 class="media-heading"><a href="#">${relation.byFollower.username}</a></h4>
	                   <%-- <span>${relation.toCreateDate}</span><br/> --%>
	                    <span>${relation.createDate}</span><br/> 
	                   <a href="#"><span></span></a>
	                     
	                  </div>
	                </div>
	                </c:forEach>
                </c:if>
                <c:if test="${empty relationList}">
                  		  <h4 style="color:#ccc" class="media-heading">目前还没有关注的好友，请赶块添加吧！</h4>
                </c:if>
                <!--  
                <div class="media mediafriend">
                  
                  <div class="media-left mediafriendl">
                    <a href="#">
                      <img class="media-object" src="images/pytx.png" alt="">
                    </a>
                  </div>
                  <div class="media-body  mediafriendr">
                   <h4 class="media-heading"><a href="#">鬼鬼</a></h4>
                   <span>2015/01/01</span>
                   <a href="#"><span>最近上传的菜单</span></a>
                     
                  </div>
               </div>
               <div class="media mediafriend">
                  
                  <div class="media-left mediafriendl ">
                    <a href="#">
                      <img class="media-object" src="images/pytx.png" alt="">
                    </a>
                  </div>
                  <div class="media-body  mediafriendr">
                   <h4 class="media-heading"><a href="#">鬼鬼</a></h4>
                    <span>2015/01/01</span>
                     <a href="#"><span>最近上传的菜单</span></a>
                     
                  </div>
               </div>
               <div class="media mediafriend">
                  
                  <div class="media-left mediafriendl ">
                    <a href="#">
                      <img class="media-object" src="${pageContext.request.contextPath}/resources/customer/images/pytx.png" alt="">
                    </a>
                  </div>
                  <div class="media-body  mediafriendr">
                    <h4 class="media-heading"><a href="#">鬼鬼</a></h4>
                      <span>2015/01/01</span>
                      <a href="#"><span>最近上传的菜单名字</span></a>
                  </div>
               </div>
             -->
              
              
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
