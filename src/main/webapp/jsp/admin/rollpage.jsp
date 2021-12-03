<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rollpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	function page_nav(frm,num){
		frm.pageIndex.value=num;
		frm.submit();
	}
	function jump_to(frm,pageno){
	 	//var regexp=/^\d+$/;
	 	var regexp=/^[1-9]\d*$/;
	 	var totalPage = document.getElementById("totalPage").value;
		if(!regexp.test(pageno)){
			alert("请输入 正确的数字！");
			return false;
		}else if((pageno-totalPage) > 0){
			alert("总页码一共"+totalPage+"页，请输入正确的页码！");
			return false;
		}else{
			page_nav(frm,pageno);
		}  
		
	}
	</script>
  </head>
  
  <body>
     <div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共${param.totalCount }条记录&nbsp;&nbsp; ${param.pageIndex }/${param.totalPage }页</li>
				<c:if test="${param.pageIndex>1 }">
					<a href="javaScript:page_nav(document.forms[0],1)">首页</a>
					<a href="javaScript:page_nav(document.forms[0],${param.pageIndex-1 }">上一页</a>
				</c:if>
				<c:if test="${param.pageIndex<param.totalPage }">
				<a href="javaScript:page_nav(document.forms[0],${param.pageIndex+1 })">下一页</a>
				<a href="javaScript:page_nav(document.forms[0],${param.totalPage })">最后一页</a>
				</c:if>
				&nbsp;&nbsp;
			</ul>
		 <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
		</div> 
  </body>
</html>
