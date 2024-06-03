<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="mycss/MatchSuccess.css">


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


				<div class="success-content">
					<div class="wrapper-1">
						<div class="wrapper-2">
							<img
								src="https://tulipex.com/wp-content/uploads/2019/06/Tulipex-Logo-Op.png"
								alt="" class="image">
							<h1>配對成功!</h1>
							<i class="fa-brands fa-gratipay fa-2xl" style="color: #e4aac6;"></i>

							<h2>可以開始聊天了</h2>
							<p class="safety-tip">
								交友時要保持警惕，避免輕信陌生人<br>建議在公共場所見面，並告知朋友或家人你的行蹤
							</p>
							<button class="go-home"
								onclick="window.location.href='/newMatchPage'">繼續配對</button>
						</div>

						<div class="footer-like">
							<p>
								Email not received?
								<!--        <a href="#">Click here to send again</a> -->
							</p>
						</div>
					</div>
				</div>


				<script>
					$(document).ready(function() {
						// perform some jQuery when page is loaded

						$("h1").hover(function() {
							// when user is hovering the h1
							$(this).addClass("animated infinite pulse");
							// we add pulse animation and to infinite
						}, function() {
							// when user no longer hover on the h1
							$(this).removeClass("animated infinite pulse");
							// we remove the pulse
						});
					});
				</script>


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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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


</body>

</html>