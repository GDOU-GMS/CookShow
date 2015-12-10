<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="${pageContext.request.contextPath}/admin/index">
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
                                <span class="menu-text">菜谱列表</span>
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
                            <a href="${pageContext.request.contextPath}/admin/cookbook/list">
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
                <li>
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-pencil-square-o"></i>
                        <span class="menu-text"> 评论管理 </span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu">
                        <li>
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
                <li class="active open">
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-desktop"></i>
                        <span class="menu-text"> 管理员管理 </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li class="active">
                            <a href="/admin/list">
                                <span class="menu-text">管理员列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!--Profile-->

            </ul>
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

            <!-- /Page Header -->
            <!-- Page Body -->
            <div>
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="well with-header  with-footer">
                            <div class="header bg-blue">
                                菜谱详细信息
                            </div>
                            <br/>

                            <div>
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">菜谱标题</span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">${cookbook.title }</label>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">菜谱标题图片</span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">${cookbook.titleImage}</label>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">菜谱材料</span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">${cookbook.material}</label>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">菜谱步骤</span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">${cookbook.step}</label>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">状态</span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">${cookbook.publicState}</label>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="widget-header bordered-bottom bordered-blue">
                                    <span class="widget-caption">提醒</span>
                                </div>
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">${cookbook.remind}</label>
                                    </div>
                                </div>
                            </div>
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
