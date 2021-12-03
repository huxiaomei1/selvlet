<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="edu.xcdq.bean.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"> </script>
	</head>
<body>
传过来的id:${param.id}
<%
	int id = Integer.parseInt(request.getParameter("id"));
	News news = newsService.getNewsById(id);
	request.setAttribute("news", news);
 %>
<div class="main-content-right">
      
        <div class="main-text-box">
      		<div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="article-box">
                    	<!--新闻的标题-->
                        <h1><c:out value="${news.title }" escapeXml="true" /></h1>
                        <div class="source-bar">发布者：${news.author } 分类：新闻信息 
                        更新时间：<fmt:formatDate value="${news.createDate }" pattern="yyyy-MM-dd"/> </div>
                        <div class="article-content">
                            <span class="article-summary"><b>摘要：${news.summary }</b></span>
                         	<%
                         		if(news.getPicPath() == null || news.getPicPath().equals("")){
                         	 %>
                         	 新闻图片：暂无<br/>
                         	 <%}else{ %>
                         	 <img src="<%=request.getContextPath() %>/upload/<%=news.getPicPath() %>"/><br/>
                         	 <%}%>
                         	 ${news.content }
                         </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>