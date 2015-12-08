<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li role="presentation" ><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
                <li role="presentation"><a href="#">健康饮食</a></li>
            </ul>
        </div>

    </div>

    <div id="content">
        <div class="cscontent">
            <h3>新建菜单</h3>
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/menu/addMenu">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">菜单名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name="name"  placeholder="请输入菜单名称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">菜单简介</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="title"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">确定</button>
                        <button type="reset" class="btn btn-default" onclick="window.location.href='${pageContext.request.contextPath}/user/personWork/${user.id}?target=mymenu'">取消</button>
                    </div>

                </div>
            </form>

        </div><!--end cscontent -->
    </div><!--end  content-->



</div>

</body>
</html>
