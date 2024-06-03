<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />

                    <title>結單團購後台</title>

                    <!-- Custom fonts for this template-->
                    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
                    <link
                        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                        rel="stylesheet" />
                    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
                    <!-- Custom styles for this template-->
                    <link href="/css/sb-admin-2.min.css" rel="stylesheet" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                </head>

                <body id="page-top" style="background-color: #FFFFF4;">
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
                                <div class="container">
                                    <h2>結單團購</h2>
                                    <table id="table_id" class="display">
                                        <thead>
                                            <th>活動編號</th>
                                            <th>開團人</th>
                                            <th>活動標題</th>
                                            <th>活動描述</th>
                                            <th>開團時間</th>
                                            <th>結團時間</th>
                                            <th>訂單</th>
                                        </thead>
                                        <tbody>
                                            <% List<Group> groups = (ArrayList<Group>)
                                                    request.getAttribute("groups");
                                                    for (Group group : groups) { %>
                                                    <tr>
                                                        <th>
                                                            <%=group.getEventNo() %>
                                                        </th>
                                                        <th>
                                                            <%=group.getUser().getUserNo() %>-
                                                                <%=group.getUser().getUserChineseName() %>
                                                        </th>
                                                        <th>
                                                            <%=group.getTitle() %>
                                                        </th>
                                                        <th>
                                                            <%=group.getDescription() %>
                                                        </th>
                                                        <th>
                                                            <%=group.getStartTime() %>
                                                        </th>
                                                        <th>
                                                            <%=group.getEndTime() %>
                                                        </th>
                                                        <th>
                                                            <button class="orders"
                                                                data-eventno="<%=group.getEventNo() %>"><i
                                                                    class="fa-solid fa-cart-plus"></i></button>
                                                        </th>
                                                    </tr>
                                                    <% } %>
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

                    <!-- 訂單細節Modal -->
                    <div class="modal fade" id="orderDetailsModal" tabindex="-1"
                        aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="orderDetailsModalLabel">訂單詳細信息</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Order details will be injected here -->
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>商品名稱</th>
                                                <th>價格</th>
                                                <th>數量</th>
                                                <th>規格</th>
                                            </tr>
                                        </thead>
                                        <tbody id="orderDetailsBody">
                                            <!-- Details go here -->
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
                                </div>
                            </div>
                        </div>
                    </div>

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
                    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                    <script src="https://kit.fontawesome.com/f8f71426ea.js" crossorigin="anonymous"></script>
                    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

                    <script>
                        var table = $('#table_id').DataTable();

                        $('#table_id tbody').on('click', 'button.orders', function () {
                            const tr = $(this).closest('tr');
                            const row = table.row(tr);

                            if (row.child.isShown()) {
                                row.child.hide();
                                tr.removeClass('shown');
                            } else {
                                var eventno = $(this).data('eventno');
                                $.ajax({
                                    url: '/groupbackorders/' + eventno,
                                    type: 'get',
                                    success: function (orders) {
                                        function parsePaymentMethod(paymentCode) {
                                            let methods = [];
                                            if (paymentCode.includes('1')) methods.push("匯款");
                                            if (paymentCode.includes('2')) methods.push("面交");
                                            if (paymentCode.includes('3')) methods.push("SB點數");

                                            return methods.join(", ");
                                        }

                                        var content = '<div class="child-row"><table style="width:100%;"> <thead> <tr> <th> 訂購人 </th> <th> 付款方式 </th> <th> 成立時間 </th> <th> 訂單細節 </th> ' +
                                            '</tr> </thead> <tbody>';
                                        orders.forEach(order => {
                                            let paymentMethods = parsePaymentMethod(order.payment.toString()); // 转换支付方式
                                            content += '<tr> <td>' + order.userNo + '-' + order.userName + '</td> <td>' +
                                                paymentMethods + '</td> <td>' + order.setTime + '</td> <td>' + '<button class="order-details-btn" data-orderno="' + order.orderNo + '"><i class="fa-solid fa-list"></i></button>' + '</td> </tr>';
                                        });
                                        content += '</tbody> </table> </div>';
                                        row.child(content).show();
                                        tr.addClass('shown');
                                    }
                                });
                            }
                        });

                        // 訂單細節按鈕點擊事件
                        $(document).on('click', '.order-details-btn', function () {
                            var orderNo = $(this).data('orderno');
                            $.ajax({
                                url: '/orderdetails/' + orderNo,
                                type: 'get',
                                success: function (orderDetails) {
                                    var orderDetailsBody = $('#orderDetailsBody');
                                    orderDetailsBody.empty(); // 清空舊的訂單細節
                                    var totalAmount = 0;

                                    orderDetails.forEach(detail => {
                                        var row = '<tr>' +
                                            '<td>' + detail.itemName + '</td>' +
                                            '<td>' + detail.itemPrice + '</td>' +
                                            '<td>' + detail.itemQuantity + '</td>' +
                                            '<td>' + detail.specValue + '</td>' +
                                            '</tr>';
                                        orderDetailsBody.append(row);
                                        totalAmount += detail.itemPrice * detail.itemQuantity; // 計算總金額
                                    });

                                    var totalRow = '<tr>' +
                                        '<td colspan="3" style="text-align: right;"><strong>總金額:</strong></td>' +
                                        '<td><strong>' + totalAmount + '</strong></td>' +
                                        '</tr>';
                                    orderDetailsBody.append(totalRow); // 顯示總金額

                                    $('#orderDetailsModal').modal('show'); // 顯示模態框
                                }
                            });
                        });
                    </script>

                </body>

                </html>