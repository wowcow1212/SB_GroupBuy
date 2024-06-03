<%@ page import="com.forum.bean.LikesBean" %>
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

    <title>喜歡管理</title>

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
				<h1>喜歡紀錄</h1>
					<form method="get" action="/posts/CategoriesPosts">
						<input type="hidden" name="categoryNo"
							value="${post.categoriesBean.category_no}">
						<button type="submit" class="btn-green">返回</button>
					</form>
				</div>
				
				<div class="table-container">
					<table id="likesTable">
				        <thead>
				            <tr>
				                <th>文章標題</th>
				                <th>文章內容</th>
				                <th>案讚會員</th>
				                <th>會員信箱</th>
				            </tr>
				        </thead>
				
				        <tbody>
				            <c:if test="${not empty PostsLikesListM}">
				                <c:forEach var="postsLikes" items="${PostsLikesListM}">
				                    <tr>
				                        <td><c:out value="${post.title}" /></td>
				                        <td class="content" data-toggle="modal" data-target="#contentModal" onclick="showcontent(this)">${post.content}</td>
				                        <td><c:out value="${postsLikes.userBean.userChineseName}" /></td>
				                        <td><c:out value="${postsLikes.userBean.email}" /></td>
				                    </tr>
				                </c:forEach>
				            </c:if>
				            <c:if test="${empty PostsLikesListM}">
				                <tr>
				                    <td colspan="4">尚無資料</td>
				                </tr>
				            </c:if>
				        </tbody>
				    </table>
				    <!-- 文章內容模態框 -->
				     <div class="modal fade" id="contentModal" tabindex="-1"
                            aria-labelledby="contentModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="contentModalLabel">文章內容</h5>
                                        <button type="button" class="btn-close" data-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 顯示完整內容 -->
                                    </div>
                                </div>
                            </div>
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
	        $('#likesTable').DataTable(); // 初始化 DataTables
	    });
	</script>
	
	<script>
	function showcontent(e) {
    let content = e.innerHTML
    let body = document.querySelector(".modal-body")
    body.innerHTML = content;
	}
	</script>

</body>

</html>