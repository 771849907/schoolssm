<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-主页</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<script type="text/javascript">
		window.location.href="${APP_PATH}/common/getAll_Admin";
	</script>
	<%-- <jsp:forward page="/common/getAll_Admin"></jsp:forward> --%>
</body>
</html>