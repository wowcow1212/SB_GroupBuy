<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交友照片</title>
<link rel="stylesheet" href="mycss/GoalsIndex.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<body>

	<div class="content">
		<h2>搜尋條件</h2>
		<div class="search-container">
			<form action="queryMatchNo" method="get">
    			<!-- 用配對編號查詢 -->
   			    <span>配對編號</span>
    			<input type="text" id="matchNoInput" name="matchNo" placeholder="請輸入配對編號">
    			<!-- 用交友圖片名稱查詢 -->
    			<span>配對狀態</span>
    			<input type="text" id="photoThemeInput" name="matchStatus" placeholder="請輸入配對狀態">
    			<button class="button select" type="submit">查詢</button>
    			<!-- 刷新/查詢全部 -->
    			<button class="button refresh" onclick="window.location.href='refreshMatches'">刷新</button>
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
 					<td><input type="checkbox" name="selectedPhotos" value="<%=match.getMatchNo()%>"></td> 
 					<td><%=match.getMatchNo()%></td> 
 					<td><%=match.getUser1No()%></td>             <!-- 記得多的屬性要加 -->
 					<td><%=match.getUser2No()%></td> 
 					<td><%=match.getMatchStatus()%></td> 
 					<td><%=match.getMatchedAt()%></td> 
 					<td>
 						<button type="button" class="button update" data-bs-toggle="modal" data-bs-target="#updateModal_<%=match.getMatchNo()%>">修改</button> 
 						<button type="button" class="button delete" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#deleteModal_<%=match.getMatchNo()%>">删除</button>
 					</td> 
   				</tr> 

<!-- 				修改模態框 -->
 				<div class="modal fade" id="updateModal_<%=match.getMatchNo()%>" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true"> 
 					<div class="modal-dialog"> 
 						<div class="modal-content"> 
 							<div class="modal-header"> 
 								<h5 class="modal-title" id="updateModalLabel">修改配對</h5> 
 								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
 							</div> 
 							<form action="updateMatch/<%=match.getMatchNo()%>" method="post"> 
 								<input type="hidden" name="_method" value="put"> 
 								<div class="modal-body"> 
 									<div class="mb-3"> 
 											<label for="updateMatchNo" class="form-label">配對編號</label>  
 											<input type="text" class="form-control" id="updateMatchNo" name="matchNo" value="<%=match.getMatchNo()%>" readonly> 
 											<label for="updateMatchStatus" class="form-label">新的配對</label>  
 											<input type="text" class="form-control" id="updateMatchStatus" name="matchStatus" value="<%=match.getMatchStatus()%>" required> 
 									</div> 
 								</div> 
 								<div class="modal-footer"> 
 									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button> 
 									<button type="submit" class="btn btn-primary">修改</button> 
 								</div> 
 							</form> 
 						</div> 
 					</div> 
 				</div> 

<!-- 				刪除確認模態框 -->
 				<div class="modal fade" id="deleteModal_<%=match.getMatchNo()%>" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true"> 
 					<div class="modal-dialog"> 
 						<div class="modal-content"> 
 							<div class="modal-header"> 
 								<h5 class="modal-title" id="deleteModalLabel">確認刪除</h5> 
 								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
 							</div> 
 							<div class="modal-body">確定要刪除配對嗎? "<%=match.getMatchStatus()%>" 嗎? 
 							</div> 
 							<div class="modal-footer"> 
 								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button> 
 								<form action="deleteMatch/<%=match.getMatchNo()%>" method="post" style="display: inline-block;"> 
 									<input type="hidden" name="_method" value="delete"> 
 									<button type="submit" class="btn btn-primary">確定</button> 
 								</form> 
 							</div> 
 						</div> 
 					</div> 
 				</div> 

<!--                 批量刪除的模態框 -->
 			   <div class="modal fade" id="deleteBatchModal" tabindex="-1" aria-labelledby="deleteBatchModalLabel" aria-hidden="true"> 
     	   			<div class="modal-dialog"> 
         	 		   <div class="modal-content"> 
            				    <div class="modal-header"> 
                 				<h5 class="modal-title" id="deleteBatchModalLabel">批量删除確認</h5> 
                				    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
             				</div> 
             				<div class="modal-body"> 
                 				<p id="deleteBatchMessage">確定要刪除嗎?</p> 
            				    </div> 
            				    <div class="modal-footer"> 
               				   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button> 
                 			   <button type="button" class="btn btn-primary" onclick="deleteBatchMatches()">確定</button> 
             			        </div> 
       					    </div>
    				       </div> 
 			      </div> 

				<%
					}
				} else {
				%>
				<tr>
					<td colspan="7" class="text-center">                         <!-- 記得行數要改 -->
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
 					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
 				</div> 
 				<div class="modal-body"> 
 					<form id="addForm"> 
 						<div class="mb-3"> 
 							<label for="addMatchStatus" class="form-label">配對狀態名稱</label> 
 						    <input type="text" class="form-control" id="addMatchStatus" name="matchStatus" required> 
 						</div> 
 					</form> 
 				</div> 
 				<div class="modal-footer"> 
 					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button> 
 					<button type="button" class="btn btn-primary" onclick="addMatch()">確定</button> 
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

    </script>
</body>
</html>
