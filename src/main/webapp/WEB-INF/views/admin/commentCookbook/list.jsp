<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.2.0
Version: 1.0.0
Purchase: http://wrapbootstrap.com
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <meta charset="utf-8"/>
    <title>秀厨网</title>

    <meta name="description" content="Dashboard"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="/resources/assets/img/favicon.png" type="image/x-icon">


    <!--Basic Styles-->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link id="bootstrap-rtl-link" href="" rel="stylesheet"/>
    <link href="/resources/assets/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/resources/assets/css/weather-icons.min.css" rel="stylesheet"/>

    <!--Fonts-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/fonts_useso_com.css" rel="stylesheet"
          type="text/css">

    <!--Beyond styles-->
    <link href="/resources/assets/css/beyond.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/assets/css/demo.min.css" rel="stylesheet"/>
    <link href="/resources/assets/css/typicons.min.css" rel="stylesheet"/>
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet"/>
    <link id="skin-link" href="" rel="stylesheet" type="text/css"/>

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="/resources/assets/js/skins.min.js"></script>
</head>
<!-- /Head -->
<!-- Body -->
<body>
<!-- Loading Container -->
<div class="loading-container">
    <div class="loading-progress">
        <div class="rotator">
            <div class="rotator">
                <div class="rotator colored">
                    <div class="rotator">
                        <div class="rotator colored">
                            <div class="rotator colored"></div>
                            <div class="rotator"></div>
                        </div>
                        <div class="rotator colored"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
        <div class="rotator"></div>
    </div>
</div>
<!--  /Loading Container -->
<!-- Navbar -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="navbar-container">
            <!-- Navbar Barnd -->
            <div class="navbar-header pull-left">
                <a href="#" class="navbar-brand">
                    <small>
                        <img src="${pageContext.request.contextPath}/resources/customer/images/newlogo.png" alt=""/>
                    </small>
                </a>
            </div>
            <!-- /Navbar Barnd -->
            <!-- Sidebar Collapse -->
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="collapse-icon fa fa-bars"></i>
            </div>

            </li>
        </div>
    </div>
</div>
<!-- /Navbar -->
<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container">
        <!-- Page Sidebar -->
        <div class="page-sidebar" id="sidebar">
            <!-- Page Sidebar Header-->
            <div class="sidebar-header-wrapper">
                <input type="text" class="searchinput"/>
                <i class="searchicon fa fa-search"></i>

                <div class="searchhelper">Search Reports, Charts, Emails or Notifications</div>
            </div>
            <!-- /Page Sidebar Header -->
            <!-- Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <!--Dashboard-->
                <li>
                    <a href="/admin/index">
                        <i class="menu-icon glyphicon glyphicon-home"></i>
                        <span class="menu-text"> 首页 </span>
                    </a>
                </li>
                <!--Databoxes-->
                <!--UI Elements-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-desktop"></i>
                        <span class="menu-text"> 用户模块 </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/user/list">
                                <span class="menu-text">用户列表</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-table"></i>
                        <span class="menu-text">分类管理</span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/classification/list">
                                <span class="menu-text">分类列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li >
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-table"></i>
                        <span class="menu-text">菜谱模块</span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/cookbook/list">
                                <span class="menu-text">菜谱列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> 菜单模块 </span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/menu/list">
                                <span class="menu-text">菜单列表</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> 作品管理 </span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/production/list">
                                <span class="menu-text">作品列表</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="active open">
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> 评论管理 </span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/admin/commentCookbook/list">
                                <span class="menu-text">菜谱评论</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/commentProduction/list">
                                <span class="menu-text">作品评论</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-desktop"></i>
                        <span class="menu-text"> 管理员管理 </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="/admin/list">
                                <span class="menu-text">管理员列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--Profile-->

            </ul>
            <!-- /Sidebar Menu -->
        </div>
        <!-- /Page Sidebar -->
        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">秀厨网</li>
                </ul>
            </div>
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        秀厨网
                    </h1>
                </div>

            </div>
            <div>
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="well with-header  with-footer" style="margin-bottom:0px;padding-bottom:10px">
                            <div class="header bg-blue">
                                菜谱评论列表
                            </div>
                            <%--<div>
                                <div class="row">
                                    <form action="${pageContext.request.contextPath}/admin/query" method="post">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input name="username" class="form-control" style="width: 50%"
                                                       placeholder="用户名" type="text">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <button class="btn btn-azure" type="submit">查询</button>
                                        </div>
                                    </form>
                                </div>
                            </div>--%>
                        </div>
                        <table class="table table-hover">
                            <thead class="bordered-darkorange">
                            <tr>
                                <th>
                                    #
                                </th>
                                <th>
                                    来自用户
                                </th>
                                <th>
                                    来自菜谱
                                </th>
                                <th>
                                    评论内容
                                </th>
                                <th>
                                    创建时间
                                </th>
                                <th>
                                    更新时间
                                </th>
                                <th>
                                    是否锁定
                                </th>
                                <th>
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.list}" var="commentCookbook" varStatus="loop">
                                <tr>
                                    <td>
                                        ${page.pageSize*(page.pageNum-1)+loop.index+1}
                                    </td>
                                    <td>
                                        ${commentCookbook.user.username}
                                    </td>
                                    <td>
                                        ${commentCookbook.cookbook.title}
                                    </td>
                                    <td>
                                         ${commentCookbook.content}
                                    </td>
                                    <td>
                                          ${commentCookbook.createDate}
                                    </td>
                                    <td>
                                        ${commentCookbook.updateDate}
                                    </td>
                                    <td>
                                        <c:if test="${commentCookbook.deleted eq 1}">
                                            已锁定
                                        </c:if>
                                        <c:if test="${commentCookbook.deleted eq 0}">
                                            未锁定
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${commentCookbook.deleted eq 1}">
                                            <a href="${pageContext.request.contextPath}/admin/commentCookbook/lock?id=${commentCookbook.id}&state=0&pageNum=${page.pageNum}"
                                               class="btn btn-default btn-xs edit">解锁</a>
                                        </c:if>
                                        <c:if test="${commentCookbook.deleted eq 0}">
                                            <a href="${pageContext.request.contextPath}/admin/commentCookbook/lock?id=${commentCookbook.id}&state=1&pageNum=${page.pageNum}"
                                               class="btn btn-info btn-xs edit">锁定</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                        <nav>
                            <ul class="pagination">
                                <c:if test="${page.pageNum gt 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/commentCookbook/list?pageNum=${page.pageNum-1}"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${page.totalPage gt 1}">
                                    <c:forEach begin="${page.startPage}" end="${page.endPage}" step="1" var="index">
                                        <li><a href="${pageContext.request.contextPath}/admin/commentCookbook/list?pageNum=${index}"
                                            <c:if test="${index eq page.pageNum}">class="active"</c:if>>${index}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${page.pageNum lt page.totalPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/commentCookbook/list?pageNum=${page.pageNum+1}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>


        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

    </div>
</div>
<!--Basic Scripts-->
<script src="/resources/assets/js/jquery-2.0.3.min.js"></script>
<script src="/resources/assets/js/bootstrap.min.js"></script>

<!--Beyond Scripts-->
<script src="/resources/assets/js/beyond.min.js"></script>


<!--Page Related Scripts-->
<!--Sparkline Charts Needed Scripts-->
<script src="/resources/assets/js/charts/sparkline/jquery.sparkline.js"></script>
<script src="/resources/assets/js/charts/sparkline/sparkline-init.js"></script>


</body>
<!--  /Body -->
</html>
