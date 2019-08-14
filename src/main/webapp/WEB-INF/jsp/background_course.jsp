<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0052)http://localhost:8080/Voids/controller/courseShow -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>智游教育</title>

<link href="./static/z/bootstrap.css" rel="stylesheet">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<script src="jquery/messages_zh.js"></script>

<link rel="stylesheet" href="./static/z/base.css" type="text/css">
<link rel="stylesheet" href="./static/z/css.css" type="text/css">
<link rel="icon" href="http://localhost:8080/static/z/favicon.png"
	type="jpg/png">

<script src="./static/z/jquery-1.js"></script>
<script src="./static/z/index.js"></script>
<script src="./static/z/gVerify.js"></script>

<style type="text/css">
th {
	text-align: center;
}
</style>
</head>

<body>
	<nav class="navbar-inverse">
	<div class="container">

		<div class="navbar-header">
			<a class="navbar-brand">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li class="active"><a href="VideoShow">视频管理</a></li>
				<li class="active"><a href="SpeakerShow">主讲人管理</a></li>
				<li class="active"><a href="CourseShow">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${admin.accounts }</span> <i
					class="glyphicon glyphicon-log-in" aria-hidden="true"></i>&nbsp;&nbsp;<a
					class="navbar-link" href="exit">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->


	</div>
	<!-- /.container-fluid --> </nav>


	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">
			<h2>课程管理</h2>
		</div>
	</div>

	<form>
		<div class="container">
			<button onclick="showAddPage()" type="button"
				class="btn btn-info dropdown-toggle">添加</button>

			<input type="button" onclick="deleteSome()" id="btn" class="btn btn-info dropdown-toggle" value="批量删除">
		</div>

		<div class="container" style="margin-top: 20px;">

			<table class="table table-bordered table-hover"
				style="text-align: center; table-layout: fixed;">
				<thead>

					<tr class="active">
						<th><input type="checkbox" onclick="swapCheck()" id="all"></th>
						<th>序号</th>
						<th style="width: 16%">标题</th>
						<th style="width: 60%">简介</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${course }" var="i">
						<tr>
							<th><input type="checkbox" name="choice" value="${i.id }"></th>
							<th>${i.id }</th>
							<th>${i.course_title }</th>
							<th>${i.course_desc }</th>
							<th><a href="updateCourseShow?id=${i.id }">✎</a></th>
							<th><a href="deleteCourse?id=${i.id }">X</a></th>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="2"><font>总共有${count }条数据 </font></td>

						<c:if test="${count%5==0 }">
							<c:set var="page" value="${count/5}"></c:set>
						</c:if>
						<c:if test="${count%5!=0 }">
							<c:set var="page" value="${count/5+1}"></c:set>
						</c:if>

						<td><c:if test="${ key==null}">
								<c:forEach var="i" begin="1" end="${page}">
									<a href="CourseShow?page=${i}">第${i}页</a>
								</c:forEach>
							</c:if></td>
					</tr>
				</tbody>
			</table>

		</div>
	</form>

	<script type="text/javascript">
		function showAddPage() {
			location.href = "addCourseShow";
		}

		var isCheckAll = false;
		function swapCheck() {
			if (isCheckAll) {
				$("input[type='checkbox']").each(function() {
					this.checked = false;
				});
				isCheckAll = false;
			} else {
				$("input[type='checkbox']").each(function() {
					this.checked = true;
				});
				isCheckAll = true;
			}
		}

		function deleteSome() {
	    	var selected=new Array();	
	        var i = 0;
	    	$.each($("input[name='choice']"),function(){
	    		if (this.checked) {
	    			selected[i]=$(this).val();
	    				i++;
	    		}	
	    	})
	    	alert(selected);
	    	if(selected == ""|| selected == null){
	    		location.href= "CourseShow";
	    	}else{
	    		location.href= "deleteCourome?selected="+selected;
	    	}
	    }

	</script>


</body>
</html>