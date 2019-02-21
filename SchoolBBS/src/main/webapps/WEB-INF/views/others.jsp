<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>他人主页</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/img/favicon.ico" rel='icon' type='image/x-icon'/>
</head>
<body>
	<!-- 他人主页-头部 -->
	<jsp:include page="/head/head.jsp"></jsp:include>
	<!-- 他人主页-主体内容 -->
	<jsp:include page="/content/otherscontent.jsp"></jsp:include>
	<!-- 他人主页-登录、注册 -->
	<jsp:include page="/login/login.jsp"></jsp:include>
	<!-- 他人主页-发帖 -->
	<jsp:include page="/head/posted.jsp"></jsp:include>
	<!-- 他人主页-基本信息设置 -->
	<jsp:include page="/head/setup.jsp"></jsp:include>
</body>
</html>