<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/27
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.2.0
Version: 1.0.0
Purchase: http://wrapbootstrap.com
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <meta charset="utf-8" />
    <title>菜单模块</title>

    <meta name="description" content="data tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="/resources/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="/resources/assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/fonts_useso_com.css" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link id="beyond-link" href="/resources/assets/css/beyond.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/demo.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/typicons.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Page Related styles-->
    <link href="/resources/assets/css/dataTables.bootstrap.css" rel="stylesheet" />

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
                        <img src="/resources/assets/img/cs.png" alt="" />
                    </small>
                </a>
            </div>
            <!-- /Navbar Barnd -->

            <!-- Sidebar Collapse -->
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="collapse-icon fa fa-bars"></i>
            </div>

            </li>
            <!--
                                        </div>
                            </div>
                            <!-- /Account Area and Settings -->
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
                <input type="text" class="searchinput" />
                <i class="searchicon fa fa-search"></i>
                <div class="searchhelper">Search Reports, Charts, Emails or Notifications</div>
            </div>
            <!-- /Page Sidebar Header -->
            <!-- Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <!--Dashboard-->
                <li class="active">
                    <a href="index.html">
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
                            <a href="elements.html">
                                <span class="menu-text">登录注册</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="menu-dropdown">
                                    <span class="menu-text">
                                      我的厨房
                                    </span>
                                <i class="menu-expand"></i>
                            </a>
                        </li>
                        <li>
                            <a href="tabs.html">
                                <span class="menu-text">我的菜单</span>
                            </a>
                        </li>
                        <li>
                            <a href="alerts.html">
                                <span class="menu-text">好友</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <!--Tables-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-table"></i>
                        <span class="menu-text"> 菜谱模块 </span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="tables-simple.html">
                                <span class="menu-text">热门专题</span>
                            </a>
                        </li>
                        <li>
                            <a href="tables-data.html">
                                <span class="menu-text">菜谱分类</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--Forms-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> 菜单模块 </span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="form-layouts.html">
                                <span class="menu-text">最近流行</span>
                            </a>
                        </li>

                        <li>
                            <a href="form-inputs.html">
                                <span class="menu-text">往期头条</span>
                            </a>
                        </li>

                        <li>
                            <a href="form-pickers.html">
                                <span class="menu-text">月度最佳</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <!--Charts-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-bar-chart-o"></i>
                        <span class="menu-text"> 作品关注</span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="flot.html">
                                <span class="menu-text">我的关注</span>
                            </a>
                        </li>

                        <li>
                            <a href="morris.html">
                                <span class="menu-text"> 我的收藏</span>
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
            <!-- /Page Breadcrumb -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        XX模块
                    </h1>
                </div>
                <!--Header Buttons-->
                <div class="header-buttons">
                    <a class="sidebar-toggler" href="#">
                        <i class="fa fa-arrows-h"></i>
                    </a>
                    <a class="refresh" id="refresh-toggler" href="">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </a>
                    <a class="fullscreen" id="fullscreen-toggler" href="#">
                        <i class="glyphicon glyphicon-fullscreen"></i>
                    </a>
                </div>
                <!--Header Buttons End-->
            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
            <div class="page-body">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">编辑框</span>
                                <div class="widget-buttons">
                                    <a href="#" data-toggle="maximize">
                                        <i class="fa fa-expand"></i>
                                    </a>
                                    <a href="#" data-toggle="collapse">
                                        <i class="fa fa-minus"></i>
                                    </a>
                                    <!--   <a href="#" data-toggle="dispose">
                                           <i class="fa fa-times"></i>
                                       </a>-->
                                </div>
                            </div>
                            <div class="widget-body">
                                <div class="table-toolbar">
                                    <a id="editabledatatable_new" href="javascript:void(0);" class="btn btn-default">
                                        添加
                                    </a>

                                </div>
                                <table class="table table-striped table-hover table-bordered" id="editabledatatable">
                                    <thead>
                                    <tr role="row">
                                        <th>
                                            Username
                                        </th>
                                        <th>
                                            Full Name
                                        </th>
                                        <th>
                                            Points
                                        </th>
                                        <th>
                                            Notes
                                        </th>
                                        <th>

                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td>alex</td>
                                        <td>Alex Nilson</td>
                                        <td>1234</td>
                                        <td class="center ">power user</td>
                                        <td>
                                            <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> 编辑</a>
                                            <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            gist124
                                        </td>
                                        <td>
                                            Nick Roberts
                                        </td>
                                        <td>
                                            62
                                        </td>
                                        <td class="center ">
                                            new user
                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> 编辑</a>
                                            <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            goldweb
                                        </td>
                                        <td>
                                            Sergio Jackson
                                        </td>
                                        <td>
                                            132
                                        </td>
                                        <td class="center ">
                                            elite user
                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> 编辑</a>
                                            <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            lisa
                                        </td>
                                        <td>
                                            Lisa Wong
                                        </td>
                                        <td>
                                            434
                                        </td>
                                        <td class="center ">
                                            new user
                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a>
                                            <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /Page Body -->
    </div>
    <!-- /Page Content -->
</div>
<!-- /Page Container -->
<!-- Main Container -->

</div>

