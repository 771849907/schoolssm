<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-主体</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<body>
	<div class="container-fluid">
		<div class="row" style="margin-top: 70px">
			<!--左边部分-->
			<div class="  nav-left col-md-2 no-padding" id="nav-list-left">
				<div class="user-panel">
					<img src="${APP_PATH }/static/img/admin/user.png" class="img-circle center-block" />
				</div>

				<div class="nav-list">
					<ul>
						<li><a id="yhgl" href="#">用户管理</a></li>
						<li><a id="tzgl" href="#">帖子管理</a></li>
						<li><a id="bkgl" href="#">板块管理</a></li>
					</ul>
				</div>
			</div>

			<!--右边部分-->
			<div class="main-right  col-md-10 col-md-offset-2">
				<!--用户管理-->
				<div class="col-md-12 yhgl">
					<div class="panel panel-default ">
						<div class="panel-heading">用户管理</div>
						<div class="panel-body">
							<table class="table table-bordered tb-hover">
								<thead>
									<tr>
										<td>序号</td>
										<td>名称</td>
										<td>年龄</td>
										<td>性别</td>
										<td>Email</td>
										<td>住址</td>
										<td>简介</td>
										<td>创建时间</td>
										<td>用户头像</td>
										<td class="text-center">操作</td>
									</tr>
								</thead>
								<tbody>
									<!-- 循环开始 -->
									<c:forEach var="listUser" items="${listUser }" varStatus="varStatus">
										<tr>
											<td>${varStatus.count }</td>
											<td>${listUser.name }</td>
											<td>${listUser.age }</td>
											<td>${listUser.sex }</td>
											<td>${listUser.email }</td>
											<td>${listUser.family }</td>
											<td>${listUser.intro }</td>
											<td>${listUser.time }</td>
											<td style="position: relative;width:80px; height: 80px;">
												<c:if test="${listUser.userphoto==null}">
													<samp class="text-warning">默认头像</samp>
												</c:if>
												<c:if test="${listUser.userphoto!=null}">
													<a href="${APP_PATH }/static/upload/user/${listUser.userphoto }" target="_brank">
														<img src="${APP_PATH }/static/upload/user/${listUser.userphoto }"
															style="position: relative; width: 100%; height: 100%;">
													</a>
												</c:if>
											</td>
											
											<td class=" text-center">
												<c:if test="${empty adminList}">
													<span class="glyphicon glyphicon-ban-circle"></span>
												</c:if>
												<c:if test="${!empty adminList}">
													<form action="${APP_PATH}/userController/deleteUser" method="post">
														<input type="hidden" name="userid" value="${listUser.userid}">
														<button type="submit" class="btn btn-danger btn-xs" onclick="return user_del();">删除</button>
													</form>
												</c:if>	
											</td>
										</tr>
									</c:forEach>
									<!-- 循环结束 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!--帖子管理-->
				<div class="col-md-12 tzgl" style="">
					<div class="panel panel-default ">
						<div class="panel-heading">帖子管理</div>
						<div class="panel-body">
							<table class="table table-bordered tb-hover">
								<thead>
									<tr>
										<td>序号</td>
										<td>标题</td>
										<td>内容</td>
										<td>图片</td>
										<td>发布者</td>
										<td>所属板块</td>
										<td>创建时间</td>
										<td>审核状态</td>
										<td class="text-center">操作</td>
									</tr>
								</thead>
								<tbody>
									<!-- 循环开始 -->
									<c:forEach var="listArticle" items="${listArticle }" varStatus="varStatus">
										<tr>
											<td>
												<div style="width:10px;word-wrap:break-word;">${varStatus.count }</div>
											</td>
											<td>
												<div style="width:50px;word-wrap:break-word;">${listArticle.titles }</div>
											</td>
											<td>
												<div style="width:300px;word-wrap:break-word;">${listArticle.fcontent }</div>
											</td>
											<td>
												<div style="position: relative;width:100px;height:100px;">
													<c:if test="${listArticle.photo!=\"photo\" }">
														<a href="${APP_PATH }/static/upload/article/${listArticle.photo }" target="_brank">
														<img src="${APP_PATH }/static/upload/article/${listArticle.photo }"
															style="position: relative; width: 100%; height: 100%;">
														</a>
													</c:if>
												</div>
											</td>
											<td>${listArticle.username }</td>
											<td>${listArticle.bname }</td>
											<td>${listArticle.time }</td>
											<td>
												<!-- 待审核 -->
												<c:if test="${listArticle.status==0 }">
													<button type="button" class="btn btn-warning btn-sm" disabled="disabled">待审核。。</button>
												</c:if>
												<!-- 审核通过 -->
												<c:if test="${listArticle.status==1 }">
													<button type="button" class="btn btn-info btn-sm" disabled="disabled">审核通过</button>
												</c:if>
												<!-- 审核未通过 -->
												<c:if test="${listArticle.status==2 }">
													<button type="button" class="btn btn-danger btn-sm" disabled="disabled">审核未通过</button>
												</c:if>
											</td>
											
											<td class=" text-center">
												<!-- 未登录 -->
												<c:if test="${empty adminList}">
													<span class="glyphicon glyphicon-ban-circle"></span>
												</c:if>
												<!-- 已登录 -->
												<c:if test="${!empty adminList}">
													<!-- 待审核 -->
													<c:if test="${listArticle.status==0 }">
														<form action="${APP_PATH}/articleController/articleStatus" method="post">
															<input type="hidden" name="fid" value="${listArticle.fid }">
															<input type="hidden" name="status" value="1">
															<input type="submit" class="btn btn-info btn-sm" value="通过"/>
														</form>
														<form action="${APP_PATH}/articleController/articleStatus" method="post">
															<input type="hidden" name="fid" value="${listArticle.fid }">
															<input type="hidden" name="status" value="2">
															<input type="submit" class="btn btn-danger btn-sm" value="拒绝"/>
														</form>
													</c:if>
													<!-- 审核通过 -->
													<c:if test="${listArticle.status==1 }">
														<form action="${APP_PATH}/articleController/articleStatus" method="post">
															<input type="hidden" name="fid" value="${listArticle.fid }">
															<input type="hidden" name="status" value="2">
															<input type="submit" class="btn btn-danger btn-sm" value="拒绝"/>
														</form>
													</c:if>
													<!-- 审核未通过 -->
													<c:if test="${listArticle.status==2 }">
														<form action="${APP_PATH}/articleController/articleStatus" method="post">
															<input type="hidden" name="fid" value="${listArticle.fid }">
															<input type="hidden" name="status" value="1">
															<input type="submit" class="btn btn-info btn-sm" value="通过"/>
														</form>
													</c:if>	
												</c:if>
											</td>
										</tr>
									</c:forEach>
									<!-- 循环结束 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!--板块管理-->
				<div class="col-md-12 bkgl" style="">
					<div class="panel panel-default ">
						<div class="panel-heading">
							<div class="row">
								<div class="col-md-10">板块管理</div>
								<c:if test="${!empty adminList}">
									<div class="col-md-2">
										<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#plate">新增</button>
									</div>
								</c:if>
							</div>
						</div>
						
						<div class="panel-body">
							<table class="table table-bordered tb-hover">
								<thead>
									<tr>
										<td>序号</td>
										<td>板块名</td>
										<td>创建时间</td>
										<td class="text-center">操作</td>
									</tr>
								</thead>
								<tbody>
									<!-- 循环开始 -->
									<c:forEach var="plates" items="${plate }" varStatus="varStatus">
										<tr>
											<td>${varStatus.count}</td>
											<td>${plates.bname}</td>
											<td>${plates.btime}</td>
											
											<td class=" text-center">
												<c:if test="${empty adminList}">
													<span class="glyphicon glyphicon-ban-circle"></span>
												</c:if>
												<c:if test="${!empty adminList}">
													<form action="${APP_PATH}/plateController/getUpdatePlate" method="post">
														<input type="hidden" name="bid" value="${plates.bid}">
														<input type="hidden" name="bname" value="${plates.bname}">
														<button type="submit" class="btn btn-info btn-xs" data-toggle="modal" 
															data-target="#plateEdit">修改</button>
														</form>
													<form action="${APP_PATH}/plateController/deletePlate" method="post">
														<input type="hidden" name="bid" value="${plates.bid}">
														<button type="submit" class="btn btn-danger btn-xs" onclick="return b_del();">删除</button>
													</form>
												</c:if>	
											</td>
										</tr>
									</c:forEach>
									<!-- 循环结束 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<script src="${APP_PATH }/static/js/admin.js"></script>
	<script src="${APP_PATH }/static/js/delete.js"></script>
	<script>
		/**
		 * 用户删除确认框
		 * @returns
		 */
		function user_del() { 
			var msg = "您真的确定要删除该用户吗？\n\n删除后不能复原！"; 
			if (confirm(msg)==true){ 
				return true; 
			}else{ 
				return false; 
			}
		}
	</script>
</body>
</html>