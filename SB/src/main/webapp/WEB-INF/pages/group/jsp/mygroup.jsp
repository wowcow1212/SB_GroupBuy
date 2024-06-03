<%@page import="com.group.dto.GroupDto" %>
	<%@page import="java.text.SimpleDateFormat" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<%@page import="java.util.*" %>
				<%@page import="com.group.dto.GroupDto" %>
					<%@page import="com.group.model.Item" %>
						<%@page import="com.group.dto.OrderDto" %>
							<%@page import="com.group.dto.OrderDetailsDto" %>
								<!DOCTYPE html>
								<html lang="en">

								<head>

									<meta charset="utf-8">
									<meta http-equiv="X-UA-Compatible" content="IE=edge">
									<meta name="viewport"
										content="width=device-width, initial-scale=1, shrink-to-fit=no">
									<meta name="description" content="">
									<meta name="author" content="">

									<title>我的團購</title>

									<!-- Custom fonts for this template-->
									<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
										type="text/css">
									<link
										href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
										rel="stylesheet">

									<!-- Custom styles for this template-->
									<link href="/css/sb-admin-2.min.css" rel="stylesheet">
									<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
										rel="stylesheet"
										integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
										crossorigin="anonymous">
									<link rel="stylesheet"
										href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

									<style>
										.sticky-header {
											position: sticky;
											top: 0;
											background-color: white;
											z-index: 1000;
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
									</style>

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

												<div style="margin-left: 10px">
													<a href="/group/groups"><i class="fa-solid fa-arrow-left"></i></a>
												</div>
												<div class="container">

													<div class="row g-3">
														<div class="col-12 col-sm-8"></div>
														<div class="my-5">
															<h3>團購資料</h3>
														</div>

														<!-- 頁籤 -->
														<ul class="nav nav-tabs" id="tab" role="tablist">
															<li class="nav-item" role="presentation">
																<button class="nav-link active" id="profileTab"
																	data-bs-toggle="tab"
																	data-bs-target="#profileTabPane" type="button"
																	role="tab" aria-controls="profileTabPane"
																	aria-selected="true">
																	我的團購
																</button>
															</li>
															<li class="nav-item" role="presentation">
																<button class="nav-link" id="photosTab"
																	data-bs-toggle="tab" data-bs-target="#photosTabPane"
																	type="button" role="tab"
																	aria-controls="photosTabPane" aria-selected="false">
																	我的訂單
																</button>
															</li>
														</ul>

														<div class="tab-content" id="tabContent">
															<!-- 我的團購 -->
															<div class="tab-pane fade show active" id="profileTabPane"
																role="tabpanel" aria-labelledby="profileTab"
																tabindex="0">
																<table id="group_id" class="display"
																	style="width: 100%;">
																	<thead>
																		<tr class="sticky-header">
																			<th>活動編號</th>
																			<th>活動標題</th>
																			<th>活動描述</th>
																			<th>截團時間</th>
																			<th>成團金額</th>
																			<th>成團數量</th>
																			<th>已訂購金額</th>
																			<th>已訂購數量</th>
																			<th>付款方式</th>
																			<th>修改</th>
																			<th>刪除</th>
																			<th>結單</th>
																		</tr>
																	</thead>
																	<% List<GroupDto> groups = (ArrayList<GroupDto>)
																			request.getAttribute("groups");
																			for (GroupDto group : groups) { %>
																			<tr>
																				<td>
																					<%= group.getEventNo() %>
																				</td>
																				<td>
																					<a href="#"
																						class="view-group-orders"
																						data-bs-toggle="modal"
																						data-bs-target="#groupOrderModal"
																						data-group-orders='<%= new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(group.getGroupOrders()) %>'>
																						<%= group.getgTitle() %>
																					</a>
																				</td>
																				<td>
																					<%= group.getgDescription() %>
																				</td>
																				<% Date endTime=group.getgEndTime();
																					SimpleDateFormat sdf=new
																					SimpleDateFormat("yyyy-MM-dd");
																					String
																					formattedEndTime=sdf.format(endTime);
																					%>
																					<td>
																						<%= formattedEndTime %>
																					</td>
																					<td>
																						<%= group.getgMinTotalAmount()
																							%>
																					</td>
																					<td>
																						<%= group.getgMinTotalQuantity()
																							%>
																					</td>
																					<td>
																						<%= group.getTotalPrice() %>
																					</td>
																					<td>
																						<%= group.getTotalAmount() %>
																					</td>
																					<% String paymentMethodDisplay="" ;
																						switch
																						(group.getPaymentMethod()) {
																						case 1:
																						paymentMethodDisplay="匯款" ;
																						break; case 2:
																						paymentMethodDisplay="面交" ;
																						break; case 3:
																						paymentMethodDisplay="SB點數" ;
																						break; case 12:
																						paymentMethodDisplay="匯款, 面交" ;
																						break; case 13:
																						paymentMethodDisplay="匯款, SB點數"
																						; break; case 23:
																						paymentMethodDisplay="面交, SB點數"
																						; break; case 123:
																						paymentMethodDisplay="匯款, 面交, SB點數"
																						; break; default:
																						paymentMethodDisplay="未知支付方式" ;
																						break; } %>
																						<td>
																							<%= paymentMethodDisplay %>
																						</td>
																						<td>
																							<button
																								class="update btn btn-primary btn-lg"
																								data-groupeventno="<%= group.getEventNo() %>"
																								data-grouptitle="<%= group.getgTitle() %>"
																								data-groupdescription="<%= group.getgDescription() %>"
																								data-groupendtime="<%= formattedEndTime %>"
																								data-groupmintotalamount="<%= group.getgMinTotalAmount() %>"
																								data-groupmintotalquantity="<%= group.getgMinTotalQuantity() %>"
																								data-grouppaymentmethod="<%= paymentMethodDisplay %>"
																								data-bs-toggle="modal"
																								data-bs-target="#exampleModal">
																								<i
																									class="fa-solid fa-pen-to-square"></i>
																							</button>
																						</td>
																						<td>
																							<button
																								class="delete btn btn-primary btn-lg"
																								data-groupeventno="<%= group.getEventNo() %>">
																								<i
																									class="fa-solid fa-xmark"></i>
																							</button>
																						</td>
																						<td>
																							<button
																								class="endGroup btn btn-primary btn-lg"
																								data-groupeventno="<%= group.getEventNo() %>">
																								<i
																									class="fa-solid fa-check"></i>
																							</button>
																						</td>
																			</tr>
																			<% } %>
																</table>
																<h3>共<%= groups.size() %>筆團購</h3>
															</div>

															<!-- 我的訂單 -->
															<div class="tab-pane fade" id="photosTabPane"
																role="tabpanel" aria-labelledby="photosTab"
																tabindex="0">
																<table id="order_id" class="display"
																	style="width: 100%">
																	<tr>
																		<th>活動編號</th>
																		<th>活動標題</th>
																		<th>活動狀態</th>
																		<th>成立時間</th>
																		<th>付款方式</th>
																		<th>訂單細節</th>
																	</tr>
																	<% List<OrderDto> orders = (ArrayList<OrderDto>)
																			request.getAttribute("orders");
																			for (OrderDto order : orders) { %>
																			<tr>
																				<td>
																					<%=order.getEventNo() %>
																				</td>
																				<td>
																					<%=order.getEventTitle() %>
																				</td>
																				<td>
																					<%=order.getEventStatus() %>
																				</td>
																				<% Date setTime=order.getSetTime();
																					SimpleDateFormat sdf=new
																					SimpleDateFormat("yyyy-MM-dd" + " "
																					+ "hh:mm:ss" ); String
																					formattedSetTime=sdf.format(setTime);
																					%>
																					<td>
																						<%=formattedSetTime %>
																					</td>
																					<% String paymentMethodDisplay="" ;
																						switch
																						(order.getPaymentMethod()) {
																						case 1:
																						paymentMethodDisplay="匯款" ;
																						break; case 2:
																						paymentMethodDisplay="面交" ;
																						break; case 3:
																						paymentMethodDisplay="SB點數" ;
																						break; case 12:
																						paymentMethodDisplay="匯款, 面交" ;
																						break; case 13:
																						paymentMethodDisplay="匯款, SB點數"
																						; break; case 23:
																						paymentMethodDisplay="面交, SB點數"
																						; break; case 123:
																						paymentMethodDisplay="匯款, 面交, SB點數"
																						; break; default:
																						paymentMethodDisplay="未知支付方式" ;
																						break; } %>
																						<td>
																							<%=paymentMethodDisplay %>
																						</td>
																						<td>
																							<button
																								class="btn btn-primary btn-lg view-order-details"
																								data-order-details='<%= new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(order.getOrderDetail()) %>'
																								data-bs-toggle="modal"
																								data-bs-target="#orderDetailsModal">
																								<i
																									class="fa-solid fa-list"></i>
																							</button>
																						</td>
																			</tr>
																			<% } %>
																</table>
															</div>
														</div>
													</div>
												</div>

												<!-- 更改團購Modal -->
												<div class="modal fade" id="exampleModal" tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">修改團購</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body" style="text-align: left">
																<div
																	style="display: flex; align-items: center; margin-bottom: 10px">
																	<div style="width: 150px">團購標題:</div>
																	<input name="gtitle" class="swal2-input" />
																</div>
																<div
																	style="display: flex; align-items: center; margin-bottom: 10px">
																	<div style="width: 150px">團購描述:</div>
																	<textarea name="gdescription" class="swal2-input"
																		style="height: 80px"></textarea>
																</div>
																<div
																	style="display: flex; align-items: center; margin-bottom: 10px">
																	<div style="width: 150px">團購截止時間:</div>
																	<input name="gendtime" type="date"
																		class="swal2-input" style="width: 250px" />
																</div>
																<div
																	style="display: flex; align-items: center; margin-bottom: 10px">
																	<div style="width: 150px">成團金額:</div>
																	<input type="number" name="MinTotalAmount"
																		class="swal2-input" />
																</div>
																<div
																	style="display: flex; align-items: center; margin-bottom: 10px">
																	<div style="width: 150px">成團數量:</div>
																	<input name="MinTotalQuantity"
																		class="swal2-input" />
																</div>
																<!-- Hidden input field for groupeventno -->
																<input type="hidden" name="groupeventno" />
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">關閉</button>
																<button id="updatesubmit"
																	class="btn btn-primary">確認修改</button>
															</div>
														</div>
													</div>
												</div>

												<!-- 商品細節Modal -->
												<div class="modal fade" id="orderDetailsModal" tabindex="-1"
													aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="orderDetailsModalLabel">訂單細節
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body" style="text-align: left">
																<table class="table">
																	<thead>
																		<tr>
																			<th>商品名稱</th>
																			<th>商品規格</th>
																			<th>訂購數量</th>
																			<th>該商品總價</th>
																		</tr>
																	</thead>
																	<tbody id="orderDetailsBody">
																		<!-- Order details will be populated here dynamically -->
																	</tbody>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">關閉</button>
															</div>
														</div>
													</div>
												</div>

												<!-- 團購訂單modal -->
												<div class="modal fade" id="groupOrderModal" tabindex="-1"
													aria-labelledby="groupOrderModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="groupOrderModalLabel">團購訂單
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body" style="text-align: left">
																<table class="table">
																	<thead>
																		<tr>
																			<th>會員</th>
																			<th>付款方式</th>
																			<th>成立時間</th>
																			<th>商品</th>
																		</tr>
																	</thead>
																	<tbody id="groupOrderDetailsBody">
																		<!-- Order details will be populated here dynamically -->
																	</tbody>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">關閉</button>
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
										<i class="fas fa-angle-up"></i></a>

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

									<script
										src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
										integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
										crossorigin="anonymous">
										</script>
									<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
									<script src="https://kit.fontawesome.com/f8f71426ea.js"
										crossorigin="anonymous"></script>
									<script
										src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

									<script>
										$(document).ready(function () {
											$("button.delete").on("click", function () {
												let groupEventNo = $(this).data("groupeventno");
												if (confirm("確定要刪除這筆資料嗎?")) {
													$.ajax({
														url: '/group/bannedgroup/' + groupEventNo,
														type: 'post',
														success: function (response) {
															console.log(groupEventNo)
															location.reload();
														}
													})
												}
											});

											$('.update').on('click', function () {
												var groupeventno = $(this).data('groupeventno');
												var grouptitle = $(this).data('grouptitle');
												var groupdescription = $(this).data('groupdescription');
												var groupendtime = $(this).data('groupendtime');
												var groupmintotalamount = $(this).data('groupmintotalamount');
												var groupmintotalquantity = $(this).data('groupmintotalquantity');
												var grouppaymentmethod = $(this).data('grouppaymentmethod');

												$('#exampleModal').find('[name="gtitle"]').val(grouptitle);
												$('#exampleModal').find('[name="gdescription"]').val(groupdescription);
												$('#exampleModal').find('[name="gendtime"]').val(groupendtime);
												$('#exampleModal').find('[name="MinTotalAmount"]').val(groupmintotalamount);
												$('#exampleModal').find('[name="MinTotalQuantity"]').val(groupmintotalquantity);
												$('#exampleModal').find('[name="groupeventno"]').val(groupeventno); // Set the hidden input field

												$('#exampleModal').find('[name="payment"]').prop('checked', false);
												$('#exampleModal').find('[name="payment"]').each(function () {
													if (grouppaymentmethod.includes($(this).val())) {
														$(this).prop('checked', true);
													}
												});
											});

											$('#updatesubmit').on('click', function () {
												var paymentMethods = $('#exampleModal').find('[name="payment"]:checked').map(function () {
													return parseInt($(this).val());
												}).get();

												var paymentMethodValue = 0;
												if (paymentMethods.includes(1)) paymentMethodValue += 1;
												if (paymentMethods.includes(2)) paymentMethodValue += 2;

												var formData = {
													eventNo: $('#exampleModal').find('[name="groupeventno"]').val(), // Read the hidden input field
													gTitle: $('#exampleModal').find('[name="gtitle"]').val(),
													gDescription: $('#exampleModal').find('[name="gdescription"]').val(),
													gEndTime: $('#exampleModal').find('[name="gendtime"]').val(),
													gMinTotalAmount: $('#exampleModal').find('[name="MinTotalAmount"]').val(),
													gMinTotalQuantity: $('#exampleModal').find('[name="MinTotalQuantity"]').val()
												};

												console.log(formData);

												$.ajax({
													url: '/group/updategroup',
													type: 'post',
													contentType: 'application/json',
													data: JSON.stringify(formData),
													success: function (response) {
														location.reload();
													},
													error: function (xhr, status, error) {
														console.error("更新失敗:", error);
													}
												});
											});

											// 我的團購訂單細節
											$(document).on('click', '.view-group-orders', function () {
												var groupOrders = JSON.parse($(this).attr('data-group-orders'));
												var groupOrderDetailsBody = $('#groupOrderDetailsBody');
												groupOrderDetailsBody.empty(); // 清空之前的細節

												// 添加新的團購訂單細節
												$.each(groupOrders, function (index, order) {
													var orderRow = '<tr>' +
														'<td>' + order.userNo + '-' + order.userName + '</td>' +
														'<td>' + parsePaymentMethod(order.paymentMethod) + '</td>' +
														'<td>' + formatDate(order.setTime) + '</td>' +
														'<td><button class="btn btn-primary view-group-order-details" data-order-details=\'' + JSON.stringify(order.orderDetail) + '\' data-bs-toggle="modal" data-bs-target="#orderDetailsModal"><i class="fa-solid fa-list"></i></button></td>' +
														'</tr>';
													groupOrderDetailsBody.append(orderRow);
												});

												$('#groupOrderModal').modal('show');
											});

											// 團購中的訂單詳細信息
											$(document).on('click', '.view-group-order-details', function () {
												var orderDetails = JSON.parse($(this).attr('data-order-details'));
												var orderDetailsBody = $('#orderDetailsBody');
												orderDetailsBody.empty();

												// 隱藏團購訂單視窗
												$('#groupOrderModal').modal('hide');

												// 添加訂單細節
												$.each(orderDetails, function (index, detail) {
													var itemTotalPrice = detail.itemQuantity * detail.itemPrice;
													var detailRow = '<tr>' +
														'<td>' + detail.itemName + '</td>' +
														'<td>' + detail.specValue + '</td>' +
														'<td>' + detail.itemQuantity + '</td>' +
														'<td>NT$' + itemTotalPrice + '</td>' +
														'</tr>';
													orderDetailsBody.append(detailRow);
												});

												// 顯示訂單細節視窗
												$('#orderDetailsModal').modal('show');

												// 在訂單細節視窗關閉時顯示團購訂單視窗
												$('#orderDetailsModal').off('hidden.bs.modal').on('hidden.bs.modal', function () {
													$('#groupOrderModal').modal('show');
												});
											});

											// 我的訂單詳細信息
											$(document).on('click', '.view-order-details', function () {
												var orderDetails = JSON.parse($(this).attr('data-order-details'));
												var orderDetailsBody = $('#orderDetailsBody');
												orderDetailsBody.empty(); // 清空之前的細節

												// 添加新的訂單細節
												$.each(orderDetails, function (index, detail) {
													var itemTotalPrice = detail.itemQuantity * detail.itemPrice;
													var row = '<tr>' +
														'<td>' + detail.itemName + '</td>' +
														'<td>' + detail.specValue + '</td>' +
														'<td>' + detail.itemQuantity + '</td>' +
														'<td>' + itemTotalPrice + '</td>' +
														'</tr>';
													orderDetailsBody.append(row);
												});

												// 顯示訂單細節視窗
												$('#orderDetailsModal').modal('show');

												// 在訂單細節視窗關閉時取消綁定的事件處理程序
												$('#orderDetailsModal').off('hidden.bs.modal');
											});

											// 格式化日期
											function formatDate(date) {
												var d = new Date(date);
												return d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
											}

											// 解析支付方式
											function parsePaymentMethod(paymentCode) {
												let methods = [];
												if (paymentCode.toString().includes('1')) methods.push("匯款");
												if (paymentCode.toString().includes('2')) methods.push("面交");
												if (paymentCode.toString().includes('3')) methods.push("SB點數");
												return methods.join(", ");
											}

											// 結單按鈕
											$('.endGroup').click(function () {
												var groupNo = $(this).data('groupeventno');
												if (confirm('確定要結單?')) {
													$.ajax({
														url: '/group/groupdone/' + groupNo,
														type: 'post',
														success: function () {
															location.reload();
														},
														error: function () {
															console.log('白癡');
															location.reload();
														}
													})
												}
											})
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