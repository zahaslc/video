<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0038)http://localhost:8080/Voids/user/go -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href=".">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
	<!-- 用户注册 -->
	<form action="updateFindPassword" method="post">
		<h3>密码找回</h3>
		<input placeholder="请输入邮箱" name="accounts" type="email" id="accounts"
			onblur="user_accounts_reg()"><span id="emailMsg"></span> <br>

		<input placeholder="请输入密码" name="psw" id="psw" type="password"
			onblur="checkPassword()"><br> <input
			placeholder="请再次输入密码" name="psw_again" type="password" id="psw_again"
			onblur="checkPassword()"><span id="passMsg"></span><br>
		<br>
		
		<button type="button" onclick="verify()" id="getVerifyCode">
			获取验证码<span id="time">60</span>
		</button>
		<input type="hidden" value="${verifyCode }" name="verifyCode" id="verifyCode">
		
		<span id="codeMsg"></span><br> <input type="text"
			placeholder="请输入验证码" name="Code" id="Code"><br> <input
			value="确　定" type="submit" id="submitReg"
			onclick="return check(this.form)"><button type="button" onclick="back()">返  回</button>
	</form>

	<script type="text/javascript">
		function check(form) {
			if (form.Code.value == "") {
				alert("验证码不能为空");
				return false;
			} else if (form.Code.value != form.verifyCode.value) {
				alert("验证码错误");
				return false;
			} else if (form.accounts.value == "") {
				alert("邮箱不能为空");
				return false;
			} else if (form.psw.value == "") {
				alert("密码不能为空");
				return false;
			} else {
				return true;
			}
		}
	</script>

	<script type="text/javascript">
	<!-- 发送验证码，并倒计时 -->
		function verify() {
			alert("成功获取验证码");
			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/getVerifyCode",
				data : {
					email : $("#accounts").val()
				},
			})

			var setTime;
			var time = 60;
			$(document).ready(function() {
				setTime = setInterval(function() {
					if (time <= 0) {
						document.getElementById("time").style.display = "none";
						$("#getVerifyCode").attr("disabled", false);
						$.post({
							url : "http://localhost:8080/video/removeSession",
						})
						return;
					} else {
						$("#getVerifyCode").attr("disabled", true);
					}
					time--;
					$("#time").text(time);
				}, 1000);
			});

		}
	</script>

	<script type="text/javascript">
		function back() {

			location.href = "http://localhost:8080/video/index";
		}

		//邮箱验证
		function user_accounts_reg() {
			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/userAccountsLogin",
				data : {
					accountsCheckLogin : $("#accounts").val(),
				},
				success : function(data) {
					
					if (data == 0) {
						//如果错误，禁止提交
						$("#submitLogin").attr("disabled", false);
						$("#emailMsg").text("邮箱输入正确").css("color", "green");
					} else if (data == 2) {
						$("#submitLogin").attr("disabled", true);
						$("#emailMsg").text("邮箱不能为空").css("color", "red");
					} else {
						$("#submitLogin").attr("disabled", true);
						$("#emailMsg").text("邮箱未注册").css("color", "red");
					}
				}
			})
		}

		//修改密码
		function checkPassword() {
			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/checkPassword",
				data : {
					psw : $("#psw").val(),
					psw_again : $("#psw_again").val(),
				},
				success : function(data) {
					if (data == 2) {
						//如果已经注册，禁止提交
						$("#submitReg").attr("disabled", true);
						$("#passMsg").text("两次密码不一致").css("color", "red");
					} else if (data == 1) {
						$("#submitReg").attr("disabled", true);
						$("#passMsg").text("密码不能为空").css("color", "red");
					} else {
						$("#submitReg").attr("disabled", false);
						$("#passMsg").text("两次密码一致").css("color", "green");
					}
				}
			})
		}
	</script>
	<script src="http://localhost:8080/video/static/z/jquery-1.js"></script>
</body>
</html>