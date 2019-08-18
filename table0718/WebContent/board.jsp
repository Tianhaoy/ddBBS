<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 引入c标签 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>钉钉社区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css"/>
<script language="javascript">
function check() {
 if(document.regForm.boardname.value==""){
    alert("版块名称不能为空");
    return false;
 }
}
</script>
</HEAD>
<BODY>
<%@include file="top.jsp" %>

<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
</DIV>
<!--      用户注册表单        -->
<DIV  class="t" style="MARGIN-TOP: 15px" align="center">
	<FORM name="regForm" onSubmit="return check()" action="board/insert" method="post">
		<br/>版&nbsp;块&nbsp;名 &nbsp;
			<INPUT class="input" tabIndex="1" tryp="text" maxLength="20" size="35" name="boardname">
		<br/>父&nbsp;版&nbsp;块 &nbsp;
            <select id="parentid" name="parentid">
                 <option value="0">父板块默认此项</option>
               	<c:forEach items="${boards}" var="three">
               	 <c:if test="${three.parentid==0 }">
                  <option value="${three.boardid }">${three.boardname}</option>
                  </c:if>
                 </c:forEach>
            </select>
		<br/>
			<INPUT class="btn" tabIndex="4" type="submit" value="增加版块">
	</FORM>
</DIV>
</BODY>
</HTML>
