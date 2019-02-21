<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>主体内容</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link href="${APP_PATH}/static/css/css.css" rel="stylesheet">
</head>
<body>
	<!--主体（下）-->
	<div class="container">
		<div class="row">
			<!--左边板块-->
			<div id="content_left">
				<!--代码部分begin-->
				<div class="jq22">
					<div class="hidden">
						<!--此处进行循环展示-->
						<c:forEach var="listArticle" items="${listArticle }">
							<!-- 只显示通过审核的帖子 -->
							<c:if test="${listArticle.status==1 }">
								<div class="row show_article">
									<div class="col-md-12 show_article_go">
										<div class="row">
											<div class="col-xs-7 col-md-9"
												style="position: relative; padding-top: 10px;">
												<small>热门内容，来自：<a href="${APP_PATH }/common/getArticleBname?bname=${listArticle.bname }">${listArticle.bname }</a></small>
											</div>
											<div class="col-xs-5 col-md-3"
												style="position: relative; padding-top: 10px;">
												<small>${listArticle.time }</small>
											</div>
										</div>
				
										<div class="row">
											<div class="col-xs-2 col-md-1">
												<a href="${APP_PATH}/userController/getOthers?userid=${listArticle.userid }"> 
													<c:if test="${listArticle.userphoto==null }">
														<img class="img_head" alt="Brand" src="${APP_PATH}/static/img/head.png">
													</c:if>
													<c:if test="${listArticle.userphoto!=null }">
														<img class="img_head" alt="Brand" src="${APP_PATH }/static/upload/user/${listArticle.userphoto }">
													</c:if>
												</a>
											</div>
											<div class="col-xs-6 col-md-8">
												<a class="a_b" href="${APP_PATH}/userController/getOthers?userid=${listArticle.userid }">
													<h5 class="bottom_left_name">
														<!-- 发帖人名字 -->
														<b>${listArticle.username }</b>
													</h5>
												</a>
											</div>
											<div class="col-xs-4 col-md-3">
												<!-- 用户登录后才显示关注按钮 && 如果是登录用户本人，则不显示关注按钮 -->
												<c:if test="${!empty username && listArticle.username!=username}">
													<!-- 每一次遍历帖子时初始化attention_record为“false” -->
													<c:set var="attention_record" value="false"></c:set>
													<!-- 遍历关注表信息 -->
													<c:forEach var="attention" items="${attention }">
														<!-- 判断该帖子对应的用户是否被关注，如果是，则将“true”保存到"attention_record"中--->
														<c:if test="${attention.userid==userid && attention.beuserid==listArticle.userid}">
															<form action="${APP_PATH }/attentionController/deleteAttention" method="post">
																<input type="hidden" name="gid" value="${attention.gid }">
																<div class="attention_content">
																	<a href="#">
																		<button type="submit" class="btn button2" style="width:80px;">取消关注</button>
																		<button type="submit" class="btn" style="width:80px;">已关注</button>
																	</a>
																</div>
															</form>
															<!-- 当该用户被关注时，给attention_record赋值“true” -->
															<c:set var="attention_record" value="true"></c:set>
														</c:if>
													</c:forEach>
													<!-- 判断attention_record中是否有“false”，有表示该帖子对应的用户还没有被关注 -->
													<c:if test="${attention_record==\"false\" }">
														<form action="${APP_PATH }/attentionController/setAttention" method="post">
															<input type="hidden" name="userid" value="${userid }">
															<input type="hidden" name="beuserid" value="${listArticle.userid }">
															<button type="submit" class="btn btn-info btn-sm">
																<samp class="glyphicon glyphicon-plus"></samp> 关注
															</button>
														</form>
													</c:if>
												</c:if>
											</div>
										</div>
				
										<div class="row">
											<div class="col-md-12">
												<a class="bottom_left_aaa a_b" href="#">
													<h4>
														<!-- 帖子标题 -->
														<b>${listArticle.titles }</b>
													</h4>
												</a>
											</div>
										</div>
				
										<div class="row">
											<div class="col-md-12">
												<!-- 帖子内容 -->
												<p>${listArticle.fcontent }</p>
											</div>
										</div>
				
										<div class="row">
											<div class="col-md-12">
												<c:if test="${listArticle.photo!=\"photo\" }">
													<a href="${APP_PATH}/static/upload/article/${listArticle.photo }" target="_blank">
													<img class="img_content"
														src="${APP_PATH}/static/upload/article/${listArticle.photo }">
													</a>
												</c:if>
											</div>
										</div>
										
										<br>
										<div class="row" style="position: relative;top: -10px;">
											<div class="col-xs-10 col-md-6">
												<div class="col-xs-5 col-md-6">
													<small>${listArticle.sum } 条评论</small>
												</div>
												<div class="col-xs-7 col-md-6">
													<!-- 用户登录后才显示心形收藏 && 如果不是登录用户本人所发帖子，则显示心形收藏 -->
													<c:if test="${!empty username && listArticle.username!=username }">
														<!-- 每一次遍历帖子时初始化collect_record为“false” -->
														<c:set var="collect_record" value="false"></c:set>
														<!-- 遍历收藏表信息 -->
														<c:forEach var="collect" items="${collect }">
															<!-- 判断该帖子是否被收藏，如果是，则将“true”保存到"collect_record"中--->
															<c:if test="${collect.userid==userid && collect.fid==listArticle.fid}">
																<form action="${APP_PATH }/collectController/deleteCollect" method="post">
																	<input type="hidden" name="sid" value="${collect.sid }">
																	<button type="submit" style="border: none;background-color: #ffffff;">
																		<samp title="取消收藏" class="glyphicon glyphicon-heart collect_end"></samp>
																	</button>
																</form>
																<!-- 当该用户被关注时，给attention_record赋值“true” -->
																<c:set var="collect_record" value="true"></c:set>
															</c:if>
														</c:forEach>
														<!-- 判断collect_record中是否有“false”，有表示该帖子对应的用户还没有被关注 -->
														<c:if test="${collect_record==\"false\" }">
															<form action="${APP_PATH }/collectController/setCollect" method="post">
																<input type="hidden" name="userid" value="${userid }">
																<input type="hidden" name="fid" value="${listArticle.fid }">
																<button type="submit" style="border: none;background-color: #ffffff;">
																	<samp title="收藏该帖子" class="glyphicon glyphicon-heart collect"></samp>
																</button>
															</form>
														</c:if>	
													</c:if>
													<!-- 用户未登录才显示文字收藏 && 如果不是登录用户本人所发帖子，则显示文字收藏 -->
													<c:if test="${empty username && listArticle.username!=username }">
														<small>登录后可收藏</small>
													</c:if>
												</div>
											</div>
										</div>
				
										<!-- 用户登录后才显示评论框 -->
										<c:if test="${!empty username}">
											<!--评论框-->
											<div class="row" style="position: relative; margin-top: 10px;">
												<div class="col-xs-12 col-md-12">
													<form action="${APP_PATH }/commentController/setComment">
														<div class="col-xs-10 col-md-11">
															<input type="hidden" name="userid" value="${userid }">
															<input type="hidden" name="fid" value="${listArticle.fid }">
															<input type="text" class="form-control"
																id="pcontent" name="pcontent" placeholder="写下你的评论..." required>
														</div>
														<div class="col-xs-2 col-md-1">
															<button type="submit" class="btn btn-success"
																style="position: relative; left: -25px;">评论</button>
														</div>
													</form>
												</div>
											</div>
										</c:if>
				
										<!--评论展示(此处循环)-->
										<c:set var="listComment_Fid" value="listComment_${listArticle.fid }"></c:set>
										<c:forEach var="comment_list" items="${map[listComment_Fid]}">
											<hr style="position: relative; margin-top: 5px;">
											<div class="row" style="position: relative; margin-top: -10px;">
												<div class="col-md-12">
													<a class="a_p" href="${APP_PATH}/userController/getOthers?userid=${comment_list.userid }">
														<!-- 评论者姓名 -->
														<b>${comment_list.name}</b>
													</a>
													&nbsp;&nbsp;&nbsp;
													<!-- 时间 -->
													<small>${comment_list.time }</small>
													<!-- 评论内容 -->
													<p>${comment_list.pcontent}</p>
												</div>
											</div>
										</c:forEach>
										<!--评论展示(循环-end)-->
				
										<br>
										<div class="row">
											<div class="col-md-12"
												style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!--此处进行循环展示-end -->
					</div>
					<div class="list">数据加载中，请稍后...</div>
					<div class="text-center more"><a class="text-info" href="javascript:;" onClick="jq22.loadMore();">点击--->加载更多</a></div>
				</div>
				<div class="row">
					<div class="col-md-12"
						style="position: relative; background-color: #f6f6f6; height: 30px;"></div>
				</div>
			</div>
			

			<!--右边板块-->
			<div id="content_right">
				<div class="row">
					<div class="col-md-12"
						style="position: relative; padding-top: 10px;">
						<b>所有板块</b>
						<hr>
					</div>
				</div>

				<!-- 所有板块-开始循环 -->
				<div class="row">
				<c:forEach var="plate" items="${plate }" varStatus="status" >
					<div class="col-xs-4 col-md-4">
						<a href="${APP_PATH }/common/getArticleBname?bname=${plate.bname }">
							<img class="img_right_logo_bankuai" src="${APP_PATH}/static/img/houtai.png">
							<p>${plate.bname }</p>
						</a>
					</div>
					<!-- 每循环1次就加一些跳行符 -->
					<c:if test="${status.count%1==0 }">
						<br><br><br><br>
					</c:if>
				</c:forEach>
				</div>
				<!-- 所有板块-结束循环 -->

				<div class="row">
					<div class="col-md-12"
						style="position: relative; background-color: #f6f6f6; height: 10px;"></div>
				</div>

				<div class="row">
					<div class="col-md-12"
						style="position: relative; padding-top: 10px;">
						<b>热门文章</b>
						<hr>
					</div>
				</div>

				<c:forEach var="listArticle" items="${listArticle }">
					<!-- 只显示通过审核的帖子且评论数大于1文章 -->
					<c:if test="${listArticle.status==1 && listArticle.sum>1 }">
						<div class="row">
							<div class="col-md-12">
								<a href="${APP_PATH }/articleController/getArticleFid?fid=${listArticle.fid }">${listArticle.titles }</a>
							</div>
							<div class="col-md-12">
								<br>
							</div>
						</div>
					</c:if>	
				</c:forEach>
			</div>
		</div>
	</div>

	<jsp:include page="/content/top.jsp"></jsp:include>
	
	<script src="${APP_PATH }/static/js/phones_pc.js"></script>
	<script src="${APP_PATH }/static/js/load_more.js"></script>
</body>
</html>