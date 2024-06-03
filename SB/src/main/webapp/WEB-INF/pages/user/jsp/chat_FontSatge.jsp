<%@page import="java.time.format.DateTimeFormatter" %>
	<%@page import="java.util.ArrayList" %>
		<%@page import="java.util.List" %>
			<%@page import="com.user.bean.UserBean" %>
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
					<%!@SuppressWarnings("unchecked")%>
					<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

						<!DOCTYPE html>
						<html lang="en">

						<head>
							<meta charset="utf-8">


							<title>聊天室</title>
							<meta name="viewport" content="width=device-width, initial-scale=1">
							<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
								rel="stylesheet">
							<style type="text/css">
								html,
								body,
								div,
								span {
									height: 100%;
									width: 100%;
									overflow: hidden;
									padding: 0;
									margin: 0;
									box-sizing: border-box;
								}

								body {
									background: url("https://www.bootdey.com/img/bgy.png") no-repeat fixed center;
									background-size: cover;
								}

								.fa-2x {
									font-size: 1.5em;
								}

								.app {
									position: relative;
									overflow: hidden;
									top: 19px;
									height: calc(100% - 38px);
									margin: auto;
									padding: 0;
									box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .06), 0 2px 5px 0 rgba(0, 0, 0, .2);
								}

								.app-one {
									background-color: #f7f7f7;
									height: 100%;
									overflow: hidden;
									margin: 0;
									padding: 0;
									box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .06), 0 2px 5px 0 rgba(0, 0, 0, .2);
								}

								.side {
									padding: 0;
									margin: 0;
									height: 100%;
								}

								.side-one {
									padding: 0;
									margin: 0;
									height: 100%;
									width: 100%;
									z-index: 1;
									position: relative;
									display: block;
									top: 0;
								}

								.side-two {
									padding: 0;
									margin: 0;
									height: 100%;
									width: 100%;
									z-index: 2;
									position: relative;
									top: -100%;
									left: -100%;
									-webkit-transition: left 0.3s ease;
									transition: left 0.3s ease;

								}


								.heading {
									padding: 10px 16px 10px 15px;
									margin: 0;
									height: 60px;
									width: 100%;
									background-color: #eee;
									z-index: 1000;
								}

								.heading-avatar {
									padding: 0;
									cursor: pointer;

								}

								.heading-avatar-icon img {
									border-radius: 50%;
									height: 40px;
									width: 40px;
								}

								.heading-name {
									padding: 0 !important;
									cursor: pointer;
								}

								.heading-name-meta {
									font-weight: 700;
									font-size: 100%;
									padding: 5px;
									padding-bottom: 0;
									text-align: left;
									text-overflow: ellipsis;
									white-space: nowrap;
									color: #000;
									display: block;
								}

								.heading-online {
									display: none;
									padding: 0 5px;
									font-size: 12px;
									color: #93918f;
								}

								.heading-compose {
									padding: 0;
								}

								.heading-compose i {
									text-align: center;
									padding: 5px;
									color: #93918f;
									cursor: pointer;
								}

								.heading-dot {
									padding: 0;
									margin-left: 10px;
								}

								.heading-dot i {
									text-align: right;
									padding: 5px;
									color: #93918f;
									cursor: pointer;
								}

								.searchBox {
									padding: 0 !important;
									margin: 0 !important;
									height: 60px;
									width: 100%;
								}

								.searchBox-inner {
									height: 100%;
									width: 100%;
									padding: 10px !important;
									background-color: #fbfbfb;
								}


								/*#searchBox-inner input {
  box-shadow: none;
}*/

								.searchBox-inner input:focus {
									outline: none;
									border: none;
									box-shadow: none;
								}

								.sideBar {
									padding: 0 !important;
									margin: 0 !important;
									background-color: #fff;
									overflow-y: auto;
									border: 1px solid #f7f7f7;
									height: calc(100% - 120px);
								}

								.sideBar-body {
									position: relative;
									padding: 10px !important;
									border-bottom: 1px solid #f7f7f7;
									height: 72px;
									margin: 0 !important;
									cursor: pointer;
								}

								.sideBar-body:hover {
									background-color: #f2f2f2;
								}

								.sideBar-avatar {
									text-align: center;
									padding: 0 !important;
								}

								.avatar-icon img {
									border-radius: 50%;
									height: 49px;
									width: 49px;
								}

								.sideBar-main {
									padding: 0 !important;
								}

								.sideBar-main .row {
									padding: 0 !important;
									margin: 0 !important;
								}

								.sideBar-name {
									padding: 10px !important;
								}

								.name-meta {
									font-size: 100%;
									padding: 1% !important;
									text-align: left;
									text-overflow: ellipsis;
									white-space: nowrap;
									color: #000;
								}

								.sideBar-time {
									padding: 10px !important;
								}

								.time-meta {
									text-align: right;
									font-size: 12px;
									padding: 1% !important;
									color: rgba(0, 0, 0, .4);
									vertical-align: baseline;
								}

								/*New Message*/

								.newMessage {
									padding: 0 !important;
									margin: 0 !important;
									height: 100%;
									position: relative;
									left: -100%;
								}

								.newMessage-heading {
									padding: 10px 16px 10px 15px !important;
									margin: 0 !important;
									height: 100px;
									width: 100%;
									background-color: #00bfa5;
									z-index: 1001;
								}

								.newMessage-main {
									padding: 10px 16px 0 15px !important;
									margin: 0 !important;
									height: 60px;
									margin-top: 30px !important;
									width: 100%;
									z-index: 1001;
									color: #fff;
								}

								.newMessage-title {
									font-size: 18px;
									font-weight: 700;
									padding: 10px 5px !important;
								}

								.newMessage-back {
									text-align: center;
									vertical-align: baseline;
									padding: 12px 5px !important;
									display: block;
									cursor: pointer;
								}

								.newMessage-back i {
									margin: auto !important;
								}

								.composeBox {
									padding: 0 !important;
									margin: 0 !important;
									height: 60px;
									width: 100%;
								}

								.composeBox-inner {
									height: 100%;
									width: 100%;
									padding: 10px !important;
									background-color: #fbfbfb;
								}

								.composeBox-inner input:focus {
									outline: none;
									border: none;
									box-shadow: none;
								}

								.compose-sideBar {
									padding: 0 !important;
									margin: 0 !important;
									background-color: #fff;
									overflow-y: auto;
									border: 1px solid #f7f7f7;
									height: calc(100% - 160px);
								}

								/*Conversation*/

								.conversation {
									padding: 0 !important;
									margin: 0 !important;
									height: 100%;
									/*width: 100%;*/
									border-left: 1px solid rgba(0, 0, 0, .08);
									/*overflow-y: auto;*/
								}

								.message {
									padding: 0 !important;
									margin: 0 !important;

									background-size: cover;
									overflow-y: auto;
									border: 1px solid #f7f7f7;
									height: calc(100% - 120px);
								}

								.message-previous {
									margin: 0 !important;
									padding: 0 !important;
									height: auto;
									width: 100%;
								}

								.previous {
									font-size: 15px;
									text-align: center;
									padding: 10px !important;
									cursor: pointer;
								}

								.previous a {
									text-decoration: none;
									font-weight: 700;
								}

								.message-body {
									margin: 0 !important;
									padding: 0 !important;
									width: auto;
									height: auto;
								}

								.message-main-receiver {
									/*padding: 10px 20px;*/
									max-width: 60%;
								}

								.message-main-sender {
									padding: 3px 20px !important;
									margin-left: 40% !important;
									max-width: 60%;
								}

								.message-text {
									margin: 0 !important;
									padding: 5px !important;
									word-wrap: break-word;
									font-weight: 200;
									font-size: 14px;
									padding-bottom: 0 !important;
								}

								.message-time {
									margin: 0 !important;
									margin-left: 50px !important;
									font-size: 12px;
									text-align: right;
									color: #9a9a9a;

								}

								.receiver {
									width: auto !important;
									padding: 4px 10px 7px !important;
									border-radius: 10px 10px 10px 0;
									background: #ffffff;
									font-size: 12px;
									text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
									word-wrap: break-word;
									display: inline-block;
								}

								.sender {
									float: right;
									width: auto !important;
									background: #dcf8c6;
									border-radius: 10px 10px 0 10px;
									padding: 4px 10px 7px !important;
									font-size: 12px;
									text-shadow: 0 1px 1px rgba(0, 0, 0, .2);
									display: inline-block;
									word-wrap: break-word;
								}


								/*Reply*/

								.reply {
									height: 60px;
									width: 100%;
									background-color: #f5f1ee;
									padding: 10px 5px 10px 5px !important;
									margin: 0 !important;
									z-index: 1000;
								}

								.reply-emojis {
									padding: 5px !important;
								}

								.reply-emojis i {
									text-align: center;
									padding: 5px 5px 5px 5px !important;
									color: #93918f;
									cursor: pointer;
								}

								.reply-recording {
									padding: 5px !important;
								}

								.reply-recording i {
									text-align: center;
									padding: 5px !important;
									color: #93918f;
									cursor: pointer;
								}

								.reply-send {
									padding: 5px !important;
								}

								.reply-send i {
									text-align: center;
									padding: 5px !important;
									color: #93918f;
									cursor: pointer;
								}

								.reply-main {
									padding: 2px 5px !important;
								}

								.reply-main textarea {
									width: 100%;
									resize: none;
									overflow: hidden;
									padding: 5px !important;
									outline: none;
									border: none;
									text-indent: 5px;
									box-shadow: none;
									height: 100%;
									font-size: 16px;
								}

								.reply-main textarea:focus {
									outline: none;
									border: none;
									text-indent: 5px;
									box-shadow: none;
								}

								@media screen and (max-width: 700px) {
									.app {
										top: 0;
										height: 100%;
									}

									.heading {
										height: 70px;
										background-color: #009688;
									}

									.fa-2x {
										font-size: 2.3em !important;
									}

									.heading-avatar {
										padding: 0 !important;
									}

									.heading-avatar-icon img {
										height: 50px;
										width: 50px;
									}

									.heading-compose {
										padding: 5px !important;
									}

									.heading-compose i {
										color: #fff;
										cursor: pointer;
									}

									.heading-dot {
										padding: 5px !important;
										margin-left: 10px !important;
									}

									.heading-dot i {
										color: #fff;
										cursor: pointer;
									}

									.sideBar {
										height: calc(100% - 130px);
									}

									.sideBar-body {
										height: 80px;
									}

									.sideBar-avatar {
										text-align: left;
										padding: 0 8px !important;
									}

									.avatar-icon img {
										height: 55px;
										width: 55px;
									}

									.sideBar-main {
										padding: 0 !important;
									}

									.sideBar-main .row {
										padding: 0 !important;
										margin: 0 !important;
									}

									.sideBar-name {
										padding: 10px 5px !important;
									}

									.name-meta {
										font-size: 16px;
										padding: 5% !important;
									}

									.sideBar-time {
										padding: 10px !important;
									}

									.time-meta {
										text-align: right;
										font-size: 14px;
										padding: 4% !important;
										color: rgba(0, 0, 0, .4);
										vertical-align: baseline;
									}

									/*Conversation*/
									.conversation {
										padding: 0 !important;
										margin: 0 !important;
										height: 100%;
										/*width: 100%;*/
										border-left: 1px solid rgba(0, 0, 0, .08);
										/*overflow-y: auto;*/
									}

									.message {
										height: calc(100% - 140px);
									}

									.reply {
										height: 70px;
									}

									.reply-emojis {
										padding: 5px 0 !important;
									}

									.reply-emojis i {
										padding: 5px 2px !important;
										font-size: 1.8em !important;
									}

									.reply-main {
										padding: 2px 8px !important;
									}

									.reply-main textarea {
										padding: 8px !important;
										font-size: 18px;
									}

									.reply-recording {
										padding: 5px 0 !important;
									}

									.reply-recording i {
										padding: 5px 0 !important;
										font-size: 1.8em !important;
									}

									.reply-send {
										padding: 5px 0 !important;
									}

									.reply-send i {
										padding: 5px 2px 5px 0 !important;
										font-size: 1.8em !important;
									}
								}
							</style>
						</head>

						<body>
							<link rel="stylesheet"
								href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
							<div class="container app">
								<div class="row app-one">
									<div class="col-sm-4 side">
										<div class="side-one">
											<div class="row heading">
												<div class="col-sm-3 col-xs-3 heading-avatar">
													<div class="heading-avatar-icon">
														<a href="/aboutMe">
															<img src="/localimages/${userBean.avatar}">
														</a>
													</div>
												</div>
												<div class="col-sm-1 col-xs-1  heading-dot  pull-right">
													<i class="fa fa-ellipsis-v fa-2x  pull-right"
														aria-hidden="true"></i>
												</div>
												<div class="col-sm-2 col-xs-2 heading-compose  pull-right">
													<i class="fa fa-comments fa-2x  pull-right" aria-hidden="true"></i>
												</div>
											</div>
											<div class="row searchBox">
												<div class="col-sm-12 searchBox-inner">
													<div class="form-group has-feedback">
														<input id="searchText" type="text" class="form-control"
															name="searchText" placeholder="Search">
														<span
															class="glyphicon glyphicon-search form-control-feedback"></span>
													</div>
												</div>
											</div>
											
											<div class="row sideBar">
												<c:forEach var="friend" items="${userFriends}">
													<div class="row sideBar-body" onclick="editChatContent(event, this, ${friend.userNo})">
														<div class="col-sm-3 col-xs-3 sideBar-avatar">
															<div class="avatar-icon">
																<img
																	src="/localimages/${friend.avatar}" id="sideBarAvatar">
															</div>
														</div>
														<div class="col-sm-9 col-xs-9 sideBar-main">
															<div class="row">
																<div class="col-sm-6 col-xs-6 sideBar-name">
																	<span class="name-meta" id="sideBarName">${friend.userChineseName}
																	</span>
																</div>
																<div class="col-sm-6 col-xs-6 pull-right sideBar-time">
																	<span class="time-meta pull-right">${localDateTimeFormat.format(friend.lastLoginDatetime)}
																	</span>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											
											</div>
										</div>
										<div class="side-two">
											<div class="row newMessage-heading">
												<div class="row newMessage-main">
													<div class="col-sm-2 col-xs-2 newMessage-back">
														<i class="fa fa-arrow-left" aria-hidden="true"></i>
													</div>
													<div class="col-sm-10 col-xs-10 newMessage-title">
														New Chat
													</div>
												</div>
											</div>
											<div class="row composeBox">
												<div class="col-sm-12 composeBox-inner">
													<div class="form-group has-feedback">
														<input id="composeText" type="text" class="form-control"
															name="searchText" placeholder="Search People">
														<span
															class="glyphicon glyphicon-search form-control-feedback"></span>
													</div>
												</div>
											</div>
											<div class="row compose-sideBar">
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar1.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar2.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar3.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar4.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar5.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar6.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar2.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar3.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar4.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
												<div class="row sideBar-body">
													<div class="col-sm-3 col-xs-3 sideBar-avatar">
														<div class="avatar-icon">
															<img
																src="https://bootdey.com/img/Content/avatar/avatar5.png">
														</div>
													</div>
													<div class="col-sm-9 col-xs-9 sideBar-main">
														<div class="row">
															<div class="col-sm-8 col-xs-8 sideBar-name">
																<span class="name-meta">John Doe
																</span>
															</div>
															<div class="col-sm-4 col-xs-4 pull-right sideBar-time">
																<span class="time-meta pull-right">18:18
																</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- 存放目前發送者的UserNo -->
									<input type="hidden" name="" id="sendOutUser" value="${userBean.userNo}">
									<!-- 存放目前接收者的UserNo -->
									<input type="hidden" name="" id="receiveUser" value="2">

									<div class="col-sm-8 conversation" id="outConversation" hidden>
										<div class="row heading">
											<div class="col-sm-2 col-md-1 col-xs-3 heading-avatar">
												<div class="heading-avatar-icon">
													<img id="chatAvatar" src="https://bootdey.com/img/Content/avatar/avatar6.png">
												</div>
											</div>
											<div class="col-sm-8 col-xs-7 heading-name">
												<a class="heading-name-meta" id="chatName">John Doe
												</a>
												<span class="heading-online">Online</span>
											</div>
											<div class="col-sm-1 col-xs-1  heading-dot pull-right">
												<i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true"></i>
											</div>
										</div>
										<div class="row message" id="conversation">
											<div class="row message-previous">
												<div class="col-sm-12 previous" style="color: #337ab7;">
													已經沒有訊息囉!
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-receiver">
													<div class="receiver">
														<div class="message-text">
															Hi, what are you doing?!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-receiver">
													<div class="receiver">
														<div class="message-text">
															Hi, what are you doing?!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">
															I am doing nothing man!
														</div>
														<span class="message-time pull-right">
															Sun
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="row reply">
											<div class="col-sm-1 col-xs-1 reply-emojis">
												<i class="fa fa-smile-o fa-2x"></i>
											</div>
											<div class="col-sm-9 col-xs-9 reply-main">
												<textarea class="form-control" rows="1" id="comment"></textarea>
											</div>
											<div class="col-sm-1 col-xs-1 reply-recording">
												<i class="fa fa-microphone fa-2x" aria-hidden="true"></i>
											</div>
											<div class="col-sm-1 col-xs-1 reply-send" onclick="send()">
												<i class="fa fa-send fa-2x" aria-hidden="true"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
							<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
							<script type="text/javascript">
								$(function () {
									$(".heading-compose").click(function () {
										$(".side-two").css({
											"left": "0"
										});
									});

									$(".newMessage-back").click(function () {
										$(".side-two").css({
											"left": "-100%"
										});
									});


									//把卷軸拉到最下面
									var scrollHeight = $("#conversation").prop("scrollHeight");
									$("#conversation").scrollTop(scrollHeight);
								})
							</script>

							<script type="text/javascript">
								var websocket = null;
								
								$(function(){
									connectWebSocket();
								});

								//連接WebSocket
								function connectWebSocket() {
									var sendOutUser = document.getElementById("sendOutUser").value;
									if (sendOutUser === "") {
										alert("請輸入用戶名稱");
										return;
									}
									//判斷當前瀏覽器是否支援websocket
									if ('WebSocket' in window) {
										websocket = new WebSocket("ws://localhost:8080/web-socket/"+document.getElementById("sendOutUser").value);
									} else {
										alert('當前瀏覽器 not support websocket')
									}
									//連接發生錯誤時回傳的方法
									websocket.onerror = function () {
										alert("連接發生錯誤");
									};
									//連接成功的回調方法
									websocket.onopen = function () {

										console.log("成功")
										var sendOutUser = document.getElementById("sendOutUser")
										sendOutUser.readOnly = true
										sendOutUser.style.backgroundColor='#ddd'
									}
									//接收到消息的回調方法
									websocket.onmessage = function (event) {
										console.log(event.data)
										innerdiv("",event.data)
									}
									//連接關閉的回調方法
									websocket.onclose = function () {
										// innerdiv("","websocket連接關閉");
									}
									//監聽視窗關閉事件，當視窗關閉時，主動去關閉websocket連接，防止連接尚未段開就關閉視窗，server端會拋出異常。
									window.onbeforeunload = function () {
										closewebsocket();
									}
								}

								//關閉連線
								function closeWebSocket() {
									websocket.close();
								}

								//發送訊息
								function send() {
									var m = new Map(); // 空Map
									var sendOutId = document.getElementById("sendOutUser")  //發送者
									var msg = document.getElementById("comment").value  //發送的訊息
									if (msg === "") {
										alert("请输入消息");
										return;
									}
									
									var receiveUser = document.getElementById("receiveUser").value //接收者
									m.set("sendOutUser",sendOutUser.value);
									m.set("msg",msg)
									
									// 接收者
									m.set("receiveUser",receiveUser)
									m.set("type",1)
									
									json = mapToJson(m)
									websocket.send(json)
									innerdiv("我",msg)

									$("#comment").val("");
								}

								//map轉成json
								function  mapToJson(map) {
									var obj= Object.create(null);
									for (var[k,v] of map) {
										obj[k] = v;
									}
									return JSON.stringify(obj);
								}

								function getCurrentTimeString(){
									let currentDate = new Date();
									let formattedDateTime = currentDate.toLocaleString('default', {
										hour12: false,
										hour: '2-digit',
										minute: '2-digit',
										second: '2-digit'
									});

									return formattedDateTime;
								};

								//顯示聊天紀錄到頁面
								function innerdiv(id,txt){
									
									var msgList = document.getElementById("conversation")
									
									var currentTime = getCurrentTimeString();
									console.log("當前時間 : " + currentTime);

									if (id === "") {
										msgList.innerHTML += `
											<div class="row message-body">
												<div class="col-sm-12 message-main-receiver">
													<div class="receiver">
														<div class="message-text">`+
															txt+
														`</div>
														<span class="message-time pull-right">`+
															currentTime+
														`</span>
													</div>
												</div>
											</div>
										`;
									}else{
										msgList.innerHTML += `
											<div class="row message-body">
												<div class="col-sm-12 message-main-sender">
													<div class="sender">
														<div class="message-text">`+
															txt +
														`</div>
														<span class="message-time pull-right">` + 
															currentTime +
														`</span>
													</div>
												</div>
											</div>
										`;
									}

									//卷軸往下推
									var scrollHeight = $("#conversation").prop("scrollHeight");
									$("#conversation").scrollTop(scrollHeight);
								}

								function formatTime(contentTime){
									console.log(contentTime); 
									const dateTime = new Date(
										contentTime[0], // 年
										contentTime[1] - 1, // 月 (0-11)
										contentTime[2], // 日
										contentTime[3], // 時
										contentTime[4], // 分
										contentTime[5]
									);

									console.log(dateTime);

									const formattedDateTime = dateTime.toLocaleString('en-US', {
										timeZone: 'Asia/Taipei', // 設定時區為台北
										hour: '2-digit',
										minute: '2-digit',
										second: '2-digit',
										hour12: false
									});


									// const formattedDateTime = dateTime.toISOString();

									return formattedDateTime;
								}
								
								function editChatContent(event, element, friendNo){
									$("#outConversation").hide(100);
									

									$("#receiveUser").val(friendNo);

									//把頭貼跟名字移過去聊天室的上面
									var name = $(element).find("#sideBarName").text();
									var avatarPath = $(element).find("#sideBarAvatar").attr('src');
									$("#chatName").text(name);
									$("#chatAvatar").attr('src', avatarPath);


									fetch("/getChatContent/" + friendNo).then(function (response) {
										if (response.status != 200) {
											console.log(response.status + " " + response.statusText);

											return;
										}

										response.json().then(function (data) {
											console.log(data);
											$("#conversation").empty();
											$("#conversation").html(`
												<div class="row message-previous">
													<div class="col-sm-12 previous" style="color: #337ab7;">
														已經沒有訊息囉!
													</div>
												</div>
											`);
											
											for(var i = 0; i < data.length; i++){
												var contentTime = formatTime(data[i].contentTime);
												if(data[i].userNo == $("#sendOutUser").val()){
													$("#conversation").append(`
														<div class="row message-body">
															<div class="col-sm-12 message-main-sender">
																<div class="sender">
																	<div class="message-text">`+
																		data[i].chatContent +
																	`</div>
																	<span class="message-time pull-right">` + 
																		contentTime +
																	`</span>
																</div>
															</div>
														</div>
													`);
												}else{
													$("#conversation").append(`
														<div class="row message-body">
															<div class="col-sm-12 message-main-receiver">
																<div class="receiver">
																	<div class="message-text">`+
																		data[i].chatContent+
																	`</div>
																	<span class="message-time pull-right">`+
																		contentTime+
																	`</span>
																</div>
															</div>
														</div>
													`);
												}
											}

											// document.querySelector("#userName").innerHTML = data.userChineseName;
											// document.querySelector("#topBarAvatar").src = "/localimages/" + data.avatar;

											// var resultText = "";
											// for (var i = 0; i < data.length; i++) {
											//     resultText += data[i].houseid + " " + data[i].housename + "<br/>";
											// }

											// document.querySelector("#result").innerHTML = resultText;
										});
									});
									
									$("#outConversation").show(500);


									//全部資料都印好後，卷軸推到底
									setTimeout(function() {
										var scrollHeight = $("#conversation").prop("scrollHeight");
										$("#conversation").scrollTop(scrollHeight);
										}, 300);
								}

								
								
							</script>
							
						</body>

						</html>