<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:43
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
                <li role="presentation" class="cbook"><a title="点击查看所有分类" href="${pageContext.request.contextPath}/classification/allClassification">全部分类</a></li>
               <li role="presentation" ><a href="${pageContext.request.contextPath}/">首页</a></li>
               <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
               <li role="presentation"><a href="${pageContext.request.contextPath}/cookbook/listAllCookbook">菜谱</a></li>
               <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
            </ul>
        </div>
    </div>
    <div id="content">
        <div class="cscontent">
            <div class="menuleft">
                <div class="menuimg" style="height: 500px;">
                    <p>${production.title}</p>
                    <p style="font-size: 12px; color: #EC8D24"><a href="${pageContext.request.contextPath}/user/personWork/${production.user.id}">来自：${production.user.username}</a></p>
                    <div class="imgcontent">
                        <div class="imagetext">
                            <img src="${production.titleImage}">
                            <div class="menushare">
                                <span>分享</span>
                                <div class="shareimg">
                                    <a href="javascript:void(0);" alt=""> <img src="${pageContext.request.contextPath}/resources/customer/images/weibo.png" style="width:36px;height:29px;"></a>
                                </div>
                            </div>
                            <a class="btn btn-default acss" href="javascript:void(0)" id="collection" role="button" onclick="doCollection()">点赞</a>
                            <a class="btn btn-default acss" href="${pageContext.request.contextPath}/cookbook/cookbook/${production.cookbookId}" role="button" style="border-right: solid #fff">做法</a></div>
                        <!--end imagetext -->
                    </div>
                    <!--imgcontent-->
                </div>
                <!--menuimg -->
                <div class="menuinfo" style="margin-top: 50px;">
                    <div class="menusubinfo">
                        <p>简介</p>
                        <span>${production.intro}</span>
                    </div>
                </div>


                <!--menuinfo-->
                <div class="menucomment">
                    <div class="eachcomment">
                        <div class="personhead">
                            <c:if test="${!empty user.face}">
                                <img src="${user.face}" width="50" height="50">
                            </c:if>
                            <c:if test="${empty user.face}">
                                <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                            </c:if>
                        </div>
                        <div class="persontalk">
                            <textarea class="form-control" id="commentContent" style="font-size: larger"></textarea>
                        </div>
                        <div class="personsubmt">
                            <a class="btn btn-default" href="javascript:void(0);" role="button" onclick="publishComment()">评论</a>
                        </div>
                    </div>

                    <div style="float:left;width:718px;" id="comment_index">
                        <span style="color:#999;font-size:16px;">评论</span>
                    </div>
                    <div style="display: none">
                        <div class="eachcomment" id="commentDiv">
                            <hr style="color:#ccc;width:718px;">
                            <div class="personhead">
                                <c:if test="${!empty user.face}">
                                    <img src="${user.face}" width="50" height="50">
                                </c:if>
                                <c:if test="${empty user.face}">
                                    <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                                </c:if>
                            </div>
                            <div class="persontalk1">
                                <span>${user.username}:</span>
                                <p></p>
                                <span class="fromcss">刚刚</span>
                                <%-- <a href=""><span class="dianzan" style="width: auto" aria-hidden="true">回复</span></a>--%>
                            </div>
                        </div>
                    </div>

                    <div id="commentArea">
                        <c:if test="${empty page.list}">
                            赶快来抢沙发吧！
                        </c:if>
                        <c:forEach items="${page.list}" var="commentProduction">
                            <div class="eachcomment">
                                <hr style="color:#ccc;width:718px;">
                                <div class="personhead">
                                    <c:if test="${!empty commentProduction.user.face}">
                                        <img src="${commentProduction.user.face}" width="50" height="50">
                                    </c:if>
                                    <c:if test="${empty commentProduction.user.face}">
                                        <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                                    </c:if>
                                </div>
                                <div class="persontalk1">
                                    <span>${commentProduction.user.username}</span>
                                    <p>${commentProduction.content}</p>
                                    <span class="fromcss" style="width: auto"><fmt:formatDate value="${commentProduction.createDate}" pattern="yyyy-MM-dd HH:mm:SS"/></span>
                                        <%-- <a href=""><span class="dianzan" style="width: auto" aria-hidden="true">回复</span></a>--%>
                                </div>
                            </div>
                        </c:forEach>
                        <%--分页--%>
                        <nav>
                            <ul class="pagination">
                                <c:if test="${page.pageNum gt 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/production/detail/${production.id}?pageNum=${page.pageNum-1}#comment_index" aria-label="Previous">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${page.totalPage gt 1}">
                                    <c:forEach begin="${page.startPage-1}" end="${page.endPage-1}" step="1" var="index" >
                                        <li><a href="${pageContext.request.contextPath}/production/detail/${production.id}?pageNum=${index+1}#comment_index" <c:if test="${index+1 eq page.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${page.pageNum lt page.totalPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/production/detail/${production.id}?pageNum=${page.pageNum+1}#comment_index" aria-label="Next">
                                            <span aria-hidden="true">下一页</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>

                </div>
                <!--menucomment-->


            </div>


            <div class="cbookside">
                <div class="cbooksidecss">
                    <p>该用户的其他作品</p>
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

    $(document).ready(function(){
        checkCollection();
    });

    var result;
    function checkCollection(){
        var data = {
            date: new Date(),
            objectId : ${production.id},
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
                    $collection.html("已赞")
                }else{
                    $collection.html("点赞")
                }
            }
        })
    }

    function checkLogin(){
        var test = false;
        var data = {
            date: new Date()
        };
        $.ajax({
            type:       "POST",
            url:        "/checkLogin",
            dataType:   "json",
            async:      false,
            data    : data,
            success: function(data){
                if(data.result == 1){
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
                objectId : ${production.id},
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

    function publishComment(){

        var commentContent = $("#commentContent").val();

        if(checkLogin()){
            if(commentContent==null||commentContent==""){
                alert("评论不能为空！");
            }else{
                var data = {
                    productionId : ${production.id},
                    comment    : commentContent
                }
                $.ajax({
                    type:       "POST",
                    url:        "/commentProduction/publicComment",
                    dataType:   "json",
                    data    : data,
                    success: function(data){
                        if(data.result==1){
                            //添加评论
                            var $commentDiv = $("#commentDiv").clone().attr("id","");
                            var $commentArea = $("#commentArea");
                            var pNode = $commentDiv.find("p");
                            $(pNode).text(commentContent);
                            $commentArea.prepend($commentDiv);
                            $("#commentContent").val("");//清空
                        }else{
                            alert(data.msg)
                        }
                    }
                })
            }
        }else{
            alert("请先登录！");
        }

    }
</script>
</body>
</html>

