<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png"
          type="image/x-icon">


    <!--Basic Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/css/weather-icons.min.css" rel="stylesheet"/>

    <!--Fonts-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/fonts_useso_com.css" rel="stylesheet"
          type="text/css">

    <!--Beyond styles-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/beyond.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/css/typicons.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css" rel="stylesheet"/>

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="${pageContext.request.contextPath}/resources/assets/js/skins.min.js"></script>
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
                        <img src="/resources/assets/img/cs.png" alt=""/>
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
                <li class="active open">
                    <a href="#" class="menu-dropdown">
                        <i class="menu-icon fa fa-table"></i>
                        <span class="menu-text">分类管理</span>
                        <i class="menu-expand"></i>
                    </a>
                    <ul class="submenu">
                        <li class="active">
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
                            <a href="${pageContext.request.contextPath}/admin/menu/list">
                                <span class="menu-text">菜单列表</span>
                            </a>
                        </li>

                    </ul>
                </li>
                <!--Charts-->

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
                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="widget flat radius-bordered">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">分类列表</span>
                            </div>

                            <div class="widget-body">
                                <div id="myTree" class="tree tree-plus-minus tree-solid-line tree-unselectable">
                                    <div class="tree-folder" style="display: block;">
                                        <div class="tree-folder-header">
                                            <i class="fa fa-folder"></i>

                                            <div class="tree-folder-name">所有分类
                                                <div class="tree-actions">
                                                    <i class="fa fa-plus green" data-parentcode=""
                                                       onclick=addClassification(event)></i>
                                                    <%--<i class="fa fa-trash-o danger"></i>
                                                        <i class="fa fa-rotate-right blizzard"></i>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tree-folder-content" style="display: block">
                                            <c:forEach items="${topClassificationVoList}" var="topClassification">
                                                <div class="tree-folder" style="display: block;">
                                                    <div class="tree-folder-header">
                                                        <i class="fa fa-folder"></i>

                                                        <div class="tree-folder-name">
                                                            <c:if test="${topClassification.deleted eq 1}">
                                                                <span style="text-decoration:line-through;">${topClassification.name}</span>
                                                            </c:if>
                                                            <c:if test="${topClassification.deleted eq 0}">
                                                                ${topClassification.name}
                                                            </c:if>
                                                            <div class="tree-actions">
                                                                <i class="fa fa-plus green" title="添加"
                                                                   data-parentcode="${topClassification.code}"
                                                                   onclick="addClassification(event)"></i>
                                                                <i class="fa fa-edit blizzard" title="编辑"
                                                                   data-id="${topClassification.id}"
                                                                   data-name="${topClassification.name}"
                                                                   onclick="updateClassification(event)"></i>
                                                                <c:if test="${topClassification.deleted eq 1}">
                                                                    <a href="${pageContext.request.contextPath}/admin/classification/recover?classificationId=${topClassification.id}"
                                                                       onclick="return confirm('确认要恢复吗?')"><i
                                                                            class="fa fa-reply danger"
                                                                            title="恢复"></i></a>
                                                                </c:if>
                                                                <c:if test="${topClassification.deleted eq 0}">
                                                                    <a href="${pageContext.request.contextPath}/admin/classification/disable?classificationId=${topClassification.id}"
                                                                       onclick="return confirm('确认要删除吗?')"><i
                                                                            class="fa fa-trash-o danger" title="删除"></i></a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tree-folder-content" style="display: none">
                                                        <c:forEach items="${topClassification.list}"
                                                                   var="secondClassification">
                                                            <div class="tree-folder" style="display: block;">
                                                                <div class="tree-folder-header">
                                                                    <i class="fa fa-folder"></i>

                                                                    <div class="tree-folder-name">
                                                                        <c:if test="${secondClassification.deleted eq 1}">
                                                                            <span style="text-decoration:line-through;">${secondClassification.name}</span>
                                                                        </c:if>
                                                                        <c:if test="${secondClassification.deleted eq 0}">
                                                                            ${secondClassification.name}
                                                                        </c:if>
                                                                        <div class="tree-actions">
                                                                            <i class="fa fa-plus green" title="添加"
                                                                               data-parentcode="${secondClassification.code}"
                                                                               onclick="addClassification(event)"></i>
                                                                            <i class="fa fa-edit blizzard" title="编辑"
                                                                               data-id="${secondClassification.id}"
                                                                               data-name="${secondClassification.name}"
                                                                               onclick="updateClassification(event)"></i>
                                                                            <c:if test="${secondClassification.deleted eq 1}">
                                                                                <a href="${pageContext.request.contextPath}/admin/classification/recover?classificationId=${secondClassification.id}"
                                                                                   onclick="return confirm('确认要恢复吗?')"><i
                                                                                        class="fa fa-reply danger"
                                                                                        title="恢复"></i></a>
                                                                            </c:if>
                                                                            <c:if test="${secondClassification.deleted eq 0}">
                                                                                <a href="${pageContext.request.contextPath}/admin/classification/disable?classificationId=${secondClassification.id}"
                                                                                   onclick="return confirm('确认要删除吗?')"><i
                                                                                        class="fa fa-trash-o danger"
                                                                                        title="删除"></i></a>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tree-folder-content" style="display: none">
                                                                    <c:forEach items="${secondClassification.list}"
                                                                               var="thirdClassification">
                                                                        <div class="tree-item">
                                                                            <i class="tree-dot"></i>

                                                                            <div class="tree-item-name">
                                                                                <c:if test="${thirdClassification.deleted eq 1}">
                                                                                    <span style="text-decoration:line-through;">${thirdClassification.name}</span>
                                                                                </c:if>
                                                                                <c:if test="${thirdClassification.deleted eq 0}">
                                                                                    ${thirdClassification.name}</div>
                                                                            </c:if>
                                                                            <div class="tree-actions">
                                                                                <i class="fa fa-edit blizzard"
                                                                                   title="编辑"
                                                                                   data-id="${thirdClassification.id}"
                                                                                   data-name="${thirdClassification.name}"
                                                                                   onclick="updateClassification(event)"></i>
                                                                                <c:if test="${thirdClassification.deleted eq 1}">
                                                                                    <a href="${pageContext.request.contextPath}/admin/classification/recover?classificationId=${thirdClassification.id}"
                                                                                       onclick="return confirm('确认要恢复吗?')"><i
                                                                                            class="fa fa-reply danger"
                                                                                            title="恢复"></i></a>
                                                                                </c:if>
                                                                                <c:if test="${thirdClassification.deleted eq 0}">
                                                                                    <a href="${pageContext.request.contextPath}/admin/classification/disable?classificationId=${thirdClassification.id}"
                                                                                       onclick="return confirm('确认要删除吗?')"><i
                                                                                            class="fa fa-trash-o danger"
                                                                                            title="删除"></i></a>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                                <div class="tree-loader" style="display: none;"></div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="tree-loader" style="display: none;"></div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="tree-loader" style="display: none;"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Page Body -->
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/classification/add" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加分类</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">分类名</label>
                        <input type="text" class="form-control" name="name" id="exampleInputEmail1" placeholder="分类名">
                        <input type="hidden" name="parentCode" class="parentCode">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/admin/classification/update" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="updateModalLabel">修改分类</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="classificationName">分类名</label>
                        <input type="text" class="form-control" name="name" id="classificationName" placeholder="分类名">
                        <input type="hidden" name="classificationId" class="classificationId" id="classificationId">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>

