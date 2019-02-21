<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改帖子</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<jsp:include page="/head/head.jsp"></jsp:include>
<jsp:include page="/head/posted.jsp"></jsp:include>

<body style="background-color: #ffffff">

	<div class="container">
		<div class="col-md-7 col-md-offset-2">
			<div class="modal-header">
				<h3 class="modal-title text-center" id="exampleModalLabel">修改该条帖子</h3>
				<p class="text-center">以下是你将修改帖子的原内容</p>
			</div>
			<div class="modal-body">
				<form action="${APP_PATH }/articleController/updateArticle" method="post" enctype="multipart/form-data">
					<input type="hidden" name="fid" value="${article_Edit.fid }">
					
					<p class="text-muted">修改你的标题：</p>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="标题"
							id="titles" name="titles" value="${article_Edit.titles }" required>
					</div>
	
					<p class="text-muted">修改所属板块：</p>
					<div class="form-group">
						<select class="form-control" name="bname">
							<!-- 动态值 -->
							<c:forEach var="plate" items="${plate }">
								<c:if test="${plate.bname==article_Edit.bname }">
									<!-- 原始值 -->
									<option selected="selected">${article_Edit.bname }</option>
								</c:if>
								<c:if test="${plate.bname!=article_Edit.bname }">
									<option>${plate.bname }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
	
					<p class="text-muted">修改你的内容：</p>
					<div class="form-group">
						<textarea class="form-control" placeholder="内容" id="fcontent" name="fcontent"
							style="position: relative; height: 200px;" required>${article_Edit.fcontent }</textarea>
					</div>
	
					<p class="text-muted">在本地选择你的配图：</p>
					<div class="form-group">
						<div id="f_preview_up">
							<a href="#">
								<img style="position: relative; width: 50%; height: 50%;" id="f_imghead_up"
									src="${APP_PATH }/static/upload/article/${article_Edit.photo }"
									onclick="$('#f_previewImg_up').click();">
							</a>
						</div>
						<input type="file" onchange="f_previewImage_up(this)"
							style="display: none;" id="f_previewImg_up" name="photo">
					</div>
	
					<div class="modal-footer">
						<button type="reset" class="btn btn-default">还原</button>
						<button type="submit" class="btn btn-primary">保存</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="${APP_PATH }/static/js/images_update.js"></script>
</body>
</html>