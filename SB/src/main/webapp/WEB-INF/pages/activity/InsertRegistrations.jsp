<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>活動報名</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .center-table {
            margin: auto;
            width: 50%;
            padding: 10px;
        }

        .center-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .center-table th, .center-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .center-table th {
            background-color: #f2f2f2;
            text-align: center;
        }

        .btn-custom {
            background-color: #4e73df;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-custom:hover {
            background-color: #2e59d9;
            color: white;
        }

        .header {
            text-align: center;
            margin: 40px 0;
            font-family: 'Nunito', sans-serif;
        }

        .header h1 {
            font-size: 3rem;
            font-weight: 700;
            color: #4e73df;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .header p {
            font-size: 1.2rem;
            font-weight: 300;
            color: #858796;
        }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
                <div class="header">
                    <h1>活動報名</h1>
                </div>

                <c:if test="${not empty errorMessage}">
                    <p style="color:red; text-align:center;">${errorMessage}</p>
                </c:if>

                <div class="center-table">
                    <form action="/InsertRegistrations" method="post">
                        <table>
                            <tr>
                                <th colspan="2">報名表單</th>
                            </tr>
                            <tr>
                                <td>活動編號:</td>
                                <td><input type="text" name="eventNo" value="${event.eventNo}" required></td>
                            </tr>
                            <tr>
                                <td>會員編號:</td>
                                <td><input type="text" name="userNo" value="${hostUserNo}" required></td>
                            </tr>
                            <tr>
                                <td>參加者姓名:</td>
                                <td><input type="text" name="participantName" required></td>
                            </tr>
                            <tr>
                                <td>聯絡電話:</td>
                                <td><input type="text" name="contactInfo" required></td>
                            </tr>
                            <tr>
                                <td>註冊時間:</td>
                                <td> <input type="text" name="registrationTime" value="${LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)}"></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center">
                                   
                                    <button type="submit" class="btn-custom">提交報名</button>
                                    <button type="button" class="btn-custom" id="oneToInput">一鍵輸入</button>
                                </td>
                            </tr>
                        </table>
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

    <script>
        document.getElementById('oneToInput').addEventListener('click', function () {
            document.getElementsByName('participantName')[0].value = "黃哥";
            document.getElementsByName('contactInfo')[0].value = "0987654321";
        });
    </script>
</body>

</html>
