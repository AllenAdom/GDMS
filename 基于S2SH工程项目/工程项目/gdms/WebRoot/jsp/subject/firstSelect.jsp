<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String j_auth_action=request.getContextPath()+"/select_getPassSubs.action";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<!-- 该jsp服务于学生在选题时提供的题目列表 -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>题目信息</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ui.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product.css"/>
	
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/form.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.js"></script>
	
	 
<script type="text/javascript">

$(document).ready(function() {
	// 查询
	$("#search").bind("click",search);
});
// 查询
function search() {
	document.forms[0].action ="<%=j_auth_action%>"+"?currentPage="+${pageBean.currentPage}+"&pageSize=${pageBean.pageSize}";  //将表单数据提交给地址j_auth_action
	document.forms[0].submit();
}
function doNextPage(){
	
	document.forms[0].action ="<%=j_auth_action%>" + "?currentPage=" +${pageBean.nextPage }+ "&pageSize=" + ${pageBean.pageSize};  //将表单数据提交给地址j_auth_action
	document.forms[0].submit();
}
function doFristPage()
{
	document.forms[0].action="<%=j_auth_action%>?currentPage=" + ${pageBean.firstPage }+"&pageSize="+ ${pageBean.pageSize};
	document.forms[0].submit();
}
function doLastPage()
{							//?currentPage=${pageBean.totalPage }&pageSize=${pageBean.pageSize}
	document.forms[0].action="<%=j_auth_action%>?currentPage=" + ${pageBean.totalPage }+"&pageSize="+ ${pageBean.pageSize};
	document.forms[0].submit();
}
function doPrePage()
{							//?currentPage=${pageBean.prePage}&pageSize=${pageBean.pageSize}
	document.forms[0].action="<%=j_auth_action%>?currentPage=" + ${pageBean.prePage}+"&pageSize="+ ${pageBean.pageSize};
	document.forms[0].submit();
}
</script>
</head>

<body>
<br>
	<div class="container">
		<div class="row">
			<form class="form-inline" method="post">
				<div class="input-group">
					<input class="form-control ue-form" type="text"  id ="subjectName" name="sq.subjectName"
						placeholder="题目名称" value="${sq.subjectName }"/>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="input-group">
					<input class="form-control ue-form" type="text" id ="teacherName" name="sq.teacherName"
						placeholder="教师名称" value="${sq.teacherName }"/>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="search" type="button" class="btn ue-btn">
					<span class="fa fa-search"></span> 搜索
				</button>
			</form>
		</div>
		<table class="table table-hover table-bordered">
		  <caption>项目列表</caption>
		  <thead>
		    <tr>
		      <th>序号</th>
		      <th>项目名称</th>
		      <th>出题人</th>
		      <th>面向 本/专 科</th>
		      <th>项目类型</th>
		      <th>学科方向</th>
		      <th>所需技术</th>
		       <th>查看详情</th>
		    </tr>
		  </thead>
		  <tbody>
		  
			   <c:forEach items="${pageBean.data}" var="subject" varStatus="varSta">
			    	 <tr>
			    	 	<td>${varSta.count }</td>
			    	 	<td>${subject.subName }</td>
			    	 	<td>${subject.teacher.name }</td>
			    	 	<td>${subject.faceTo }</td>
			    	 	<td>${subject.sub_type }</td>
			    	 	<td>${subject.major_direction }</td>
			    	 	<td>${subject.tech }</td>
			    	 	<td><a href="${pageContext.request.contextPath}/sub_seeSub.action?sub_id=${subject.sub_id}">去看看</a></td>
			    	 </tr>
	    		  </c:forEach>
	    	<tr>
    	 	<td align="center" colspan="8">
    	 	 <c:choose>
    	 	 	<c:when test="${pageBean.currentPage==pageBean.firstPage}">
    	 	 		首页&nbsp;
    	 	 		上一页
    	 	 	</c:when>
    	 	 	<c:otherwise>
    	 	 		<a id="firstPage"  onclick="doFristPage()">首页</a>&nbsp;
    	 			<a id="prePage" onclick="doPrePage()">上一页</a>&nbsp;
    	 	 	</c:otherwise>
    	 	 </c:choose>
    	 	 
    	 	 <c:choose>
    	 	 	<c:when test="${pageBean.currentPage==pageBean.totalPage}">
    	 	 		下一页&nbsp;
    	 	 		末页
    	 	 	</c:when>
    	 	 	<c:otherwise>
    	 	 		<a id="nextPage" onclick="doNextPage()">下一页</a>&nbsp;
    	 			<a id="lastPage" onclick="doLastPage()">末页</a>&nbsp;
    	 	 	</c:otherwise>
    	 	 </c:choose>
    	 		当前为第${pageBean.currentPage }页/共${pageBean.totalPage }页&nbsp;
    	 		共${pageBean.totalCount }条数据&nbsp;
    	 		每页显示 <input type="text" size="2" id="pageSize" value="${pageBean.pageSize }" onblur="changePageSize()"/> 条&nbsp;
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
  		var url = "${pageContext.request.contextPath}/sub_getAll.action?pageSize="+pageSize;
  		window.location.href=url;
  	}
  	
  	/*跳转页面*/
  	function changePage(){
  		var curPage = document.getElementById("curPage").value;
  		var reg = /^[1-9][0-9]?$/;
  		if(!reg.test(curPage)){
  			alert("只能输入1-2位的数字");
  			return;
  		}
  		/*如果输入的页码大于等于总页数*/
  		var totalPage = "${pageBean.totalPage}";
  		if(curPage>totalPage){
  			alert("已经超过总页数");
  			return;
  		}
  		
  		var url = "${pageContext.request.contextPath}/sub_getAll.action?currentPage="+curPage+"&pageSize=${pageBean.pageSize}";
  		window.location.href=url;
  	}
  </script>
</body>
</html>