<!--Basic Scripts--><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.2.0
Version: 1.0.0
Purchase: http://wrapbootstrap.com
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <meta charset="utf-8" />
    <title>秀厨网</title>

    <meta name="description" content="Dashboard" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="/resources/assets/img/favicon.png" type="image/x-icon">


    <!--Basic Styles-->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="/resources/assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/fonts_useso_com.css" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link href="/resources/assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/assets/css/demo.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/typicons.min.css" rel="stylesheet" />
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

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
                        <img src="/resources/assets/img/cs.png" alt="" />
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
                <input type="text" class="searchinput" />
                <i class="searchicon fa fa-search"></i>
                <div class="searchhelper">Search Reports, Charts, Emails or Notifications</div>
            </div>
            <!-- /Page Sidebar Header -->
            <!-- Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <!--Dashboard-->
                <li>
                    <a href="index.html">
                        <i class="menu-icon glyphicon glyphicon-home"></i>
                        <span class="menu-text" > 首页 </span>
                    </a>
                </li>
                <!--Databoxes-->

                <!--UI Elements-->
                <li class="active open">
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-desktop"></i>
                        <span class="menu-text"> 用户模块 </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li class="active">
                            <a href="javascript:void(0);">
                                <span class="menu-text">用户列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="menu-dropdown">
                                    <span class="menu-text">
                                      我的厨房
                                    </span>
                                <i class="menu-expand"></i>
                            </a>
                        </li>
                        <li>
                            <a href="tabs.html">
                                <span class="menu-text">我的菜单</span>
                            </a>
                        </li>
                        <li>
                            <a href="alerts.html">
                                <span class="menu-text">好友</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <!--Tables-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-table"></i>
                        <span class="menu-text"> 菜谱模块 </span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/cookbook/list">
                                <span class="menu-text">热门专题</span>
                            </a>
                        </li>
                        <li>
                            <a href="tables-data.html">
                                <span class="menu-text">菜谱分类</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--Forms-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> 菜单模块 </span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="form-layouts.html">
                                <span class="menu-text">最近流行</span>
                            </a>
                        </li>

                        <li>
                            <a href="form-inputs.html">
                                <span class="menu-text">往期头条</span>
                            </a>
                        </li>

                        <li>
                            <a href="form-pickers.html">
                                <span class="menu-text">月度最佳</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <!--Charts-->
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-bar-chart-o"></i>
                        <span class="menu-text"> 作品关注</span>

                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="flot.html">
                                <span class="menu-text">我的关注</span>
                            </a>
                        </li>

                        <li>
                            <a href="morris.html">
                                <span class="menu-text"> 我的收藏</span>
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
            <!-- /Page Breadcrumb -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        秀厨网
                    </h1>
                </div>

            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
            <div>
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="well with-header  with-footer">
                            <div class="header bg-blue">
                               最近流行
                            </div>
                            <table class="table table-hover">
                                <thead class="bordered-darkorange">
                                <tr>
                                    <th>
                                        #
                                    </th>
                                    <th>
                            菜单名字                          
                                    </th>
                                    <th>
                                        创建时间
                                    </th>
                                    <th>
                                       更新时间
                                    </th>
                                    <th>
                                        点赞数
                                    </th>
                                                         <th>
                                        是否删除
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                             <c:forEach items="${recentmenu}" var="menu" varStatus="loop">
                                    <tr>
                                        <td>
                                                ${recentmenu.id}
                                        </td>
                              
                                        <td>
                                                ${recentmenu.createDate}
                                        </td>
                                        <td>
                                                ${recentmenu.updateDate}
                                        </td>
                                         <td>
                                                ${recentmenu.classificationCode}
                                        </td>
                                         <td>
                                                ${recentmenu.favourNum}
                                        </td>
                                              <td>
                                     ${recentmenu.deleted }
                                        </td>
                                    </tr>
                                </c:forEach> 
                                </tbody>
                            </table>
                            <br/>
                            <nav>
                                <ul class="pagination">
                                    <c:if test="${page.pageNum-1 gt 1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/cookbook/list?pageNum=${page.pageNum-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${page.startIndex}" end="${page.startIndex}" step="1" var="index">
                                        <li><a href="${pageContext.request.contextPath}/cookbook/list?pageNum=${index+1}" <c:if test="${index+1 eq page.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                    </c:forEach>
                                    <c:if test="${page.pageNum+1 lt page.totalRecord}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/cookbook/list?pageNum=${page.pageNum+1}" aria-label="Next">
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
        </div>
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

<script src="/resources/assets/js/jquery-2.0.3.min.js"></script>
<script src="/resources/assets/js/bootstrap.min.js"></script>

<!--Beyond Scripts-->
<script src="/resources/assets/js/beyond.min.js"></script>

<!--Page Related Scripts-->
<script src="/resources/assets/js/datatable/jquery.dataTables.min.js"></script>
<script src="/resources/assets/js/datatable/ZeroClipboard.js"></script>
<script src="/resources/assets/js/datatable/dataTables.tableTools.min.js"></script>
<script src="/resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>
<script src="/resources/assets/js/datatable/datatables-init.js"></script>
<script>
    InitiateSimpleDataTable.init();
    InitiateEditableDataTable.init();
    InitiateExpandableDataTable.init();
    InitiateSearchableDataTable.init();
</script>
<!--Google Analytics::Demo Only-->
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-52103994-1', 'auto');
    ga('send', 'pageview');

</script>
</body>
<!--  /Body -->
</html>
