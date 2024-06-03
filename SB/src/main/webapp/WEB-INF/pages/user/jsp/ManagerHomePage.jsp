<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.user.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! @SuppressWarnings("unchecked") %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>使用者資料</title>
</head>

<body style="background-color: #fdf5e6">
	<a href="ManagerIndex">回首頁</a>
    <div align="center">
        <h2>使用者資料</h2>

        <table border="1">
        	<thead>
                <tr style="background-color: #a8fefa">
                    <th>會員編號</th>
                    <th>帳號</th>
                    <th>中文姓名</th>
                    <th>電話</th>
                    <th>創建時間</th>
                    <th>最後登入時間</th>
                    <th>性別</th>
                    <th>是否為管理員</th>
                    <th>修改</th>
                    <th>刪除</th>
                </tr>
            </thead>
            
            <tbody>
            	
            <% List<UserBean> users = (ArrayList<UserBean>)request.getAttribute("userBeans");
            	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            for(UserBean user : users){ %>
            	
            	<tr>
                	<td><%=user.getUserNo() %></td>
	                <td><%=user.getUserAccount() %></td>
	                <td><%=user.getUserChineseName() %></td>
	                <td><%=user.getPhone() %></td>
	                <td><%=df.format(user.getCreationDatetime()) %></td>
	                <td><%=df.format(user.getLastLoginDatetime()) %></td>
	                <td><%=user.getGender() == 1 ? "生理男" : "生理女" %></td>
	                <td><%=user.getIsManager() == 1 ? "是" : "否" %></td>
	                <td><a href="user/<%=user.getUserNo() %>"><button>修改</button></a></td>
<%-- 	                <td><a href="DeleteUser?userNo=<%=user.getUserNo() %>"><button>刪除</button></a></td> --%>
					
					
					<td> 
						<form action="user/<%=user.getUserNo() %>" method="post">
							<input type="hidden" name="_method" value="delete"/>
							<input type="submit" value="刪除"/>
						</form>
					</td>
	            </tr>
	            <% } %>
            </tbody>
            
            
        </table>
        
        <h2>執行結果：<%=(String)request.getAttribute("result")%>，
        異動狀態：<%=(String)request.getAttribute("changeState")%><%=(String)request.getAttribute("changeRow")%>筆，
        異動編號：<%=(String)request.getAttribute("changeNo")%></h2>
    </div>
</body>

</html>