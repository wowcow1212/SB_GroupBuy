<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.SocialPhotosBean"%>
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
	<div class="header">
		<h1>交友照片</h1>
		<ul class="nav">
			<li><a href="ManagerIndex">后台首頁</a></li>
			<li><a href="userHP">修改使用者個性</a></li>
			<li><a href="#">超級管理員</a></li>
		</ul>
	</div>


	<div class="content">
		<h2>搜尋條件</h2>
		<div class="search-container">
			<form action="queryPhotoNo" method="get">                               <!-- 查詢編號+姓名 -->
				<!-- 用交友圖片編號查詢 -->
				<span>交友照片編號</span> <input type="text" id="photoNoInput"
					name="photoNo" placeholder="請輸入交友照片編號">
				<!-- 用交友圖片名稱查詢 -->
				<span>交友照片名稱</span> <input type="text" id="photoThemeInput"
					name="photoTheme" placeholder="請輸入交友照片名稱">
				<button class="button select" type="submit">查詢</button>
				<!-- 刷新/查詢全部 -->
				<button class="button refresh"
					onclick="window.location.href='/refreshPhotos'">刷新</button>
			</form>
		</div>
		
		
		<div class="separator"></div>
		<button type="button" class="button insert" data-bs-toggle="modal" data-bs-target="#addModal">新增交友照片</button>
		<!-- 在新增交友照片右邊添加一個批量刪除按鈕 -->
		<button type="button" class="button delete-batch" data-bs-toggle="modal" data-bs-target="#deleteBatchModal">批量删除</button>


		<table>
			<thead>
				<tr>
					<!-- 顯示複選框 -->
					<th scope="col"><input type="checkbox" id="selectAll">全選</th>
					<th scope="col">使用者編號</th>
					<th scope="col">交友照片編號</th>
					<th scope="col">交友照片主題名稱</th>
					<th scope="col">交友照片</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody>
 				<% 
   				List<SocialPhotosBean> photos = (List<SocialPhotosBean>) request.getAttribute("photos");
 				if (photos != null && !photos.isEmpty()) {
 					for (SocialPhotosBean photo : photos) {
 				%> 
 				<tr> 
<!-- 					在每一行的 <td> 中添加一個複選框 -->
 					<td><input type="checkbox" name="selectedPhotos" value="<%=photo.getPhotoNo()%>"></td> 
 					<td><%=photo.getUserNo()%></td> 
 					<td><%=photo.getPhotoNo()%></td>             <!-- 記得多的屬性要加 -->
 					<td><%=photo.getPhotoTheme()%></td>      
 					<td><img src="<%=photo.getPhotoPath()%>" alt="交友照片" width="100" height="100"></td>
 					<td>
 						<button type="button" class="button update" data-bs-toggle="modal" data-bs-target="#updateModal_<%=photo.getPhotoNo()%>">修改</button> 
 						<button type="button" class="button delete" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#deleteModal_<%=photo.getPhotoNo()%>">删除</button>
 					</td> 
   				</tr> 

<!-- 				修改模態框 -->
 				<div class="modal fade" id="updateModal_<%=photo.getPhotoNo()%>" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true"> 
 					<div class="modal-dialog"> 
 						<div class="modal-content"> 
 							<div class="modal-header"> 
 								<h5 class="modal-title" id="updateModalLabel">修改交友照片</h5> 
 								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
 							</div> 
 							<form action="updatePhoto/<%=photo.getPhotoNo()%>" method="post"> 
 								<input type="hidden" name="_method" value="put"> 
 								<div class="modal-body"> 
 									<div class="mb-3"> 
 											<label for="updatePhotoNo" class="form-label">交友照片編號</label>  
 											<input type="text" class="form-control" id="updatePhotoNo" name="photoNo" value="<%=photo.getPhotoNo()%>" readonly> 
 											<label for="updatePhotoTheme" class="form-label">新的交友照片</label>  
 											<input type="text" class="form-control" id="updatePhotoTheme" name="photoTheme" value="<%=photo.getPhotoTheme()%>" required> 
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
 				<div class="modal fade" id="deleteModal_<%=photo.getPhotoNo()%>" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true"> 
 					<div class="modal-dialog"> 
 						<div class="modal-content"> 
 							<div class="modal-header"> 
 								<h5 class="modal-title" id="deleteModalLabel">確認刪除</h5> 
 								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
 							</div> 
 							<div class="modal-body">確定要刪除交友照片嗎? "<%=photo.getPhotoTheme()%>" 嗎? 
 							</div> 
 							<div class="modal-footer"> 
 								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button> 
 								<form action="deletePhoto/<%=photo.getPhotoNo()%>" method="post" style="display: inline-block;"> 
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
                 			   <button type="button" class="btn btn-primary" onclick="deleteBatchPhotos()">確定</button> 
             			        </div> 
       					    </div>
    				       </div> 
 			      </div> 

				<%
					}
				} else {
				%>
				<tr>
					<td colspan="6" class="text-center">             <!-- 記得行數要改 -->
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
 					<h5 class="modal-title" id="addModalLabel">新增交友照片</h5> 
 					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
 				</div> 
 				<div class="modal-body"> 
 					<form id="addForm"> 
 						<div class="mb-3"> 
 							<label for="addPhotoTheme" class="form-label">交友照片名稱</label> 
 						    <input type="text" class="form-control" id="addPhotoTheme" name="photoTheme" required> 
 						</div> 
 					</form> 
 				</div> 
 				<div class="modal-footer"> 
 					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button> 
 					<button type="button" class="btn btn-primary" onclick="addPhoto()">確定</button> 
 				</div> 
 			</div> 
 		</div> 
 	</div> 

	<script>
    function addPhoto() {
        const photoTheme = document.getElementById("addPhotoTheme").value; // 修改這一行以獲取新增目標的名稱
        const formData = new FormData();
        formData.append("photoThemeParam", photoTheme);

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
	function showSelectedPhotos() {
   	    const selectedPhotos = document.querySelectorAll('input[name="selectedGoals"]:checked');
   	    const deleteBatchMessage = document.getElementById('deleteBatchMessage');

    	if (selectedGoals.length === 0) {
        	deleteBatchMessage.textContent = '沒有選擇任何交友目標';
   	    } else {
        	deleteBatchMessage.textContent = '確定要刪除嗎?';
    	}
	}

    // 批量刪除選中的交友目標
    function deleteBatchPhotos() {
        const selectedPhotos = document.querySelectorAll('input[name="selectedPhotos"]:checked');
        const photoNos = Array.from(selectedPhotos).map(selectedPhoto => selectedPhoto.value);

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
    document.getElementById('deleteBatchModal').addEventListener('show.bs.modal', showSelectedPhotos);

    </script>
</body>
</html>
