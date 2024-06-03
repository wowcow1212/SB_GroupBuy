<%@ page import="com.forum.bean.PostsBean" %>
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

    <title>文章管理</title>

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

	/* 調整圖片的寬度和高度 */
	img {
	width: 100px; /* 設置圖片的寬度為 */
	height: 100px; /* 設置圖片的高度為 */
	}

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
               
               <!--  
				    <form method="get" action="/posts/OnePosts">
				        查詢: <input type="text" name="postsBeanKeyword" required>
				        <button type="submit">送出</button>
				    </form>   
				-->
				
				 <!-- 
				    <form method="get" action="/posts/AllPosts">
				        <button type="submit">查詢全部</button>
				    </form>
				-->
               
               	<div class="title-and-button">
               		<h1>文章</h1> 
				     <form method="get" action="/CategoriesController/CategoriesAll">
				        <button type="submit" class="btn-green">返回</button>
				    </form>
				</div>
				    
				    <div class="table-container">
				    <table id="postsTable">
				        <thead>
				            <tr>
				                <th>分類</th>
				                <th>文章標題</th>
				                <th>文章內容</th>
				                <th>圖片</th>
				                <th>日期</th>
				                <th>會員名稱</th>
				                <th>會員信箱</th>
				                <th>瀏覽次數</th>
				                <th>回覆</th>
				                <th>檢舉紀錄</th>
				                <th>喜歡紀錄</th>
				            </tr>
				        </thead>
				        
				        <tbody>
				            <c:if test="${not empty postsM}">
				                <c:forEach var="posts" items="${postsM}">
				                    <tr>
				                        <td><c:out value="${categories.title_name}" /></td>
				                        <td><c:out value="${posts.title}" /></td>
				                        <td class="content" data-toggle="modal" data-target="#contentModal" onclick="showcontent(this)">${posts.content}</td>
				                        <td class="image-cell" data-image-url="${posts.image_url}"></td>
				                        <td><c:out value="${posts.update_date}" /></td>
				                        <td><c:out value="${posts.userBean.userChineseName}" /></td>
				                        <td><c:out value="${posts.userBean.email}" /></td>
				                        <td><c:out value="${posts.view_count}" /></td>
				                        
				                     <td>
										<form method="get" action="/replies/PostsReplies">
										<input type="hidden" name="postsNo" value="${posts.post_no}">
										<button type="submit" class="btn-blue">回覆</button>
										</form>
									</td>
									
									 <td>
										<form method="get" action="/reports/PostsReports">
										<input type="hidden" name="postsNo" value="${posts.post_no}">
										<button type="submit" class="btn-red">檢舉</button>
										</form>
									</td>
				
										<td>
											<form method="get" action="/likes/PostsLikes">
												<input type="hidden" name="postsNo" value="${posts.post_no}">
												<button type="submit" class="btn-yellow">喜歡</button>
											</form>
										</td>
										
									</tr>
				                </c:forEach>
				            </c:if>
				            <c:if test="${empty postsM}">
				                <tr>
				                    <td colspan="11">尚無資料</td>
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
	        $('#postsTable').DataTable(); // 初始化 DataTables
	    });
	</script>
	
	<script>
	<!-- 文章內容模態框 -->
	function showcontent(e) {
    let content = e.innerHTML
    let body = document.querySelector(".modal-body")
    body.innerHTML = content;
	}
	<!-- 圖片顯示框 -->
	document.addEventListener("DOMContentLoaded", function() {
	    var imageCells = document.querySelectorAll(".image-cell");
	    imageCells.forEach(function(cell) {
	        var imageUrl = cell.getAttribute("data-image-url");
	        if (imageUrl) {
	            var link = document.createElement('a');
	            link.href = 'javascript:void(0);'; // 防止页面跳转
	            link.addEventListener('click', function() {
	                var popup = window.open('', 'popup', 'width=400,height=400');
	                popup.document.body.innerHTML = '<img src="http://localhost:8080/localimages/' + imageUrl + '" style="max-width:100%; max-height:100%;">';
	            });
	            link.textContent = "查看圖片";
	            cell.appendChild(link); // 添加超链接到单元格
	        } else {
	            cell.textContent = "無圖片";
	        }
	    });
	});
	</script>


</body>

</html>