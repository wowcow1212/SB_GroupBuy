<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.match.bean.GoalsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改交友目標</title>
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 30vh;">

	<% GoalsBean goalbaen = (GoalsBean)request.getAttribute("goalBean"); %>
    <div>
        <h2>修改交友目標</h2>
        <form id="updateForm">
            輸入交友目標編號 : <input type="text" id="goalNo" name="goalNo" value="<%= goalbaen.getGoalNo()%>" readonly><p>
            新的交友目標 : <input type="text" id="goalName" name="goalName" value="<%= goalbaen.getGoalName()%>"><p>
            <input type="button" value="修改" onclick="updateGoal()">
        </form>
    </div>

    <script>
        function updateGoal() {
            var goalNo = document.getElementById("goalNo").value;
            var goalName = document.getElementById("goalName").value;
            var formData = new FormData();
            formData.append("goalNameParam", goalName);

            fetch("../goals/" + goalNo, {
                method: 'PUT',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    // 重新定向到首頁
                    window.location.href = "../goalsHP"; // 修改成首頁的URL
                } else {
                    alert("Update Failed");
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


