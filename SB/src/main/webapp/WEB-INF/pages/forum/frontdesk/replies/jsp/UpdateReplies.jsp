<%@ page import="com.forum.bean.RepliesBean" %>
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

	<title>編輯回覆:${updateSelect.postsBean.title}</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- SweetAlert2 CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    
<style>

.input-group.position-relative {
	display: none;
}

.replies-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 40px;
    width: 800px;
    margin-left: auto;
    margin-right: auto;
    color: black !important;
    height: 500px;
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
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
				
				<div class="replies-container">
					<div class="forum-form-container">
				
				<form  id="repliesUpdate" method="post" action="/repliesFrontDesk/UpdateReplies" onsubmit="return confirmPublish()">
					
					<input type="hidden" name="_method" value="PUT">
				    
				   	<input type="hidden" name="reply_no" value="${updateSelect.reply_no}"/>
				   	
				   	<input type="hidden" name="post_no" value="${updateSelect.postsBean.post_no}"/>
				    
				    <input type="hidden" name="user_no" value="${updateSelect.userBean.userNo}"/>
				    
				    <label for="content">內文 :</label>
					<textarea name="content" required style="width: 100%; height: 300px; resize: none;">${updateSelect.content}</textarea><br>
				
				    <label for="update_date">日期 :</label>
				    <input type="text" name="update_date" value="${updateSelect.update_date}" readonly/>
				    
				<div class="form-group">
					<button type="submit" class="btn btn-primary">修改</button>
					<button type="button" class="btn btn-secondary" onclick="goBack()">返回</button>
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
    
    <!-- SweetAlert2 js -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

	<script>
	
	//sweetalert
	async function confirmPublish(event) { 
          event.preventDefault();
          const result = await Swal.fire({
              title: '確定要修改這筆回覆嗎？',
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
	
	document.getElementById('repliesUpdate').addEventListener('submit', confirmPublish);

		function goBack() {
			window.history.back();
		}
		
	</script>


</body>

</html>