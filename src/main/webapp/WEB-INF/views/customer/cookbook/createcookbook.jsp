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
                    <div style="float:left;">
                        <a class="btn btn1" href="#" role="button">登录</a>
                        <a class="btn btn1" href="#" role="button">注册</a>
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

            <h3>新建菜谱</h3>
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">菜谱名称</label>
                    <div class="col-sm-10" >
                        <input type="email" class="form-control" id="inputEmail3" placeholder="菜谱名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">上传文件</label>
                    <div class="col-sm-10">
                        <!--<input type="file" name="file0" id="file0" multiple /><br>
                        <img style="width:748px;height:475px;" src="images/tj.png" alt="" class="img-rounded" id="img0">-->
                        <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file1" id="file0" multiple /><br>
                        <img class="media-object" src=""  alt="..." style="width:748px;height:475px;cursor:pointer;background:url(images/tj.png)"  id="img0" onClick="tempClick0()" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="intro" class="col-sm-2 control-label">简介</label>
                    <div class="col-sm-16">
                        <textarea class="form-control" id="intro" rows="3" style="width:600px"></textarea>
                    </div>
                </div>




                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">用法</label>
                    <div class="col-sm-10" >
                        <div class="table-responsive">
                            <table id="ci" name="ci" class="table table-bordered " style="width:600px;">
                                <tr id="tabtr">
                                    <td ><input type="text" class="" style="border:none;width:200px;height:20px;" ></td>
                                    <td><input type="text" class="" style="border:none;width:200px;height:20px;"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="trdiv">
                            <a class="btn btn-default tradd" href="#" onclick="add()" role="button">添加一行</a>
                        </div>

                    </div>
                </div>



                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">步骤</label>
                    <div class="media">
                        <div class="media-body media_rself ">
                            <h4 class="media-heading">1</h4>
                            烤箱预热400F/205C。烤盘铺烘焙纸备用。
                        </div>
                        <div class="media-left media_lself ">

                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file1" id="file1" multiple /><br>
                            <img class="media-object" src=""  alt="..." style="width:230px;height:230px;cursor:pointer;background:url(images/fm.png)"  id="img1" onClick="tempClick()" >

                            </a>
                        </div>

                    </div>



                </div><!-- form-group-->


                <div class="form-group">

                    <div class="media medialocation">
                        <div class="media-body media_rself ">
                            <h4 class="media-heading">2</h4>
                            烤箱预热400F/205C。烤盘铺烘焙纸备用。
                        </div>
                        <div class="media-left media_lself ">

                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file1" id="file1" multiple /><br>
                            <img class="media-object" src=""  alt="..." style="width:230px;height:230px;cursor:pointer;background:url(images/fm.png)"  id="img1" onClick="tempClick()" >

                            </a>
                        </div>

                    </div>



                </div><!-- form-group-->



                <div class="form-group">
                    <div class="media  medialocation">
                        <div class="media-body media_rself ">
                            <h4 class="media-heading">3</h4>
                            烤箱预热400F/205C。烤盘铺烘焙纸备用。
                        </div>
                        <div class="media-left media_lself ">

                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file1" id="file1" multiple /><br>
                            <img class="media-object" src=""  alt="..." style="width:230px;height:230px;cursor:pointer;background:url(images/fm.png)"  id="img1" onClick="tempClick()" >

                            </a>
                        </div>

                    </div>



                </div><!-- form-group-->



                <div class="form-group">
                    <div class="media  medialocation">
                        <div class="media-body media_rself ">
                            <h4 class="media-heading">4</h4>
                            烤箱预热400F/205C。烤盘铺烘焙纸备用。
                        </div>
                        <div class="media-left media_lself ">

                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file1" id="file1" multiple /><br>
                            <img class="media-object" src=""  alt="..." style="width:230px;height:230px;cursor:pointer;background:url(images/fm.png)"  id="img1" onClick="tempClick()" >

                            </a>
                        </div>

                    </div>



                </div><!-- form-group-->

                <div class="form-group">
                    <div class="media  medialocation">
                        <div class="media-body media_rself ">
                            <h4 class="media-heading">5</h4>
                            烤箱预热400F/205C。烤盘铺烘焙纸备用。
                        </div>
                        <div class="media-left media_lself ">

                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file1" id="file1" multiple /><br>
                            <img class="media-object" src=""  alt="..." style="width:230px;height:230px;cursor:pointer;background:url(images/fm.png)"  id="img1" onClick="tempClick()" >

                            </a>
                        </div>

                    </div>



                </div><!-- form-group-->



                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default btnpublic">发布菜谱</button>
                    </div>


                </div>
            </form>



        </div><!--end cscontent -->
    </div><!--end  content-->
    <div id="pagebottom">
        <div class="cspagebottom">
            <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
        </div>
    </div><!--pagebottom-->

</div>
<script type="text/javascript">
    function tempClick0(){
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */

            //IE浏览器实现点击图片出现文件上传界面
        document.getElementById('file0').click();            //调用main_img的onclick事件
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
    //function addrow(){

    //		var tr = $("#tabtr");                                 //tabtr是你要克隆的表格行的id

    //		var newtr = tr.clone();                            //克隆tr行
    //		newtr.find(":input").each(function(i){      //循环新克隆的newtr，在里边找到所有的input标签，
    //					 $(this).val("");                                    //给该标签的value赋值为空
    // });
    // tr.after(newtr);                  //在id="tabtr"的表格行tr后插入克隆行newtr

    //}

    var count = 1;
    function add() {
        var tbl = document.all.ci;
        var rows = tbl.rows.length;
        var tr = tbl.insertRow(rows);

        var e_id = tr.insertCell(0);
//e_id.innerHTML = '<input type="text" name="e_id' + count + '" size="7" />';
        e_id.innerHTML = '<input type="text" style="border:none;width:200px;height:20px;" name="e_id' + count + '">';



        var memo = tr.insertCell(1);
        memo.innerHTML = '<input type="text" style="border:none;width:200px;height:20px;" name="mode' + count + '">';

        count++;
    }
</script>
<script>

    function tempClick(){
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */

            //IE浏览器实现点击图片出现文件上传界面
        document.getElementById('file1').click();            //调用main_img的onclick事件
    }


    $("#file1").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#img1").attr("src", objUrl) ;
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
