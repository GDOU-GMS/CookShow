<%--
  Created by IntelliJ IDEA.
  User: Seven
  Date: 2015/11/29
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<div class="csleft">
						<div class="banner">
							<ul id="csnav">
								<c:forEach items="${topClassificationVoList}" var="topClassification">
									<li id="mainCate-1" class="mainCate">
										<h3>
											<span>&gt;</span><a href="http://sc.admin5.com/">${topClassification.name }</a>
										</h3>
										<!-- <p>
											<a href="http://sc.admin5.com/">茅台</a><a
												href="http://sc.admin5.com/">五粮液</a><a
												href="http://sc.admin5.com/">国窖1573</a>
										</p>

										<p>
											<a href="http://sc.admin5.com/">酱香型</a><a
												href="http://sc.admin5.com/">浓香型</a><a
												href="http://sc.admin5.com/">贵州</a><a
												href="http://sc.admin5.com/">四川</a>
										</p>
 -->									<div class="subCate" style="display: none;">
											<c:forEach items="${topClassification.list }" var="secondClassification">
												<ul id="sub-ul-1">
												<h4>${secondClassification.name }</h4>
													<li>
														<span>
															<c:forEach items="${secondClassification.list }" var="thirdClassification">
																<a href="http://sc.admin5.com/">${thirdClassification.name }</a>
															</c:forEach>
														</span>
													</li>
												</ul>
											</c:forEach>
										</div>
									</li>
								</c:forEach>
							</ul>
			
				</div>
				</div>
            <!--csleft-->
            <div class="cbookright">
                <div class="cbooktop">
                	<c:forEach items="${page.list}" var="cookbook" varStatus="loop">
                		
                		 <div class="feat_prod_box cbookcontent" style="border_bottom:none;"><!-- ${pageContext.request.contextPath}/resources/customer/images/dg.png -->
                        <div class="prod_img"><a href="details.html"><img style="width:150px;height:150px;" src="${pageContext.request.contextPath}/resources/customer/images/${cookbook.titleImage}" alt="" title=""
                                                                          border="0"/>
                        </a>
                        </div>
                        <div class="prod_det_box">


                            <div class="box_center">
                                <div class="prod_title"><h3><a href="cookbook.html">${cookbook.title}</a></h3></div>
                                <p style="margin:0px 5px;padding:0px;height:60px;overflow:hidden;text-overflow:ellipsis;">${cookbook.material}</p>
								<a href="#" class="cbuser"><p style="margin:0px 5px;padding:0px;">${cookbook.user.username}</p></a> 
                           		<p style="margin:0px 5px;padding:0px;color:#ccc;">${cookbook.createDate}</p> 
                                <div class="clear"></div>

                            </div>
                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                	
                	
                	</c:forEach>
                    
                </div>
                <div class="cbookbottom">

                    <nav>
                        <ul class="pagination">
                           
                            <c:if test="${page.pageNum gt 1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${page.pageNum-1}" aria-label="Previous">
                                                <span aria-hidden="true">上一页</span>
                                            </a>
                                        </li>
                                    </c:if>
                                   <%--  <c:forEach begin="${page.startIndex}" end="${page.startIndex}" step="1" var="index">
                                        <li><a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${index+1}" <c:if test="${index+1 eq page.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                    </c:forEach> --%>
                             
                                    <c:forEach begin="${page.startPage-1}" end="${page.endPage-1}" step="1" var="index" >
                                    	 <li><a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${index+1}" <c:if test="${index+1 eq page.pageNum}">class="active"</c:if>>${index+1}</a></li>
                                    </c:forEach> 
                                    <c:if test="${page.pageNum lt page.totalPage}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/menu/cookmenu?pageNum=${page.pageNum+1}" aria-label="Next">
                                                <span aria-hidden="true">下一页</span>
                                            </a>
                                        </li>
                                    </c:if>
                        </ul>
                    </nav>
                </div>


            </div>
            <!--end cbookright-->

            <div class="cbookside">
                <div class="cbooksidecss">
                    <p>相关菜单</p>
                    <ul>
                    <c:forEach items="${menuList}" var="menu">
						<li><a href="http://sc.admin5.com/">${menu.title}</a></li>
					</c:forEach>
                        <!-- <li><a href="">美食疯狂来袭美食疯狂来袭美食12月你好</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li>
                        <li><a href="">美食疯狂来袭美食疯狂来袭美食疯狂</a></li> -->

                    </ul>
                </div>
            </div>
        </div>
        <!--end cscontent -->
    </div>
    <!--end  content-->
    <div id="pagebottom" style="float:left;width:100%">
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
