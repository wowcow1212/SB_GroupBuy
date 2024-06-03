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
<title>使用者首頁</title>
</head>

<body style="background-color: #fdf5e6">
	<div align="center">
		<h2>使用者首頁</h2>
		<jsp:useBean id="user" scope="request" class="com.user.bean.UserBean" />
		<%
		DateTimeFormatter birthdayDF = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'hh:mm");
		%>

		

	</div>
</body>

</html>