<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.user.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>更改資料</title>
</head>

<body style="background-color: #fdf5e6">
	<div align="center">
		<h2>更改資料</h2>
		<jsp:useBean id="user" scope="request" class="com.user.bean.UserBean" />
		<%
		DateTimeFormatter birthdayDF = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'hh:mm");
		%>

		<form method="post" action="../userUpdate">
			<table>
				<tr>
					<td>使用者編號</td>
					<td><input type="text" readonly value=<%=user.getUserNo()%>
						name="userNo"></td>
				</tr>
				<tr>
					<td>使用者帳號</td>
					<td><input type="text" value=<%=user.getUserAccount()%>
						name="account"></td>
				</tr>
				<tr>
					<td>使用者密碼</td>
					<td><input type="text" value=<%=user.getUserPassword()%>
						name="password"></td>
				</tr>
				<tr>
					<td>中文姓名</td>
					<td><input type="text" value=<%=user.getUserChineseName()%>
						name="UCName"></td>
				</tr>
				<tr>
					<td>英文姓名</td>
					<td><input type="text" value=<%=user.getUserEnglishName()%>
						name="UEName"></td>
				</tr>
				<tr>
					<td>暱稱</td>
					<td><input type="text" value=<%=user.getNickName()%>
						name="nickName"></td>
				</tr>
				<tr>
					<td>頭像</td>
					<td><input type="text" value=<%=user.getAvatar()%>
						name="avatar"></td>
				</tr>
				<tr>
					<td>電子信箱</td>
					<td><input type="text" value=<%=user.getEmail()%> name="email"></td>
				</tr>
				<tr>
					<td>生日</td>
					<td><input type="date"
						value=<%=birthdayDF.format(user.getBirthday())%> name="birthday"></td>
				</tr>
				<tr>
					<td>電話</td>
					<td><input type="text" value=<%=user.getPhone()%> name="phone"></td>
				</tr>
				<tr>
					<td>住址</td>
					<td><input type="text" value=<%=user.getUserAddress()%>
						name="address"></td>
				</tr>
				<tr>
					<td>創建時間</td>
					<td><input type="datetime-local" readonly
						value=<%=df.format(user.getCreationDatetime())%> name="creationDateTime"></td>
				</tr>

				<tr>
					<td>最後登入時間</td>
					<td><input type="datetime-local" readonly
						value=<%=df.format(user.getLastLoginDatetime())%> name="lastLoginDatetime"></td>
				</tr>

				<tr>
					<td>性別</td>
					<td><select name="gender" id="">
							<%
							if (user.getGender() == 1) {
							%>
							<option selected value="1" >生理男</option>
							<option value="0">生理女</option>
							<%
							}else{
							%>
							<option value="1" >生理男</option>
							<option selected value="0">生理女</option>
							<%} %>
					</select></td>
				</tr>
				
				<tr>
					<td>交友目標編號</td>
					<td><input type="text" value=<%=user.getGoalNo()%> name="goalNo"></td>
				</tr>
				
				<tr>
					<td>血型</td>
					<td><input type="text" value=<%=user.getBloodType()%> name="bloodType"></td>
				</tr>
				
				<tr>
					<td>MBTI</td>
					<td><input type="text" value=<%=user.getMBTI()%> name="MBTI"></td>
				</tr>
				
				<tr>
					<td>是否已停權</td>
					<td><input type="text" value=<%=user.getSuspension()%> name="suspension"></td>
				</tr>
				
				<tr>
					<td>是否已驗證</td>
					<td><input type="text" readonly value=<%=user.getVerify()%> name="verify"></td>
				</tr>
				
				<tr>
					<td>是否已刪除</td>
					<td><input type="text" readonly value=<%=user.getIsDelete()%> name="isDelete"></td>
				</tr>
				
				<tr>
					<td>是否為管理者</td>
					<td><select name="isManager" id="">
							<%
							if (user.getIsManager() == 1) {
							%>
							<option selected value="1" >管理者</option>
							<option value="0">非管理者</option>
							<%
							}else{
							%>
							<option value="1" >管理者</option>
							<option selected value="0">非管理者</option>
							<%} %>
					</select></td>
				</tr>
			</table>
			
			<input type="hidden" name="_method" value="put"/>
			<input type="submit" value="更新" />
		</form>

	</div>
</body>

</html>