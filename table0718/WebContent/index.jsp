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
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
	function del(boardid) {
		if (confirm("确认删除板块数据吗？")){
			window.location= "<%=basePath %>board/delete?boardid=" +boardid
		}
	}
</script>
</HEAD>

<BODY>

<%@include file="top.jsp" %>

<form action="board/selectone" method="post" name="form1" id="form1">
  <input type="submit" name="submit" id="submit" value="增加板块" />
</form>
<!--      主体        -->
	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr2" align="center">
				<TD colSpan="2">论坛</TD>
				<TD style="WIDTH: 5%;">主题</TD>
				<TD style="WIDTH: 25%">最后发表</TD>
			</TR>
		<!--       主版块       -->
  		<c:forEach items="${boards}" var="one">
		<c:if test="${one.parentid==0}">
			<TR class="tr3">			
				<TD colspan="4">${one.boardname}<a href="board/edit?boardid=${one.boardid}">&nbsp&nbsp&nbsp修改&nbsp&nbsp</a><a href="javascript:del('${one.boardid }');">&nbsp&nbsp&nbsp删除&nbsp&nbsp</a></TD>
				
			</TR>
	
		<!--       子版块       -->
 	<c:forEach items="${boards}" var="two">
		<c:if test="${two.parentid==one.boardid and two.parentid!=0}">
			<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="topic/select?boardid=${two.boardid}&boardname=${two.boardname}">${two.boardname}<a href="board/edit?boardid=${two.boardid}">&nbsp&nbsp&nbsp修改&nbsp&nbsp&nbsp</a><a href="javascript:del('${two.boardid }');">&nbsp&nbsp删除&nbsp&nbsp</a></A>
				</TH>
				<TD align="center">${two.count}</TD>
				<TH>
					<SPAN>
						<A href="reply/select?topicid=${two.topic.topicid}">${two.topic.title }</A>
					</SPAN>
					<BR/>
					<SPAN>${two.topic.publishtime }</SPAN>
					<SPAN class="gray">${two.topic.uname }</SPAN>
				</TH>
			</TR>
			</c:if>
			</c:forEach>
			</c:if>
			</c:forEach>
<!-- 		<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="list.jsp">servlet<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp&nbsp</a><a href="#">&nbsp&nbsp删除&nbsp&nbsp</a></A>
				</TH>
				<TD align="center">4</TD>
				<TH>
					<SPAN>
						<A href=""></A>
					</SPAN>
					<BR/>
					<SPAN></SPAN>
					<SPAN class="gray"></SPAN>
				</TH>
			</TR> -->		
			  
							
			<!--       主版块       -->
<!-- 		<TR class="tr3">
				<TD colspan="4">C#板块<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp</a><a href="#">&nbsp&nbsp&nbsp删除&nbsp&nbsp</a></TD>
			</TR> -->	
		<!--       子版块       -->
<!--			<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="list.jsp">winForm<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp&nbsp</a><a href="#">&nbsp&nbsp删除&nbsp&nbsp</a></A>
				</TH>
				<TD align="center">3</TD>
				<TH>
					<SPAN>
						<A href="">Django和Flask的比较</A>
					</SPAN>
					<BR/>
					<SPAN>小凡</SPAN>
					<SPAN class="gray">[2019-02-14]</SPAN>
				</TH>
			</TR>
			<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="list.jsp">AET.NET<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp&nbsp</a><a href="#">&nbsp&nbsp删除&nbsp&nbsp</a></A>
				</TH>
				<TD align="center">3</TD>
				<TH>
					<SPAN>
						<A href=""></A>
					</SPAN>
					<BR/>
					<SPAN>小凡</SPAN>
					<SPAN class="gray">[2019-02-14]</SPAN>
				</TH>
			</TR>
			<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="list.jsp">WCF<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp&nbsp</a><a href="#">&nbsp&nbsp删除&nbsp&nbsp</a></A>
				</TH>
				<TD align="center">3</TD>
				<TH>
					<SPAN>
						<A href=""></A>
					</SPAN>
					<BR/>
					<SPAN>小凡</SPAN>
					<SPAN class="gray">[2019-02-14]</SPAN>
				</TH>
			</TR>-->
		<!--       主版块       -->
<!-- 		
			<TR class="tr3">			
				<TD colspan="4">娱乐版块<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp</a><a href="#">&nbsp&nbsp&nbsp删除&nbsp&nbsp</a></TD>
				
			</TR>
 -->		
		<!--       子版块       -->
<!--		<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="list.jsp">象棋类<a href="#">&nbsp&nbsp&nbsp修改&nbsp&nbsp&nbsp</a><a href="#">&nbsp&nbsp删除&nbsp&nbsp</a></A>
				</TH>
				<TD align="center">3</TD>
				<TH>
					<SPAN>
						<A href=""></A>
					</SPAN>
					<BR/>
					<SPAN></SPAN>
					<SPAN class="gray"></SPAN>
				</TH>
			</TR> -->					
			
		</TABLE>
	
	</DIV>

<BR/>

</BODY>
</HTML>