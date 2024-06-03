<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@page import="java.util.*" %>
		<%@page import="com.group.model.Group" %>
			<%@page import="com.group.model.Item" %>
				<%@ page import="java.text.SimpleDateFormat" %>
					<%@page import="org.springframework.data.domain.Page" %>
						<%@page import="org.springframework.data.domain.PageImpl" %>
							<%@page import="org.springframework.data.domain.PageRequest" %>
								<%@page import="org.springframework.data.domain.Pageable" %>
									<%! public String formatTimeAgo(Date date) { final long SECOND=1000; final long
										MINUTE=60 * SECOND; final long HOUR=60 * MINUTE; final long DAY=24 * HOUR; final
										long MONTH=30 * DAY; long currentTime=System.currentTimeMillis(); long
										timeDiff=currentTime - date.getTime(); if (timeDiff < MINUTE) { return (timeDiff
										/ SECOND) + " 秒前開團" ; } else if (timeDiff < HOUR) { return (timeDiff / MINUTE)
										+ " 分鐘前開團" ; } else if (timeDiff < DAY) { return (timeDiff / HOUR) + " 小時前開團" ;
										} else if (timeDiff < MONTH) { return (timeDiff / DAY) + " 天前開團" ; } else {
										return new SimpleDateFormat("yyyy-MM-dd").format(date); } } public String
										formatTimeLeft(Date date) { final long SECOND=1000; final long MINUTE=60 *
										SECOND; final long HOUR=60 * MINUTE; final long DAY=24 * HOUR; long
										currentTime=System.currentTimeMillis(); long timeDiff=date.getTime() -
										currentTime; if (timeDiff < MINUTE) { return (timeDiff / SECOND) + " 秒後截止" ; }
										else if (timeDiff < HOUR) { return (timeDiff / MINUTE) + " 分鐘後截止" ; } else if
										(timeDiff < DAY) { return (timeDiff / HOUR) + " 小時後截止" ; } else { return
										(timeDiff / DAY) + " 天後截止" ; } } %>
										<!DOCTYPE html>
										<html>

										<head>
											<meta charset="UTF-8">
											<meta http-equiv="X-UA-Compatible" content="IE=edge">
											<meta name="viewport"
												content="width=device-width, initial-scale=1, shrink-to-fit=no">
											<meta name="description" content="">
											<meta name="author" content="">
											<title>SB 團購活動</title>
											<link
												href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
												rel="stylesheet"
												integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
												crossorigin="anonymous">
											<link rel="stylesheet" href="/mycss/groups.css">
											<link rel="stylesheet"
												href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
											<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
												type="text/css">
											<link
												href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
												rel="stylesheet">

											<!-- Custom styles for this template-->
											<link href="/css/sb-admin-2.min.css" rel="stylesheet">
											<style>
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
													color: gray.
												}
											</style>
										</head>

										<body id="page-top" style="background-color: #FFFFF4;">
											<jsp:useBean id="userData" scope="request" class="com.user.bean.UserBean">
											</jsp:useBean>

											<div id="wrapper">
												<div id="content-wrapper" class="d-flex flex-column">
													<div id="content">
														<script src="/js/layout/Z_TopBar.js"></script>
														<div class="container" style="width: 68%;position: relative;">
															<div class="row">
																<div class="col-4">
																	<button type="button" class="btn btn-primary"
																		data-bs-toggle="modal"
																		data-bs-target="#newgroup"
																		style="height: 40px;margin-top: 20px">
																		我要開團
																	</button>
																</div>
																<div class="col-4">
																	<div class="text-center">
																		排序:
																		<select id="sortOptions">
																			<option value="origin"></option>
																			<option value="startTime">發起時間</option>
																			<option value="endTime">截止時間</option>
																		</select>
																	</div>
																</div>
																<div class="col-4">
																	<div class="text-end" style="margin-top: 20px;">
																		<a href="/getLinePayPay">購買點數</a>
																		<p>點數: <%=userData.getPoint() %>
																		</p>
																	</div>
																</div>
															</div>

															<div class="row" style="padding-top: 0px;margin-top: 0px">
																<% Page<Group> groups = (Page<Group>)
																		request.getAttribute("groups");
																		for (Group group : groups.getContent()) { %>
																		<div
																			class="col-lg-4 col-md-6 col-12 mt-4 pt-2 position-relative">
																			<div class="card service-wrapper rounded border-0 shadow p-4"
																				style="padding: 0px;">
																				<a
																					href="/otherAboutMe/<%=group.getUser().getUserNo() %>"><img
																						src="/localimages/<%=group.getUser().getAvatar() %>"
																						alt=""
																						style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover; margin: 5px"></a>
																				<div class="content mt-4"
																					style="margin: 0px;">
																					<h5 class="title">
																						<%=group.getTitle() %>
																					</h5>
																					<p class="text-muted mt-3 mb-0">
																						<%=group.getDescription() %>
																					</p>
																					<% Date
																						startDate=group.getStartTime();
																						String
																						timeAgo=formatTimeAgo(startDate);
																						%>
																						<% Date
																							endDate=group.getEndTime();
																							String
																							timeLeft=formatTimeLeft(endDate);
																							%>
																							<p class="link-wrapper"
																								style="position: absolute; bottom: 5px; left: 10px; color: gray">
																								<%=timeAgo %>/
																									<%=timeLeft %>
																							</p>
																							<div class="link-wrapper"
																								style="position: absolute; bottom: 10px; right: 10px;">
																								<a href="<%= "/group/eachgroup/"+group.getEventNo()%>"class="text-custom">前往團購
																									<i
																										class="mdi mdi-chevron-right"></i></a>
																							</div>
																				</div>
																			</div>
																		</div>
																		<% } %>
															</div>
															<br>
															<!-- 分頁按鈕 -->
															<nav aria-label="Page navigation example">
																<ul class="pagination justify-content-center">
																	<% int totalPages=groups.getTotalPages();
																		int currentPage=groups.getNumber();
																		for (int i=0; i < totalPages; i++) { %>
																		<li class="page-item <%= (currentPage == i) ? "active" : "" %>">
																			<a class="page-link"
																				href="/group/groups?page=<%= i %>">
																				<%= i + 1 %> <!-- 顯示給用戶的頁碼是從 1 開始 -->
																			</a>
																		</li>
																		<% } %>
																</ul>
															</nav>


														</div>
													</div>
													<script src="/js/layout/Z_footer.js"></script>
												</div>
											</div>
											<a class="scroll-to-top rounded" href="#page-top">
												<i class="fas fa-angle-up"></i>
											</a>
											<div class="modal fade" id="newgroup" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content" style="border-radius: 20px;">
														<div class="modal-body">
															<form id="newgroupform" , method="post" ,
																action="/group/insertgroup">
																<fieldset>
																	<legend>團購</legend>
																	<ol style="list-style-type: none;">
																		<li>
																			<label for="gTitle"
																				style="display: flex;">團購標題:</label>
																			<input type="text" name="gTitle" id="gTitle"
																				placeholder="團購標題"
																				style="width: 411px;">
																			<span class="error-message"
																				style="display: none; color: red;"></span>
																		</li>
																		<li>
																			<label for="gDescription"
																				style="display: flex;">團購簡述:</label>
																			<textarea name="gDescription"
																				id="gDescription" placeholder="團購描述"
																				style="display: flex;justify-content: flex-end;width: 411px;"></textarea>
																			<span class="error-message"
																				style="display: none; color: red;"></span>
																		</li>
																		<li>
																			<label for:"gEndTime"
																				style="display: flex;">團購截止時間:</label>
																			<input type="date" id="gEndTime"
																				name="gEndTime" style="width: 411px;">
																			<span class="error-message"
																				style="display: none; color: red;"></span>
																		</li>
																		<li>
																			<label for="gMinTotalAmount"
																				style="display: flex;">成團金額:</label>
																			<input type="number" name="gMinTotalAmount"
																				id="gMinTotalAmount"
																				placeholder="成團最小金額"
																				style="width: 411px;">
																		</li>
																		<li>
																			<label for="gMinTotalQuantity"
																				style="display: flex;">成團數量:</label>
																			<input type="number"
																				name="gMinTotalQuantity"
																				id="gMinTotalQuantity"
																				placeholder="成團最小數量"
																				style="width: 411px;">
																		</li>
																	</ol>
																</fieldset>
																<fieldset>
																	<legend>付款細項</legend>
																	<ol style="list-style-type: none;">
																		<li>
																			<label style="display: flex;">
																				付款方式:
																			</label>
																			<br>
																			<label style="width: 70px"><input
																					type="checkbox" name="payment[]"
																					value="1">匯款</label>
																			<label style="width: 70px"><input
																					type="checkbox" name="payment[]"
																					value="2">面交</label>
																			<label style="width: 70px"><input
																					type="checkbox" name="payment[]"
																					value="3">SB點數</label>
																		</li>
																		<br>
																		<li class="bank-account"
																			style="display:none;margin: 0;padding: 0">
																			<label style="display: flex;">
																				匯款帳戶:
																			</label>
																			<br>
																			<select id="bank" name="bank">
																				<option>銀行</option>
																			</select>
																			<input class="rounded-input"
																				id="bankAccount" type="text"
																				name="account" placeholder="帳戶"
																				style="width: 411px;">
																		</li>
																		<br>
																		<li class="meetup-address"
																			style="display:none;margin: 0;padding: 0">
																			<label style="display: flex;">
																				面交地址:
																			</label>
																			<br>
																			<select id="city" name="city">
																				<option value="">選縣市</option>
																			</select>
																			<select id="area" name="area"
																				style="display:none;">
																				<option value="">請選擇</option>
																			</select>
																			<br>
																			<input class="rounded-input"
																				id="groupAddress" type="text"
																				name="address"
																				style="display:none; width: 411px;">
																		</li>
																	</ol>
																</fieldset>
																<fieldset>
																	<div
																		style="display: flex;align-items: center;justify-content: center;">
																		<button type="submit" class="btn btn-primary"
																			id="submitgroup">開團囉</button>
																	</div>
																</fieldset>
														</div>
														</form>
														<div
															style="display: flex;align-items: center;justify-content: center;">
															<button class="btn btn-warning" style="width: 100px;"
																id="quickButton">一鍵輸入</button>
														</div>
													</div>
												</div>
											</div>

											<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
											<script src="https://kit.fontawesome.com/f8f71426ea.js"
												crossorigin="anonymous"></script>
											<script
												src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
											<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

											<!-- 地區json -->
											<script>
												$(document).ready(function () {
													const url = '/json/taiwancity.json'
													$.ajax({
														url: url,
														type: "get",
														dataType: "json",
														success: function (data) {
															$.each(data, function (key, value) {
																$('#city').append('<option data-key="' + key + '" value="' + data[key].CityName + '">' + data[key].CityName + '</option>')
															})
														},
														error: function (data) {
															alert("讀取資料失敗");
														}
													});
													$("#city").change(function () {
														cityvalue = $("#city option:selected").data("key");
														console.log('cityvalue = ' + cityvalue);
														$("#area").empty();
														$("#area").css("display", "inline");
														$.ajax({
															url: url,
															type: "get",
															dataType: "json",
															success: function (data) {
																eachval = data[cityvalue].AreaList;
																$.each(eachval, function (key, value) {
																	$('#area').append('<option value="' + eachval[key].AreaName + '">' + eachval[key].AreaName + '</option>')
																});
															},
															error: function () {
																alert("讀取資料失敗");
															}
														});
													});
													$("#area").change(function () {
														$.ajax({
															url: url,
															type: "get",
															dataType: "json",
															success: function (data) {
																$('input[name="address"]').show();
															},
															error: function () {
																alert("讀取資料失敗");
															}
														});
													});
												});
											</script>

											<!-- 銀行json -->
											<script>
												$(document).ready(function () {
													const url = '/json/taiwanbank.json'
													$.ajax({
														url: url,
														type: "get",
														dataType: "json",
														success: function (data) {
															$.each(data, function (key, value) {
																$('#bank').append('<option value="' + data[key].code + data[key].name + '">' + data[key].code + '-' + data[key].name + '</option>')
															})
															updateAccountInput(data);
														}
													})

													$('#bank').change(function () {
														const url = '/json/taiwanbank.json';
														$.ajax({
															url: url,
															type: "get",
															dataType: "json",
															success: function (data) {
																updateAccountInput(data);
															}
														});
													});

													function updateAccountInput(data) {
														const bankvalue = $('#bank').val();
														if (data[bankvalue]) {
															const bankcode = data[bankvalue].code + data[bankvalue].name + '-';
															$('input[name="account"]').val();
														}
													}
												})
											</script>

											<!-- 匯款方式 -->
											<script>
												$(document).ready(function () {
													$('input[name="payment[]"]').change(function () {
														if ($('input[name="payment[]"][value="2"]').is(':checked')) {
															$('.meetup-address').show();
														} else {
															$('.meetup-address').hide();
														}

														if ($('input[name="payment[]"][value="1"]').is(':checked')) {
															$('.bank-account').show();
														} else {
															$('.bank-account').hide();
														}
													})
												})
											</script>

											<!-- 團購細節confirm -->
											<script>
												$(document).ready(function () {
													$('#newgroupform').submit(function (e) {
														var gTitle = $('#gTitle').val().trim();
														var gDescription = $('#gDescription').val().trim();
														var gEndTime = $('#gEndTime').val().trim();
														var errorMessages = [];

														if (gTitle === '') {
															errorMessages.push('團購標題');
														}
														if (gDescription === '') {
															errorMessages.push('團購簡述');
														}
														if (gEndTime === '') {
															errorMessages.push('團購截止時間');
														}

														if (errorMessages.length > 0) {
															e.preventDefault();
															Swal.fire({
																title: '錯誤!',
																html: '請填寫所有必填欄位：<br>' + errorMessages.join('、'),
																icon: 'error',
																confirmButtonText: '確定'
															});
														}
													});
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

											<!-- 排序 -->
											<script>
												$(document).ready(function () {
													$('#sortOptions').change(function () {
														const sortBy = $(this).val();
														if (sortBy == 'startTime') {
															$.ajax({
																url: '/group/groupsbystimeasc',
																method: 'get',
																success: function () {
																	window.location.href = "/group/groupsbystimeasc";
																}
															})
														} else if (sortBy == 'endTime') {
															$.ajax({
																url: '/group/groupsbyetimeasc',
																method: 'get',
																success: function () {
																	window.location.href = "/group/groupsbyetimeasc";
																}
															})
														} else if (sortBy == 'origin') {
															$.ajax({
																url: '/group/groups',
																method: 'get',
																success: function () {
																	window.location.href = "/group/groups";
																}

															})
														}
													});

													$('#quickButton').click(function () {
														$('#gTitle').val('最強新北伴手禮-小潘鳳梨酥');
														$('#gDescription').val('板橋No.1伴手禮名店的「小潘蛋糕坊」，可是超適合送禮、有夠熱賣的啦，平日總是大排長龍，入手超級困難啊。');
														$('#gMinTotalAmount').val(0);
														$('#gMinTotalQuantity').val(0);
														$('#bankAccount').val('123456789123456');
														$('#groupAddress').val('中山路二段286號');
													})

													const currentUrl = window.location.href;
													if (currentUrl.includes("groupsbystimeasc")) {
														$("#sortOptions").val("startTime");
													} else if (currentUrl.includes("groupsbyetimeasc")) {
														$("#sortOptions").val("endTime");
													} else {
														$("#sortOptions").val("origin");
													}
												});
											</script>
											<!--  <script>
												$(document).ready(function () {
													const totalPages = <%= groups.getTotalPages() %>;
													const currentPage = <%= groups.getNumber() %>;
													const paginationContainer = $('.pagination');

													function createPageLink(page) {
														const li = $('<li class="page-item"></li>');
														if (page === currentPage) {
															li.addClass('active');
														}
														const a = $('<a class="page-link" href="#"></a>').text(page + 1);
														a.on('click', function (e) {
															e.preventDefault();
															window.location.href = `/group/groups?page=${page}`;
														});
														li.append(a);
														return li;
													}

													for (let i = 0; i < totalPages; i++) {
														paginationContainer.append(createPageLink(i));
													}
												})
											</script> -->

										</body>

										</html>