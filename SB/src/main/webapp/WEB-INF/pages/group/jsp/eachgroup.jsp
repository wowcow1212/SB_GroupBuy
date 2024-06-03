<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page import="java.util.*" %>
        <%@page import="com.group.model.Group" %>
            <%@page import="com.group.model.Item" %>
                <%@page import="com.group.model.ItemSpecification" %>
                    <%@ page import="java.text.SimpleDateFormat" %>
                        <%@ page import="java.util.Date" %>
                            <!DOCTYPE html>
                            <html lang="en">

                            <head>

                                <meta charset="utf-8">
                                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                                <meta name="description" content="">
                                <meta name="author" content="">

                                <title>團購內容</title>

                                <!-- Custom fonts for this template-->
                                <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                                <link
                                    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                                    rel="stylesheet">
                                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
                                    rel="stylesheet">
                                <style>
                                    input::-webkit-outer-spin-button,
                                    input::-webkit-inner-spin-button {
                                        -webkit-appearance: none;
                                        margin: 0;
                                    }

                                    input[type=number] {
                                        -moz-appearance: textfield;
                                    }

                                    .suggestions {
                                        position: absolute;
                                        top: 100%;
                                        left: 0;
                                        z-index: 1000;
                                        border: 1px solid #ddd;
                                        background-color: #fff;
                                        max-height: 200px;
                                        overflow-y: auto;
                                        width: 100%;
                                    }

                                    .suggestions div {
                                        padding: 10px;
                                        cursor: pointer;
                                    }

                                    .suggestions div:hover {
                                        background-color: #f0f0f0;
                                    }

                                    .suggestion-item {
                                        margin-bottom: 10px;
                                    }

                                    .suggestion-title {
                                        font-size: 16px;
                                        font-weight: bold;
                                    }

                                    .suggestion-description {
                                        font-size: 12px;
                                        color: gray;
                                    }

                                    .scrollable {
                                        max-height: 75px;
                                        max-width: 288px;
                                        overflow-y: auto;
                                        padding: 10px;
                                        box-sizing: border-box;
                                    }

                                    .centered-cell {
                                        text-align: center;
                                        vertical-align: auto;
                                    }

                                    .productadd {
                                        margin-top: 19px;
                                    }
                                </style>
                                <script async
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDAgqI1p1boHUwEIE395YECgaaYngF9FIE&libraries=places&callback=initMap&region=TW&language=zh-TW">
                                    </script>
                                <!-- Custom styles for this template-->
                                <link href="/css/sb-admin-2.min.css" rel="stylesheet">

                            </head>

                            <body id="page-top" style="background-color: #FFFFF4;">

                                <!-- Page Wrapper -->
                                <div id="wrapper">

                                    <!--        <script src="js/test/Z_slider.js"></script>-->

                                    <!-- Content Wrapper -->
                                    <div id="content-wrapper" class="d-flex flex-column">

                                        <!-- Main Content -->
                                        <div id="content">

                                            <!-- Topbar -->
                                            <script src="/js/layout/Z_TopBar.js"></script>

                                            <link rel="stylesheet"
                                                href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
                                                integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
                                                crossorigin="anonymous" />
                                            <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
                                                rel="stylesheet">

                                            <div style="margin-left: 10px;">
                                                <a href="/group/groups"><i class="fa-solid fa-arrow-left"></i></a>
                                            </div>

                                            <div
                                                class="container container-contact bootstrap snippets bootdeys bootdey">
                                                <jsp:useBean id="group" scope="request" class="com.group.model.Group">
                                                </jsp:useBean>

                                                <div class="group">
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <section class="border border-info p-3 mb-3 rounded-pill">
                                                                <p class="lead" style="margin-bottom: 0px">標題:
                                                                    <%=group.getTitle() %>
                                                                </p>
                                                            </section>
                                                        </div>
                                                        <div class="col-8">
                                                            <section class="border border-info p-3 mb-3 rounded-pill">
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <% Date endTime=group.getEndTime();
                                                                            SimpleDateFormat sdf=new
                                                                            SimpleDateFormat("yyyy-MM-dd"); String
                                                                            formattedDate=sdf.format(endTime); %>
                                                                            <p class="lead" style="margin-bottom: 0px">
                                                                                結單時間:
                                                                                <%=formattedDate %>
                                                                            </p>
                                                                    </div>
                                                                    <% String paymentMethodDisplay="" ; switch
                                                                        (group.getPaymentMethod()) { case 1:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-primary btn-sm' data-bs-toggle='modal' data-bs-target='#accountModal'>匯款</button>"
                                                                        ; break; case 2:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#addressModal'>面交</button>"
                                                                        ; break; case 3:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-success btn-sm'>SB點數</button>"
                                                                        ; break; case 12:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-primary btn-sm' data-bs-toggle='modal' data-bs-target='#accountModal'>匯款</button> "
                                                                        + "<button class='btn btn-outline-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#addressModal'>面交</button>"
                                                                        ; break; case 13:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-primary btn-sm' data-bs-toggle='modal' data-bs-target='#accountModal'>匯款</button> "
                                                                        + "<button class='btn btn-outline-success btn-sm'>SB點數</button>"
                                                                        ; break; case 23:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#addressModal'>面交</button> "
                                                                        + "<button class='btn btn-outline-success btn-sm'>SB點數</button>"
                                                                        ; break; case 123:
                                                                        paymentMethodDisplay="<button class='btn btn-outline-primary btn-sm' data-bs-toggle='modal' data-bs-target='#accountModal'>匯款</button> "
                                                                        + "<button class='btn btn-outline-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#addressModal'>面交</button> "
                                                                        + "<button class='btn btn-outline-success btn-sm'>SB點數</button>"
                                                                        ; break;} %>
                                                                        <div class="col-6">
                                                                            <p class="lead" style="margin-bottom: 0px">
                                                                                支付方式:
                                                                                <%=paymentMethodDisplay %>
                                                                            </p>
                                                                        </div>
                                                                </div>
                                                            </section>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <section
                                                            class="border border-info p-3 mb-3 rounded-pill text-center">
                                                            <p class="lead mb-0">團購描述:</p>
                                                            <p>
                                                                <%= group.getDescription() %>
                                                            </p>
                                                        </section>
                                                    </div>
                                                    <div class="row">
                                                        <section class="border border-info p-3 mb-3 rounded-pill">

                                                        </section>
                                                    </div>
                                                </div>

                                                <!-- 商品列表 -->
                                                <table class="table table-striped align-middle table-nowrap">
                                                    <thead>
                                                        <tr>
                                                            <td class="centered-cell">
                                                                <h4>商品名稱</h4>
                                                            </td>
                                                            <td class="centered-cell">
                                                                <h4>商品簡述</h4>
                                                            </td>

                                                            <td class="centered-cell">
                                                                <h4>商品規格</h4>
                                                            </td>
                                                            <td class="centered-cell">
                                                                <h4>商品價格</h4>
                                                            </td>
                                                            <td class="centered-cell">
                                                                <h4>商品數量</h4>
                                                            </td>
                                                            <td class="centered-cell">
                                                                <h4>功能</h4>
                                                            </td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% List<Item> items = (ArrayList<Item>)
                                                                request.getAttribute("items");
                                                                Map<Integer, List<ItemSpecification>> specificationsMap
                                                                    =
                                                                    (Map<Integer, List<ItemSpecification>>)
                                                                        request.getAttribute("itemspecmap");
                                                                        for (Item item : items) {
                                                                        List<ItemSpecification> specifications =
                                                                            specificationsMap.get(item.getItemNo());%>
                                                                            <tr style="height: 100px">
                                                                                <td class="centered-cell">
                                                                                    <div>
                                                                                        <h5 class="font-size-18">
                                                                                            <a href="#"
                                                                                                class="text-dark itemname"
                                                                                                data-bs-toggle="modal"
                                                                                                data-bs-target="#productModal"
                                                                                                data-itemno="<%=item.getItemNo() %>"
                                                                                                data-name="<%=item.getName() %>"
                                                                                                data-description="<%=item.getDescription() %>"
                                                                                                data-price="<%=item.getPrice() %>"
                                                                                                data-path="<%=item.getImgPath() %>">
                                                                                                <%= item.getName() %>
                                                                                            </a>
                                                                                        </h5>
                                                                                    </div>
                                                                                </td>
                                                                                <td class="centered-cell">

                                                                                    <p class="itemdesc centered-cell scrollable"
                                                                                        style="margin-left: 37px;">
                                                                                        <%=item.getDescription() %>
                                                                                    </p>

                                                                                </td>

                                                                                <td class="centered-cell"
                                                                                    style="width: 180px;">
                                                                                    <p style="margin-bottom: 5px">規格:
                                                                                    </p>
                                                                                    <select class="item-spec-select">
                                                                                        <% for(int i=0; i <
                                                                                            specifications.size(); i++){
                                                                                            %>
                                                                                            <option class="itemspec"
                                                                                                value="<%=specifications.get(i).getSpecNo() %>"
                                                                                                data-itemspec="<%=specifications.get(i).getSpecNo() %>">
                                                                                                <%=specifications.get(i).getSpecValue()
                                                                                                    %>
                                                                                            </option>
                                                                                            <% } %>
                                                                                    </select>
                                                                                </td>
                                                                                <td class="centered-cell">
                                                                                    <h3 class="mb-0 font-size-20">
                                                                                        NT$
                                                                                        <b class="itemprice">
                                                                                            <%=item.getPrice() %>
                                                                                        </b>
                                                                                    </h3>
                                                                                </td>
                                                                                <td class="centered-cell">
                                                                                    <p style="margin-bottom: 5px">數量:
                                                                                    </p>
                                                                                    <button
                                                                                        class="minus btn btn-primary btn-sm">-</button>
                                                                                    <input class="numberinput"
                                                                                        type="number"
                                                                                        style="width: 32px; height: 31px"
                                                                                        value="0" min="0">
                                                                                    <button
                                                                                        class="plus btn btn-primary btn-sm">+</button>
                                                                                </td>
                                                                                <td class="centered-cell">
                                                                                    <div class="centered-cell">
                                                                                        <button type="button"
                                                                                            class="btn btn-primary waves-effect waves-light productadd"
                                                                                            data-itemno="<%=item.getItemNo() %>"><i
                                                                                                class="bx bx-cart me-2 font-size-15 align-middle"></i>
                                                                                            Add</button>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <% } %>
                                                    </tbody>
                                                </table>
                                                <button class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#cart" type="submit" id="submitorder"
                                                    data-eventno="<%=group.getEventNo() %>"
                                                    style="width: 100%;">購物車</button>
                                            </div>

                                            <!-- 匯款帳戶Modal -->
                                            <div class="modal fade" id="accountModal" tabindex="-1"
                                                aria-labelledby="accountModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" style="border-radius: 20px;">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="accountlabel">匯款帳戶</h5>
                                                        </div>
                                                        <div class="modal-body text-center">
                                                            <% if (group.getAccount() !=null &&
                                                                !group.getAccount().isEmpty()) { %>
                                                                <h5>
                                                                    <%= group.getAccount() %>
                                                                </h5>
                                                                <% } %>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 面交地址Modal -->
                                            <div class="modal fade" id="addressModal" tabindex="-1"
                                                aria-labelledby="addressModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" style="border-radius: 20px;">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="addresslabel">面交地址</h5>
                                                        </div>
                                                        <div class="modal-body text-center">
                                                            <% if (group.getAddress() !=null &&
                                                                !group.getAddress().isEmpty()) { %>
                                                                <p id="address">
                                                                    <%= group.getAddress() %>
                                                                </p>
                                                                <div id="map" class="text-center"
                                                                    style="height: 400px; width: 470px;"></div>
                                                                <% } %>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 商品Modal -->
                                            <div class="modal fade" id="productModal" tabindex="-1"
                                                aria-labelledby="productModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" style="border-radius: 20px;">

                                                        <div class="modal-body text-center">
                                                            <img id="productImage" src="" alt="商品圖片" class="img-fluid"
                                                                style="width: 200px;height: 200px;">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 購物車Modal -->
                                            <div class="modal fade" id="cart" tabindex="-1" aria-labelledby="cartLabel"
                                                aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content" style="border-radius: 20px;">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="cartLabel">購物車</h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table
                                                                class="table table-striped align-middle table-nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <td>
                                                                            商品名稱
                                                                        </td>
                                                                        <td>
                                                                            規格
                                                                        </td>
                                                                        <td>
                                                                            數量
                                                                        </td>
                                                                        <td>
                                                                            商品總價
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="cart">

                                                                </tbody>
                                                            </table>
                                                            <div class="center">
                                                                付款方式選擇
                                                                <label><input type="radio" value="1"
                                                                        name="method">匯款</label>
                                                                <label><input type="radio" value="2"
                                                                        name="method">面交</label>
                                                                <label><input type="radio" value="3"
                                                                        name="method">SB點數</label>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary cartsubmit"
                                                                data-eventno="<%=group.getEventNo() %>">確認送出</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

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

                                <script src="https://kit.fontawesome.com/f8f71426ea.js"
                                    crossorigin="anonymous"></script>
                                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                <script
                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

                                <script>
                                    $(document).ready(function () {

                                        function updatePaymentMethods(paymentOptions) {
                                            const options = {
                                                '1': '匯款',
                                                '2': '面交',
                                                '3': 'SB點數'
                                            };

                                            // 禁用所有選項
                                            $('input[name="method"]').prop('disabled', true).prop('checked', false);

                                            // 啟用對應的選項
                                            paymentOptions.split('').forEach(function (option) {
                                                $('input[name="method"][value="' + option + '"]').prop('disabled', false);
                                            });

                                            // 自動選擇第一個可用的選項
                                            $('input[name="method"]:not(:disabled)').first().prop('checked', true);
                                        }

                                        // 假設從後端獲取的group.payment值
                                        const groupPayment = "<%=group.getPaymentMethod() %>"; // 這裡使用JSP語法從後端獲取payment值

                                        // 更新付款方式選擇
                                        updatePaymentMethods(groupPayment);


                                        // 數量選擇
                                        $('.plus').click(function () {
                                            var input = $(this).siblings('.numberinput');
                                            var currentValue = parseInt(input.val(), 10);
                                            input.val(currentValue + 1);
                                        });

                                        $('.minus').click(function () {
                                            var input = $(this).siblings('.numberinput');
                                            var currentValue = parseInt(input.val(), 10);
                                            if (currentValue > 0) {
                                                input.val(currentValue - 1);
                                            }
                                        });
                                        // 加入購物車
                                        $('.btn.productadd').on('click', function () {
                                            const $tr = $(this).closest('tr');
                                            const itemno = $tr.find('.itemname').data('itemno');
                                            const itemname = $tr.find('.itemname').text();
                                            const $selectedOption = $tr.find('.item-spec-select option:selected');
                                            const itemspecno = $selectedOption.data('itemspec');
                                            const itemspecvalue = $selectedOption.text();
                                            const itemquan = $tr.find('.numberinput').val();
                                            const price = $tr.find('.itemprice').text().replace('NT$', '').trim();
                                            const itemspec = $tr.find('select').find('option:selected').text();
                                            const itemtotalprice = parseInt(itemquan, 10) * parseFloat(price);

                                            const modalcontext = `<tr data-itemno="` + itemno + `" data-itemspec="` + itemspecno + `" data-itemquan="` + itemquan + `">
                                                    <td>` + itemname + `</td>
                                                    <td>` + itemspec + `</td>
                                                    <td>` + itemquan + `</td>
                                                    <td>NT$` + itemtotalprice + `</td>
                                                    <td><button class="btn btn-danger"><i class="fa-solid fa-xmark"></i></button></td>
                                                </tr>`;

                                            $('.cart').append(modalcontext);
                                            alert('已加入購物車');
                                            $tr.find('.numberinput').val(0);

                                        });
                                        // 購物車取消
                                        $('.cart').on('click', '.btn-danger', function () {
                                            $(this).closest('tr').remove();
                                        });

                                        $('.cartsubmit').on('click', function () {
                                            const eventno = $(this).data('eventno')
                                            const orderDetails = [];
                                            const paymentMethod = $('input[name="method"]:checked').val();

                                            $('.cart tr').each(function () {
                                                const $row = $(this);
                                                const itemno = $row.data('itemno');
                                                const itemspec = $row.data('itemspec');
                                                const itemquan = $row.data('itemquan');

                                                orderDetails.push({
                                                    itemNo: itemno,
                                                    itemSpec: itemspec,
                                                    itemQuantity: parseInt(itemquan, 10)
                                                });

                                            })

                                            const formData = {
                                                eventNo: eventno,
                                                paymentMethod: paymentMethod,
                                                orderDetail: orderDetails
                                            }
                                            if (confirm('確定要送出購物車嗎')) {
                                                $.ajax({
                                                    url: '/insertorder',
                                                    type: 'POST',
                                                    contentType: 'application/json',
                                                    data: JSON.stringify(formData),
                                                    success: function (response) {
                                                        alert('訂單已送出');
                                                        window.location.href = "/group/mygroups";
                                                    },
                                                    error: function (err) {
                                                        console.log(formData);
                                                    }
                                                })
                                            }

                                        })

                                        $('#productModal').on('show.bs.modal', function (event) {
                                            var button = $(event.relatedTarget); // 觸發模態框的按鈕
                                            var itemImageFilename = button.data('path');
                                            var itemImageUrl = '/groupimages/' + itemImageFilename;

                                            var modal = $(this);
                                            modal.find('#productImage').attr('src', itemImageUrl);
                                        });
                                    });
                                </script>

                                <!-- googlemap -->
                                <script>
                                    $(document).ready(function () {
                                        $('#addressModal').on('show.bs.modal', function (event) {
                                            var button = $(event.relatedTarget);
                                            var address = "<%= group.getAddress() %>";

                                            if (address) {
                                                getLatLngFromAddress(address)
                                                    .then(latLng => {
                                                        var mapOptions = {
                                                            center: { lat: latLng.lat, lng: latLng.lng },
                                                            zoom: 17
                                                        };

                                                        var map = new google.maps.Map(document.getElementById('map'), mapOptions);

                                                        var marker = new google.maps.Marker({
                                                            position: { lat: latLng.lat, lng: latLng.lng },
                                                            map: map,
                                                            title: '面交地址'
                                                        });

                                                        var pano = new google.maps.StreetViewPanorama(
                                                            document.getElementById('streetMap'), {
                                                            position: { lat: latLng.lat, lng: latLng.lng },
                                                            pov: {
                                                                heading: 270,
                                                                pitch: 0
                                                            },
                                                            zoom: 1
                                                        });

                                                        var streetViewService = new google.maps.StreetViewService();
                                                        streetViewService.getPanorama({
                                                            location: { lat: latLng.lat, lng: latLng.lng },
                                                            radius: 50
                                                        }, function (result, status) {
                                                            if (status === google.maps.StreetViewStatus.OK) {
                                                                pano.setPosition(result.location.latLng);
                                                                pano.setPov({
                                                                    heading: 270,
                                                                    pitch: 0
                                                                });
                                                            } else {
                                                                console.log('Street View data not found for this location.');
                                                            }
                                                        });
                                                    })
                                                    .catch(error => {
                                                        console.error('Error:', error.message);
                                                    });
                                            }
                                        });

                                        function getLatLngFromAddress(address) {
                                            return new Promise((resolve, reject) => {
                                                var geocoder = new google.maps.Geocoder();
                                                geocoder.geocode({ 'address': address }, function (results, status) {
                                                    if (status == google.maps.GeocoderStatus.OK) {
                                                        var latitude = results[0].geometry.location.lat();
                                                        var longitude = results[0].geometry.location.lng();
                                                        resolve({ lat: latitude, lng: longitude });
                                                    } else {
                                                        reject(new Error('Geocoding failed: ' + status));
                                                    }
                                                });
                                            });
                                        }

                                        function initMap() {
                                            console.log("Initializing Map");
                                        }
                                    });
                                </script>

                                <!-- 搜尋列 -->
                                <script>
                                    $(document).ready(function () {
                                        $('#search').on('input', function () {
                                            const search = $(this).val();
                                            if (search.length > 0) {
                                                $.ajax({
                                                    url: '/group/groupsearch',
                                                    method: 'get',
                                                    data: { search: search },
                                                    success: function (response) {
                                                        displaySuggestions(response);
                                                    },
                                                    error: function (err) {
                                                        console.log("錯了白痴" + err);
                                                    }
                                                })
                                            } else {
                                                $('#searchSuggestions').empty();
                                            }
                                        });

                                        function displaySuggestions(suggestions) {
                                            const suggestionsContainer = $('#searchSuggestions');
                                            suggestionsContainer.empty();
                                            suggestions.forEach(function (suggestion) {
                                                const suggestionItem = $('<div>').addClass('suggestion-item');
                                                const title = $('<div>').text(suggestion.gTitle).addClass('suggestion-title');
                                                const description = $('<div>').text(suggestion.gDescription).addClass('suggestion-description');
                                                console.log(suggestion.gDescription);
                                                suggestionItem.append(title).append(description);
                                                suggestionItem.on('click', function () {
                                                    const eventno = suggestion.eventNo;
                                                    console.log(eventno);
                                                    window.location.href = '/group/eachgroup/' + eventno;
                                                });
                                                suggestionsContainer.append(suggestionItem);
                                            });
                                        }

                                    })
                                </script>
                            </body>

                            </html>