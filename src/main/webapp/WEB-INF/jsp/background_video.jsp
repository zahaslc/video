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
			<h2>视频管理</h2>
		</div>
	</div>

	<form action="selectLikeVideo" method="post">
		<div class="container">
			<div style="float: left">
				<button onclick="showAddPage()" type="button"
					class="btn btn-info dropdown-toggle">添加</button>

				<input type="button" onclick="deleteSome()" id="btn"
					class="btn btn-primary" value="批量删除">
			</div>
			<div style="float: right">
				
				<input type="text" placeholder="标题" name="title" value="${title }"> 
				
				<select name="speaker_id" id="btn" class="btn btn-primary">
					
					<option selected="selected" value="0">--请选择老师--</option>
					<c:forEach items="${speaker}" var="s">

						<option value="${s.id }" <c:if test="${speakerL.id eq s.id }">selected="selected"</c:if>>${s.speaker_name }</option>
					</c:forEach>

				</select> 
				<select name="course_id" id="btn" class="btn btn-primary">
					<option selected="selected" value="0">--请选择课程--</option>
					<c:forEach items="${course}" var="c">

						<option value="${c.id }" <c:if test="${courseL.course_title eq c.course_title }">selected="selected"</c:if>>${c.course_title }</option>
					</c:forEach>
				</select> 
				<input type="submit"  id="btn" class="btn btn-info dropdown-toggle" value="查询">
			</div>
		</div>

		<div class="container" style="margin-top: 20px;">

			<table class="table table-bordered table-hover"
				style="text-align: center; table-layout: fixed;">
				<thead>

					<tr class="active">
						<th><input type="checkbox" onclick="swapCheck()" id="all"></th>
						<th>序号</th>
						<th style="width: 16%">名称</th>
						<th style="width: 45%">介绍</th>
						<th>讲师</th>
						<th>时长</th>
						<th style="width: 8%">播放次数</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${video }" var="i">
						<tr>
							<th><input type="checkbox" name="choice"
								value="${i.video_id }" onclick="checkboxOnclick(this)"></th>
							<th>${i.video_id }</th>
							<th>${i.title }</th>
							<th>${i.detall }</th>
							<th>${i.speaker_id }</th>
							<th>${i.time }</th>
							<th>${i.paly_num }</th>
							<th><a href="updateVideoShow?video_id=${i.video_id }">✎</a></th>
							<th><a href="deleteVideo?video_id=${i.video_id }">X</a></th>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="3"><font>总共有${count }条数据 </font></td>

						<c:if test="${count%5==0 }">
							<c:set var="page" value="${count/5}"></c:set>
						</c:if>
						<c:if test="${count%5!=0 }">
							<c:set var="page" value="${count/5+1}"></c:set>
						</c:if>

						<td colspan="6"><c:if test="${ key==null}">
								<c:forEach var="i" begin="1" end="${page}">
									<a href="selectLikeVideo?page=${i}&title=${title}&speaker_id=${speaker_id}&course_id=${course_id}">第${i}页</a>
								</c:forEach>
							</c:if></td>
					</tr>
				</tbody>
			</table>

		</div>
	</form>

	<script type="text/javascript">
		function showAddPage() {
			location.href = "addVideoShow";
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
			var selected = new Array();
			var i = 0;
			$.each($("input[name='choice']"), function() {
				if (this.checked) {
					selected[i] = $(this).val();
					i++;
				}
			})
			if(selected == ""|| selected == null){
	    		location.href= "VideoShow";
	    	}else{
	    		location.href= "deleteVideoSome?selected="+selected;
	    	}
		}

	</script>
</body>
</html>