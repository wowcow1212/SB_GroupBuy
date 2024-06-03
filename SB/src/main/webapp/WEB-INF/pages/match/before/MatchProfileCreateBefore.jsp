<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.user.bean.UserBean"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<title>Document</title>

<style>
/*custom font*/
@import url(https://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
	/*Image only BG fallback*/

	/*background = gradient + image pattern combo*/
	/*background: 
                linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6)); 原本的背景色*/
}

body {
	font-family: montserrat, arial, verdana;
	/*新的背景色*/
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/38816/image-from-rawpixel-id-2042508-jpeg.jpg");
	height: 100vh;
	width: 100vw;
	position: relative;
	background-size: cover;
	background-repeat: no-repeat;
	display: grid;
	justify-items: center;
	align-items: center;
}

/*form styles*/
#msform {
	width: 400px; /*調表單的寬度*/
	margin: 50px auto;
	text-align: center;
	/*position: relative;*/
	position: absolute;
	top: 40%;
	left: 50%; /*調表單的位置*/
	transform: translate(calc(-50% + 0px), -50%); /*平移*/
}

#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	/*stacking fieldsets above each other*/
	position: relative;
}

.form-control {
	height: 50px; /*男女框大小*/
}

.icon-button {
	border: none;
	background: none;
	padding: 0;
	cursor: pointer;
	outline: none;
}

.icon-button:focus {
	outline: none;
}

/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
	display: none;
}

/*inputs*/
#msform input, #msform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}

/*buttons*/
#msform .action-button {
	width: 100px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px;
	margin: 10px 5px;
	text-decoration: none;
	font-size: 14px;
	display: inline-block;
	/* Make it inline-block to match behavior of anchor tags */
}

#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

/*headings*/
.fs-title {
	font-size: 23px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}

.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
}

/*progressbar*/
#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	/*CSS counters to number the steps*/
	counter-reset: step;
	list-style-type: none;
}

#progressbar li {
	color: white;
	text-transform: uppercase;
	font-size: 9px;
	width: 33.33%;
	float: left;
	position: relative;
}

#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}

/*progressbar connectors*/
#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1; /*put it behind the numbers*/
}

#progressbar li:first-child:after {
	/*connector not needed before the first step*/
	content: none;
}

/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before, #progressbar li.active:after {
	background: #27AE60;
	color: white;
}
/* Hide all fieldsets except the first one */
fieldset:not(:first-of-type) {
	display: none;
}
</style>
</head>

