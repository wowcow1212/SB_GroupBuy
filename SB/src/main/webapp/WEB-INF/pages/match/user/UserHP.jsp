<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.user.bean.UserBean"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>使用者管理</title>
    <link rel="stylesheet" href="mycss/GoalsIndex.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="header">
        <h1>使用者管理</h1>
        <ul class="nav">
			<li><a href="ManagerIndex">后台首頁</a></li>
            <li><a href="goalsHP">修改交友目標</a></li>
            <li><a href="#">超級管理員</a></li>
        </ul>
    </div>
    <div class="content">
        <h2>搜尋條件</h2>
        <div class="search-container">
            <form action="queryUser" method="get">
                <!-- 用使用者編號查詢 -->
                <span>使用者編號</span>
                <input type="text" id="userNoInput" name="userNo" placeholder="請輸入使用者編號">
                <!-- 用使用者暱稱查詢 -->
                <span>使用者暱稱</span>
                <input type="text" id="nickNameInput" name="nickName" placeholder="請輸入使用者暱稱">
                <button class="button select" type="submit">查詢</button>
                <!-- 刷新/查詢全部 -->
                <button class="button refresh" onclick="window.location.href='/refreshUsers'">刷新</button>
            </form>
        </div>
        <div class="separator"></div>
        <button type="button" class="button insert" data-bs-toggle="modal" data-bs-target="#addModal">新增使用者</button>
        <table>
            <thead>
                <tr>
                    <th scope="col">使用者編號</th>
                    <th scope="col">暱稱</th>
                    <th scope="col">交友目標編號</th>
                    <th scope="col">血型</th>
                    <th scope="col">MBTI</th>
                    <th scope="col">操作</th>
                </tr>
            </thead>
            <tbody>
            
                <!-- 將資料表的資料傳進UserHP.jsp -->
                <%
                List<UserBean> users = (List<UserBean>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (UserBean user : users) {
                %>
                
                <!-- 在這裡處理每一個使用者的資料 -->
                <tr>
                    <td><%=user.getUserNo()%></td>
                    <td><%=user.getNickName()%></td>
                    <td><%=user.getGoalNo()%></td>
                    <td><%=user.getBloodType()%></td>
                    <td><%=user.getMBTI()%></td>                 
                    <td>
                        <button type="button" class="button update" data-bs-toggle="modal" data-bs-target="#updateModal_<%=user.getUserNo()%>">修改</button>
                        <button type="button" class="button delete" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#deleteModal_<%=user.getUserNo()%>">删除</button>
                    </td>
                </tr>

                <!-- 修改模態框 -->
                <div class="modal fade" id="updateModal_<%=user.getUserNo()%>" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateModalLabel">修改使用者資料</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="updateUser/<%=user.getUserNo()%>" method="post">
                                <input type="hidden" name="_method" value="put">
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <input type="hidden" name="userNo" value="<%=user.getUserNo()%>">
                                        <label for="nickName" class="form-label">新的使用者暱稱</label>
                                        <input type="text" class="form-control" id="nickName" name="nickName" value="<%=user.getNickName()%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="goalNo" class="form-label">新的交友目標編號</label>
                                        <input type="text" class="form-control" id="goalNo" name="goalNo" value="<%=user.getGoalNo()%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="bloodType" class="form-label">新的血型</label>
                                        <input type="text" class="form-control" id="bloodType" name="bloodType" value="<%=user.getBloodType()%>" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="mbti" class="form-label">新的MBTI</label>
                                        <input type="text" class="form-control" id="mbti" name="mbti" value="<%=user.getMBTI()%>" required>
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


                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">
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
        <span>第</span>
        <input type="number" value="1">
        <span>頁</span>
        <span>共</span>
        <span>1</span>
        <span>頁</span>
        <select>
            <option value="10">10 條/頁</option>
            <option value="20">20 條/頁</option>
            <option value="50">50 條/頁</option>
        </select>
    </div>



    <script>
        function addUser() {
            const nickName = document.getElementById("nickName").value;
            const goalNo = document.getElementById("goalNo").value;
            const bloodType = document.getElementById("bloodType").value;
            const mbti = document.getElementById("mbti").value;
            const formData = new FormData();
            formData.append("nickName", nickName);
            formData.append("goalNo", goalNo);
            formData.append("bloodType", bloodType);
            formData.append("mbti", mbti);

            fetch("users", {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    // 關閉模態框
                    const modal = bootstrap.Modal.getInstance(document.getElementById('addModal'));
                    modal.hide();
                    
                    // 重新加載
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
    </script>
</body>
</html>
