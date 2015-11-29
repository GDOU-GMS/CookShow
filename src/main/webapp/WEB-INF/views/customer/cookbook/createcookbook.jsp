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

    <script src="js/jquery.min.js"></script>

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
                                <li><a href="#">账号设置</a></li>
                                <li><a href="#">我的菜单</a></li>
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
                <li role="presentation" class="active"><a href="#">首页</a></li>
                <li role="presentation"><a href="#">菜谱大全</a></li>
                <li role="presentation"><a href="#">菜单菜单</a></li>
                <li role="presentation"><a href="#">作品动态</a></li>
                <li role="presentation"><a href="#">我的菜单</a></li>
            </ul>

        </div>
    </div>
    <div id="content">
        <div class="cscontent">
            <div class="menuleft">
                <div class="menuimg">
                    <p>美食疯狂来袭</p>

                    <div class="imgcontent">

                        <div class="imagetext">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/tu.jpg">

                            <div class="menushare">
                                <span>分享到</span>

                                <div class="shareimg">
                                    <a href="" alt=""><img src="${pageContext.request.contextPath}/resources/customer/images/weibo.png" style="width:36px;height:29px;"></a>

                                </div>


                            </div>
                            <a class="btn btn-default acss" href="#" role="button">收藏</a>

                        </div>
                        <!--end imagetext -->
                    </div>
                    <!--imgcontent-->

                </div>
                <!--menuimg -->

                <div class="menuinfo">
                    <div class="menusubinfo">
                        <p>简介</p>
                            <span>我们家其实管这个叫「泡饭」，不过我看叫「烫饭」的地方比较多呀，就随个大流咯~ 这不是重点。我小时候其实很不爱吃这个，虽然爸妈现在也在看我的微信，但是还是要说... 每次就是白水煮一碗剩饭，啥都不放，只能配腐乳和榨菜吃，吃多了很无聊好不好！
我自己更喜欢把烫饭做成鲜美的，食材多多的，营养丰富的。更多快手早餐的菜谱，欢迎关注我的公众号tianluo_hhhaze，早餐视频和企鹅吃喝指南（qiechihe）合作拍摄。					                          </span>
                    </div>
                    <div class="menusubinfo">
                        <p>用料</p>

                        <div class="table-responsive" style="width:500px;">
                            <table class="table">
                                <tr>
                                    <td>隔夜剩米饭</td>
                                    <td>一碗</td>
                                </tr>
                                <tr>
                                    <td>隔夜剩米饭</td>
                                    <td>一碗</td>
                                </tr>
                                <tr>
                                    <td>隔夜剩米饭</td>
                                    <td>一碗</td>
                                </tr>
                            </table>
                        </div>

                    </div>

                    <div class="menusubinfo">
                        <p>做法</p>
                        <span class="cooktag1">1</span>
                        <span class="cooktag2">隔夜米饭加上清水，清水的分量大概没过米饭半截指头，再加上火腿和虾米一起煮沸，一直保持中火。</span>

                        <div class="cookimg">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/11.png">
                        </div>


                    </div>
                    <div class="menusubinfo">
                        <span class="cooktag1">2</span>
                        <span class="cooktag2">隔夜米饭加上清水，清水的分量大概没过米饭半截指头，再加上火腿和虾米一起煮					                          </span>

                        <div class="cookimg">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/11.png">
                        </div>


                    </div>
                    <div class="menusubinfo">

                        <span class="cooktag1">3</span>
                        <span class="cooktag2">隔夜米饭加上清水，清水的分量大概没过米饭半截指头，再加上火腿和虾米一起煮。					                          </span>

                        <div class="cookimg">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/11.png">
                        </div>


                    </div>

                </div>
                <!--menuinfo-->
                <div class="menucomment">
                    <div class="eachcomment">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk">
                                <textarea class="form-control">
                                     [随意吐槽]:
                                </textarea>

                        </div>
                        <div class="personsubmt">
                            <a class="btn btn-default" href="#" role="button">评论</a>
                        </div>
                    </div>

                    <div style="float:left;width:718px;">

                        <span style="color:#999;font-size:16px;">评论</span>


                    </div>

                    <div class="eachcomment">
                        <hr style="color:#ccc;width:718px;">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk1">

                            <span>[随意吐槽：]</span>

                            <p>都是我爱吃的哦</p>
                            <span class="fromcss">来自秀厨网</span>
                            <a href=""><span class="glyphicon glyphicon-thumbs-up dianzan"
                                             aria-hidden="true"></span></a>

                        </div>

                    </div>


                    <div class="eachcomment">
                        <hr style="color:#ccc;width:718px;">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk1">

                            <span>[随意吐槽：]</span>

                            <p>都是我爱吃的哦</p>
                            <span class="fromcss">来自秀厨网</span>
                            <a href=""><span class="glyphicon glyphicon-thumbs-up dianzan"
                                             aria-hidden="true"></span></a>

                        </div>

                    </div>
                    <div class="eachcomment">
                        <hr style="color:#ccc;width:718px;">
                        <div class="personhead">
                            <img src="${pageContext.request.contextPath}/resources/customer/images/22.png">
                        </div>
                        <div class="persontalk1">

                            <span>[随意吐槽：]</span>

                            <p>都是我爱吃的哦</p>
                            <span class="fromcss">来自秀厨网</span>
                            <a href=""><span class="glyphicon glyphicon-thumbs-up dianzan"
                                             aria-hidden="true"></span></a>

                        </div>

                    </div>

                </div>
                <!--menucomment-->


            </div>


            <div class="cbookside">
                <div class="cbooksidecss">
                    <div class="panel panel-default">
                        <div class="panel-heading">最近流行</div>
                        <div class="panel-body">
                            蒜香烤鱼
                        </div>
                        <div class="panel-body">
                            蒜香烤鱼
                        </div>
                        <div class="panel-body">
                            蒜香烤鱼
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->
    <div id="pagebottom">
        <div class="cspagebottom">
            <p>广东海洋大学秀厨网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright©2015秀厨网第四组</p>
        </div>
    </div>
    <!--pagebottom-->

</div>
<script type="text/javascript">
    jQuery("#csnav").slide({
        type: "menu",
        titCell: ".mainCate",
        targetCell: ".subCate",
        delayTime: 0,
        triggerTime: 0,
        defaultPlay: false,
        returnDefault: true
    });
</script>
</body>
</html>
