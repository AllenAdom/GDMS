<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String j_auth_action=request.getContextPath()+"/doc_assBookForLead.action";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>题目信息</title>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product.css"/>
	
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/form.css" />
	 <script type="text/javascript" src="<%=request.getContextPath()%>/js/form.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.js"></script>
	
	 
<script type="text/javascript">

$(document).ready(function() {
	// 查询
	$("#search").bind("click",search);
});
// 查询
function search() {
	var condition = $("#condition").val();
	document.forms[0].action ="<%=j_auth_action%>"+"?currentPage="+${pageBeanAssBooks.currentPage}+"&pageSize=${pageBeanAssBooks.pageSize}"+"&condition="+condition;  //将表单数据提交给地址j_auth_action
	document.forms[0].submit();
}
function doNextPage(){
	
	document.forms[0].action ="<%=j_auth_action%>" + "?currentPage=" +${pageBeanAssBooks.nextPage }+ "&pageSize=" + ${pageBeanAssBooks.pageSize};  //将表单数据提交给地址j_auth_action
	document.forms[0].submit();
}
function doFristPage()
{
	document.forms[0].action="<%=j_auth_action%>?currentPage=" + ${pageBeanAssBooks.firstPage }+"&pageSize="+ ${pageBeanAssBooks.pageSize};
	document.forms[0].submit();
}
function doLastPage()
{							
	document.forms[0].action="<%=j_auth_action%>?currentPage=" + ${pageBeanAssBooks.totalPage }+"&pageSize="+ ${pageBeanAssBooks.pageSize};
	document.forms[0].submit();
}
function doPrePage()
{							
	document.forms[0].action="<%=j_auth_action%>?currentPage=" + ${pageBeanAssBooks.prePage}+"&pageSize="+ ${pageBeanAssBooks.pageSize};
	document.forms[0].submit();
}
</script>
</head>

<body>
<br>
	<div class="container">
		<div class="row">
			<form class="form-inline" method="post">
				<select class="form-control ue-form" id="condition">
						<option value="all">全部的任务书</option>
						<option value="Null">未填写的任务书</option>
						<option value="NotNull">已填写的任务书</option>
					</select>
				<button id="search" type="button" class="btn ue-btn">
					<span class="fa fa-search"></span> 搜索
				</button>
			</form>
		</div>
		<table class="table table-hover table-bordered">
		  <caption>任务书列表</caption>
		  <thead>
		    <tr>
		      <th>序号</th>
		      <th>项目名称</th>
		      <th>出题人</th>
		      <th>学生姓名</th>
		      <th>项目类型</th>
		      <th>项目方向</th>
		       <th>院长审核</th>
		       <th>审核</th>
		    </tr>
		  </thead>
		  <tbody>
		  
			   <c:forEach items="${pageBeanAssBooks.data}" var="assignmentBook" varStatus="varSta">
			    	 <tr>
			    	 	<td>${varSta.count }</td>
			    	 	<td>${assignmentBook.student.subject.subName }</td>
			    	 	<td>${assignmentBook.teacher.name }</td>
			    	 	<td>${assignmentBook.student.name }</td>
			    	 	<td>${assignmentBook.student.subject.sub_type }</td>
			    	 	<td>${assignmentBook.student.subject.major_direction }</td>
			    	 	
					<c:choose>
			    	 	 	<c:when test="${assignmentBook.sub_deptOpt != '' }">
			    	 	 		<td style="color: #00EE76">已填写</td>
			    	 	 	</c:when>
			    	 	 	<c:otherwise>
			    	 	 		<td style="color: red">未填写</td>
			    	 	 	</c:otherwise>
				    	 </c:choose>
			    	 	<td><a href="${pageContext.request.contextPath}/doc_leadOptAssBook.action?assBook_id=${assignmentBook.assBook_id}">填写/修改任务书</a></td>
			    	 </tr>
	    		  </c:forEach>
	    	<tr>
    	 	<td align="center" colspan="8">
    	 	 <c:choose>
    	 	 	<c:when test="${pageBeanAssBooks.currentPage==pageBeanAssBooks.firstPage}">
    	 	 		首页&nbsp;
    	 	 		上一页
    	 	 	</c:when>
    	 	 	<c:otherwise>
    	 	 		<a id="firstPage"  onclick="doFristPage()">首页</a>&nbsp;
    	 			<a id="prePage" onclick="doPrePage()">上一页</a>&nbsp;
    	 	 	</c:otherwise>
    	 	 </c:choose>
    	 	 
    	 	 <c:choose>
    	 	 	<c:when test="${pageBeanAssBooks.currentPage==pageBeanAssBooks.totalPage}">
    	 	 		下一页&nbsp;
    	 	 		末页
    	 	 	</c:when>
    	 	 	<c:otherwise>
    	 	 		<a id="nextPage" onclick="doNextPage()">下一页</a>&nbsp;
    	 			<a id="lastPage" onclick="doLastPage()">末页</a>&nbsp;
    	 	 	</c:otherwise>
    	 	 </c:choose>
    	 		当前为第${pageBeanAssBooks.currentPage }页/共${pageBeanAssBooks.totalPage }页&nbsp;
    	 		共${pageBeanAssBooks.totalCount }条数据&nbsp;
    	 		每页显示 <input type="text" size="2" id="pageSize" value="${pageBeanAssBooks.pageSize }" onblur="changePageSize()"/> 条&nbsp;
    	 		跳转到第&nbsp;<input type="text" id="curPage" size="2" onblur="changePage()"/>页
    	 		
    	 	</td>
    	 	</tr>
	</tbody>
		</table>
	
	
	</div>
	 <script type="text/javascript">
  	/*改变每页显示记录数*/
  	function changePageSize(){
  		//1.得到用户输入
  		var pageSize = document.getElementById("pageSize").value;
  		//判断规则：只能输入1-2个的数字
  		var reg = /^[1-9][0-9]?$/;
  		if(!reg.test(pageSize)){
  			alert("只能输入1-2位的数字");
  			return;
  		}
  		//2.请求ListEmpServlet，同时发送参数(pageSize)
  		var url = "${pageContext.request.contextPath}/sub_getAll.action?currentPage=1&pageSize="+pageSize;
  		window.location.href=url;
  	}
  	
  	/*跳转页面*/
  	function changePage(){
  		var curPage = document.getElementById("curPage").value;
  		alert(curPage);
  		var reg = /^[1-9][0-9]?$/;
  		if(!reg.test(curPage)){
  			alert("只能输入1-2位的数字");
  			return;
  		}
  		/*如果输入的页码大于等于总页数*/
  		var totalPage = "${pageBeanAssBooks.totalPage}";
  		if(curPage>totalPage){
  			alert("已经超过总页数");
  			return;
  		}
  		
  		var url = "${pageContext.request.contextPath}/sub_getAll.action?currentPage="+curPage+"&pageSize=${pageBeanAssBooks.pageSize}";
  		window.location.href=url;
  	}
  </script>
</body>
</html>