<%@ page import="com.forum.bean.PostsBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <title>首頁</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

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
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->

				<div class="categories-container">
						<div class="category-header">
							<input type="text" id="searchInput" onkeyup="filterCategories()" placeholder="搜尋分類...">
							<div class="category-title">分類</div>
						</div>
						<c:forEach var="category" items="${categoriesM}">
							<div class="category">
								<a href="/postsFrontDesk/CategoriesPosts?categoryNo=${category.category_no}">
									<c:out value="${category.title_name}" />
								</a>
							</div>
						</c:forEach>
					</div>
				
					<div class="forum-container">
						<form class="search-form" method="get" action="/postsFrontDesk/OnePosts">
							查詢: <input type="text" name="postsBeanKeyword" required>
							<button type="submit">送出</button>
						</form>
				
						<form method="get" action="/postsFrontDesk/AllPosts">
							<button type="submit">全部文章</button>
						</form>
						
						<form method="get" action="/postsFrontDesk/InsertPostsCategories">
							<button type="submit">發文</button>
						</form>
				
						<div class="forum-posts">
							<c:if test="${not empty postsM}">
								<c:forEach var="post" items="${postsM}">
									<div class="post">
										<div class="post-date-container">
											<div class="post-date">${post.categoriesBean.title_name}</div>
											<div class="post-date">${post.update_date}</div>
										</div>
										<img  class="avatar" src="http://localhost:8080/localimages/${post.userBean.avatar} "alt="" style="width:300px">
										<a href="/postsFrontDesk/SelectPosts?postsNo=${post.post_no}" class="post-title" >${post.title}</a>
										<div class="post-content">${post.content}</div>
										<div class="post-image">
										<img src="http://localhost:8080/localimages/${post.image_url}">
										</div>
										<div class="post-footer">
											<div class="post-likes">${post.likesBean.size()}likes</div>
											<div class="post-replies">${post.repliesBean.size()} replies</div>
											<div class="post-views">${post.view_count}views</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty postsM}">
								<div class="post">
									<div class="post-content">尚無資料</div>
								</div>
							</c:if>
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
	
	<script>
		function filterCategories() {
		    var input, filter, categories, category, txtValue;
		    input = document.getElementById('searchInput');
		    filter = input.value.toUpperCase();
		    categories = document.getElementsByClassName('category');
		    for (var i = 0; i < categories.length; i++) {
		        category = categories[i].getElementsByTagName('a')[0];
		        txtValue = category.textContent || category.innerText;
		        if (txtValue.toUpperCase().indexOf(filter) > -1) {
		            categories[i].style.display = '';
		        } else {
		            categories[i].style.display = 'none';
		        }
		    }
		}
		</script>


</body>

</html>