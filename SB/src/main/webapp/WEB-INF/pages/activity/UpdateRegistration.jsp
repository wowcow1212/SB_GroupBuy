<%@page import="com.activity.bean.EventRegistrationsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    EventRegistrationsBean registration = (EventRegistrationsBean) request.getAttribute("registration");
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>修改報名信息</title>
    <style>
        body {
            background-color: #f4f7f6;
            font-family: Arial, sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: .55rem;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
            width: 400px;
        }
        h1 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="datetime-local"] {
            width: calc(100% - 16px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn-custom {
            width: 100%;
            padding: 10px;
            background-color: #4e73df;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-custom:hover {
            background-color: #2e59d9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>修改報名信息</h1>
        <form action="UpdateRegistrations" method="post">
            <input type="hidden" name="_method" value="put">
            <input type="hidden" name="registrationID" value="<%= registration.getRegistrationID() %>">
            
            <label for="participantName">參與者姓名：</label>
            <input type="text" id="participantName" name="participantName" value="<%= registration.getParticipantName() %>" required>
            
            <label for="contactInfo">聯絡電話:</label>
            <input type="text" id="contactInfo" name="contactInfo" value="<%= registration.getContactInfo() %>" required>
            
            <label for="registrationTime">註冊時間：</label>
            <input type="datetime-local" id="registrationTime" name="registrationTime" value="${localDateTimeFormat.format(registration.registrationTime)}" readonly>
            
            <button type="submit" class="btn-custom">更新信息</button>
        </form>
    </div>
</body>
</html>
