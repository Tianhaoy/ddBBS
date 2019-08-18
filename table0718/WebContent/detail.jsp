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
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	var p=1;
	var t=${reply.topicid};
	var totalpages=${totalpages};
	//上一页
	function pre(){
		if(p>1){
			p--;
		}
		$.post("/reply/ajaxselect",{page:p,topicid:t},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var reply=data[i];
				s+='<TR class="tr1">';
				s+='<TH style="WIDTH: 20%">';
				s+='<B>回贴用户：'+reply.uname+'</B><BR/><BR/>';
				s+='<img width="50" height="50" src="image/head/'+reply.head+'"/><BR/>';
				s+='注册时间:'+reply.regtime+'&nbsp&nbsp id:'+reply.userid+'<BR/>';
				s+='</TH>	';			
				s+='<TH>';
				s+='<H4>'+reply.title+'</H4>';
				s+='<DIV><pre>'+reply.content+'</pre></DIV>';
				s+='发表时间：'+reply.publishtime+'&nbsp;';
				s+='最后修改时间: '+reply.modifytime+' ';
				s+='<A href="javascript:del('+reply.replyid+','+reply.topicid+','+reply.userid+')">[删除]</A>';
				s+='<A href="javascript:update('+reply.replyid+','+reply.userid+')">[修改]</A>';
				s+='</DIV>';
				s+='</TH>';			
				s+='</TR>';
			}
			$("#rbody").html(s);
		})
	}
	
	//下一页
	function next(){
		if(p<totalpages){
			p++;
		}
		$.post("/reply/ajaxselect",{page:p,topicid:t},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var reply=data[i];
				s+='<TR class="tr1">';
				s+='<TH style="WIDTH: 20%">';
				s+='<B>回贴用户：'+reply.uname+'</B><BR/><BR/>';
				s+='<img width="50" height="50" src="image/head/'+reply.head+'"/><BR/>';
				s+='注册时间:'+reply.regtime+'&nbsp&nbsp id:'+reply.userid+'<BR/>';
				s+='</TH>	';			
				s+='<TH>';
				s+='<H4>'+reply.title+'</H4>';
				s+='<DIV><pre>'+reply.content+'</pre></DIV>';
				s+='发表时间：'+reply.publishtime+'&nbsp;';
				s+='最后修改时间: '+reply.modifytime+' ';
				s+='<A href="javascript:del('+reply.replyid+','+reply.topicid+','+reply.userid+')">[删除]</A>';
				s+='<A href="javascript:update('+reply.replyid+','+reply.userid+')">[修改]</A>';
				s+='</DIV>';
				s+='</TH>';			
				s+='</TR>';
			}
			$("#rbody").html(s);
		})			
	}
	function del(replyid,topicid,userid){
		if(userid==${u.userid}){
			if (confirm("确认删除本人回帖吗？")){
				window.location= "<%=basePath %>reply/delete?replyid="+ replyid+"&topicid="+topicid+"&userid="+userid
			}
		}else{
			alert("权限不够，无法删除他人评论！");
		 }
	}
	
	function update(replyid,userid){
		if(userid==${u.userid}){
			if (confirm("确认修改本人回帖吗？")){
				window.location= "<%=basePath %>reply/edit?replyid="+ replyid
			}
		}else{
			alert("权限不够，无法修改他人回帖！");
		 }
	}
</script>
</HEAD>

<BODY>
<%@include file="top.jsp" %>
<!--      主体        -->
<DIV><br/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="board/select">论坛首页</a></B>&gt;&gt;
	<B><a href="topic/select?boardid=${param.boardid}&boardname=${param.boardname}">${param.boardname}帖子 </a></B>
</DIV>
	<br/>
	<!--      回复、新帖        -->
	<DIV>
		<A href="reply.jsp?topicid=${param.topicid}"><IMG src="image/reply.gif" border="0"></A> 
		<A href="post.jsp?boardid=${param.boardid}&boardname=${param.boardname}"><IMG src="image/post.gif" border="0"></A>
	</DIV>
	<!--         翻 页         -->
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>

	<!--      本页主题的标题        -->
	<DIV>
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR>
				<TH class="h">本页主题:${param.title}</TH>
			</TR>
			<TR class="tr2">
				<TD>&nbsp;</TD>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      主题        -->
	
  	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">			
			<c:forEach items="${ts}" var="t">		
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B>主题吧主：${t.uname}</B><BR/>					
					<img width="50" height="50"  src="image/head/${t.head}"/><BR/>
					注册时间:${t.regtime }&nbsp&nbsp id:${t.userid }<BR/>
				</TH>
				<TH>
					<H4>${t.title}</H4>
					<DIV><pre>${t.content}</pre></DIV>
					<DIV class="tipad gray">
						发表时间：${t.publishtime} &nbsp;
						最后修改时间:${t.modifytime}
					</DIV>
				</TH>
			</TR>
			</c:forEach>
		</TABLE>
	</DIV> 

	<!--      回复        -->
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
		<tbody id="rbody">
		<c:forEach items="${rs}" var="r">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B>回贴用户：${r.uname}</B><BR/><BR/>
					<img width="50" height="50" src="image/head/${r.head }"/><BR/>
					注册时间:${r.regtime}&nbsp&nbsp id:${r.userid }<BR/>
				</TH>				
				<TH>
					<H4>${r.title }</H4>
					<DIV><pre>${r.content }</pre></DIV>
					<DIV class="tipad gray">
						发表时间：${r.publishtime}&nbsp;
						最后修改时间:${r.modifytime}
						<A href="javascript:del('${r.replyid }','${r.topicid }','${r.userid }')">[删除]</A>
						<A href="javascript:update('${r.replyid }','${r.userid }')">[修改]</A>
					</DIV>
				</TH>			
			</TR>
		</c:forEach>
		</tbody>
		</TABLE>
	</DIV>
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>

</DIV>
<BR>
</BODY>
</HTML>
