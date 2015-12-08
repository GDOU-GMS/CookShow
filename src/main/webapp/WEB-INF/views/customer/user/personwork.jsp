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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
     <script src="${pageContext.request.contextPath}/resources/customer/js/modal.js"></script>
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
                </div><!--landr-->

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
                    <c:if test="${!empty user}">
                       <span style="display:none;" id="focusid">${userInfo.id}</span>
                       <span style="display:none;" id="currentid">${user.id}</span>

                       <a id="focushref" class="btn btn-default createcss" href="javascript:void(0)" >关注</a>

                   		<!--
                   		<form method="post" action="${pageContext.request.contextPath}/relation/addFocusOnFriend/${userInfo.id}/${user.id}" id="focushref">

                   			 <button type="submit" class="btn btn-default createcss" >关注</button>
                   		</form>
                   		 -->
                    </c:if>
                    <c:if  test="${(!empty user)&&(!empty relation)&&(!empty tag)}">
                       <span style="display:none;" id="focusid">${userInfo.id}</span>
                       <span style="display:none;" id="currentid">${user.id}</span>
                        
                       <a id="focushref" class="btn btn-default createcss createcss1"  href="javascript:void(0)">已关注</a>
                   		 
                    	
                    </c:if>
                   <div class="media-body mediainforight">
                       <a class="mediainforight">关注的人</a>
                       <a class="mediainforight">被关注</a>
                   </div>
                </div>
            </div><!--end  media-->


            <div>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist" id="navul">
                    <li role="presentation" id="target_gaikuang" class="active"><a href="#gaikuang" aria-controls="gaikuang" role="tab" data-toggle="tab">概况</a></li>
                    <li role="presentation" id="target_mymenu"><a href="#mymenu" aria-controls="home" role="tab" data-toggle="tab">菜单</a></li>
                    <li role="presentation" id="target_pwd"><a href="#pwd" aria-controls="messages" role="tab" data-toggle="tab">菜谱</a></li>
                    <li role="presentation" id="target_production"><a href="#production" aria-controls="production" role="tab" data-toggle="tab">作品</a></li>
                    <li role="presentation" id="target_personimage"><a href="#personimage" aria-controls="settings" role="tab" data-toggle="tab">收藏</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content tagstyle">


                    <div role="tabpanel" class="tab-pane active" id="gaikuang">
                        <div class="creatediv">

                            <div class="row showimg">
                                <div class="col-sm-6 col-md-4"style="width:100%;padding:0px;">
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..." style="margin:0px 30px;margin-top:25px;">
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
                                        <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..." style="margin:0px 30px;margin-top:25px;">
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
                                        <img src="${pageContext.request.contextPath}/resources/customer/images/255.png" alt="..." style="margin:0px 30px;margin-top:25px;">
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
                            <a class="btn btn-default createcss" href="${pageContext.request.contextPath}/menu/createMenu" role="button">创建新菜单</a>
                        </div>
                        <div class="menuname">
                            <a  href="#" role="button">菜单名称</a>

                            <a  href="#" role="button">菜单名称</a>
                            <a  href="#" role="button">菜单名称</a>
                        </div>
                        <nav>
                            <ul class="pagination">
                                <c:if test="${menuPage.pageNum-1 gt 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=mymenu&menupageNum=${menuPage.pageNum-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${menuPage.startIndex}" end="${menuPage.startIndex}" step="1" var="index">
                                    <li><a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=mymenu&menupageNum=${index+1}" <c:if test="${index+1 eq menuPage.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                </c:forEach>
                                <c:if test="${menuPage.pageNum+1 lt menuPage.totalRecord}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=mymenu&menupageNum=${menuPage.pageNum+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div><!-- mymenu-->

                    <div role="tabpanel" class="tab-pane" id="pwd">
                        <div class="row">
                            <a class="btn btn-default createcss" href="${pageContext.request.contextPath}/cookbook/createCookbook" role="button">创建新菜谱</a>
                        </div>

                        <div class="row">
                            <c:forEach items="${cookbookPage.list}" var="cookbook">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div>
                                            <a href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}"><img src="${cookbook.titleImage}" alt="..."></a>
                                            <div class="caption">
                                                <h3>${cookbook.title}</h3>
                                                <p>${cookbook.intro}</p>
                                                <c:if test="${!empty user}">
                                                    <p class="col-md-offset-3">
                                                        <a href="${pageContext.request.contextPath}/cookbook/forwardModifyCookbook?id=${cookbook.id}" class="btn btn-default" role="button">编辑</a>
                                                        <a href="${pageContext.request.contextPath}/cookbook/deleteCookbook?id=${cookbook.id}" class="btn btn-default" role="button" onclick="return confirm('确认删除？')">删除</a>
                                                    </p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="production">
                        <c:forEach items="${productionPage.list}" var="production">
                            <div class="row showimg imgright">
                                <div class="col-sm-6 col-md-4"style="width:100%;padding:0px;">
                                    <div class="thumbnail">
                                        <a href="${pageContext.request.contextPath}/production/detail/${production.id}">
                                            <img src="${production.titleImage}" alt="..." style="margin:0px 30px;margin-top:25px; overflow: hidden" width="250px" >
                                        </a>
                                        <div class="caption">
                                            <h4>${production.title}</h4>
                                            <p>${fn:length(production.intro) lt 20 ? production.intro : fn:substring(production.intro,0,20).concat('...')}</p>
                                            <c:if test="${!empty user}">
                                                <p class="col-md-offset-3">
                                                    <a href="${pageContext.request.contextPath}/production/forwardToModify?productionId=${production.id}" class="btn btn-default" role="button">编辑</a>
                                                    <a href="${pageContext.request.contextPath}/production/disableProduction?productionId=${production.id}" class="btn btn-default" role="button" onclick="return confirm('确认删除？')">删除</a>
                                                </p>
                                            </c:if>
                                            <span style="color:#ccc;font-size:12px;"><fmt:formatDate value="${production.createDate}" pattern="yyyy-MM-dd"/> </span>
                                        </div>
                                    </div>
                                </div>
                            </div><!--  end row-->
                        </c:forEach>
                        <div class="page row col-md-12">
                            <nav>
                                <ul class="pagination">
                                    <c:if test="${productionPage.pageNum-1 gt 1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=production&productionpageNum=${productionPage.pageNum-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${productionPage.startIndex}" end="${productionPage.startIndex}" step="1" var="index">
                                        <li><a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=production&productionpageNum=${index+1}" <c:if test="${index+1 eq productionPage.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                    </c:forEach>
                                    <c:if test="${productionPage.pageNum+1 lt productionPage.totalRecord}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=production&productionpageNum=${productionPage.pageNum+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="collectionCookbook">
                        <div class="row">
                            <c:forEach items="${collectionCookbookPage.list}" var="cookbook">
                                <div class="col-sm-6 col-md-4">
                                    <div class="thumbnail">
                                        <div>
                                            <a href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}"><img src="${cookbook.titleImage}" alt="..."></a>
                                            <div class="caption">
                                                <h3>${cookbook.title}</h3>
                                                <p>${cookbook.intro}</p>
                                                <c:if test="${!empty user}">
                                                    <p class="col-md-offset-3">
                                                        <a href="${pageContext.request.contextPath}/cookbook/forwardModifyCookbook?id=${cookbook.id}" class="btn btn-default" role="button">编辑</a>
                                                        <a href="${pageContext.request.contextPath}/cookbook/deleteCookbook?id=${cookbook.id}" class="btn btn-default" role="button" onclick="return confirm('确认删除？')">删除</a>
                                                    </p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <nav>
                            <ul class="pagination">
                                <c:if test="${collectionCookbookPage.pageNum-1 gt 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=pwd&collectionCookbookpageNum=${collectionCookbookPage.pageNum-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="${collectionCookbookPage.startIndex}" end="${collectionCookbookPage.startIndex}" step="1" var="index">
                                    <li><a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=pwd&collectionCookbookpageNum=${index+1}" <c:if test="${index+1 eq collectionCookbookPage.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                </c:forEach>
                                <c:if test="${cookbookPage.pageNum+1 lt cookbookPage.totalRecord}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/personWork/${userInfo.id}?target=pwd&collectionCookbookpageNum=${collectionCookbookPage.pageNum+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="collectionMenu">
                        3
                    </div>
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

<script>
    $(function(){
        var target ='${target}';
        var $navul = $("#navul");
       if(target!=null&&target!=''){
           $navul.find("li").each(function(){
               $(this).removeClass("active");
           });
           $("#target_"+target).attr("class","active");
           $(".tab-pane").each(function(){
               $(this).removeClass("active");
           });
           $("#"+target).addClass("active")
       }
       if($('#focushref').text()=="已关注"){
    	   $('#focushref').mouseover(function(){
	        	$('#focushref').text("取消关注");
	        });
	        $('#focushref').mouseout(function(){
	        	$('#focushref').text("已关注");
	        });
	        $('#focushref').removeClass("changea");
	        $('#focushref').addClass("createcss");
       }
       
    })
    $(document).ready(function() {
    	$('#focushref').click(function(){
    		aa();
    	})
    })
    function aa(){
    	    if($('#focushref').text()=="关注"){
	    	    var url = 'http://localhost:8080/relation/addFocusOnFriend/';
	    	    var focusid=$('#focusid').text();
	    	    var currentid=$('#currentid').text();
	    	    var param=currentid+'/'+focusid;
	    	    url += param;
	    	    //alert(url);
	    	    $.get(url, function(data) {
	    	        $('#focushref').text(data.msg);
	    	        $('#focushref').removeClass("createcss");
	    	        $('#focushref').addClass("changea");
	    	        //$('#myModal').modal('show');
	    	        $('#focushref').mouseover(function(){
	    	        	$('#focushref').text("取消关注");
	    	        });
     $(document).ready(function() { 
       
    	$('#focushref').click(function(){
    		aa();
    	})
    })
    
     function aa(){
    	    if($('#focushref').text()=="关注"){
	    	    var url = 'http://localhost:8080/relation/addFocusOnFriend/'; 
	    	    var focusid=$('#focusid').text();
	    	    var currentid=$('#currentid').text();
	    	    var param=currentid+'/'+focusid;
	    	    url += param;  
	    	    //alert(url);  
	    	    $.get(url, function(data) { 
	    	        $('#focushref').text(data.msg);
	    	        $('#focushref').removeClass("createcss");
	    	        $('#focushref').addClass("changea");
	    	        //$('#myModal').modal('show');
	    	        $('#focushref').mouseover(function(){
	    	        	$('#focushref').text("取消关注");
	    	        });
	    	        $('#focushref').mouseout(function(){
	    	        	$('#focushref').text(data.msg);
	    	        });
	    	        
	    	    });  
    	    }else if($('#focushref').text()=="取消关注"){
    	    	
    	    	var url = 'http://localhost:8080/relation/deleteFocusOnFriend/'; 
	    	    var focusid=$('#focusid').text();
	    	    var currentid=$('#currentid').text();
	    	   //alert(focusid);
	    	    var param=currentid+'/'+focusid;
	    	    url += param;  
	    	    //alert(url);  
	    	    $.get(url, function(data) { 
	    	        $('#focushref').text(data.msg);
	    	        $('#focushref').removeClass("changea");
	    	        $('#focushref').addClass("createcss");
	    	        //$('#myModal').modal('show');
	    	       /*  $('#focushref').mouseover(function(){
	    	        	$('#focushref').text("取消关注");
	    	        }); */
	    	        $('#focushref').mouseover(function(){
	    	        	$('#focushref').text("关注");
	    	        });
	    	        $('#focushref').mouseout(function(){
	    	        	$('#focushref').text("关注");
	    	        });
	    	        
	    	    });  
    	    	
    	    }
    	   
    	    
    }

	    	    });
    	    }else if($('#focushref').text()=="取消关注"){

    	    	var url = 'http://localhost:8080/relation/deleteFocusOnFriend/';
	    	    var focusid=$('#focusid').text();
	    	    var currentid=$('#currentid').text();
	    	   //alert(focusid);
	    	    var param=currentid+'/'+focusid;
	    	    url += param;
	    	    //alert(url);
	    	    $.get(url, function(data) {
	    	        $('#focushref').text(data.msg);
	    	        $('#focushref').removeClass("changea");
	    	        $('#focushref').addClass("createcss");
	    	        //$('#myModal').modal('show');
	    	       /*  $('#focushref').mouseover(function(){
	    	        	$('#focushref').text("取消关注");
	    	        }); */

	    	    });

    	    }


    }




</script>

</body>
</html>