<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<!-- 記得改 -->
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="mycss/GoalsIndex.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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



				<div class="content">
					<h2>搜尋條件</h2>
					<div class="search-container">
						<form action="queryMatchNo" method="get">
							<!-- 用user1No查詢 -->
							<span>當前使用者編號</span> <input type="text" id="user1NoInput"
								name="user1No" placeholder="請輸入當前使用者編號">
							<!-- 用matchStatus查詢 -->
							<span>配對狀態</span> <input type="text" id="matchStatusInput"
								name="matchStatus" placeholder="請輸入配對狀態">
							<button class="button select" type="submit">查詢</button>
							<!-- 刷新/查詢全部 -->
							<button class="button refresh"
								onclick="window.location.href='refreshMatches'">刷新</button>

							<a href="/newMatchPage" class="nav-link icon" id="nextPage"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-arrow-through-heart"
									viewBox="0 0 16 16">
            					<path fill-rule="evenodd"
										d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l.53-.53c-.771-.802-1.328-1.58-1.704-2.32-.798-1.575-.775-2.996-.213-4.092C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182a22 22 0 0 1-2.685-2.062l-.539.54V14a.5.5 0 0 1-.146.354zm2.893-4.894A20.4 20.4 0 0 0 8 12.71c2.456-1.666 3.827-3.207 4.489-4.512.679-1.34.607-2.42.215-3.185-.817-1.595-3.087-2.054-4.346-.761L8 4.62l-.358-.368c-1.259-1.293-3.53-.834-4.346.761-.392.766-.464 1.845.215 3.185.323.636.815 1.33 1.519 2.065l1.866-1.867a.5.5 0 1 1 .708.708z" />
        						</svg>
							</a>
						</form>
					</div>


					<div class="separator"></div>
					<button type="button" class="button insert" data-bs-toggle="modal" data-bs-target="#addModal">新增配對</button>
					<!-- 在新增交友照片右邊添加一個批量刪除按鈕 -->
					<button type="button" class="button delete-batch" data-bs-toggle="modal" data-bs-target="#deleteBatchModal">批量删除</button>


					<table>
						<thead>
							<tr>
								<!-- 顯示複選框 -->
								<th scope="col"><input type="checkbox" id="selectAll">全選</th>
								<th scope="col">配對編號</th>
								<th scope="col">當前使用者</th>
								<th scope="col">配對對象</th>
								<th scope="col">配對狀態</th>
								<th scope="col">配對時間</th>
								<th scope="col">操作</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<MatchBean> matches = (List<MatchBean>) request.getAttribute("matches");
							if (matches != null && !matches.isEmpty()) {
								for (MatchBean match : matches) {
							%>
							<tr>
								<!-- 					在每一行的 <td> 中添加一個複選框 -->
								<td><input type="checkbox" name="selectedPhotos"
									value="<%=match.getMatchNo()%>"></td>
								<td><%=match.getMatchNo()%></td>
								<td><%=match.getUser1No()%></td>
								<!-- 記得多的屬性要加 -->
								<td><%=match.getUser2No()%></td>
								<td><%=match.getMatchStatus()%></td>
								<td><%=match.getMatchedAt()%></td>
								<td>
									<button type="button" class="button update"
										data-bs-toggle="modal"
										data-bs-target="#updateModal_<%=match.getMatchNo()%>">修改</button>
									<button type="button" class="button delete"
										data-bs-dismiss="modal" data-bs-toggle="modal"
										data-bs-target="#deleteModal_<%=match.getMatchNo()%>">删除</button>
								</td>
							</tr>

							<!-- 				修改模態框 -->
							<div class="modal fade" id="updateModal_<%=match.getMatchNo()%>"
								tabindex="-1" aria-labelledby="updateModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="updateModalLabel">修改配對</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form action="updateMatch/<%=match.getMatchNo()%>"
											method="post">
											<input type="hidden" name="_method" value="put">
											<div class="modal-body">
												<div class="mb-3">
													<label for="updateMatchNo" class="form-label">配對編號</label>
													<input type="text" class="form-control" id="updateMatchNo"
														name="matchNo" value="<%=match.getMatchNo()%>" readonly>
													<label for="updateMatchStatus" class="form-label">新的配對</label>
													<input type="text" class="form-control"
														id="updateMatchStatus" name="matchStatus"
														value="<%=match.getMatchStatus()%>" required>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
												<button type="submit" class="btn btn-primary">修改</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<!-- 				刪除確認模態框 -->
							<div class="modal fade" id="deleteModal_<%=match.getMatchNo()%>"
								tabindex="-1" aria-labelledby="deleteModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">確認刪除</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											確定要刪除配對嗎? "<%=match.getMatchStatus()%>" 嗎?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<form action="deleteMatch/<%=match.getMatchNo()%>"
												method="post" style="display: inline-block;">
												<input type="hidden" name="_method" value="delete">
												<button type="submit" class="btn btn-primary">確定</button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<!--                 批量刪除的模態框 -->
							<div class="modal fade" id="deleteBatchModal" tabindex="-1"
								aria-labelledby="deleteBatchModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteBatchModalLabel">批量删除確認</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p id="deleteBatchMessage">確定要刪除嗎?</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary"
												onclick="deleteBatchMatches()">確定</button>
										</div>
									</div>
								</div>
							</div>

							<%
							}
							} else {
							%>
							<tr>
								<td colspan="7" class="text-center">
									<!-- 記得行數要改 -->
									<div class="alert alert-warning" role="alert">沒有這筆資料</div>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>

				<div class="pagination">
					<span>第</span> <input type="number" value="1"> <span>頁</span>
					<span>共</span> <span>1</span> <span>頁</span> <select>
						<option value="10">10 條/頁</option>
						<option value="20">20 條/頁</option>
						<option value="50">50 條/頁</option>
					</select>
				</div>

				<!-- 新增交友目標模態框 -->
				<div class="modal fade" id="addModal" tabindex="-1"
					aria-labelledby="addModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">

								<!-- 					帶有"X"圖標的按鈕 -->
								<h5 class="modal-title" id="addModalLabel">新增配對</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form id="addForm">
									<div class="mb-3">
										<label for="addMatchStatus" class="form-label">配對狀態名稱</label>
										<input type="text" class="form-control" id="addMatchStatus"
											name="matchStatus" required>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary"
									onclick="addMatch()">確定</button>
							</div>
						</div>
					</div>
				</div>

				<script>
    function addMatch() {
        const matchStatus = document.getElementById("addMatchStatus").value; // 修改這一行以獲取新增目標的名稱
        const formData = new FormData();
        formData.append("matchStatusParam", matchStatus);

        fetch("photos", {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                // 關閉模態框
                const modal = bootstrap.Modal.getInstance(document.getElementById('addModal'));
                modal.hide();
                
                // 重新加載頁面
                location.reload();
            } else {
                alert("Insert Failed");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("An error occurred");
        });
    }
    
    
    //----------------------
    
    // 批量刪除
    // 全選/全不選
    document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('input[name="selectedPhotos"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
    });

    // 顯示選中的交友目標列表
	function showSelectedMatches() {
   	    const selectedMatches = document.querySelectorAll('input[name="selectedMatches"]:checked');
   	    const deleteBatchMessage = document.getElementById('deleteBatchMessage');

    	if (selectedMatches.length === 0) {
        	deleteBatchMessage.textContent = '沒有選擇任何交友目標';
   	    } else {
        	deleteBatchMessage.textContent = '確定要刪除嗎?';
    	}
	}

    // 批量刪除選中的交友目標
    function deleteBatchMatches() {
        const selectedMatches = document.querySelectorAll('input[name="selectedMatches"]:checked');
        const matchNos = Array.from(selectedMatches).map(selectedMatch => selectedMatch.value);

        if (photoNos.length === 0) {
            alert('請至少選擇一個交友目標');
            return;
        }

        const formData = new FormData();
        formData.append('photoNos', photoNos);

        fetch('deleteBatchPhotos', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                // 關閉模態框
                const modal = bootstrap.Modal.getInstance(document.getElementById('deleteBatchModal'));
                modal.hide();

                // 重新加載頁面
                location.reload();
            } else {
                alert('批量刪除失敗');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('發生錯誤');
        });
    }

    // 顯示選中的交友照片列表
    document.getElementById('deleteBatchModal').addEventListener('show.bs.modal', showSelectedMatches);
    
    
    document.querySelector('.delete-batch').style.display = 'none';
    
    document.querySelector('.button.insert').style.display = 'none';



    </script>






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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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