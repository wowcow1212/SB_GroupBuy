<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>新增文章</title>

<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<!-- SweetAlert CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<style>
.input-group.position-relative {
	display: none;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 40px;
	color: black !important;
}

.forum-form-container {
	display: flex;
	flex-direction: column;
}

.onekey {
	background-color: #e74c3c;
	color: white;
	border: none;
	padding: .375rem .75rem;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.onekey:hover {
	background-color: #c0392b;
}

.onekey:active {
	background-color: #a93226;
}

.onekey:focus {
	outline: none;
	box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.4);
}
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!--<script src="js/test/Z_slider.js"></script>-->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<script src="/js/layout/Z_TopBar.js"></script>

				<!-- 主要內容 -->
				<div class="container">
					<div class="forum-form-container">
						<form id ="forumInsert" method="post" action="/postsFrontDesk/InsertPosts" enctype="multipart/form-data" onsubmit="return confirmPublish()">
							
						<div class="form-group"> <label for="category_no">分類 :</label> 
							<select id="category_no" name="category_no" class="form-control">
									<c:forEach var="category" items="${categoriesList}">
										<option value="${category.category_no}" ${category.category_no == updateSelect.categoriesBean.category_no ? 'selected' : ''}>${category.title_name}</option>
									</c:forEach>
							</select>
						</div>
							
							<div class="form-group">
								<label for="title">新增文章標題 :</label> <input type="text" id="title" name="title" class="form-control" maxlength="100" required>
							</div>
							
							<div class="form-group">
								<label for="content">新增文章內容 :</label> <textarea id="content" name="content" class="form-control" rows="15"required ></textarea>
							</div>
							
							<div class="form-group">
								<label for="image_url">新增圖片：</label> <input type="file" id="image_url" name="image_url" class="form-control-file" maxlength="255" >
							</div>

							<div class="button-primary-secondary">
								<button type="submit" class="btn btn-primary">發佈</button>
								<button type="button" class="btn btn-secondary" onclick="goBack()">返回</button>
								<button type="button" class="onekey" onclick="fillForm()">一鍵輸入</button>
							</div>
						
						</form>
					</div>
				</div>

				<!-- 主要內容結尾 -->

			</div>
			<!-- End of Main Content -->

			<!-- footer -->
			<script src="/js/layout/Z_footer.js"></script>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<script src="/js/layout/Z_Logout Modal.js"></script>

	<!-- Bootstrap core JavaScript-->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/js/demo/chart-area-demo.js"></script>
	<script src="/js/demo/chart-pie-demo.js"></script>
	
	<!-- 引入 SweetAlert2 JavaScript 腳本 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
	
	//sweetalert
	  async function confirmPublish(event) { 
          event.preventDefault();
          const result = await Swal.fire({
              title: '確定要發佈這篇文章嗎？',
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '確定',
              cancelButtonText: '取消'
          });

          if (result.isConfirmed) {
              event.target.submit();
          }
      }

      document.getElementById('forumInsert').addEventListener('submit', confirmPublish); 
        
		function goBack() {
			window.history.back();
		}
		
		function fillForm() {
            document.getElementById("forumInsert").title.value = "今天天氣真棒";
            document.getElementById("forumInsert").content.value = "今天天氣真棒，陽光明媚，微風拂面，讓人感到心情愉悅。早晨醒來，看到窗外的藍天白雲，心情頓時開朗了許多。這樣的好天氣最適合出去走走，我決定到附近的公園散步。走在公園的小徑上，空氣中彌漫著花草的芬芳。樹木郁郁蔥蔥，鳥兒在枝頭歡快地歌唱，孩子們在草地上追逐嬉戲，老人們在樹蔭下悠閒地聊天，一切都顯得那麼和諧美好。我忍不住在長椅上坐下來，閉上眼睛，感受這難得的寧靜與美好。不遠處，有人在放風箏，風箏在空中自由翱翔，彷彿在慶祝這美好的一天。我拿出手機，拍下了這美麗的景象，想把這份愉悅分享給朋友們。這樣的好天氣不僅讓人身心愉悅，更讓人對生活充滿了希望和動力。無論生活中有多少煩惱和壓力，在這樣一個陽光燦爛的日子裡，都能暫時拋諸腦後，盡情享受大自然帶來的美好與寧靜。";
        }
		
	</script>


</body>

</html>