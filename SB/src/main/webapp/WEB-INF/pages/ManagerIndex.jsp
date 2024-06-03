<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.user.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Social Book</title>
<link rel="stylesheet" href="mycss/index.css">

<style>

h1{
	color: white;
	font-weight: bold;
	text-shadow: 5px 5px 20px white;
}

.data{
	color: white;
	font-weight: bold;
	text-shadow: 3px 3px 15px white;
}

h4{
    font-size: 50px;
}

h4,h5{
    color: white;
    text-align: center;
    
    font-weight: bold;
    font-family: Monospace;
    margin: 0;
    text-shadow: 3px 3px 15px white;
}

.inCircle {
	position: relative;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.circle {
	
	transform: translate(200%, 30%);
	width: 300px;
	height: 300px;
	border: 5px solid white;
	border-radius: 50%;
	box-shadow: 3px 3px 15px white;
	
	transition: background-color 1s;
}
</style>
</head>

<body>

	<div class="all">
		<header>
			<div class="heading">
				<figure>
					<img src="images/IMG_0279.jpg" alt="不讓你看">
				</figure>
				<div class="title">
					<h1>Social Book</h1>
				</div>
			</div>

			<nav>
				<ul class="menu">
					<li><a href="users">個人</a></li>
					<li><a href="forum.homepage">貼文</a></li>
					<li><a href="goalsHP">交友</a></li>
					<li><a href="activityHomepage">活動</a></li>
					<li><a href="callback">拍賣</a></li>
					<li><a href="groups.controller">團購</a></li>
					<li><a href="user.login">登出</a></li>
				</ul>
			</nav>

			<%
			UserBean user = (UserBean) request.getSession().getAttribute("userData");
			%>
			<%
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
			%>
			
			<br><br><br>
			<div class="data">
				
				<h2>
					歡迎，<%=user.getUserChineseName()%>！
				</h2>
				<p>
					最後登入時間：<%=df.format(user.getLastLoginDatetime())%></p>
			</div>
			<div class="circle">
				<div class="inCircle">
					<h4 id="time">00:00:00</h1>
					<h5 id="date">Jan 01, 2000</h2>
				</div>
			</div>
		</header>
	</div>


	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		setInterval(getTime, 1000);

		function getTime() {
			var d = new Date();
			var arr = d.toString().split(" ");

			// console.log(arr);

			$("#time").text(arr[4]);

			$("#date").text(arr[1] + " " + arr[2] + ", " + arr[3])

			if (d.getSeconds() % 2 == 1) {
				//var r = Math.floor(Math.random() * 255);
				//var g = Math.floor(Math.random() * 255);
				//var b = Math.floor(Math.random() * 255);

				color = "rgb(" + 0 + "," + 0 + "," + 0 + ")";

				$(".circle").css("background-color", color);
			}
			if (d.getSeconds() % 2 == 0) {
				//var r = Math.floor(Math.random() * 255);
				//var g = Math.floor(Math.random() * 255);
				//var b = Math.floor(Math.random() * 255);

				color = "rgb(" + 80 + "," + 80 + "," + 80 + ")";

				$(".circle").css("background-color", color);
			}

		}
	</script>
</body>

</html>