<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/30
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/workdynamic.css">


    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>

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

                </div><!--landr-->

            </div>
        </div>
    </div>
    <div id="navfont">
        <div id="navcontent">

          <ul class="nav nav-pills">
                <li role="presentation" class="cbook"><a title="点击查看所有分类" href="${pageContext.request.contextPath}/classification/allClassification">全部分类</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
                <li role="presentation"><a href="#">健康饮食</a></li>
            </ul>

        </div>

    </div>

    <div id="content">
        <div class="cscontent">

            <div>
                <!-- Tab panes -->
                <div class="tab-content tagstyle">
                    <div role="tabpanel" class="tab-pane active" id="info">

                        <c:forEach items="${page.list}" var="production">
                            <div  class="mediadynamic">
                                <div class="dynamictop">
                                    <div class="media">
                                        <div class="media-left dynamictopl">
                                            <a href="#">
                                                <img class="media-object" src="${production.user.face}" alt="...">
                                            </a>
                                        </div>
                                        <div class="media-body dynamictopr">
                                            <a href="#"><h4 class="media-heading">${production.user.username}</h4></a>
                                        </div>
                                    </div>
                                </div><!--end dynamictop-->

                                <div class="dynamicbottom">
                                    <div class="media">
                                        <div class="media-left dynamicbottoml">
                                            <a href="${pageContext.request.contextPath}/production/detail/${production.id}">
                                                <img class="media-object" src="${production.titleImage}">
                                            </a>
                                        </div>
                                        <div class="media-body dynamicbottomr">
                                            <h4 class="media-heading">${production.intro}</h4>
                                            <a href="${pageContext.request.contextPath}/cookbook/cookbook/${production.cookbookId}"><span>${production.title}的做法</span></a>
                                            <a href="#" class="zanzan"><span class="glyphicon glyphicon-thumbs-up dianzan" aria-hidden="true"></span></a>
                                        </div>
                                    </div>
                                    <%--<div class="dynamiccomment">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-sm-3" style="width:100%;" >
                                                    <input type="email" style="width:700px;" class="form-control" id="inputEmail3" >
                                                    <button type="submit" class="btn btn-default dcomment">评论</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>--%>
                                </div><!--end dynamicbottom-->
                            </div><!--end mediadynamic-->
                        </c:forEach>

                        <%--<div  class="mediadynamic">
                            <div class="dynamictop">
                                <div class="media">
                                    <div class="media-left dynamictopl">
                                        <a href="#">
                                            <img class="media-object" src="images/tx1.png" alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body dynamictopr">
                                        <a href="#"><h4 class="media-heading">鬼鬼</h4></a><span>做过</span>
                                        <a href="#"><h4 class="media-heading">烤鱼</h4></a>

                                    </div>
                                </div>
                            </div><!--end dynamictop-->

                            <div class="dynamicbottom">
                                <div class="media">
                                    <div class="media-left dynamicbottoml">
                                        <a href="#">
                                            <img class="media-object" src="images/zp.png" alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body dynamicbottomr">
                                        <h4 class="media-heading">无可替代哈</h4>
                                        <a href="#"><span>酸菜鱼的做法</span></a>
                                        <a href="#" class="zanzan"><span class="glyphicon glyphicon-thumbs-up dianzan" aria-hidden="true"></span></a>
                                    </div>
                                </div>
                                <div class="dynamiccomment">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-sm-3" style="width:100%;" >
                                                <input type="email" style="width:700px;" class="form-control" id="inputEmail3" >
                                                <button type="submit" class="btn btn-default dcomment">评论</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div><!--end dynamicbottom-->
                        </div><!--end mediadynamic-->--%>

                        <%--<div  class="mediadynamic">
                            <div class="dynamictop">
                                <div class="media">
                                    <div class="media-left dynamictopl">
                                        <a href="#">
                                            <img class="media-object" src="images/tx1.png" alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body dynamictopr">
                                        <a href="#"><h4 class="media-heading">鬼鬼</h4></a><span>做过</span>
                                        <a href="#"><h4 class="media-heading">烤鱼</h4></a>
                                    </div>
                                </div>
                            </div><!--end dynamictop-->

                            <div class="dynamicbottom">
                                <div class="media">
                                    <div class="media-left dynamicbottoml">
                                        <a href="#">
                                            <img class="media-object" src="images/zp.png" alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body dynamicbottomr">
                                        <h4 class="media-heading">无可替代哈</h4>
                                        <a href="#"><span>酸菜鱼的做法</span></a>
                                        <a href="#" class="zanzan"><span class="glyphicon glyphicon-thumbs-up dianzan" aria-hidden="true"></span></a>
                                    </div>
                                </div>
                                <div class="dynamiccomment">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-sm-3" style="width:100%;" >
                                                <input type="email" style="width:700px;" class="form-control" id="inputEmail3" >
                                                <button type="submit" class="btn btn-default dcomment">评论</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div><!--end dynamicbottom-->
                        </div><!--end mediadynamic-->--%>
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


    function tempClick(){
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */

            //IE浏览器实现点击图片出现文件上传界面
        document.getElementById('file3').click();            //调用main_img的onclick事件
    }
    $("#file0").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#img0").attr("src", objUrl) ;
        }
    }) ;
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
</body>
</html>

