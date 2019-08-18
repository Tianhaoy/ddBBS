<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 引入c标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${u==null }">
<DIV>
	<IMG src="image/logo.gif">
</DIV>
</c:if>
<c:if test="${u!=null }">
<DIV>
	<IMG width="50" height="50" src="image/head/${u.head }">
</DIV>
</c:if>
<!--      用户信息、登录、注册        -->
	<c:if test="${u==null }">
	<DIV class="h">
		您尚未　<a href="login.jsp">登录</a>
		&nbsp;| &nbsp; <A href="reg.jsp">注册</A> |
	</DIV>
	</c:if>
	<c:if test="${u!=null }">
	<DIV class="h">
		您好：　${u.uname}
		&nbsp;| &nbsp; <A href="/user/logout">登出</A> |
	</DIV>
	</c:if>
</body>
</html>