<body>
	<!-- multistep form -->
	<form id="msform" action="/editMatchProfile" method="post">
		<!-- 表單提交時,請求會被發送到 editMatchProfile 路徑, -->
		<!-- progressbar -->
		<ul id="progressbar">
			<li id="step1Tab" class="active">Account Setup</li>
			<li id="step2Tab">Social Profiles</li>
			<li id="step3Tab">Personal Details</li>
		</ul>
		<!-- fieldsets -->
		<fieldset id="step1">
			<h2 class="fs-title">創建交友資料</h2>
			<h3 class="fs-subtitle">This is step 1</h3>

			<!-- 暱稱 -->
			<div class="form-group">
				<!-- 注意name要跟userbean的屬性一樣 -->
				<input type="text" class="form-control" name="nickName"
					placeholder="暱稱" style="font-size: inherit;">
			</div>

			<!-- 生日 : 動態傳入user設定好的資料 -->
			<div class="form-group">
				<input type="date" class="form-control" name="birthday"
					value="${localDateTimeDateFormat.format(userBean.birthday)}"
					pattern='yyyy-MM-dd' style="font-size: inherit;" />
			</div>

			<!-- 性別 : 動態傳入user設定好的資料 -->
			<div class="form-group">
				<select class="form-control" name="gender" placeholder="性別">
					<!-- <option value="" disabled selected>性別</option> -->
					<option value="1" ${userBean.gender == 1? "selected" : ""}>生理男</option>
					<option value="0" ${userBean.gender == 0? "selected" : ""}>生理女</option>
				</select>
			</div>



			<input type="button" name="next" class="next action-button"
				value="Next" onclick="nextStep()" />
		</fieldset>



		<fieldset id="step2">
			<h2 class="fs-title">個人特徵</h2>
			<h3 class="fs-subtitle">Your presence on the social network</h3>
			<div class="form-group">
				<select class="form-control" name="bloodType" placeholder="血型">
					<option value="" disabled selected>血型</option>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="AB">AB</option>
					<option value="OTHERS">其他</option>
				</select>
			</div>

			<div class="form-group">
				<select class="form-control" name="starSign" placeholder="星座">
					<option value="" disabled selected>星座</option>
					<option value="水瓶座">水瓶座</option>
					<option value="雙魚座">雙魚座</option>
					<option value="牡羊座">牡羊座</option>
					<option value="金牛座">金牛座</option>
					<option value="雙子座">雙子座</option>
					<option value="巨蟹座">巨蟹座</option>
					<option value="獅子座">獅子座</option>
					<option value="處女座">處女座</option>
					<option value="天秤座">天秤座</option>
					<option value="天蠍座">天蠍座</option>
					<option value="射手座">射手座</option>
					<option value="魔羯座">魔羯座</option>
				</select>
			</div>


			<div class="form-group">
				<select class="form-control" name="MBTI" placeholder="MBTI">
					<option value="" disabled selected>MBTI</option>
					<option value="ISTJ">ISTJ</option>
					<!--   在後端的 UserBean 類中,mbti 屬性的類型通常是 String,而不是 Integer -->
					<option value="ISTP">ISTP</option>
					<option value="ISFJ">ISFJ</option>
					<option value="ISFP">ISFP</option>
					<option value="INTJ">INTJ</option>
					<option value="INTP">INTP</option>
					<option value="INFJ">INFJ</option>
					<option value="INFP">INFP</option>
					<option value="ESTJ">ESTJ</option>
					<option value="ESTP">ESTP</option>
					<option value="ESFJ">ESFJ</option>
					<option value="ESFP">ESFP</option>
					<option value="ENTJ">ENTJ</option>
					<option value="ENTP">ENTP</option>
					<option value="ENFJ">ENFJ</option>
					<option value="ENFP">ENFP</option>
				</select>
			</div>


			<!-- 尋找關係 -->
			<div class="form-group">
				<select class="form-control" name="goalNo" placeholder="尋找關係">
					<option value="" disabled selected>尋找關係</option>
					<option value="1">不回答</option>
					<option value="2">網友</option>
					<option value="3">飯友</option>
					<option value="4">酒友</option>
					<option value="5">牌友</option>
					<option value="6">山友</option>
					<option value="7">旅伴</option>
					<option value="8">戀愛伴侶</option>
					<option value="9">結婚對象</option>
					<option value="10">朋友關係</option>
					<option value="11">短暫浪漫</option>
					<option value="12">匿名網友</option>
					<option value="13">一起運動</option>
					<option value="14">一起團購</option>
					<option value="15">外送拼單</option>
					<option value="16">不設限</option>
				</select>
			</div>

			<input type="button" name="previous" class="previous action-button"
				value="Previous" onclick="prevStep()" /> <input type="button"
				name="next" class="next action-button" value="Next"
				onclick="nextStep()" />
		</fieldset>



		<fieldset id="step3">
			<h2 class="fs-title">基本資料填寫完成</h2>
			<h3 class="fs-subtitle">We will never sell it</h3>
			<div class="edit-match">
				<!-- 路徑 -->
				<button type="submit" name="targetPage" value="/editMatchProfile"
					class="icon-button">
					<i class="fa-solid fa-user-pen"
						style="color: #8f8f8f; font-size: 4em; margin-right: 25px; margin-bottom: 66px;"></i>
				</button>
				<!-- 路徑 -->
				<button type="submit" name="targetPage" value="/matchPage"
					class="icon-button">
					<i class="fa-solid fa-heart-circle-xmark"
						style="color: #8f8f8f; font-size: 4em; margin-top: 66px;"></i>
				</button>
			</div>
			<input type="button" name="previous" class="previous action-button"
				value="Previous" onclick="prevStep()" />
		</fieldset>


		<!-- 在這裡添加隱藏的輸入框   表單提交時能夠被正確傳遞到後端-->
		<input type="hidden" name="targetPage" id="targetPage" value="">

	</form>

	<script>
		// 表單內容
		var formSteps = [ "step1", "step2", "step3" ];

		var currentStep = 0; // 初始步驟

		// 下一步
		function nextStep() {
			if (currentStep < formSteps.length - 1) {
				document.getElementById(formSteps[currentStep]).style.display = "none";
				document.getElementById(formSteps[currentStep + 1] + "Tab").classList
						.add("active");
				document.getElementById(formSteps[currentStep + 1] + "Tab").style.color = "#27AE60";
				document.getElementById(formSteps[currentStep + 1] + "Tab").style.fontWeight = "bold";
				currentStep++;
				document.getElementById(formSteps[currentStep]).style.display = "block";
			}
		}

		// 上一步
		function prevStep() {
			if (currentStep > 0) {
				document.getElementById(formSteps[currentStep]).style.display = "none";
				document.getElementById(formSteps[currentStep] + "Tab").classList
						.remove("active");
				document.getElementById(formSteps[currentStep] + "Tab").style.color = "white";
				document.getElementById(formSteps[currentStep] + "Tab").style.fontWeight = "normal";
				currentStep--;
				document.getElementById(formSteps[currentStep]).style.display = "block";
			}
		}
		
		
		
		

		
	</script>
</body>
</html>
