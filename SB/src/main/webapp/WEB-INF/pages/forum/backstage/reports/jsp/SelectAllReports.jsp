<%@ page import="com.forum.bean.ReportsBean" %>
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

				<title>檢舉管理</title>

				<!-- Custom fonts for this template-->
				<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
				<link
					href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
					rel="stylesheet">

				<!-- Custom styles for this template-->
				<link href="/css/sb-admin-2.min.css" rel="stylesheet">

				<!-- DataTables CSS -->
				<link rel="stylesheet" type="text/css"
					href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

				<link rel="stylesheet" type="text/css" href="/mycss/forumBackstage.css">

				<style>
					/* 將標題和按鈕包裹在同一個容器中 */
					.title-and-button {
						display: flex;
						/* 使用 Flexbox 佈局 */
						flex-direction: column;
						/* 垂直佈局 */
						align-items: center;
						/* 將內容水平居中對齊 */
					}

					/* 調整標題的底部間距 */
					.title-and-button h1 {
						margin-bottom: 10px;
						/* 調整標題底部間距 */
					}
				</style>

			</head>

			<body id="page-top">

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

							<!--  
				    <form method="get" action="/reports/AllReports">
				        <button type="submit">檢舉紀錄</button>
				    </form>
				-->

							<div class="title-and-button">
								<h1>全部檢舉管理</h1>


							</div>

							<div class="table-container">
								<table id="reportsTable">
									<thead>
										<tr>
											<th>文章標題</th>
											<th>文章內容</th>
											<th>文章圖片</th>
											<th>檢舉人</th>
											<th>檢舉人信箱</th>
											<th>檢舉原因</th>
											<th>檢舉日期</th>
											<th>刪除</th>
										</tr>
									</thead>

									<tbody>
										<c:if test="${not empty reportsM}">
											<c:forEach var="reports" items="${reportsM}">
												<tr>
													<td>
														<c:out value="${reports.postsBean.title}" />
													</td>
													<td class="content" data-toggle="modal" data-target="#contentModal"
														data-content="${reports.postsBean.content}">
														<c:out value="${reports.postsBean.content}" />
													</td>
													<td class="image-cell" data-image-url="${reports.postsBean.image_url}"></td>
													<td>
														<c:out value="${reports.userBean.userChineseName}" />
													</td>
													<td>
														<c:out value="${reports.userBean.email}" />
													</td>
													<td class="reason-content" data-toggle="modal"
														data-target="#reasonModal" data-reason="${reports.reason}">
														<c:out value="${reports.reason}" />
													</td>
													<td>
														<c:out value="${reports.report_date}" />
													</td>

													<td>
														<form method="post" action="/reports/DeleteReportsForAll"
															onsubmit="return confirm('確定要刪除嗎？');">
															<input type="hidden" name="postNo"
																value="${reports.postsBean.post_no}">
															<input type="hidden" name="reportNo"
																value="${reports.report_no}">
															<input type="hidden" name="categoryNo"
																value="${reports.postsBean.categoriesBean.category_no}">
															<input type="hidden" name="_method" value="delete">
															<button type="submit" class="btn-red">刪除</button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty reportsM}">
											<tr>
												<td colspan="7">尚無資料</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<!-- 文章內容模態框 -->
								<div class="modal fade" id="contentModal" tabindex="-1" role="dialog"
									aria-labelledby="contentModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="contentModalLabel">文章內容</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p id="contentModalBody"></p>
											</div>
										</div>
									</div>
								</div>

								<!-- 檢舉原因模態框 -->
								<div class="modal fade" id="reasonModal" tabindex="-1" role="dialog"
									aria-labelledby="reasonModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="reasonModalLabel">檢舉原因</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p id="reasonModalBody"></p>
											</div>
										</div>
									</div>
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

				<!-- 引入 jQuery -->
				<script type="text/javascript" charset="utf8"
					src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

				<!-- 引入 DataTables JS -->
				<script type="text/javascript" charset="utf8"
					src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

				<!-- DataTables initialization -->
				<!-- DataTables initialization -->
				<script>
					$(document).ready(function () {
						$('#reportsTable').DataTable(); // 初始化 DataTables
					});
				</script>

				<script>
					// 顯示文章內容
					$('.content').click(function () {
						var content = $(this).data('content');
						$('#contentModalBody').text(content);
						$('#contentModal').modal('show');
					});

					// 顯示檢舉原因
					$('.reason-content').click(function () {
						var reason = $(this).data('reason');
						$('#reasonModalBody').text(reason);
						$('#reasonModal').modal('show');
					});
					
					//跳視窗顯示圖片
					document.addEventListener("DOMContentLoaded", function() {
					    var imageCells = document.querySelectorAll(".image-cell");
					    imageCells.forEach(function(cell) {
					        var imageUrl = cell.getAttribute("data-image-url");
					        if (imageUrl) {
					            var link = document.createElement('a');
					            link.href = 'javascript:void(0);'; 
					            link.addEventListener('click', function() {
					                var popup = window.open('', 'popup', 'width=400,height=400');
					                popup.document.body.innerHTML = '<img src="http://localhost:8080/localimages/' + imageUrl + '" style="max-width:100%; max-height:100%;">';
					            });
					            link.textContent = "查看圖片";
					            cell.appendChild(link); 
					        } else {
					            cell.textContent = "無圖片";
					        }
					    });
					});
				</script>


			</body>

			</html>