<!--Beyond Scripts-->
<script src="${pageContext.request.contextPath}/resources/assets/js/beyond.min.js"></script>


<!--Page Related Scripts-->
<script src="${pageContext.request.contextPath}/resources/assets/js/fuelux/treeview/tree-custom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/fuelux/treeview/treeview-init.js"></script>

<script>
    jQuery(document).ready(function () {
        UITree.init();
    });

    function addClassification(event) {
        event = event ? event : window.event;
        var obj = event.srcElement ? event.srcElement : event.target;
        var parentcode = $(obj).data('parentcode');
        $(".parentCode").val("");
        $(".parentCode").val(parentcode);
        $('#myModal').modal('show');
    }

    function updateClassification(event) {
        event = event ? event : window.event;
        var obj = event.srcElement ? event.srcElement : event.target;
        var id = $(obj).data("id");
        var name = $(obj).data("name");
        $("#classificationName").empty();
        $("#classificationName").val(name);
        $("#classificationId").empty();
        $("#classificationId").val(id);

        $("#updateModal").modal('show');
    }

    function deleteClassification(event) {
        if (confirm("确认要删除吗？")) {
            event = event ? event : window.event;
            var obj = event.srcElement ? event.srcElement : event.target;
            var code = $(obj).data("code");
            var url = "${pageContext.request.contextPath}/admin/classification/disable";
            var data = {
                "code": code
            }
            $.post(url, data);
        }

    }
</script>

</body>
<!--  /Body -->
</html>
