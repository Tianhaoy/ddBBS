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
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	//当前页码
	var p=1;
	var b=${board.boardid};	
	var totalpages=${totalpages};
	//上一页
	function pre(){
		if(p>1){
			p--;
		}
		$.post("/topic/ajaxselect",{page:p,boardid:b},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var topic=data[i];
				s+='<TR class="tr3">';
				s+='<TD><IMG src="image/topic.gif" border=0></TD>';
				s+='<TD style="FONT-SIZE: 15px">';
				s+='<A href="detail.jsp?boardid=${board.boardid}&boardname=${board.boardname}&uname='+topic.uname+'&userid='+topic.userid+'&title='+topic.title+'&content='+topic.content+'&head=${user.head}&regtime=${user.regtime}&topicid='+topic.topicid+'">'+topic.title+'</A>';
				s+='</TD>';				
				s+='<TD align="center">'+topic.uname+'</TD>';
				s+='<TD align="center">6</TD>';
				s+='</TR>';
			}
			$("#tbody").html(s);
		})
	}
	//下一页
	function next(){
		if(p<totalpages){
			p++;
		}
		
		$.post("/topic/ajaxselect",{page:p,boardid:b},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var topic=data[i];
				s+='<TR class="tr3">';
				s+='<TD><IMG src="image/topic.gif" border=0></TD>';
				s+='<TD style="FONT-SIZE: 15px">';
				s+='<A href="detail.jsp?boardid=${board.boardid}&boardname=${board.boardname}&uname='+topic.uname+'&userid='+topic.userid+'&title='+topic.title+'&content='+topic.content+'&head=${user.head}&regtime=${user.regtime}&topicid='+topic.topicid+'">'+topic.title+'</A>';
				s+='</TD>';				
				s+='<TD align="center">'+topic.uname+'</TD>';
				s+='<TD align="center">6</TD>';
				s+='</TR>';
			}
			$("#tbody").html(s);
		})							
	}
</script>
</HEAD>

<BODY>
<%@include file="top.jsp" %>

<!--      主体        -->
<DIV>
<!--      导航        -->
	<br/>
	
	<DIV>	
		&gt;&gt;<B><a href="/board/select">论坛首页</a></B>&gt;&gt;						
		<B><a href="" >${board.boardname}帖子</a></B>						
	</DIV>

	<br/>
<!--      新帖        -->
<c:if test="${u==null }">
	<DIV>
	<form id="form1" name="form1" method="post" action="login.jsp">
  		<input type="submit" name="submit" id="submit" value="未登录不能发表话题 请登录" />
	</form>
	</DIV>
</c:if>
<c:if test="${u!=null }">
	<DIV>
		<A href="post.jsp?boardid=${board.boardid}&boardname=${board.boardname}"><IMG src="image/post.gif" border="0"></A>
	</DIV>
</c:if>
<!--         翻 页         -->
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>

	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">		
			<TR>
				<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
			</TR>
<!--       表 头           -->
			<TR class="tr2">
				<TD>&nbsp;</TD>
				<TD style="WIDTH: 80%" align="center">文章</TD>
				<TD style="WIDTH: 10%" align="center">作者</TD>
				<TD style="WIDTH: 10%" align="center">回复</TD>
			</TR>
<!--         主 题 列 表        -->
			<tbody id="tbody">
			<c:forEach items="${topics}" var="t">						
			<TR class="tr3">
				<TD><IMG src="image/topic.gif" border=0></TD>
				<TD style="FONT-SIZE: 15px">
<!--  	<A href="detail.jsp?boardid=${board.boardid}&boardname=${board.boardname}&uname=${t.uname}&userid=${t.userid}&title=${t.title}&content=${t.content}&head=${u.head}&regtime=${u.regtime}&topicid=${t.topicid}">${t.title}</A>  -->	
			 <A href="reply/select?topicid=${t.topicid}">${t.title}</A>		
				</TD>				
				<TD align="center">${t.uname }</TD>
				<TD align="center">6</TD>
			</TR>
			</c:forEach>
			</tbody>
		</TABLE>
	</DIV>
<!--            翻 页          -->
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>
</DIV>


</BODY>
</HTML>
