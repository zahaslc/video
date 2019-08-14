<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0046)http://localhost:8080/Voids/user/userUpdate.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<link rel="stylesheet" href="./static/z/base.css">
<link rel="stylesheet" href="./static/z/profile.css">
<link rel="icon" href="http://localhost:8080/SSM/static/z/favicon.png"
	type="image/png">
<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<li><a
					href="updateUserShow?accounts=${user.accounts }">更改资料</a></li>
				<li class="profile_tab_line">|</li>
				<li><a
					href="updatePicShow?accounts=${user.accounts }">更改头像</a></li>
				<li class="profile_tab_line">|</li>
				<li><a
					href="updatePasswordShow?accounts=${user.accounts }">密码安全</a></li>
			</ul>
			<div class="proflle_tab_body">
				<div class="proflle_tab_workplace clearfix">
					<div class="profile_avatar_area">

						<img src="${user.imgurl }" width="200px;">

					</div>
					<div class="profile_ifo_area">

						<form action="updateUser">

							<div class="form_group">
								<span class="dd">昵 称：</span> <input name="nickname" type="text"
									value="${user.nickname }">

							</div>
							<div class="form_group">

								<c:if test="${user.sex eq 'man' }">
									<span class="dd">性 别：</span>
									<input id="sex" type="radio" name="sex" value="man"
										checked="checked">
									<label for="man">男</label>
									<input id="sex" type="radio" name="sex" value="woman">
									<label for="woman">女</label>
								</c:if>
								<c:if test="${user.sex eq 'woman' }">
									<span class="dd">性 别：</span>
									<input id="sex" type="radio" name="sex" value="man">
									<label for="man">男</label>
									<input id="sex" type="radio" name="sex" value="woman"
										checked="checked">
									<label for="woman">女</label>
								</c:if>
							</div>
							<div class="form_group">
								<span class="dd">生 日：</span>
								<!-- 1990-10-04 -->
								<input name="birthday" type="text" value="${user.birthday }">
							</div>
							<div class="form_group">
								
								<span class="dd">邮 箱：</span>${user.accounts }
							</div>
							<div class="form_group">

								<span class="dd">所在地：</span>

								<div id="city">
									<select id="selProvince" name="prov"
										onChange="getCity(this.options[this.selectedIndex].value)">
										<option value="">-请选择-</option>
										<option value="北京">北京</option>
										<option value="上海">上海</option>
										<option value="天津">天津</option>
										<option value="重庆">重庆</option>
										<option value="河北">河北</option>
										<option value="山西">山西</option>
										<option value="内蒙古自治区">内蒙古自治区</option>
										<option value="辽宁">辽宁</option>
										<option value="吉林">吉林</option>
										<option value="黑龙江">黑龙江</option>
										<option value="江苏">江苏</option>
										<option value="浙江">浙江</option>
										<option value="安徽">安徽</option>
										<option value="福建">福建</option>
										<option value="江西">江西</option>
										<option value="山东">山东</option>
										<option value="河南">河南</option>
										<option value="湖北">湖北</option>
										<option value="湖南">湖南</option>
										<option value="广东">广东</option>
										<option value="广西壮族自治区">广西壮族自治区</option>
										<option value="海南">海南</option>
										<option value="四川">四川</option>
										<option value="贵州">贵州</option>
										<option value="云南">云南</option>
										<option value="西藏自治区">西藏自治区</option>
										<option value="陕西">陕西</option>
										<option value="甘肃">甘肃</option>
										<option value="宁夏回族自治区">宁夏回族自治区</option>
										<option value="青海">青海</option>
										<option value="新疆维吾尔族自治区">新疆维吾尔族自治区</option>
										<option value="香港特别行政区">香港特别行政区</option>
										<option value="澳门特别行政区">澳门特别行政区</option>
										<option value="台湾">台湾</option>
										<option value="其它">其它</option>
									</select> 
									<select id="selCity" name="city">
										<option>-城市-</option>
									</select>
								</div>

							</div>
							<div class="form_submit dd">
								<input type="hidden" name="accounts" value="${user.accounts }">
								<input value="保　存" type="submit"> <a onclick="back()">重置</a>
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


	<script src="./static/z/jquery-1.js"></script>
	<script src="./static/z/gVerify.js"></script>
	<script src="./static/z/index.js"></script>
	<script src="./static/z/jquery.js"></script>

	<script language="javascript" type="text/javascript">
		//定义 城 数据数组 
		cityArray = new Array();
		cityArray[0] = new Array("北京",
				"东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆");
		cityArray[1] = new Array("上海",
				"黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明");
		cityArray[2] = new Array("天津",
				"和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县");
		cityArray[3] = new Array(
				"重庆",
				"万州|涪陵|渝中|大渡口|江北|沙坪坝|九龙坡|南岸|北碚|万盛|双挢|渝北|巴南|黔江|长寿|綦江|潼南|铜梁 |大足|荣昌|壁山|梁平|城口|丰都|垫江|武隆|忠县|开县|云阳|奉节|巫山|巫溪|石柱|秀山|酉阳|彭水|江津|合川|永川|南川");
		cityArray[4] = new Array("河北", "石家庄|邯郸|邢台|保定|张家口|承德|廊坊|唐山|秦皇岛|沧州|衡水");
		cityArray[5] = new Array("山西", "太原|大同|阳泉|长治|晋城|朔州|吕梁|忻州|晋中|临汾|运城");
		cityArray[6] = new Array("内蒙古自治区",
				"呼和浩特|包头|乌海|赤峰|呼伦贝尔盟|阿拉善盟|哲里木盟|兴安盟|乌兰察布盟|锡林郭勒盟|巴彦淖尔盟|伊克昭盟");
		cityArray[7] = new Array("辽宁",
				"沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛");
		cityArray[8] = new Array("吉林", "长春|吉林|四平|辽源|通化|白山|松原|白城|延边");
		cityArray[9] = new Array("黑龙江",
				"哈尔滨|齐齐哈尔|牡丹江|佳木斯|大庆|绥化|鹤岗|鸡西|黑河|双鸭山|伊春|七台河|大兴安岭");
		cityArray[10] = new Array("江苏",
				"南京|镇江|苏州|南通|扬州|盐城|徐州|连云港|常州|无锡|宿迁|泰州|淮安");
		cityArray[11] = new Array("浙江", "杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水");
		cityArray[12] = new Array("安徽",
				"合肥|芜湖|蚌埠|马鞍山|淮北|铜陵|安庆|黄山|滁州|宿州|池州|淮南|巢湖|阜阳|六安|宣城|亳州");
		cityArray[13] = new Array("福建", "福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德");
		cityArray[14] = new Array("江西", "南昌|景德镇|九江|鹰潭|萍乡|新馀|赣州|吉安|宜春|抚州|上饶");
		cityArray[15] = new Array("山东",
				"济南|青岛|淄博|枣庄|东营|烟台|潍坊|济宁|泰安|威海|日照|莱芜|临沂|德州|聊城|滨州|菏泽");
		cityArray[16] = new Array("河南",
				"郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源");
		cityArray[17] = new Array("湖北",
				"武汉|宜昌|荆州|襄樊|黄石|荆门|黄冈|十堰|恩施|潜江|天门|仙桃|随州|咸宁|孝感|鄂州");
		cityArray[18] = new Array("湖南",
				"长沙|常德|株洲|湘潭|衡阳|岳阳|邵阳|益阳|娄底|怀化|郴州|永州|湘西|张家界");
		cityArray[19] = new Array("广东",
				"广州|深圳|珠海|汕头|东莞|中山|佛山|韶关|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|潮州|揭阳|云浮");
		cityArray[20] = new Array("广西壮族自治区",
				"南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|南宁地区|柳州地区|贺州|百色|河池");
		cityArray[21] = new Array("海南", "海口|三亚");
		cityArray[22] = new Array("四川",
				"成都|绵阳|德阳|自贡|攀枝花|广元|内江|乐山|南充|宜宾|广安|达川|雅安|眉山|甘孜|凉山|泸州");
		cityArray[23] = new Array("贵州", "贵阳|六盘水|遵义|安顺|铜仁|黔西南|毕节|黔东南|黔南");
		cityArray[24] = new Array("云南",
				"昆明|大理|曲靖|玉溪|昭通|楚雄|红河|文山|思茅|西双版纳|保山|德宏|丽江|怒江|迪庆|临沧");
		cityArray[25] = new Array("西藏自治区", "拉萨|日喀则|山南|林芝|昌都|阿里|那曲");
		cityArray[26] = new Array("陕西", "西安|宝鸡|咸阳|铜川|渭南|延安|榆林|汉中|安康|商洛");
		cityArray[27] = new Array("甘肃",
				"兰州|嘉峪关|金昌|白银|天水|酒泉|张掖|武威|定西|陇南|平凉|庆阳|临夏|甘南");
		cityArray[28] = new Array("宁夏回族自治区", "银川|石嘴山|吴忠|固原");
		cityArray[29] = new Array("青海", "西宁|海东|海南|海北|黄南|玉树|果洛|海西");
		cityArray[30] = new Array("新疆维吾尔族自治区",
				"乌鲁木齐|石河子|克拉玛依|伊犁|巴音郭勒|昌吉|克孜勒苏柯尔克孜|博尔塔拉|吐鲁番|哈密|喀什|和田|阿克苏");
		cityArray[31] = new Array("香港特别行政区", "香港特别行政区");
		cityArray[32] = new Array("澳门特别行政区", "澳门特别行政区");
		cityArray[33] = new Array("台湾",
				"台北|高雄|台中|台南|屏东|南投|云林|新竹|彰化|苗栗|嘉义|花莲|桃园|宜兰|基隆|台东|金门|马祖|澎湖");
		cityArray[34] = new Array("其它", "北美洲|南美洲|亚洲|非洲|欧洲|大洋洲");
		function getCity(currProvince) {
			//当前 所选择 的  
			var currProvincecurrProvince = currProvince;
			var i, j, k;
			//清空 城 下拉选单 
			document.all.selCity.length = 0;
			for (i = 0; i < cityArray.length; i++) {
				//得到 当前 在 城数组中的位置 
				if (cityArray[i][0] == currProvince) {
					//得到 当前 所辖制的 地 
					tmpcityArray = cityArray[i][1].split("|")
					for (j = 0; j < tmpcityArray.length; j++) {
						//填充 城 下拉选单 
						document.all.selCity.options[document.all.selCity.length] = new Option(
								tmpcityArray[j], tmpcityArray[j]);
					}
				}
			}
		}
	</script>


	<script type="text/javascript">
		$(function() {

			var sex = '';
			$("input[name='sex']").each(function(i, obj) {
				//obj是dom对象     不是jquery对象
				//alert(obj+","+i);
				//alert(obj.value+","+sex);
				if ($(obj).val() == sex) {
					// obj.checked=true;
					$(obj).attr("checked", true);
				}
			});

			var address = ''; //""  河南-郑州

			if (null != address && address != "") {
				var arr = address.split("-");

				$("#city").citySelect({
					prov : arr[0], //默认份
					city : arr[1], //默认城
					nodata : "none"
				});
			} else {
				$("#city").citySelect({
					prov : "河南", //默认份
					city : "郑州", //默认城
					nodata : "none"
				});
			}

		});

		function back() {
			location.href = "updateUserShow";
		}
	</script>


</body>
</html>