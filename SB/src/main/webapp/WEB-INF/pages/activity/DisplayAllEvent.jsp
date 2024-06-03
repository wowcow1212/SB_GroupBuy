<%@page import="com.activity.bean.EventBean"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"); %>
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
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">

    <style>
        .btn-circle {
            width: 40px;
            height: 40px;
            padding: 0;
            border-radius: 50%;
            text-align: center;
            font-size: 18px;
            line-height: 1.5;
        }
        .btn-info { background-color: #36b9cc; }
        .btn-danger { background-color: #e74a3b; }

        .header {
            text-align: center;
            margin: 40px 0;
            font-family: 'Nunito', sans-serif;
        }

        .header h2 {
            font-size: 3rem;
            font-weight: 700;
            color: #4e73df;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            letter-spacing: 0.1em;
        }

        table.dataTable {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        table.dataTable th,
        table.dataTable td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table.dataTable th {
            background-color: #4e73df;
            color: white;
            font-weight: 700;
        }

        table.dataTable tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table.dataTable tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
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
                <script src="/js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->
                <div class="header">
                    <h2>活動詳情</h2>
                </div>
                <div align="center">
                    <% 
                        List<EventBean> events = (List<EventBean>) request.getAttribute("events");
                        if (events != null && !events.isEmpty()) {
                    %>
                        <table id="eventsTable" class="display" style="width:100%">
                            <thead>
                                <tr>
                                    <th>活動<br>編號</th>
                                    <th>發起人</th>
                                    <th>標題</th>
                                    <th>描述</th>
                                    <th>活動時間</th>
                                    <th>報名開始時間</th>
                                    <th>報名結束時間</th>
                                    <th>活動地點</th>
                                    <th>活動狀態</th>
                                    <th>活動圖片</th>
                                    <th>修改</th>
                                    <th>刪除</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (EventBean event : events) { %>
                                    <tr>
                                        <td><%= event.getEventNo() %></td>
                                        <td><%= event.getHostUserNo() %></td>
                                        <td><%= event.getTitle() %></td>
                                        <td><%= event.getDescription() %></td>
                                        <td><%= event.getActivityTime().format(dtf) %></td>
                                        <td><%= event.getSignupStartTime().format(dtf) %></td>
                                        <td><%= event.getSignupEndTime().format(dtf) %></td>
                                        <td><%= event.getLocation() %></td>
                                        <td><%= event.getStatus() %></td>
                                        <td><img style="width: 100px;" src="/localimages/<%= event.getImagePath() %>" alt="活動圖片"></td>
                                        <td>
                                            <div class="button-group">
                                                <a href="getEventDataForUpdate?eventNo=<%= event.getEventNo() %>" class="btn btn-info btn-circle">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="button-group">
                                                <form method="post" action="/DeleteEvent">
                                                    <input type="hidden" name="_method" value="delete">
                                                    <input type="hidden" name="eventNo" value="<%= event.getEventNo() %>">
                                                    <button type="submit" class="btn btn-danger btn-circle">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    <% } else { %>
                        <h3>目前沒有可顯示的活動。</h3>
                    <% } %>
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

    <!-- DataTables JavaScript -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#eventsTable').DataTable();
        });
    </script>

</body>

</html>
