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

    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery_form/jquery.form.min.js"></script>

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
                <li role="presentation" class="cbook"></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation"  class="active"><a href="${pageContext.request.contextPath}/cookbook/listAllCookbook">菜谱</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
            </ul>
        </div>
    </div>
    <div id="content">
        <div class="cscontent">
            <div class="menuleft">
                <div class="menuimg">
                    <p>${cookbook.title}</p>
                    <div class="imgcontent">
                        <div class="imagetext">
                            <img src="${cookbook.titleImage}">
                            <div class="menushare">
                                <span>分享</span>
                                <div class="shareimg">
                                    <a href="javascript:void(0);" alt=""> <img src="${pageContext.request.contextPath}/resources/customer/images/weibo.png" style="width:36px;height:29px;"></a>
                                </div>
                            </div>
                            <a class="btn btn-default acss" href="javascript:void(0)" role="button" id="collection" onclick="doCollection()"></a>
                            <c:if test="${!empty user}">
                                <button data-toggle="modal" data-target="#myModal" class="btn btn-default acss" role="button" style="border-right: solid #fff">添加到...</button>
                            </c:if>
                        </div>
                        <!--end imagetext -->
                    </div>
                    <!--imgcontent-->
                </div>
                <!--menuimg -->

                <div class="menuinfo">
                    <div class="menusubinfo">
                        <p>简介</p>
                            <span>${cookbook.intro}</span>
                    </div>
                    <div class="menusubinfo">
                        <p>用料</p>

                        <div class="table-responsive" style="width:500px;">
                            <table class="table">
                                <c:forEach items="${materialList}" var="material">
                                    <tr>
                                        <td>${material.kind}</td>
                                        <td>${material.num}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </div>

                    <div class="menusubinfo">
                        <p>做法</p>
                    </div>
                    <c:forEach items="${stepList}" var="step" varStatus="loop">
                        <div class="menusubinfo">
                            <span class="cooktag1">${loop.index + 1}</span>
                            <span class="cooktag2">${step.intro}</span>
                            <div class="cookimg">
                                <img src="${step.image}"style="width:200px;height:200px;">
                            </div>
                        </div>
                    </c:forEach>

                    <a class="btn btn-default col-md-2 col-md-offset-5" href="${pageContext.request.contextPath}/production/forwardToCreateProduction?cookbookId=${cookbook.id}" role="button">上传我的作品</a>

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
                        <c:forEach items="${page.list}" var="commentCookbook">
                            <div class="eachcomment">
                                <hr style="color:#ccc;width:718px;">
                                <div class="personhead">
                                    <c:if test="${!empty commentCookbook.user.face}">
                                        <img src="${commentCookbook.user.face}" width="50" height="50">
                                    </c:if>
                                    <c:if test="${empty commentCookbook.user.face}">
                                        <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                                    </c:if>
                                </div>
                                <div class="persontalk1">
                                    <span>${commentCookbook.user.username}</span>
                                    <p>${commentCookbook.content}</p>
                                    <span class="fromcss" style="width: auto"><fmt:formatDate value="${commentCookbook.createDate}" pattern="yyyy-MM-dd HH:mm:SS"/></span>
                                        <%-- <a href=""><span class="dianzan" style="width: auto" aria-hidden="true">回复</span></a>--%>
                                </div>
                            </div>
                        </c:forEach>
                        <%--分页--%>
                        <nav>
                            <ul class="pagination">
                                <c:if test="${page.pageNum gt 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}?pageNum=${page.pageNum-1}#comment_index" aria-label="Previous">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${page.totalPage gt 1}">
                                    <c:forEach begin="${page.startPage-1}" end="${page.endPage-1}" step="1" var="index" >
                                        <li><a href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}?pageNum=${index+1}#comment_index" <c:if test="${index+1 eq page.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${page.pageNum lt page.totalPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/cookbook/cookbook/${cookbook.id}?pageNum=${page.pageNum+1}#comment_index" aria-label="Next">
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


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form id="addToMenuForm" action="${pageContext.request.contextPath}/menu/addCookbook" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加到我的菜单</h4>
                </div>
                <div class="modal-body">
                        <div class="form-group">
                            <label for="menuselect">请选择菜单：</label><br>
                            <select id="menuselect" class="form-control" name="menuId">
                                <c:if test="${!empty menuList}">
                                    <c:forEach items="${menuList}" var="menu">
                                        <option value="${menu.id}">${menu.name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                            <input name="cookbookId" type="hidden" value="${cookbook.id}">
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(document).ready(function(){
        checkCollection();
    });

    var result;
    function checkCollection(){
        var data = {
            date: new Date(),
            objectId : ${cookbook.id},
            type:   0
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
               objectId : ${cookbook.id},
               type     : 0,
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
                    cookbookId : ${cookbook.id},
                    comment    : commentContent
                }
                $.ajax({
                    type:       "POST",
                    url:        "/commentCookbook/publicComment",
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


    jQuery("#csnav").slide({
        type: "menu",
        titCell: ".mainCate",
        targetCell: ".subCate",
        delayTime: 0,
        triggerTime: 0,
        defaultPlay: false,
        returnDefault: true
    });

    var options = {
        beforeSubmit:  showRequest,  //提交前处理
        success:       showResponse,  //处理完成
        resetForm:     true,
        url:           '/menu/addCookbook',
        dataType:      'json'
    };

    $('#addToMenuForm').submit(function() {
        $(this).ajaxSubmit(options);
        // !!! Important !!!
        // always return false to prevent standard browser submit and page navigation
        return false;
    });
    function showRequest(formData, jqForm, options) {
        return true;
    }

    function showResponse(responseText, statusText,xhr, $form)  {
        console.log(responseText)
        var result = responseText.result;
        if(result==0||result==-1){
            alert(responseText.msg)
        }else{
            alert(responseText.msg)
            $(".modal").modal('hide');
        }
    }
</script>
</body>
</html>

