<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
    <%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); %>
    <jsp:useBean id="event" scope="request" class="com.activity.bean.EventBean"/>
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
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <script src="js/layout/Z_slider.js"></script>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
					<div align="center">
  <h2>更改活動內容</h2>
	<form method="post" action="UpdateEvent"  enctype="multipart/form-data">
	<input type="hidden" name="_method" value="put">
		<label for="eventNo">活動編號:</label><br>
        <input type="text" id="eventNo" name="eventNo" value="${event.eventNo}" readonly ><br>
        <label for="hostUserNo">發起人:</label><br>
        <input type="text" id="hostUserNo" name="hostUserNo" value="${event.hostUserNo}" ><br>
		
		<label for="title">標題:</label><br>
        <input type="text" id="title" name="title" value="${event.title}" ><br>
        <label for="description">描述:</label><br>
        <textarea id="description" name="description">${event.description}</textarea><br>
        <label for="activityTime">活動時間:</label><br>
        <input type="datetime-local" id="activityTime" name="activityTime" value="<%= dtf.format(event.getActivityTime())%>"><br>
        <label for="signupStartTime">報名開始時間:</label><br>
        <input type="datetime-local" id="signupStartTime" name="signupStartTime" value="<%= dtf.format(event.getSignupStartTime())%>"><br>
        <label for="signupEndTime">報名結束時間 :</label><br>
        <input type="datetime-local" id="signupEndTime" name="signupEndTime" value="<%= dtf.format(event.getSignupEndTime())%>"><br>
        <label for="location">地點:</label><br>
        <input type="text" id="location" name="location" value="${event.location}"><br>
        <label for="status">狀態:</label><br>
        <input type="text" id="status" name="status" value="${event.status}"><br>
        
        <!-- 顯示當前圖片 -->
        <% if (event.getImagePath() != null) { %>
            <label for="currentImage">目前圖片:</label><br>
            <img src="/localimages/<%= event.getImagePath() %>" alt="活動圖片" style="max-width: 100%;"><br>
            <input type="hidden" name="currentImagePath" value="<%= event.getImagePath() %>"><br>
        <% } %>

        <!-- 選擇重新上傳圖片 -->
        <label for="imagepath">更換圖片:</label><br>
        <input type="file" name="imagePath" id="imagepath"><br>
        <button type="submit" class="btn btn-success btn-icon-split">
				            <span class="icon text-white-50">
				                <i class="fas fa-check"></i>
				            </span>
				            <span class="text">確定</span>
				        </button>
	</form>
	</div>
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


</body>

</html>