<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新增交友目標</title>
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 30vh;">
    <div>
        <h2>新增交友目標</h2>
        <form id="addForm">
            新增交友目標 : <input type="text" id="goalName" name="goalName"><p>
            <input type="button" value="確定" onclick="addGoal()">
        </form>
    </div>

    <script>
        function addGoal() {
            var goalName = document.getElementById("goalName").value;
            var formData = new FormData();
            formData.append("goalNameParam", goalName);

            fetch("goals", {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    // 重新定向到首頁
                    window.location.href = "goalsHP"; // 修改成首頁的URL
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
