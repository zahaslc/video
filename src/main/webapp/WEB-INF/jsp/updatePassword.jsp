<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/Voids/user/password -->
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
<link rel="stylesheet" href="http://localhost:8080/video/static/z/base.css">
<link rel="stylesheet" href="http://localhost:8080/video/static/z/profile.css">

<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<script src="http://localhost:8080/video/jquery/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://localhost:8080/video/static/z/jquery-1.js"></script>
<script src="http://localhost:8080/video/static/z/index.js"></script>

</head>


<body class="w100">

	<header>
	<div class="container top_bar clearfix">
		<img src="http://localhost:8080/video/static/z/logo.png" alt="智游">
		<div id="tele">
			<span>4006-371-555</span> <span>0371-88888598</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li><a href="home?accounts=${user.accounts }">首页</a></li>

				<li class="menu_active"><a href="userShow?accounts=${user.accounts }">个人中心</a></li>
			</ul>

			<div id="user_bar">
				<a> <img id="avatar" src="${user.imgurl }" alt="">

				</a> <a href="exit">退出</a>
			</div>
		</div>
	</menu>
	</header>

	<main>
	<div class="container">
		<h2>我的资料</h2>
		<div id="profile_tab">
			<ul class="profile_tab_header f_left clearfix">
				<li><a href="updateUserShow?accounts=${user.accounts }">更改资料</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updatePicShow?accounts=${user.accounts }">更改头像</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updatePasswordShow?accounts=${user.accounts }">密码安全</a></li>
			</ul>
			<div class="proflle_tab_body">
				<div class="proflle_tab_workplace clearfix">
					<div class="profile_avatar_area">


						<img id="avatar" width="200px;" src="${user.imgurl }" alt="">




					</div>
					<div class="profile_ifo_area">
						<form action="updatePassword" method="post">
							<input type="hidden" name="accounts" value="${user.accounts }"
								id="accounts">
							<div class="form_group">
								<span class="dd">旧 密 码：</span> <input id="oldPassword"
									type="password" onblur="p()"> <span id="oldMsg"></span>
							</div>
							<div class="form_group">
								<span class="dd">新 密 码：</span> <input id="newPassword"
									type="password" onblur="checkP()" name="password">
							</div>
							<div class="form_group">
								<span class="dd">确认新密码：</span> <input id="newRPassword"
									type="password" onblur="checkP()"> <span id="newMsg"></span>
							</div>
							<div class="form_submit dd">
								<input value="保　存" type="submit" id="sub" onclick="return notNull()"> <a
									href="updatePasswordShow?accounts=${user.accounts }">取消</a>
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
			<li><img src="http://localhost:8080/video/static/z/footer_logo.png" alt="" id="foot_logo"></li>
			<li>版权所有：智游3G教育 ©&nbsp;www.zhiyou100.com</li>
			<li><img src="http://localhost:8080/video/static/z/a.png" alt="" id="wxgzh"></li>
		</ul>
	</div>
	</footer>

	<script>
function notNull()
{
    var newPassword = document.getElementById("newPassword").value

    if(newPassword == ""||newPassword==null){
    	alert("新密码不能为空");
    	return false;
    }else{
    	return true;
    }
}
</script>

	<script type="text/javascript">

		function p() {
			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/checkOldPassword",
				data : {
					oldPassword : $("#oldPassword").val(),
					accounts : $("#accounts").val()
				},
				success : function(data) {
					if (data == 0) {
						$("#oldMsg").text("旧密码错误");
						$("#sub").attr("disabled", true);
					} else {
						$("#oldMsg").text("旧密码正确");
						$("#sub").attr("disabled", false);
					}
				}
			})
		}
		function checkP() {

			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/checkRPassword",
				data : {
					newPassword : $("#newPassword").val(),
					newRPassword : $("#newRPassword").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#newMsg").text("两次输入密码不一致！");
						$("#sub").attr("disabled", true);
					} else {
						$("#newMsg").text("密码一致！");
						$("#sub").attr("disabled", false);
					}
				}
			})
		}
	</script>

</body>
</html>