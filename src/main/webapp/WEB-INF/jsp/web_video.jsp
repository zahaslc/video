<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0084)http://localhost:8080/Voids/user/VideoGo.do?id=218&subjectName=WEB%E5%89%8D%E7%AB%AF -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">

<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">

<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="./static/z/base.css">
<link rel="stylesheet" href="./static/z/css.css">
<link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png"
	type="image/png">

<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

</head>

<body class="w100" style="padding-top: 0px;">




	<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>
		<div style="float: right" id="user_bar">
			<a href="userShow?accounts=${user.accounts }"> <img
				id="avatar" src="${user.imgurl }" draggable="false"
				style="height: 30px"></a> 
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




	<div>
		<!--面包屑导航-->
		<div class="container mian-nav">公开课 / ${subject.subject_name }</div>

		<div id="content">




			<div class="intro">
				<div class="container">
					<div class="v-intro">
						<div class="left">
							<video id="videoPlayer" src="${video.video_url }"
								class="video-js vjs-default-skin" controls="controls"
								poster="static/z/02.jpg" data-setup="{}" height="280"
								width="627" controls autoplay> </video>
						</div>

						<div class="right">
							<p class="right-title">${video.title }</p>
							<div class="avatar">
								<span style="background-image: url(${speaker.pic_url})"></span>
								<p>
									讲师：<b>${speaker.speaker_name }</b><br> <i>${speaker.speaker_desc }</i>
								</p>
							</div>
							<p class="video-intro">
								<span>本节内容：</span>${video.detall }</p>
						</div>
					</div>

					<div class="kcjs">
						<p class="title">课程介绍</p>
						<p class="content">${course.course_desc }</p>
					</div>

				</div>
			</div>
			<!--目录-->
			<div class="catalog">
				<div class="container">
					<p class="title">目录</p>

					<c:forEach items="${videos }" var="v">



						<div class="chapter">
							<p class="biaoti">
								<a href="video.do?video_id=${v.video_id }">${v.title }</a>
							</p>
							<p class="lecturer">${v.detall }</p>
							<p class="lecturer">讲师：${speaker.speaker_name }</p>
							<div class="v-info">
								<span class="count"><img src="./static/z/count.png"
									alt="">${v.paly_num }</span> <span class="duration"><img
									src="./static/z/player.png" alt="">${v.time }</span>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		window.addEventListener("load", getVideoEvent);
		function getVideoEvent() {
			var videoes = document.getElementsByTagName("video");
			for (var i = 0; i < videoes.length; i++) {
				showEventLog("video" + (i + 1), videoes[i]);
			}
		}
		function showEventLog(videoNum, Media) {
			eventTester = function(e) {
				Media.addEventListener(e, function() {
					console.log(videoNum + ":" + e);
				});
			}
			eventTester("play"); //play()和autoplay开始播放时触发
			eventTester("pause"); //pause()触发
		}
	</script>


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
						<img class="weixin" src="./static/z/a.png" alt=""
							draggable="false"> <img class="weibo"
							src="./static/z/a_002.png" alt="" draggable="false">
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

	<script src="./static/z/jquery-1.js"></script>
	<script src="./static/z/gVerify.js"></script>
	<script src="./static/z/index.js"></script>
	<script src="./static/z/video.js"></script>

</body>
</html>