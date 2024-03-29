<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0050)http://localhost:8080/Voids/controller/web?id=1 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- base href="http://localhost:8080/video/" -->
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">

<link href="./static/z/bootstrap.css" rel="stylesheet">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="./static/z/base.css" type="text/css">
<link rel="stylesheet" href="./static/z/css.css" type="text/css">

<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body class="w100" style="padding-top: 0px;">
	<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>
		<div style="float: right" id="user_bar">
			<a href="userShow?accounts=${user.accounts }"> <img id="avatar"
				src="${user.imgurl }" draggable="false" style="height: 30px"></a>
			<a href="index?accounts=${user.accounts }">首页</a>
			<a href="exit">退出</a>
		</div>

		<a onclick="JavaScript:addFavorite2()"><img src="static/z/sc.png"
			draggable="false">加入收藏</a> <a data-toggle="modal"
			data-target="#myModal"> <img src="static/z/we.png"
			draggable="false">后台管理
		</a> <a class="color_e4"><img src="static/z/phone.png"
			draggable="false"> 0371-88888598 4006-371-555</a>

	</div>
	</header>


	<div id="app">
		<!--banner图-->
		<div class="banner">
			<img alt="" src="./static/z/banner-1.jpg" width="100%"
				height="470px;">
		</div>

		<!--面包屑导航-->
		<div class="container mian-nav" id="navDiv">公开课 / ${subject.subject_name }</div>
		
		<c:forEach items="${courses }" var="course" begin="0" end="${count }">
			<div class="classify">
				<div class="container" id="dataContainer">
					<div class="section">
						<div class="classifyName">
							<p class="title title-first">${course.course_title }</p>
						</div>
						<div class="kcIntro">
							<p class="int">
								<span>课程介绍：</span> ${course.course_desc }
							</p>
						</div>

						<!-- 外围foreach输出所有课程--course_title -->
						<!-- 内层foreach根据course.id(即video.course_id)按课程分类输出不同的视频 -->
						<c:if test="${list != null }">

							<%-- <c:set var="keys" value="6"></c:set>
							<c:set var="book" value="${pageScope.table[pageScope.keys]}"></c:set>
 							${keys }=${book} --%>

							<c:forEach items="${videos[course.id]}" var="video">

								<ul style="float: left">
									<li class="section-main" onclick="getVideo(${video.video_id})">
										<div class="thum"
											style="background-image: url(${video.image_url})"></div>
										<p>${video.title}</p>
										<div class="classify-v-info">
											<span class="count" title="观看次数"><img
												src="./static/z/count.png" alt="">${video.paly_num }</span> <span
												class="duration" title="视频时长"><img
												src="./static/z/player.png" alt="">${video.time }</span>
										</div>
									</li>
								</ul>
							</c:forEach>

						</c:if>

					</div>
				</div>
			</div>
		</c:forEach>


		<!--页脚-->
		<footer>
		<ul>
			<li><img src="./static/z/footer_logo.png" alt=""
				draggable="false"></li>
			<li class="mt25">
				<h3>各校区地址</h3>
				<ul>
					<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层
					</li>
					<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路
					</li>
					<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼
					</li>
					<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层
					</li>
					<li>西安分校<br>中国-西安莲湖区 联系人：梁老师 13201570801
					</li>
				</ul>
			</li>
			<li class="mt25">
				<h3>联系我们</h3>
				<ul id="foo_icon">
					<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
					<li>e-mail:zy@zhiyou100.com</li>
					<li>电话:4006-371-555 0371-88888598</li>
					<li class="erwei"><br>
						<div>
							<img class="weixin" src="./static/z/a_002.png" alt=""
								draggable="false"> <img class="weibo"
								src="./static/z/a.png" alt="" draggable="false">
						</div></li>
				</ul>
			</li>
		</ul>
		<div class="record">智游教育 © 豫ICP备17000832号-1 河南智游臻龙教育科技有限公司</div>
		</footer>

		<script type="text/javascript">
		function back() {

			location.href = "http://localhost:8080/video/index";
		}
	</script>

	</div>

	<script type="text/javascript">
		function getVideo(num) {
			location.href = "video?video_id=" + num;
		}
	</script>
	
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<script src="jquery/messages_zh.js"></script>

<script src="./static/z/jquery-1.js"></script>
<script src="./static/z/index.js"></script>
<script src="./static/z/gVerify.js"></script>
	
</body>
</html>