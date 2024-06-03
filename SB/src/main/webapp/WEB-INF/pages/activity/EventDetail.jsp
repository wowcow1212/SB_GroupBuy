<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.activity.bean.EventBean" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>活動詳情</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .content-table {
            margin: 50px auto;
            border-collapse: collapse;
            font-size: 18px;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        .content-table th,
        .content-table td {
            padding: 12px 15px;
            text-align: center;
        }

        .content-table th {
            background-color: #009879;
            color: #ffffff;
        }

        .content-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .content-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .content-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        .content-table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .details-button, .register-button {
            display: block;
            padding: 10px;
            margin: 20px auto;
            border: none;
            border-radius: 3px;
            background-color: #3b76e1;
            color: #fff;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            width: 200px;
        }

        .details-button:hover, .register-button:hover {
            background-color: #555;
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
                    <h1>活動詳情</h1>
                </div>

                <div id="main-content" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                    <%
                        EventBean event = (EventBean) request.getAttribute("event");
                        if (event != null) {
                    %>
                    <div>
                        <img src="<%= request.getContextPath() %>/localimages/<%= event.getImagePath() %>" alt="Event Image" style="max-width: 100%; height: auto; display: block; margin: 20px auto;">
                        <table class="content-table">
                            <tbody>
                                <tr>
                                    <th>活動標題</th>
                                    <td><%= event.getTitle() %></td>
                                </tr>
                                <tr>
                                    <th>活動描述</th>
                                    <td><%= event.getDescription() %></td>
                                </tr>
                                <tr>
                                    <th>活動時間</th>
                                    <td><%= event.getActivityTime().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></td>
                                </tr>
                                <tr>
                                    <th>報名開始時間</th>
                                    <td><%= event.getSignupStartTime().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></td>
                                </tr>
                                <tr>
                                    <th>報名結束時間</th>
                                    <td><%= event.getSignupEndTime().format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) %></td>
                                </tr>
                                <tr>
                                    <th>活動地點</th>
                                    <td>
                                        <%= event.getLocation() %><br>
                                        <a href="https://www.google.com/maps/search/?api=1&query=<%= java.net.URLEncoder.encode(event.getLocation(), "UTF-8") %>" target="_blank">查看地圖</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>活動狀態</th>
                                    <td><%= event.getStatus() %></td>
                                </tr>
                            </tbody>
                        </table>
                        <a class="register-button" href="activityInsertRegistrations?eventNo=<%= event.getEventNo() %>&userNo=<%= event.getHostUserNo() %>">我要報名</a>
                        <a class="details-button" href="/activityList">返回活動列表</a>
                    </div>
                    <%
                        } else {
                    %>
                    <p style="text-align:center;">抱歉，無法載入活動詳情。</p>
                    <a class="details-button" href="/activityList">返回活動列表</a>
                    <%
                        }
                    %>
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
