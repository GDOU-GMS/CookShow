<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:45
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/cookmenu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/createcookbook.css">


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

                    <ul id="personcenter" style="float:left;">
                        <li style="width:110px;"><a class="btn btn1" href="#" role="button">个人中心</a>
                            <ul>
                                <li><a href="userinfo.html">账号设置</a></li>
                                <li><a href="personwork.html">我的菜单</a></li>
                                <li><a href="myfriends.html">关注的好友</a></li>
                                <li><a href="#">退出</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="navfont">
        <div id="navcontent">

            <ul class="nav nav-pills">
                <li role="presentation" class="cbook "><span>全部分类</span></li>
                <li role="presentation" class="active"><a href="index.html">首页</a></li>
                <li role="presentation"><a href="cookmenu.html">菜单</a></li>
                <li role="presentation"><a href="#">健康饮食</a></li>
                <li role="presentation"><a href="#">作品动态</a></li>
            </ul>


        </div>
    </div>
    <div id="content">
        <div class="cscontent">

            <h3>编辑菜谱</h3>
            <form class="form-horizontal" METHOD="post" action="/cookbook/modifyCookbook" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${cookbook.id}">
                <div class="form-group">
                    <label for="cookbookName" class="col-sm-2 control-label">菜谱名称</label>
                    <div class="col-sm-10" >
                        <input type="text" class="form-control" id="cookbookName" name="title" placeholder="菜谱名称" value="${cookbook.title}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="file0" class="col-sm-2 control-label">上传文件</label>
                    <div class="col-sm-10">
                        <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="titleImg" id="file0" multiple /><br>
                        <img class="media-object" src="${cookbook.titleImage}"  alt="..." style="width:748px;height:475px;cursor:pointer;background:url(${pageContext.request.contextPath}/resources/customer/images/tj.png);background-size: cover"  id="img0" onClick="tempClick0('file0')" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="intro" class="col-sm-2 control-label">简介</label>
                    <div class="col-sm-16">
                        <textarea class="form-control" id="intro" rows="3" name="intro" style="width:600px">${cookbook.intro}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用法</label>
                    <div class="col-sm-10" >
                        <div class="table-responsive">
                            <table id="ci" name="ci" class="table table-bordered " style="width:600px;">
                                <c:forEach items="${materialList}" var="material">
                                    <tr id="tabtr">
                                        <td ><input type="text" name="material_kind" class="" style="border:none;width:200px;height:20px;" value="${material.kind}"></td>
                                        <td><input type="text" class="" name="material_num" style="border:none;width:200px;height:20px;" value="${material.num}"></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="trdiv">
                            <a class="btn btn-default tradd" href="javascript:void(0)" onclick="add()" role="button">添加一行</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <span class="col-sm-2 control-label">步骤</span>
                </div>
                <c:forEach items="${stepList}" var="step" varStatus="loop">
                    <div class="form-group">
                        <div class="media medialocation">
                            <div class="media-body media_rself ">
                                <h4 class="media-heading">${loop.index+1}</h4>
                                <textarea type="text" class="form-control" style="width: 80%" rows="4" name="step_intro">${step.intro}</textarea>
                            </div>
                            <div class="media-left media_lself ">
                                <input type="file" class="inputimage" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;" data-imgId="img${loop.index+1}"  name="step_image" id="file${loop.index+1}" multiple /><br>
                                <img class="media-object" src="${step.image}"  alt="..." style="width:230px;height:230px;cursor:pointer;background:url(${pageContext.request.contextPath}/resources/customer/images/fm.png);background-size: cover"  id="img${loop.index+1}" data-inputId="file${loop.index+1}" onClick="tempClick(event)">
                            </div>
                        </div>
                    </div><!-- form-group-->
                </c:forEach>


                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a class="btn btn-default tradd" href="javascript:void(0)" onclick="addstep()" role="button">添加步骤</a>
                    </div>
                </div>
                <div class="form-group">
                    <div class="medialocation">
                        <h4 class="media-heading">选择分类：</h4>
                        <input type="text" class="inputimage form-control" id="checkedName" data-toggle="modal" data-target="#myModal" value="${classifications}" readonly>
                        <input type="hidden" id="checkedCode" class="form-control" name="classifications" value="${cookbook.classificationCode}">
                    </div>
                </div>
                <%--  <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                          <button type="button" class="btn btn-default tradd" >
                              选择分类
                          </button>
                      </div>
                  </div><!-- form-group-->--%>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default btnpublic">编辑完成</button>
                    </div>
                </div>
            </form>

            {"intro":"5555","image":"http://7xoqvb.com1.z0.glb.clouddn.com/201512031507503_"}]

        </div><!--end cscontent -->
    </div><!--end  content-->
    <div id="pagebottom">
        <div class="cspagebottom">
            <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
        </div>
    </div><!--pagebottom-->


    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">选择分类</h4>
                </div>
                <div class="modal-body">
                    <c:forEach items="${topClassificationList}" var="topClassification">
                        <h4>${topClassification.name}</h4><hr>
                        <c:forEach items="${topClassification.list}" var="secondClassification">
                            <h5>${secondClassification.name}：</h5>
                            <div class="thirdClassification">
                                <c:forEach items="${secondClassification.list}" var="thirdClassification">
                                    <div class="checkbox-inline">
                                        <label><input type="checkbox" onclick="updateClassification()" value="${thirdClassification.code}" data-name="${thirdClassification.name}" <c:if test="${cookbook.classificationCode.contains(thirdClassification.code)}">checked="checked" </c:if>>${thirdClassification.name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </c:forEach>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    var count = 1;
    function add() {
        var tbl = document.all.ci;
        var rows = tbl.rows.length;
        var tr = tbl.insertRow(rows);
        var e_id = tr.insertCell(0);
        e_id.innerHTML = '<input type="text" style="border:none;width:200px;height:20px;" name="material_kind">';
        var memo = tr.insertCell(1);
        memo.innerHTML = '<input type="text" style="border:none;width:200px;height:20px;" name="material_num">';
        count++;
    }
</script>
<script>
    var num=${stepList.size()+1};
    function addstep(){
        var div = $(".media:last");                          //获得要克隆的div

        var newdiv = div.clone();                           //克隆div
        newdiv.find(":input").each(function(i){         //将input制空，
            $(this).val("");
            //给该标签的value赋值为空
        });
        newdiv.find("input").each(function (i) {
            $(this).attr("id","file"+num);
            $(this).attr("data-imgId","img"+num);
            $(this).change(changeImgSource);
        })
        newdiv.find("img").each(function(i){
            $(this).attr("src","${pageContext.request.contextPath}/resources/customer/images/fm.png")
            $(this).attr("data-inputId","file"+num)
            $(this).attr("id","img"+num)
        })
        newdiv.find("h4").text(num);
        div.after(newdiv);                                   //放在所在div之后
        num++;
    }
</script>
<script type="text/javascript">

    function tempClick0(id){
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */

            //IE浏览器实现点击图片出现文件上传界面
        document.getElementById(id).click();            //调用main_img的onclick事件
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
<script>

    function tempClick(event){
        event = event ? event : window.event;
        var obj = event.srcElement ? event.srcElement : event.target;
        var inputId = $(obj).attr("data-inputId")
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */

            //IE浏览器实现点击图片出现文件上传界面
            //$("#"+inputId).click();
        document.getElementById(inputId).click();            //调用main_img的onclick事件

    }


    $(".inputimage").change(changeImgSource) ;

    //修改触发事件
    function changeImgSource(event){
        event = event ? event : window.event;
        var obj = event.srcElement ? event.srcElement : event.target;
        var imgId = $(obj).attr("data-imgid");
        var objUrl = getObjectURL(this.files[0]) ;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#"+imgId).attr("src", objUrl) ;
        }
    }

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

    function updateClassification(){
        //获取所有选中的checkbox
        var thirdClassifications = $(".thirdClassification :input:checked");
        var $checkedName = $("#checkedName");
        var $checkedCode = $("#checkedCode");
        var checkedNameStr = "";
        var checkedCodeStr = "";

        thirdClassifications.each(function(index,thirdClassification){
            checkedNameStr = checkedNameStr + $(thirdClassification).data("name")+",";
            checkedCodeStr = checkedCodeStr + $(thirdClassification).val() +",";
            console.log([$(thirdClassification).val()])
            console.log([$(thirdClassification).data("name")])
        });
        $checkedName.val(checkedNameStr)
        $checkedCode.val(checkedCodeStr)

    }
</script>
</body>
</html>
