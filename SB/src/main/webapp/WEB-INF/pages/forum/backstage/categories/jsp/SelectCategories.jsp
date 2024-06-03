<%@ page import="com.forum.bean.CategoriesBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>分類版管理</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css"
	    href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
	    
	<link rel="stylesheet" type="text/css" href="/mycss/forumBackstage.css">
	
	<style>
	/* 調整按鈕位置 */
	.homepage-buttons {
    float: left; /* 讓首頁按鈕浮動到左側 */
    margin-left: 96px; /* 設置右邊距離 */
	}
	
	/* 調整按鈕位置 */
	.insert-buttons {
    float: right; /* 讓新增按鈕浮動到右側 */
    margin-right: 96px; /* 設置左邊距離 */
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
               
				<h1>分類版</h1>
				
				<!--
				<br>
				<form method="get" action="/CategoriesController/OneCategories">
				    查詢: <input type="text" name="categoryKeyword" required>
				    <button type="submit">送出</button>
				</form>
				-->
				<!--
				<form method="get" action="/CategoriesController/CategoriesAll">
				    <button type="submit">查詢全部</button>
				</form>
				-->
				
				<div class="homepage-buttons">
				<form method="get" action="/forumManager.homepage">
				    <button type="submit" class="btn-red">首頁</button>
				</form>
				</div>
				
				<div class="insert-buttons">
				<form method="get" action="/forum.InsertCategories">
				    <button type="submit" class="btn-green">新增</button>
				</form>
				</div>
				
				<div class="table-container">
				<table id="categoriesTable">
				    <thead>
				    <tr>
				        <th>分類</th>
				        <th>刪除</th>
				        <th>文章</th>
				    </tr>
				    </thead>
				
				    <tbody>
				    <c:if test="${not empty CategoriesM}">
				        <c:forEach var="category" items="${CategoriesM}">
				            <tr>
				                <td><c:out value="${category.title_name}"/></td>
				
				                <td>
				    				<form method="post" action="/CategoriesController/DeleteCategories" onsubmit="return confirm('確定要刪除嗎？');">
				        				<input type="hidden" name="categoryNo" value="${category.category_no}">
				        				<input type="hidden" name="_method" value="delete">
				        			<button type="submit" class="btn-blue">刪除</button>
				    			</form>
								</td>
								<td>
									<form method="get" action="/posts/CategoriesPosts">
										<input type="hidden" name="categoryNo" value="${category.category_no}">
										<button type="submit" class="btn-yellow">文章</button>
									</form>
								</td>
									</tr>
				        </c:forEach>
				
				    </c:if>
				    <c:if test="${noData}">
				        <tr>
				            <td colspan="3">尚無資料</td>
				        </tr>
				    </c:if>
				    </tbody>
				</table>
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
    
    <!-- 引入 jQuery -->
	<script type="text/javascript" charset="utf8"
	    src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<!-- 引入 DataTables JS -->
	<script type="text/javascript" charset="utf8"
	    src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
	
	<!-- DataTables initialization -->
	<script>
		$(document).ready(function() {
			$('#categoriesTable').DataTable(); // 初始化 DataTables
		});
	</script>


</body>

</html>