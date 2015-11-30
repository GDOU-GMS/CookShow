<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:48
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
            <div class="navcenter">
                <div class="seach">
                    <input type="text" class="form-control" id="exampleInputName2" placeholder="搜索商品或菜单">
                    <button class="btn btn-default">搜索</button>
                </div>
                <div class="landr">
                    <div style="float:left;">
                        <a class="btn btn1" href="#" role="button">登录</a>
                        <a class="btn btn1" href="#" role="button">注册</a>
                    </div>

                    <ul id="personcenter" style="float:left;">
                        <li style="width:110px;"><a class="btn btn1" href="#" role="button">个人中心</a>
                                     <ul>
                                        <li><a href="userinfo.jsp">账号设置</a></li>
                                        <li><a href="personwork.jsp">我的菜单</a></li>
                                        <li><a href="myfriends.jsp">关注的好友</a></li>
                                        <li><a href="#">退出</a></li>
                                    </ul>
                        </li>

                    </ul>

                </div>
                <!--landr-->

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
            <h3>设置个人信息</h3>

            <div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#info" aria-controls="home" role="tab"
                                                              data-toggle="tab">基本信息</a></li>

                    <li role="presentation"><a href="#pwd" aria-controls="messages" role="tab"
                                               data-toggle="tab">修改密码</a></li>
                    <li role="presentation"><a href="#personimage" aria-controls="settings" role="tab"
                                               data-toggle="tab">设置头像</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content tagstyle">
                    <div role="tabpanel" class="tab-pane active" id="info">

                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">自我介绍</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-10" style="padding-top:5px;">

                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1"
                                               checked>
                                        男
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                        女
                                    </label>

                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">保存</button>
                                    <button type="reset" class="btn btn-default">取消</button>
                                </div>

                            </div>
                        </form>


                    </div>
                    <div role="tabpanel" class="tab-pane" id="pwd">


                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">原密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">新密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">确认新密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">保存</button>
                                    <button type="reset" class="btn btn-default">取消</button>
                                </div>

                            </div>
                        </form>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="personimage">
                        <form>

                            <input type="file" name="file0" id="file0" multiple/><br>
                            <img style="width:140px;height:140px;" src="" alt="" class="img-rounded" id="img0">

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">更新</button>
                                </div>


                            </div>
                        </form>

                    </div>

                    <div role="tabpanel" class="tab-pane" id="settings">...</div>
                </div>

            </div>


        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->


</div>
<script>
    $("#file0").change(function () {
        var objUrl = getObjectURL(this.files[0]);
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            $("#img0").attr("src", objUrl);
        }
    });
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
</script>
</body>
</html>
