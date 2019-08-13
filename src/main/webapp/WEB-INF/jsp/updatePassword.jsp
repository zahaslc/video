<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/Voids/user/password.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- base href="http://localhost:8080/video/" -->
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<link rel="stylesheet" href="./static/z/base.css">
<link rel="stylesheet" href="./static/z/profile.css">

<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./static/z/jquery-1.js"></script>
<script src="./static/z/index.js"></script>
<!-- <script type="text/javascript">
	$().ready(function() {
		$("#sub").validate({
			rules : {
				oldPassword : {
					required : true
				},
				newPassword : {
					required : true,
					minlength : 6
				},
				newRPassword : {
					required : true,
					equalTo : "#newPassword"
				}
				
			},
				oldPassword : {
					required : "请输入旧密码",
				},
				newPassword : {
					required : "请输入新密码",
					minlength : "密码长度不小于6",
				},
				newPassword : {
					required : "请再次输入密码",
					minlength : "密码长度不小于6",
					equalTo : "两次输入不一样"
				}
			}
		});
	})
</script> -->
</head>


<body class="w100">




	<header>
	<div class="container top_bar clearfix">
		<img src="./static/z/logo.png" alt="智游">
		<div id="tele">
			<span>4006-371-555</span> <span>0371-88888598</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li><a href="home.do">首页</a></li>

				<li class="menu_active"><a>个人中心</a></li>
			</ul>

			<div id="user_bar">
				<a> <img id="avatar" src="${user.imgurl }" alt="">




				</a> <a href="exit.do">退出</a>
			</div>
		</div>
	</menu>
	</header>

	<main>
	<div class="container">
		<h2>我的资料</h2>
		<div id="profile_tab">
			<ul class="profile_tab_header f_left clearfix">
				<li><a href="updateUserShow.do?accounts=${user.accounts }">更改资料</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updatePicShow.do?accounts=${user.accounts }">更改头像</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updatePasswordShow.do?accounts=${user.accounts }">密码安全</a></li>
			</ul>
			<div class="proflle_tab_body">
				<div class="proflle_tab_workplace clearfix">
					<div class="profile_avatar_area">


						<img id="avatar" width="200px;" src="${user.imgurl }" alt="">




					</div>
					<div class="profile_ifo_area">
						<form action="updatePassword.do" method="post">
							<input type="hidden" name="accounts" value="${user.accounts }"
								id="accounts">
							<div class="form_group">
								<span class="dd">旧 密 码：</span> <input id="oldPassword"
									type="password" onblur="p()"> <span id="oldMsg"></span>
							</div>
							<div class="form_group">
								<span class="dd">新 密 码：</span> <input id="newPassword"
									type="password" name="password">
							</div>
							<div class="form_group">
								<span class="dd">确认新密码：</span> <input id="newRPassword"
									type="password" onblur="checkP()"> <span id="newMsg"></span>
							</div>
							<div class="form_submit dd">
								<input value="保　存" type="submit" id="sub"> <a
									href="updatePasswordShow.do">取消</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>



	<footer>
	<div class="container">
		<ul>
			<li><img src="./static/z/footer_logo.png" alt="" id="foot_logo"></li>
			<li>版权所有：智游3G教育 ©&nbsp;www.zhiyou100.com</li>
			<li><img src="./static/z/a.png" alt="" id="wxgzh"></li>
		</ul>
	</div>
	</footer>

	<script type="text/javascript">
 /* 	  $().ready(function() {
		$("#sub").attr("disabled", true);
		$("#oldPassword").blur(p);
		$("#newPassword").blur(checkP);
		$("#newRPassword").blur(checkP);
		$("#sub").lick(p);
		$("#sub").lick(checkP);
	}),   */ 
	
	
	function p() {
			$.post({
				url : "checkOldPassword.do",
				data : {
					oldPassword : $("#oldPassword").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#oldMsg").text("旧密码错误");
						
					} else {
						$("#oldMsg").text("旧密码正确");
						$("#sub").attr("disabled", false);
					}
				}
			})
		}
		function checkP() {

			$.post({
				url : "http://localhost:8080/SSM/checkRPassword.do",
				data : {
					newPassword : $("#newPassword").val(),
					newRPassword : $("#newRPassword").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#newMsg").text("两次输入密码不一致！");
						
					} else {
						$("#newMsg").text("密码一致！");
						
					}
				}
			})
		}
	</script>



</body>
</html>