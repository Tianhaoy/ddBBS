<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 引入c标签 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>钉钉社区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
function check(){
	if(document.updateForm.title.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.updateForm.content.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.updateForm.content.value.length>1000) {
		alert("长度不能大于1000");
		return false;
	}
}
</script>
</HEAD>
<BODY>
<%@include file="top.jsp" %>
<!--      主体        -->
<div>
<BR/>
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
		<B><a href="topic/select?boardid=${param.boardid}&boardname=${param.boardname}">${param.boardname}帖子</a></B>
	</DIV><BR/>
	<DIV>
		<FORM name="updateForm" onSubmit="return check();" action="reply/update" method="post">
			<!-- 提交表单加隐藏域 -->
			<input type="hidden" id="topicid" name="topicid" value="${replys.topicid }">
			<input type="hidden" id="replyid" name="replyid" value="${replys.replyid }">
			<input type="hidden" id="userid" name="userid" value="${replys.userid}">			
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">				 
				    <TR>
					    <TD class="h" colSpan="3"><B>修改回复帖子</B></TD>
				    </TR>
					
				    <TR class="tr3">
					    <TH width="20%"><B>标题</B></TH>
					    <TH><INPUT name="title"  class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" value="${replys.title }"></TH>
				    </TR>
				 
				    <TR class="tr3">
					    <TH vAlign="top">
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan="2">
					        <DIV>
						        <span><textarea  name="content" style="WIDTH: 500px;" rows="20" cols="90" tabIndex="2" >${replys.content}</textarea></span>
						    </DIV>
					      (不能大于:<FONT color="blue">1000</FONT>字)
					    </TH>
					</TR>				
				</TABLE>
			</DIV>
			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="修 改">
				<INPUT class="btn" tabIndex="4" type="reset"  value="重 置"> 
			</DIV>
		</FORM>
	
	</DIV>
</div>
</BODY>
</HTML>
