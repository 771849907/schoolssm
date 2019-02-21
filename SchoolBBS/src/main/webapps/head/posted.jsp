<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发帖</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<div class="container">
		<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#faTie">按钮</button> -->

		<div class="modal fade" id="faTie" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content col-md-11">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3 class="modal-title text-center" id="exampleModalLabel">写下你的帖子</h3>
						<p class="text-center">具有创新的帖子更易得到关注和评论</p>
						<p class="text-center text-danger">需知：你所发布的帖子需要通过管理员审核通过后才能在首页展示</p>
					</div>
					<div class="modal-body">
						<form action="${APP_PATH }/articleController/setArticle" method="post" enctype="multipart/form-data">
							<p class="text-muted">写下你的标题：</p>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="标题"
									id="titles" name="titles" required>
							</div>

							<p class="text-muted">选择所属板块：</p>
							<div class="form-group">
								<select class="form-control" name="bname">
									<c:forEach var="plate" items="${plate }">
										<option>${plate.bname }</option>
									</c:forEach>
								</select>
							</div>

							<p class="text-muted">写下你的内容：</p>
							<div class="form-group">
								<textarea class="form-control" placeholder="内容" id="fcontent"
									name="fcontent" style="position: relative; height: 200px;" required></textarea>
							</div>

							<p class="text-muted">在本地选择你的配图：</p>
							<div class="form-group">
								<div id="f_preview">
									<a href="#"> <img
										style="position: relative; width: 100%; height: 100%;"
										id="f_imghead" src="${APP_PATH }/static/img/fatiePhoto.png"
										onclick="$('#f_previewImg').click();">
									</a>
								</div>
								<input type="file" onchange="f_previewImage(this)"
									style="display: none;" id="f_previewImg" name="photo">
							</div>

							<div class="modal-footer">
								<button type="reset" class="btn btn-default">清空</button>
								<button type="submit" class="btn btn-primary">发帖</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="${APP_PATH }/static/js/images.js"></script>
</body>
</html>