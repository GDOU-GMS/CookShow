<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/12/3
  Time: 17:13
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/cookmenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/menuofcbook.css">

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
                                    <li><a href="${pageContext.request.contextPath}/relation/getRelationDynamic">好友动态</a></li>
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
                <li role="presentation" class="cbook"><span></span></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/cookbook/listAllCookbook">菜谱</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
            </ul>
        </div>
    </div>
    <div id="content">
        <div class="cscontent">
            <div class="menuleft">
                <div class="mobtop" style="background:#F0F0F0 ">
                    <h2>${menu.name}</h2>
                    <div class="mobtopl" >
                        <div class="mobcdjj">
                        		<span>${menu.title}</span>
                        </div>
                        <div class="mobdate">
                            <span>创建时间:<fmt:formatDate value="${menu.createDate}" pattern="yyyy-MM-dd"/> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span>最后修改:<fmt:formatDate value="${menu.updateDate}" pattern="yyyy-MM-dd"/></span>
                        </div>
                    </div>
                    <div class="mobtopr">
                        <a class="btn btn-default acss" style="margin-top:125px;" href="#" role="button">收藏</a>
                        <div class="mobshare">
                            <span style="">分享到</span><a href=""><img src="${pageContext.request.contextPath}/resources/customer/images/weibo.png" style="width:36px;height:29px;"></a>                    </div>
                    </div>
                </div>
                <div class="mobbottom mobmedia">
                    <c:forEach items="${cookbookPage.list}" var="cookbook">
                        <div class="media" >
                            <div class="media-left mobmedial">
                                <a href="#">
                                    <img class="media-object" src="${cookbook.titleImage}" alt="...">
                                </a>
                            </div>
                            <div class="media-body mobmediar">
                                <h3 class="media-heading">${cookbook.title}</h3>
                                <div class="mobjj">
                                    <span>${cookbook.intro}</span>
                                </div>
                                <span>${cookbook.user.username}</span><br/>
                                <span>发表时间：<fmt:formatDate value="${cookbook.createDate}" pattern="yyyy-MM-dd"/> </span><br/>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <nav>
                    <ul class="pagination">
                        <c:if test="${cookbookPage.pageNum-1 gt 1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/menu/menuDetail/${menu.id}?pageNum=${cookbookPage.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${cookbookPage.totalPage gt 1}">
                            <c:forEach begin="${cookbookPage.startIndex}" end="${cookbookPage.startIndex}" step="1" var="index">
                                <li><a href="${pageContext.request.contextPath}/menu/menuDetail/${menu.id}?pageNum=${index+1}" <c:if test="${index+1 eq cookbookPage.pageNum}">class="active"</c:if>>${index+1}</a></li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${cookbookPage.pageNum+1 lt cookbookPage.totalRecord}">
                            <li>
                                <a href="${pageContext.request.contextPath}/menu/menuDetail/${menu.id}?pageNum=${cookbookPage.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
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

        </div><!--end cscontent -->
    </div><!--end  content-->
    <div id="pagebottom">
        <div class="cspagebottom">
            <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
        </div>
    </div><!--pagebottom-->

</div>
<script type="text/javascript">
    jQuery("#csnav").slide({  type:"menu", titCell:".mainCate", targetCell:".subCate", delayTime:0, triggerTime:0, defaultPlay:false, returnDefault:true });

    $(document).ready(function(){
        checkCollection();
    });



    var result;
    function checkCollection(){
        var data = {
            date: new Date(),
            objectId : ${menu.id},
            type:   1
        };
        $.ajax({
            type:       "POST",
            url:        "/collection/checkCollection",
            dataType:   "json",
            data    : data,
            success: function(data){
                if(data.msg=='yes'){
                    result = true;
                }else if(data.msg = 'no'){
                    result = false;
                }else{
                    alert(data.msg);
                }
                var $collection = $("#collection");
                if(result){
                    $collection.html("已收藏")
                }else{
                    $collection.html("收藏")
                }
            }
        })
    }

    function checkLogin(){
        var test = false;
        var data = {
            date: new Date()
        }
        $.ajax({
            type:       "POST",
            url:        "/checkLogin",
            dataType:   "json",
            async:      false,
            data    : data,
            success: function(data){
                if(data.result = 1){
                    test =  true;
                }else{
                    test =  false;
                }
            }
        });
        return test;
    }

    function doCollection(){
        //如果已经登录
        if(checkLogin()){
            var data = {
                objectId : ${menu.id},
                type     : 1,
                state    : result,
                date     : new Date()
            }
            $.ajax({
                type:       "POST",
                url:        "/collection/doCollection",
                dataType:   "json",
                data    : data,
                success: function(data){
                    if(data.result==0){
                        alert(data.msg)
                    }else{
                        checkCollection();
                    }
                }
            })
        }
    }
</script>
</body>
</html>
