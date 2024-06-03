<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>新增成功</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
	    
	<link rel="stylesheet" type="text/css" href="/mycss/forumBackstage.css">
	
	<style>
	
	/* 將標題和按鈕包裹在同一個容器中 */
	.title-and-button {
	display: flex; /* 使用 Flexbox 佈局 */
	flex-direction: column; /* 垂直佈局 */
	align-items: center; /* 將內容水平居中對齊 */
	}

	/* 調整標題的底部間距 */
	.title-and-button h1 {
	margin-bottom: 10px; /* 調整標題底部間距 */
	}
	
    /* 按鈕的基本樣式 */
    .title-and-button button[type='submit'] {
     padding: 15px 30px; /* 設置內邊距 */
     background-color: #007bff; /* 背景顏色設置為藍色 */
     color: #fff; /* 文字顏色 */
     border: none; /* 去除邊框 */
     border-radius: 5px; /* 圓角 */
     cursor: pointer; /* 鼠標指針類型 */
     transition: background-color 0.3s; /* 漸變動畫 */
     }

     /* 按鈕的懸停樣式 */
     .title-and-button button[type='submit']:hover {
      background-color: #0056b3; /* 懸停時的背景顏色略微深藍 */
     }
	
	</style>
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <script src="/js/layout/Z_slider.js"></script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
				
				<div class="title-and-button">
				<h1>新增成功</h1>
				   	<form method="get" action="/CategoriesController/CategoriesAll">
				    	<button type="submit">返回分類管理</button>
					</form>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
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
    
</body>

</html>