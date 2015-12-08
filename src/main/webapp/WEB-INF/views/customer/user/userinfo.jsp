<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:48
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer/css/userinfo.css">


    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/resources/customer/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customer/js/jquery.SuperSlide.2.1.js"></script>

    <!--datapicker-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/customer/plugins/datepicker/css/jquery-ui.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/customer/plugins/datepicker/js/jquery-ui-datepicker.js"></script>
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
                <!--landr-->

            </div>
        </div>
    </div>
    <div id="navfont">
        <div id="navcontent">

          <ul class="nav nav-pills">
                <li role="presentation" class="cbook"><a href="${pageContext.request.contextPath}/classification/allClassification">全部分类</li>
                <li role="presentation" class=""><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/menu/cookmenu">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/production/productionIndex">作品动态</a></li>
                <li role="presentation"><a href="#">健康饮食</a></li>
            </ul>

        </div>

    </div>

    <div id="content">
        <div class="cscontent">
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

                        <form class="form-horizontal" action="${pageContext.request.contextPath}/user/updateUserInfo"
                              method="post">
                            <div class="form-group">
                                <label for="nick" class="col-sm-2 control-label">昵称</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="nick" placeholder="昵称"
                                           value="${user.username}" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="realName" class="col-sm-2 control-label">真实姓名</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="realName" placeholder="真实姓名"
                                           name="realName" value="${user.realName}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-sm-2 control-label">电话</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="phone" placeholder="电话" name="phone"
                                           value="${user.phone}" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-sm-2 control-label">生日</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="birthday" placeholder="生日"
                                           name="userBirthday"
                                           value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
                                           required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">自我介绍</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" id="inputPassword3" rows="3" required
                                              name="intro">${user.intro}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>

                                <div class="col-sm-10" style="padding-top:5px;">
                                    <label>
                                        <input type="radio" name="gender" id="optionsRadios1" value="男"
                                               <c:if test="${user.gender eq '男'}">checked</c:if> required>
                                        男
                                    </label>
                                    <label>
                                        <input type="radio" name="gender" id="optionsRadios2" value="女"
                                               <c:if test="${user.gender eq '女'}">checked</c:if> required>
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


                        <form class="form-horizontal" id="updatePasswordForm"
                              action="${pageContext.request.contextPath}/user/updatePassword" method="post">
                            <div class="form-group">
                                <span class="col-sm-4 col-sm-offset-2" style="color: #ff0000" id="notice"></span>
                            </div>
                            <div class="form-group">
                                <label for="oldpassword" class="col-sm-2 control-label">原密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="oldpassword" name="oldpassword"
                                           placeholder="请输入原密码">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="newpassword" class="col-sm-2 control-label">新密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="newpassword" name="newpassword"
                                           placeholder="请输入新密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="renewpassword" class="col-sm-2 control-label">确认新密码</label>

                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="renewpassword" name="renewpassword"
                                           placeholder="请再次输入新密码">
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
                        <form method="post" id="uploadFaceForm" enctype="multipart/form-data"
                              action="${pageContext.request.contextPath}/user/uploadFace">
                            <input type="file" style="position: absolute; filter: alpha(opacity = 0); opacity: 0; width: 30px;"  name="file3" id="file3" multiple /><br>
                            <img class="media-object" src=""  alt="..." style="width:140px;height:140px;cursor:pointer;background:url(${user.face});background-size: cover"  id="img3" onClick="tempClick()">
                            <%--<input type="file" name="file0" id="file0" multiple/><br>
                            <img style="width:140px;height:140px;" src="${user.face}" alt="" name="faceImage"
                                 class="img-rounded" id="img0">--%>
                            <div class="form-group">
                                <br><br>
                                <div class="col-sm-2 col-sm-10">
                                    <button type="submit" class="btn btn-default" id="uploadbtn">更新</button>
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

    <div id="hidden">
        <input hidden="hidden" id="result" value="${resultEntity.result}">
        <input hidden="hidden" id="msg" value="${resultEntity.msg}">
    </div>
</div>
<%--jquer form plugin--%>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery_form/jquery.form.min.js"></script>
<script>
    $(function () {

        $("#file3").change(function () {
            var objUrl = getObjectURL(this.files[0]);
            console.log("objUrl = " + objUrl);
            if (objUrl) {
                $("#img3").attr("src", objUrl);
            }
        });

        $("#birthday").datepicker({
            yearRange: '-100:+50'
        });

        alertMsg();

        $('#updatePasswordForm').submit(function () {
            var options = {
                beforeSubmit: showRequest,  //提交前处理
                success: showResponse,  //处理完成
                resetForm: true,
                // url:           '/adminLogin',//默认是form的action
                dataType: 'json'
            };

            $(this).ajaxSubmit(options);
            // !!! Important !!!
            // always return false to prevent standard browser submit and page navigation
            return false;
        });

        $("#uploadFaceForm").submit(function () {
            var options = {
                success: showResponse,  //处理完成
                resetForm: true
            };

            $(this).ajaxSubmit(options);
            // !!! Important !!!
            // always return false to prevent standard browser submit and page navigation
            return false;
        })

        function showRequest(formData, jqForm, options) {
            var oldpassword = $("#oldpassword").val();
            var newpassword = $("#newpassword").val();
            var renewpassword = $("#renewpassword").val();
            if (oldpassword == null || oldpassword == "") {
                $("#notice").empty();
                $("#notice").text("密码不能为空！");
                return false;
            } else if (newpassword == null || newpassword == "") {
                $("#notice").empty();
                $("#notice").text("新密码不能为空！");
                return false;
            } else if (renewpassword == null || renewpassword == "") {
                $("#notice").empty();
                $("#notice").text("确认密码不能为空！");
                return false;
            } else if (newpassword != renewpassword) {
                $("#notice").empty();
                $("#notice").text("两次输入密码不一致！");
                return false;
            } else {
                return true;
            }
        }

        function showResponse(responseText, statusText, xhr, $form) {
            var result = responseText.result;
            if (result == 0 || result == -1) {
                alert(responseText.msg)
            } else {
                alert(responseText.msg)
            }
        }


        function removeNotice() {
            $("#notice").empty();
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

    function alertMsg() {
        var result = $("#result").val();
        var msg = $("#msg").val();
        if (result == '0' || result == '-1') {
            alert(msg);
        }
    }

    function tempClick(){
        /**
         * 火狐浏览器实现点击图片出现文件上传界面
         * var a=document.createEvent("MouseEvents");
         * a.initEvent("click", true, true);
         * document.getElementById("upload_main_img").dispatchEvent(a);
         */
        //IE浏览器实现点击图片出现文件上传界面
        document.getElementById('file3').click();//调用main_img的onclick事件
    }
</script>
</body>
</html>
