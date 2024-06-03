<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

	<style>
	.team-bg {
	background-color: #eee;
	overflow: hidden;
}

.team .section-title {
	padding-bottom: 40px;
}

.team .section-title .main-team-subheading {
	font-size: 17px;
	font-weight: 500;
	padding: 0;
	line-height: 1px;
	margin: 0 0 5px 0;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #aaaaaa;
}

.team .section-title .main-team-subheading::after {
	content: "";
	width: 120px;
	height: 1px;
	display: inline-block;
	background: #556270;
	margin: 4px 10px;
}

.team .main-team-heading {
	margin: 0;
	font-size: 36px;
	font-weight: 700;
	text-transform: uppercase;
	color: #556270;
}

.team .member {
	position: relative;
	box-shadow: 0px 2px 15px rgba(85, 98, 112, 0.08);
	padding: 30px;
	border-radius: 4px;
	background: #fff;
}

.team .member .pic {
	overflow: hidden;
	width: 180px;
	border-radius: 4px;
	margin-top: 28px;
	position: relative; /* 添加這行 */
}

.team .member .pic img {
	transition: ease-in-out 0.3s;
}

.team .member:hover img {
	transform: scale(1.1);
}

.team .member .member-info {
	padding-left: 30px;
}

.team .member .member-heading {
	font-weight: 700;
	margin-bottom: 5px;
	font-size: 26px;
	color: #556270;
	line-height: 1.2;
}

.team .member span {
	display: block;
	font-size: 16px;
	padding-bottom: 10px;
	position: relative;
	font-weight: 500;
}

.team .member span::after {
	content: '';
	position: absolute;
	display: block;
	width: 50px;
	height: 1px;
	background: #dee2e6;
	bottom: 0;
	left: 0;
}

.team .member .member-para {
	margin: 10px 0 0 0;
	font-size: 16px;
}

.team .member .social {
	margin-top: 12px;
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.team .member .social a {
	transition: ease-in-out 0.3s;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 4px;
	width: 32px;
	height: 32px;
	background: #8795a4;
}

.team .member .social a+a {
	margin-left: 8px;
}

.team .member .social a:hover {
	background: #41A1FD;
}

.team .member .social a .team-icon {
	color: #fff;
	font-size: 16px;
	margin: 0 2px;
}

.custom-margin {
    margin-top: 80px;
    margin-bottom: 100px;
}
	
.button-group {
    position: relative;
    top: 60px; /* 調整這個值來改變按鈕組的上下位置 */
}


	</style>

	
	
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!--        <script src="js/test/Z_slider.js"></script>-->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
                
                
                	<section id="team" class="team team-bg py-5">
		<div class="container">

			<div class="section-title">
				<p class="main-team-subheading">配對成功</p>
				<p class="main-team-heading">好友</p>
			</div>

			<div class="row">

			<c:forEach var="matchData" items="${matchedUsersData}">
						  <div class="col-lg-6 mt-4 mt-lg-0">
							<div class="member d-flex align-items-start">
								<div class="pic">
								  <a href="/chatPage"><img src="" class="img-fluid randomImgs" alt=""></a></div>
							  	  <div class="member-info">
									<p class="member-heading">${matchData.nickName}</p>
								
				                <span>尋找關係&nbsp;
				                    <c:choose>
				                        <c:when test="${matchData.goalNo == 1}">不回答</c:when>
				                        <c:when test="${matchData.goalNo == 2}">網友</c:when>
				                        <c:when test="${matchData.goalNo == 3}">飯友</c:when>
				                        <c:when test="${matchData.goalNo == 4}">酒友</c:when>
				                        <c:when test="${matchData.goalNo == 5}">牌友</c:when>
				                        <c:when test="${matchData.goalNo == 6}">山友</c:when>
				                        <c:when test="${matchData.goalNo == 7}">旅伴</c:when>
				                        <c:when test="${matchData.goalNo == 8}">戀愛伴侶</c:when>
				                        <c:when test="${matchData.goalNo == 9}">結婚對象</c:when>
				                        <c:when test="${matchData.goalNo == 10}">朋友關係</c:when>
				                        <c:when test="${matchData.goalNo == 11}">短暫浪漫</c:when>
				                        <c:when test="${matchData.goalNo == 12}">匿名網友</c:when>
				                        <c:when test="${matchData.goalNo == 13}">一起運動</c:when>
				                        <c:when test="${matchData.goalNo == 14}">一起團購</c:when>
				                        <c:when test="${matchData.goalNo == 15}">外送拼單</c:when>
				                        <c:when test="${matchData.goalNo == 16}">不設限</c:when>
				                        <c:otherwise>未知</c:otherwise>
				                    </c:choose>
				                </span>
				                <p class="member-para">
				                    性別&nbsp;&nbsp; <c:choose>
				                        <c:when test="${matchData.gender == 1}">男</c:when>
				                        <c:when test="${matchData.gender == 0}">女</c:when>
				                        <c:otherwise>未知</c:otherwise>
				                    </c:choose>
				                </p>
				                
								<p class="member-para">血型&nbsp;&nbsp; ${matchData.bloodType}</p>
								<p class="member-para">MBTI&nbsp; ${matchData.MBTI}</p>
								<p class="member-para">生日&nbsp; ${localDateTimeDateFormat.format(matchData.birthday)}</p>								
								
								<div class="social">
								  <a href=""><i class="fab fa-twitter team-icon"></i></a>
								  <a href=""><i class="fab fa-facebook-f team-icon"></i></a>
								  <a href=""><i class="fab fa-instagram team-icon"></i></a>
								  <a href=""> <i class="fab fa-linkedin-in team-icon"></i> </a>
								</div>
							  </div>
							</div>
						  </div>
				</c:forEach>

			</div>
			
			
<div class="container text-center">
    <div class="button-group d-flex justify-content-center custom-margin">
        <button type="button" class="btn btn-primary mx-2" onclick="window.location.href='/chatPage'">開始聊天</button>
        <button type="button" class="btn btn-danger mx-2" onclick="window.location.href='/newMatchPage'">繼續配對</button>
    </div>
</div>
			
		</div>
	</section>
	

                  

                <!-- 主要內容結尾 -->

            </div>
            <!-- End of Main Content -->

            <!-- footer -->
            <script src="js/layout/Z_footer.js"></script>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <script src="js/layout/Z_Logout Modal.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

	<script>
		window.onload = function(){
			var allRandomImgs = document.querySelectorAll(".randomImgs");
			allRandomImgs = [...allRandomImgs];
			console.log("allRandomImgs :　" + allRandomImgs);

			for(var i = 0; i < allRandomImgs.length; i++)
			{
				allRandomImgs[i].src = randomImgPath();
			}
		}

		function randomImgPath(){
			var imgPaths = ["/localimages/randomImg01.jpg", "/localimages/random1.jpeg", "/localimages/random2.jpeg","/localimages/random3.png","/localimages/random4.jpg","/localimages/random5.png","/localimages/random6.jpg","/localimages/random7.png","/localimages/random8.png","/localimages/random9.jpg","/localimages/random10.jpg"]
			var r = Math.floor(Math.random() * imgPaths.length);
			var randomPath = imgPaths[r];
			return randomPath;
		}
	</script>
</body>

</html>