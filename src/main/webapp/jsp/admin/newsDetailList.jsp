<%@page import="edu.xcdq.util.PageSupport"%>
<%@page import="edu.xcdq.bean.News"%>
<%@page import="java.util.List"%>
<%@page import="edu.xcdq.service.impl.NewsServiceImpl"%>
<%@page import="edu.xcdq.service.NewsService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%--动态包含无法使用，页面报错，newsService无法使用 <jsp:include page="../common/common.jsp" /> --%>
<%@include file="../common/common.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<style type="text/css">
<!--

-->
</style>
<script>
	function addNews(){
		window.location="&lt;%=request.getContextPath()%>/jsp/admin/newsDetailCreateSimple.jsp";
	}
	
	var flag = '${param.flag}';
	if(flag!=null &amp;&amp; flag!='' &amp;&amp; undefined!=flag){
		if(flag=='success'){
			alert('删除成功！');
		}else{
			alert('删除失败！');
		}
	}
	
</script>
</head>

<body>

<!--主体-->
    <div class="main-content-right">
        <!--即时新闻-->
        <div class="main-text-box">
            <div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <form name ="searchForm" id="searchForm" action="/news/jsp/admin/newsDetailList.jsp" method="post">
		 	          <div>
		 				新闻分类：
		 					<select name="categoryId">
		 						<option value="0">全部</option>
			        			
			        				<option value='1' >国内</option>
			        			
			        				<option value='2' >国际</option>
			        			
			        				<option value='3' >娱乐</option>
			        			
			        				<option value='4' >军事</option>
			        			
			        				<option value='5' >财经</option>
			        			
			        				<option value='6' >天气</option>
			        			
	        				</select>
		 				新闻标题<input type="text" name="title" id="title" value=''/>
		 					<button type="submit" class="page-btn">GO</button>
		 					<button type="button" onclick="addNews();" class="page-btn">增加</button>
		 					<input type="hidden" name="pageIndex" value="1"/>
		 	</div>
		 	</form>
			<table cellpadding="1" cellspacing="1" class="admin-list">
				<thead >
					<tr class="admin-list-head">
						<th>新闻标题</th>
                        <th>作者</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	 <%
                	//获取当前页码
                	String currntPage=request.getParameter("pageIndex");
                	if(currntPage==null)
                		currntPage="1";
                	int pageIndex=Integer.parseInt(currntPage);
                	//获取新闻记录总数量
                	int totalCount=newsService.getTotalCount();
                	//每页显示记录数
                	int pageSize=2;
                	/*获取总页数*/
                	PageSupport pages=new PageSupport();
                	pages.setCurrentPageNo(pageIndex);
                	pages.setPageSize(pageSize);
                	pages.setTotalCount(totalCount);
                	int totalPage=pages.getTotalPageCount();
                	
                	//控制首页和末页
                	if(pageIndex<1)
                		pageIndex=1;
                	else if(pageIndex>totalPage)
                		pageIndex=totalPage;
                	
                	//每页显示的新闻列表
                	List<News> newsList=newsService.getPageNewsList(pageIndex, pageSize);
                	request.setAttribute("list", newsList);
                %>
                	 <input type="hidden" id="totalPage" value="<%=totalPage%>"/>
                <c:forEach var="news" items="${list }" varStatus="status">
                	<tr  <c:if test="${status.count%2==0 }">class="admin-list-td-h2"</c:if>>
                		<td><a href='newsDetailView.jsp?id=${news.id }'><c:out value="${news.title }" escapeXml="true" /></a></td>
                		<td>${news.author }</td>
                		<td><fmt:formatDate value="${news.createDate }" pattern="yyyy-MM-dd"/></td>
                		<td><a href='adminNewsCreate.jsp?id=2'>修改</a>
                			<a href="javascript:if(confirm('确认是否删除此新闻？')) location='adminNewsDel.jsp?id=${news.id }'">删除</a>
                		</td>
                	</tr> 
                </c:forEach>
                </tbody>
            </table>
          <c:import url="rollpage.jsp">
          		<c:param name="totalCount" value="<%=Integer.toString(totalCount)%>"></c:param>
				<c:param name="pageIndex" value="<%=Integer.toString(pageIndex)  %>"></c:param>
				<c:param name="totalPage" value="<%=Integer.toString(totalPage)  %>"></c:param>
          </c:import>
        </div>
       </div>
   </div>
   </div>
</body></html>