<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0038)http://localhost:8080/Voids/user/go -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">


<link rel="stylesheet" href="http://localhost:8080/video/static/z/base.css" type="text/css">
<link rel="stylesheet" href="http://localhost:8080/video/static/z/css.css" type="text/css">

<link rel="stylesheet"
	href=".\css\font-awesome-4.7.0\css\font-awesome.min.css"
	type="text/css">


<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


</head>

<body class="w100" style="padding-top: 0px">

	<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>
		<div style="float: right" id="user_bar">

			<a id="login_open"><img src="static/z/we.png">登录</a> <a
				id="reg_open"><img src="static/z/we.png" draggable="false">注册</a>
			<a id="user_pic" style="display: none"
				href="userShow?accounts=${user.accounts }"><span>@qq.com</span><img
				id="avatar" src="${user.imgurl }" draggable="false"
				style="height: 30px"></a>
		</div>

		<a onclick="JavaScript:addFavorite2()"><img src="static/z/sc.png"
			draggable="false">加入收藏</a> <a data-toggle="modal"
			data-target="#myModal"> <img src="static/z/we.png"
			draggable="false">后台管理
		</a> <a class="color_e4"><img src="static/z/phone.png"
			draggable="false"> 0371-88888598 4006-371-555</a>

	</div>
	</header>


	<!--banner图-->
	<div class="banner index-banner">
		<img alt="" src="static/z/banner-2.jpg">
	</div>


	<!--模块化课程-->
	<div class="course">
		<div class="container">
			<p class="title">模块化课程，从入门到精通，大神并不遥远</p>
			<div class="course-info">
				<table cellspacing="10">
					<tbody>
						<tr>

							<td colspan="2"><a onclick="web()"> <img
									src="static/z/html5.jpg" alt="" class="image scale"
									draggable="false">
									<div class="headline">
										<span>Web前端教程</span> <img src="static/z/arrow.png" alt="">
									</div>
							</a></td>

							<td>
								<!--上线时修改id--> <a onclick="ui()"> <img src="static/z/ui.jpg"
									alt="" class="image scale" draggable="false">
									<div class="headline">
										<span>UI设计教程</span> <img src="static/z/arrow.png" alt="">
									</div>
							</a>
							</td>

							<td rowspan="2" class="one_three"><a class="opacity5"> <img
									src="static/z/java.jpg" alt="" class="image" draggable="false">
									<div class="headline">
										<span>Java教程</span> <img src="static/z/arrow.png" alt="">
									</div>
							</a></td>
						</tr>

						<tr>
							<td><a class="opacity5"> <img src="static/z/bigdata.jpg"
									alt="" class="image" draggable="false">
									<div class="headline">
										<span>大数据教程</span> <img src="static/z/arrow.png" alt="">
									</div>
							</a></td>

							<td colspan="2"><a onclick="python()"> <img
									src="static/z/python.jpg" alt="" class="image scale"
									draggable="false">
									<div class="headline">
										<span>Python教程</span> <img src="static/z/arrow.png" alt="">
									</div>
							</a></td>
						</tr>

						<tr>
							<td colspan="2"><a onclick="php()"> <img
									src="static/z/php.jpg" alt="" class="image scale"
									draggable="false">
									<div class="headline">
										<span>PHP教程</span> <img src="static/z/arrow.png" alt="">
									</div>
							</a></td>
							<td colspan="2" class="three_two"><img
								src="static/z/qidai.jpg" alt="" class="image" draggable="false">
								<div class="headline">更多课程，敬请期待...</div></td>
						</tr>

					</tbody>
				</table>


				<!--马上试听-->
				<a onclick="pyRegisterCvt()" target="_blank"
					href="http://wpa.qq.com/msgrd?v=3&amp;uin=2580094677&amp;site=qq&amp;menu=yes">
					<div class="audition">高级课程</div>
				</a>
			</div>
		</div>
	</div>

	<!--报名表单-->
	<div class="form_area">
		<div class="container">
			<p class="title">
				<b>这个世界上可以选择的很多，可以改变命运的选择很少<br>你现在准备好向梦想出发了吗？
				</b>
			</p>
			<form id="iform" action="http://localhost:8080/090/plus/dmail.php"
				enctype="multipart/form-data" method="post">
				<div class="form_line1"></div>
				<div class="form_line2"></div>
				<div class="wrap">
					<input name="action" value="post" type="hidden"> <input
						name="diyid" value="3" type="hidden"> <input name="do"
						value="2" type="hidden"> <input name="ip" value=""
						type="hidden"> <input name="time" value="" type="hidden">
					<div>
						<label for="name">姓名：</label> <input name="name" id="name"
							class="form-control" type="text">
					</div>
					<div>
						<label for="tel">手机号：</label> <input name="tel" id="tel"
							class="form-control" type="text">
					</div>
					<div>
						<label for="qq">QQ：</label> <input name="qq" id="qq"
							class="form-control" type="text">
					</div>
				</div>
				<input class="button" value="立即报名" type="submit">
			</form>
		</div>
	</div>


	<!--页脚-->
	<footer>
	<ul>
		<li><img src="http://localhost:8080/video/static/z/footer_logo.png" alt=""
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
						<img class="weixin" src="http://localhost:8080/video/static/z/a_002.png" alt=""
							draggable="false"> <img class="weibo"
							src="http://localhost:8080/video/static/z/a.png" alt="" draggable="false">
					</div></li>
			</ul>
		</li>
	</ul>
	<div class="record">智游教育 © 豫ICP备17000832号-1 河南智游臻龙教育科技有限公司</div>
	</footer>



	<div class="mask hidden" id="login">
		<div class="mask_content">
			<div class="mask_content_header">
				<img src="http://localhost:8080/video/static/z/logo.png" alt="" class="ma">
			</div>
			<div class="mask_content_body">
				<form action="login" method="post" id="form">
					<h3>快速登录</h3>
					<input placeholder="请输入邮箱" name="accounts" id="userLogin" type="email" onblur="checkLogin()"> 
						<span id="accountLogin"></span> 
					<input placeholder="请输入密码" name="password" id="password" type="password"> 

					<div id="forget">
						<a href="http://localhost:8080/video/findPassword">忘记密码？</a>
					</div>
					<span id="account"></span> 
					<input id="submitLogin" value="登　录" type="submit">
				</form>
			</div>
			<div class="mask_content_footer">
				<span id="login_close">关 闭</span>
			</div>
		</div>
	</div>
	
	<!-- 用户注册 -->
	<div class="mask hidden" id="reg">
		<div class="mask_content">
			<div class="mask_content_header">
				<img src="http://localhost:8080/video/static/z/logo.png" alt="" class="ma">
			</div>
			<div class="mask_content_body">
				<form action="insertUser" method="post">
					<h3>新用户注册</h3>
					<input placeholder="请输入邮箱" name="accounts" type="email" id="accounts" onblur="user_accounts_reg()"> 
						<span id="emailMsg"></span> 
					<input placeholder="请输入密码" name="psw" id="psw" type="password" onblur="checkPassword()"> 
					<input placeholder="请再次输入密码" name="psw_again" type="password" id="psw_again" onblur="checkPassword()"> 
						<span id="passMsg"></span><br>
					<button type="button" onclick="verify()" id="getVerifyCode">获取验证码<span id="time">60</span></button>
					<input type="text" placeholder="请输入验证码" name="Code" id="Code">
						<span id="codeMsg"></span>
					<input value="注　册" type="submit" id="submitReg" onclick="return check(this.form)">
				</form>
			</div>
			<div class="mask_content_footer">
				<span id="reg_close">关 闭</span>
			</div>
		</div>
	</div>

	<!-- 管理员登录 -->
	<form action="adminLogin" id="form">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">管理员登录</h4>
					</div>
					<div class="modal-body">

						<table id="log">
							<tr>
								<td>账号:</td>
								<td><input type="text" id="accountsAdmin"
									name="accountsAdmin" onblur="accountsAdminCheck()"> <i
									id="i1"></i></td>
							</tr>
							<tr>
								<td>密码:</td>
								<td><input type="text" name="passwordAdmin"
									id="passwordAdmin"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="back()">关闭</button>
						<input type="submit" class="btn btn-primary" id="submitAdmin"
							value="登录">
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
	function check(form){
		if(form.Code.value == ""){
			alert("验证码不能为空");
			return false;
		}else if(form.accounts.value == ""){
			alert("邮箱不能为空");
			return false;
		}else if(form.psw.value == ""){
			alert("密码不能为空");
			return false;
		}else{
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
    		url:"http://localhost:8080/video/getVerifyCode",
    		data:{
    			email:$("#accounts").val()
    		},
    		
    	})
    	
    	var setTime;
		var time = 60;
        $(document).ready(function(){
            
            setTime=setInterval(function(){
                if(time<=0){
               	 document.getElementById("time").style.display="none";
               	 $("#getVerifyCode").attr("disabled",false);
               	 $.post({
                		url:"http://localhost:8080/video/removeSession",
                  	})
                    return;
                }else{
               	 $("#getVerifyCode").attr("disabled",true);
                }
                time--;
                $("#time").text(time);
            },1000);
        });
        
	 }
	</script>
	
	<script type="text/javascript">
		function back() {

			location.href = "http://localhost:8080/video/index";
		}
		
		//用户登录验证
		function checkLogin() {
			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/userAccountsLogin",
				data : {
					accountsCheckLogin : $("#userLogin").val(),
				},
				success : function(data) {
					if (data == 0) {
						//如果错误，禁止提交
						$("#submitLogin").attr("disabled", false);
						$("#accountLogin").text("邮箱输入正确").css("color", "green");
					} else if(data == 2) {
						$("#submitLogin").attr("disabled", true);
						$("#accountLogin").text("邮箱不能为空").css("color", "red");
					} else {
						$("#submitLogin").attr("disabled", true);
						$("#accountLogin").text("该邮箱尚未注册").css("color", "red");
					}
				}
			})
		}
		//管理员登录验证
		function accountsAdminCheck() {
			$.ajax({
				type : "post",
				url : "http://localhost:8080/video/accountsAdminCheck",
				data : {
					accountsAdmin : $("#accountsAdmin").val(),

				},
				success : function(data) {
					if (data == 1) {
						//如果错误，禁止提交
						$("#submitAdmin").attr("disabled", false);
						$("#i1").text("账号输入正确").css("color", "green");
					} else {
						$("#submitAdmin").attr("disabled", true);
						$("#i1").text("账号输入错误").css("color", "red");
					}
				}
			})
		}
		//注册验证(邮箱)
		function user_accounts_reg() {
			$.ajax({
					type : "post",
					url : "http://localhost:8080/video/user_accounts_reg",
					data : {
						accountsCheck : $("#accounts").val(),
					},
					success : function(data) {
						if (data == 2) {
							//如果已经注册，禁止提交
							$("#submitReg").attr("disabled", true);
							$("#emailMsg").text("该邮箱已注册，请直接登录").css( "color", "red");
						} else if(data == 1){
							$("#submitReg").attr("disabled", true);
							$("#emailMsg").text("邮箱不能为空").css("color", "red");
						}else {
							$("#submitReg").attr("disabled", false);
							$("#emailMsg").text("该邮箱可用").css("color", "green");
						}
					}
				})
		}
		
		//注册验证(密码)
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
							$("#passMsg").text("两次密码不一致").css( "color", "red");
						} else if(data == 1){
							$("#submitReg").attr("disabled", true);
							$("#passMsg").text("密码不能为空").css("color", "red");
						}else {
							$("#submitReg").attr("disabled", false);
							$("#passMsg").text("两次密码一致").css("color", "green");
						}
					}
				})
		}
	</script>
	
	<script type="text/javascript">
	function web() {
			if (${user.accounts == null}) {
				alert("请先登录");
			} else {
				location.href = "webShow.do?subject_id=" + 1;
			}
		}

		function ui() {
			if (${user.accounts == null}) {
				alert("请先登录");
			} else {
				location.href = "webShow.do?subject_id=" + 6;
			}
		}
		function python() {
			if (${user.accounts == null}) {
				alert("请先登录");
			} else {
				location.href = "webShow.do?subject_id=" + 10;
			}
		}
		function php() {
			if (${user.accounts == null}) {
				alert("请先登录");
			} else {
				location.href = "webShow.do?subject_id=" + 11;
			}
		}
	</script>

	<c:if test="${user.accounts != null }">
		<script type="text/javascript">
			document.getElementById("login_open").style.display = "none";
			document.getElementById("reg_open").style.display = "none";
			document.getElementById("user_pic").style.display = "inline";
		</script>
	</c:if>


	<c:if test="${msg!=null}">
		<script type="text/javascript">
			alert('${msg}');
		</script>
	</c:if>
		
	<script src="http://localhost:8080/video/static/z/jquery-1.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://localhost:8080/video/static/z/index.js"></script>
</body>
</html>