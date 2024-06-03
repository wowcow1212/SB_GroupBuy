<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--FontAwesome圖標字體-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>
<!--Hammer.js庫來處理手勢事件-->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
	integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">

<title>Document</title>
<style>
* {
	margin: 0px;
	padding: 0px;
} /*leftside*/
* {
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100vh;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

button {
	outline: none;
	transition: .2s;
	cursor: pointer;
	&:
	hover
	{
	opacity
	:
	.7;
}

}
body {
	--app-background: #eaebf5;
	--chat-background: #fff;
	--link-color: #c0c1c5;
	--navigation-bg: #fff;
	--navigation-box-shadow: 0 2px 6px 0 rgba(136, 148, 171, 0.2), 0 24px
		20px -24px rgba(71, 82, 107, 0.1);
	--main-color: #3d42df;
	--message-bg: #f3f4f9;
	--message-bg-2: #3d42df;
	--message-text: #2c303a;
	--placeholder-text: #a2a4bc;
	--button-bg: #fff;
}

body.dark {
	--app-background: #262a42;
	--navigation-box-shadow: 0px 0px 8px 0px #282b33;
	--chat-background: #3c3f56;
	--message-bg: #2c3046;
	--message-text: rgba(255, 255, 255, 0.8);
	--placeholder-text: #fff;
	--navigation-bg: #3c3f56;
	--button-bg: #3c3f56;
	--main-color: #6f74ff;
	--message-bg-2: #6f74ff;
	.
	mic
	{
	background-image
	:
	url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-mic-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M9 9v3a3 3 0 005.12 2.12M15 9.34V4a3 3 0 00-5.94-.6'/%3E%3Cpath d='M17 16.95A7 7 0 015 12v-2m14 0v2a7 7 0 01-.11 1.23M12 19v4M8 23h8'/%3E%3C/svg%3E%0A")
	;
}

.camera {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-camera-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M21 21H3a2 2 0 01-2-2V8a2 2 0 012-2h3m3-3h6l2 3h4a2 2 0 012 2v9.34m-7.72-2.06a4 4 0 11-5.56-5.56'/%3E%3C/svg%3E%0A");
}

.maximize {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-maximize' viewBox='0 0 24 24'%3E%3Cpath d='M8 3H5a2 2 0 00-2 2v3m18 0V5a2 2 0 00-2-2h-3m0 18h3a2 2 0 002-2v-3M3 16v3a2 2 0 002 2h3'/%3E%3C/svg%3E%0A");
}

.magnifier {
	color: #fff;
}

.chat-header {
	border-color: var(--message-bg);
}

.btn-close-right {
	color: #fff;
}

}
a {
	text-decoration: none;
}

.app-container {
	background-color: var(--app-background);
	width: 100%;
	height: 100%;
	font-family: 'DM Sans', sans-serif;
	display: flex;
	transition: .2s;
}

/*可以刪*/
.left-side {
	position: relative;
	padding: 16px;
	flex-basis: 120px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
}

.navigation {
	display: flex;
	flex-direction: column;
	background-color: var(--navigation-bg);
	padding: 24px;
	border-radius: 10px;
	box-shadow: var(--navigation-box-shadow);
}

.nav-link+.nav-link {
	margin-top: 32px;
}

.nav-link:hover svg {
	color: #3d42df;
}

.icon svg {
	width: 24px;
	height: 24px;
	color: var(--link-color);
	transition: .2s ease-in;
}

/*右邊欄位*/
.right-side {
	margin-left: auto;
	flex-basis: 400px;
	height: 80%;
	padding: 16px;
	right: 98px; /*調位置*/
	top: 6.39%;
	position: relative;
	transition: all 300ms cubic-bezier(0.190, 1.000, 0.560, 1.000); &. show
	{ display : block;
	transform: translateX(0);
}

}

/*右下的聊天框*/
.chat-container {
	background-color: var(--chat-background);
	border-radius: 10px;
	display: flex; /*將容器設置為使用彈性布局*/
	flex-direction: column; /*將子元素排列方向設置為垂直，這樣子元素會垂直堆疊*/
	height: calc(100% - 72px); /*設置容器的高度為當前視窗高度減去 72px*/
}

.chat-header {
	padding: 16px;
	border-bottom: 1px solid #f5f5f5;
}

.chat-header-button {
	background-color: var(--main-color);
	padding: 12px 16px 12px 40px;
	border: none;
	border-radius: 4px;
	color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg viewBox='0 0 512 512' xmlns='http://www.w3.org/2000/svg' fill='%23fff'%3E%3Cpath d='M479.9 187.52l-90.19 68.53v-52.6a20 20 0 00-20-20H20a20 20 0 00-20 20V492a20 20 0 0020 20h349.71a20 20 0 0020-20v-52.6l90.18 68.52c13.05 9.91 32.1.67 32.1-15.92V203.45c0-16.5-18.94-25.92-32.1-15.93zM349.7 472H40V223.45h309.71zM472 451.68l-82.29-62.53V306.3L472 243.77zM87.96 79.24C129.62 28.88 190.86 0 256 0c65.13 0 126.37 28.88 168.03 79.24a20 20 0 01-30.82 25.5A177.6 177.6 0 00256 40a177.6 177.6 0 00-137.21 64.73 20 20 0 11-30.83-25.5zm240.36 32.21a20 20 0 11-21.02 34.03 97.57 97.57 0 00-51.3-14.53 97.6 97.6 0 00-51.31 14.53 20 20 0 11-21.02-34.03A137.53 137.53 0 01256 90.95c25.59 0 50.6 7.09 72.32 20.5zm0 0'/%3E%3C/svg%3E%0A");
	background-repeat: no-repeat;
	background-position: center left 12px;
	background-size: 16px;
	font-size: 14px;
}

.chat-area {
	flex: 1;
	overflow-y: auto;
	padding: 16px;
}

.profile-picture {
	border-radius: 8px;
	width: 32px;
	height: 32px;
	overflow: hidden;
	margin-right: 12px;
	flex-shrink: 0; img { width : 100%;
	height: 100%;
	object-fit: cover;
}

}
.message-wrapper {
	display: flex;
}

.name {
	margin: 0;
	line-height: 16px;
	font-size: 12px;
	font-weight: 700;
	color: var(--message-text);
}

.rightmessage {
	margin-top: 8px;
	background-color: var(--message-bg);
	padding: 8px 16px;
	border-radius: 0 12px 12px 12px;
	font-size: 12px;
	line-height: 16px;
	max-width: calc(100% - 32px);
	color: var(--message-text);
}

.message-wrapper {
	padding: 16px 0; &. reverse { flex-direction : row-reverse; . message {
	background-color : var( --message-bg-2);
	color: #fff;
	margin-left: auto;
	border-radius: 16px 0px 16px 16px;
}

.profile-picture {
	margin-right: 0px;
	margin-left: 12px;
}

.name {
	text-align: right;
}

}
}
.message-file {
	border: 1px solid var(--message-bg);
	width: 100%;
	margin-top: 16px;
	border-radius: 4px;
	padding: 8px;
	display: flex; . sketch { border-radius : 4px;
	padding: 2px;
	background-color: #fdeee2;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 32px;
	height: 32px; svg { width : 20px;
	height: 20px;
}

}
}
.file-info {
	flex: 1;
	padding: 0 40px 0 8px;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23b8b8b8' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-download' viewBox='0 0 24 24'%3E%3Cpath d='M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4M7 10l5 5 5-5M12 15V3'/%3E%3C/svg%3E%0A");
	background-position: center right 12px;
	background-size: 20px;
	background-repeat: no-repeat;
	font-size: 12px;
}

.file-name {
	color: var(--message-text);
}

.file-size {
	color: #b8b8b8;
}

.mention {
	color: #7c80fd;
}

.chat-typing-area-wrapper {
	padding: 16px;
}

.chat-typing-area {
	display: flex;
	border-radius: 10px;
	padding: 8px;
	box-shadow: var(--navigation-box-shadow);
	background-color: var(--message-bg);
	.
	dark
	&
	{
	box-shadow
	:
	none;
}

}
.chat-input {
	border: none;
	font-size: 14px;
	line-height: 24px;
	outline: none;
	color: var(--message-text);
	flex: 1;
	background-color: transparent;
	&:
	placeholder
	{
	color
	:
	var(
	--placeholder-text
	);
}

}
.send-button {
	color: #fff;
	background-color: var(--main-color);
	border-radius: 8px;
	border: none;
	width: 32px;
	height: 32px;
	display: flex;
	justify-content: center;
	align-items: center; svg { width : 20px;
	height: 20px;
}

}
.app-main {
	flex: 1;
	width: 100%;
	padding: 72px 32px 16px 32px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/*調整圖片框的大小*/
.video-call-wrapper {
	width: 75%;
	height: 100%;
	border-radius: 16px;
	overflow: hidden;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row; /* 水平排列 */
	box-shadow: 4px 4px 12px -2px rgba(20%, 20%, 40%, 0.5);
	z-index: 2; /* 設置較高的 z-index 值 */ /*想讓陰影出來外面*/
}

.video-participant {
	width: 50%;
	height: 25%;
	position: relative; img { width : 100%;
	height: 100%;
	object-fit: cover;
}

}
.name-tag {
	position: absolute;
	bottom: 12px;
	right: 12px;
	font-size: 12px;
	color: #fff;
	background-color: rgba(0, 15, 47, 0.5);
	border-radius: 4px;
	padding: 4px 12px;
}

.participant-actions {
	position: absolute;
	display: flex;
	left: 12px;
	top: 12px;
}

.btn-mute, .btn-camera {
	width: 32px;
	height: 32px;
	border-radius: 4px;
	background-color: rgba(0, 15, 47, 0.5);
	background-repeat: no-repeat;
	background-position: center;
	background-size: 16px;
	border: none;
}

.btn-mute {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-mic-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M9 9v3a3 3 0 005.12 2.12M15 9.34V4a3 3 0 00-5.94-.6'/%3E%3Cpath d='M17 16.95A7 7 0 015 12v-2m14 0v2a7 7 0 01-.11 1.23M12 19v4M8 23h8'/%3E%3C/svg%3E%0A");
	margin-right: 4px;
}

.btn-camera {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-camera-off' viewBox='0 0 24 24'%3E%3Cpath d='M1 1l22 22M21 21H3a2 2 0 01-2-2V8a2 2 0 012-2h3m3-3h6l2 3h4a2 2 0 012 2v9.34m-7.72-2.06a4 4 0 11-5.56-5.56'/%3E%3C/svg%3E%0A");
}

.video-call-actions {
	display: flex;
	align-items: center;
	padding-top: 64px;
	max-width: 500px;
}

.video-action-button {
	background-repeat: no-repeat;
	background-size: 24px;
	border: none;
	height: 48px;
	margin: 0 8px;
	box-shadow: var(--navigation-box-shadow);
	border-radius: 8px;
	width: 48px;
	cursor: pointer;
	outline: none;
	background-color: var(--button-bg); span { display : block;
	margin: 0 16px;
}

}

/*太陽*/
.participants {
	display: flex;
	background-color: var(--button-bg);
	box-shadow: var(--navigation-box-shadow);
	margin-top: 16px;
	padding: 12px;
	border-radius: 8px;
	max-width: 232px;
	margin-left: auto;
}

.participant-more {
	background-color: #e1e0e1;
	font-size: 14px;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #636181;
	font-weight: 700;
	border-radius: 8px;
	min-width: 32px;
}

.mode-switch {
	z-index: 1;
	position: absolute;
	top: 20px;
	left: 36px;
	background-color: var(--chat-background);
	border: none;
	color: #ddd;
	outline: none;
	cursor: pointer;
	box-shadow: var(--navigation-box-shadow);
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 36px;
	height: 36px;
	transform-origin: center; svg { width : 0;
	height: 24px;
	transition: all .3s ease-in;
	transform-origin: center;
}

.moon {
	opacity: 0;
}

.sun {
	width: 24px;
}

}
.dark .moon {
	opacity: 1;
	width: 24px;
}

.dark .sun {
	opacity: 0;
	width: 0;
}

.expand-btn {
	position: absolute;
	right: 32px;
	top: 24px;
	border: none;
	background-color: var(--chat-background);
	border-radius: 4px;
	padding: none;
	color: var(--message-text);
	width: 40px;
	height: 40px;
	justify-content: center;
	align-items: center;
	display: none;
	&.
	show
	{
	display
	:
	flex;
}

}
.btn-close-right {
	border: none;
	background-color: transparent;
	position: absolute;
	top: 24px;
	right: 24px;
	color: var(--light-font);
	outline: none;
	cursor: pointer;
	display: none;
}

@media screen and (max-width: 900px) {
	.expand-btn {
		display: block;
	}
	.right-side {
		position: absolute;
		right: 0px;
		background-color: var(--chat-background);
		transform: translateX(100%); /*調上下*/
		z-index: 2;
		width: 100%;
		&.
		show
		{
		transform
		:
		translateX(
		0
		);
	}
}

.btn-close-right {
	display: block;
}

}
@media screen and (max-width: 520px) {
	.left-side {
		display: none;
	}
	.app-main {
		padding: 72px 16px 16px 16px;
	}
	.expand-btn {
		right: 16px;
	}
	.mode-switch {
		left: 16px;
	}
	.video-action-button {
		width: 32px;
		height: 32px;
		background-size: 14px;
		margin: 0 4px;
	}
	.video-action-button.endcall {
		background-size: 14px;
		font-size: 12px;
		padding-left: 36px;
	}
	.video-action-button.magnifier svg {
		width: 14px;
	}
	.video-action-button.magnifier span {
		margin: 0 4px;
		font-size: 12px;
	}
}

@media screen and (max-width: 520px) and (max-height: 720px) {
	.video-participant {
		width: 50%;
		height: 33.3%;
	}
}

*, *:before, *:after {
	box-sizing: border-box;
}

body {
	background-color: #f4efef;
}

img {
	max-width: auto;
	height: auto;
}

/*調整輪播大小*/
.card-container {
	position: absolute;
	max-width: 849.5px; /*調框的寬度*/
	width: 60%;
	height: 75.8%; /*框跟圖片調這個-裡面全部圖片的長寬*/
	top: 0;
	left: 0;
	pointer-events: none;
	margin: auto;
}

/*調整輪播區塊*/
.carousel {
	position: absolute;
	width: 100%;
	height: 100%;
	pointer-events: auto;
	margin-top: 0px;
	margin-bottom: 67px;
	overflow: hidden;
	border-radius: 16px;
	/* 確保圖片不會溢出框 */
	font-size: 0; /*去掉全部的圖片間距，以及圓角套到全部*/
	box-shadow: 4px 4px 12px -2px rgba(20%, 20%, 40%, 0.5);
	z-index: 2; /* 設置較高的 z-index 值 */ /*想讓陰影出來外面*/
	top: 80px;
	left: 60%; /* 調整這個值來控制距離左側的距離 */
	transition: transform 0.5s ease-in-out;
	background-color: #EAEBF5;
	/*background-color: rgba(255, 255, 255, 0.8);  /*設置背景不透明度*/
}

.carousel img {
	height: 400px; /* 設定 carousel 區塊高度 */ /*框跟圖片調這個-裡面全部圖片的長寬*/
	overflow: hidden; /* 隱藏超出區塊的部分 */
	object-fit: cover; /* 圖片保持比例填滿容器 */
}

@media screen and (max-width: 1200px) {
	.container {
		max-width: 100%;
	}
}

@media screen and (max-width: 1024px) {
	.carousel img {
		width: 100%;
	}
}

.carousel.removed {
	transform: translateX(-100%) rotateY(-30deg) scale(0.9);
	transition: transform 0.5s;
	opacity: 0;
	pointer-events: none;

	/*transform: translateX(-100vw);*/
}

.carousel.loved {
	transform: translateX(100%) rotateY(30deg) scale(0.9);
	transition: transform 0.5s;
	opacity: 0;
	pointer-events: none;

	/*transform: translateX(100vw);*/
}

/*上面的按紐*/
.nav-link:hover svg { /*按鈕移上去顏色*/
	color: #A2ABB0;
}

.icon svg { /*按鈕大小*/
	width: 35px;
	height: 35px;
	color: var(--link-color);
	transition: .2s ease-in;
}

#home {
	margin-left: 38px;
	position: absolute; /* 將按鈕設為絕對定位 */
	top: 23px; /* 距頂部 20px */
	left: 110px; /* 距左側 0px */
}

#edit {
	margin-left: 38px;
	position: absolute; /* 將按鈕設為絕對定位 */
	top: -9.5px; /* 距頂部 20px */
	left: 190px; /* 距左側 0px */
}

#leftmenu {
	height: 69px;
	width: 290px; /*可以調垂直或是水平*/
	/*border-bottom:1px solid #d8dfe3;/	/*底下的水平線*/
}

#leftmenu span {
	float: left; /*按鈕排列順序*/
	width: 96px;
	height: 100px;
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/top-menu.png")
		-3px -118px no-repeat;
	cursor: pointer; /*滑鼠移上去變手的圖案*/
	position: relative;
	/* 為了使用 left 屬性，需要设置 position 為 relative 或 absolute */
	left: 18px; /* 負值表示向左移動 */
	top: 3px;
}

/*調整左邊欄位裡面按鈕的位置*/
#leftmenu span.friends {
	margin-bottom: -1px;
}

#leftmenu span.chats {
	background-position: -95px 25px;
	cursor: pointer;
}

#leftmenu span.chats:hover {
	background-position: -95px -46px;
	cursor: pointer;
}

#leftmenu span.history {
	background-position: -190px 24px;
	cursor: pointer;
}

#leftmenu span.history:hover {
	background-position: -190px -47px;
	cursor: pointer;
}

/*右邊欄位裡面*/
.matchsname {
	text-align: center;
	font-family: "Poppins", sans-serif;
	font-size: 37px;
	font-weight: 700;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.chat-header {
	overflow-y: auto; /* 垂直滾輪 */
	background-color: 0;
}

.chat-header .social {
	float: left;
	width: 100%;
	text-align: center;
}

.chat-header .social a {
	text-decoration: none;
}

.chat-header .social i {
	display: inline-block;
	font-size: 16px;
	color: #006da0;
	text-align: center;
	border: 1px solid #006da0;
	width: 30px;
	height: 30px;
	line-height: 30px;
	border-radius: 50%;
	margin: 0 5px;
}

.chat-header .social i:hover {
	background-color: #006da0;
	color: #fff;
}

.hr {
	width: 65%;
	margin: 0 auto; /* 0 上下邊距，auto 左右邊距自動調整使其置中 */
	margin-top: 25px;
	border-top: 1px solid rgba(0, 0, 0, 0.1); /* 使用 rgba() 函數設置顏色和透明度 */
}

@font-face {
	font-family: 'cwTeXYen';
	font-style: normal;
	font-weight: 500;
	src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot);
	src: url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.eot?#iefix)
		format('embedded-opentype'),
		url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/cwtexyen/v3/cwTeXYen-zhonly.ttf)
		format('truetype');
}

.goal {
	text-align: center;
	font-family: "cwTeXYen", sans-serif;
	font-size: 24px;
	font-weight: 100;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.topic {
	text-align: center;
	font-family: "cwTeXYen", sans-serif;
	font-size: 24px;
	font-weight: 100;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.aboutMe {
	text-align: center;
	font-family: "cwTeXYen", sans-serif;
	font-size: 24px;
	font-weight: 100;
	line-height: 3; /*行與行之間的垂直間距*/
	transition: all .3s ease; /*在屬性值變化時平滑過渡*/
}

.gender {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.birthday {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.starSign {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.bloodType {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 21px;
}

.MBTI {
	margin-right: 140px; /* 向右移動 20 像素 */
	font-size: 18px;
}

/*愛心跟X*/
.tinder {
	padding-top: 0px;
}

.tinder--buttons {
	flex: 0 0 100px;
	text-align: center;
	margin-top: 850px; /*如果padding-top調了不會動，請設margin-top*/
	margin-bottom: 100px; /*如果padding-top調了不會動，請設margin-top*/
	margin-left: 429.5px; /*調位置*/
}

.tinder--buttons button {
	border-radius: 50%;
	line-height: 70px; /*愛心X長*/
	width: 70px; /*愛心X寬*/
	border: 0;
	background-color: var(--button-bg);
	display: inline-block;
	margin: 0 8px;
	box-shadow: var(--navigation-box-shadow);
}

.tinder--buttons button:focus {
	outline: 0;
}

.tinder--buttons i {
	font-size: 32px;
	vertical-align: middle;
}

.fa-heart {
	color: #FFACE4;
}

.fa-remove {
	color: #CDD6DD;
}

/*左邊的好友欄*/
#chatbox {
	width: 330px; /*調整朋友框的大小*/
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	height: 535px;
	position: absolute;
	top: 100px; /*調整朋友框的位置*/
	left: 13.4%;
	margin-left: -155px;
}

#friendslist {
	position: absolute;
	top: 0;
	left: 5%;
	width: 330px;
	height: 535px;
}

.friend { /*朋友列表裡面的位置調整*/
	bottom: 0px;
	left: 10px;
	height: 80px;
	border-bottom: 1px solid #e7ebee;
	position: relative;
	vertical-align: top;
}

.friend:hover {
	background: #f1f4f6;
	cursor: pointer;
}

.friend img {
	width: 50px; /*改頭像大小  記得	height:80px;也要改*/
	border-radius: 50%;
	margin: 15px;
	float: left;
}

.floatingImg {
	width: 40px;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 12px;
	border: 3px solid #fff;
}

.friend p {
	padding: 28px 0 0 0; /*改名字位置*/
	float: left;
	width: 220px;
}

.friend p strong {
	font-weight: 600;
	font-size: 17px;
	color: #597a96;
}

.friend p span {
	font-size: 13px;
	font-weight: 400;
	color: #aab8c2;
}

.friend .status { /*登陸狀態*/
	background: #26c281;
	border-radius: 50%;
	width: 9px;
	height: 9px;
	position: absolute;
	top: 31px; /*調點點的位置*/
	right: 35px;
}

.friend .status.away {
	background: #ffce54;
}

.friend .status.inactive {
	background: #eaeef0;
}

#search {
	background: #e3e9ed
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/search.png")
		-11px 0 no-repeat;
	height: 60px;
	width: 330px; /*要跟#chatbox一樣*/
	position: absolute;
	bottom: 0;
	left: 0;
}

#searchfield {
	background: #e3e9ed;
	margin: 21px 0 0 55px;
	border: none;
	padding: 0;
	font-size: 16px;
	font-family: "Open Sans", sans-serif;
	font-weight: 400px;
	color: #8198ac;
}

#searchfield:focus {
	outline: 0;
}

#chatview {
	width: 330px; /*要跟#friendslist一樣*/
	height: 535px;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
	background: #fff;
}

#profile {
	height: 153px;
	overflow: hidden;
	text-align: center;
	color: #fff;
	/*width:330px;      /*profile資料的位置會改?*/
}

.p1 #profile {
	background: #fff
		url("https://watermark.lovepik.com/photo/40030/3639.jpg_wh1200.jpg") 0
		0 no-repeat;
}

#profile .avatar { /*頭像調位置要在js調   $('.floatingImg').animate({   */
	width: 68px;
	border: 3px solid #fff;
	margin: 23px 0 0;
	border-radius: 50%;
}

#profile  p {
	font-weight: 600;
	font-size: 19px;
	margin: 118px 0 -1px;
	opacity: 0;
	-webkit-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-moz-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#profile  p.animate { /*profile字體的位置*/
	margin-top: 97px;
	opacity: 1;
	-webkit-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-moz-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
}

#profile  span {
	font-weight: 400;
	font-size: 14px; /*email字體大小*/
}

#chat-messages {
	opacity: 0;
	margin-top: 30px;
	width: 335px; /*裡面聊天區塊的大小*/
	height: 320px;
	overflow-y: scroll;
	overflow-x: hidden;
	padding-right: 20px;
	-webkit-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-moz-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-ms-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	-o-transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	transition: all 200ms cubic-bezier(0.000, 0.995, 0.990, 1.000);
	/* 隱藏滾動條 */
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

#chat-messages.animate { /*整個聊天內容*/
	opacity: 1;
	margin-top: 0;
}

#chat-messages label {
	color: #aab8c2;
	font-weight: 600;
	font-size: 15px; /*日期*/
	text-align: center;
	margin: 15.5px 0;
	width: 330px;
	display: block;
}

#chat-messages div.message {
	padding: 0 0 30px 58px;
	clear: both;
	margin-bottom: 59px; /*調整bubble的間距*/
}

#chat-messages div.message.right {
	padding: 0 58px 30px 0;
	margin-right: -19px;
	margin-left: 19px;
}

#chat-messages .message img {
	float: left;
	margin-left: -45px;
	border-radius: 50%;
	width: 35px; /*聊天區塊頭像大小*/
	height: 35px;
	margin-top: 12px;
}

#chat-messages div.message.right img {
	float: right;
	margin-left: 0;
	margin-right: -45px;
}

.message .bubble { /*消息的框*/
	background: #F3F4F9;
	font-size: 15.5px; /*訊息字體大小*/
	font-weight: 600;
	padding: 12px 13px;
	border-radius: 5px 5px 5px 0px;
	color: #8495a3;
	position: relative;
	float: left;
}

#chat-messages div.message.right .bubble {
	float: right;
	border-radius: 5px 5px 0px 5px;
}

.bubble .corner {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bubble-corner.png")
		0 0 no-repeat;
	position: absolute;
	width: 7px;
	height: 7px;
	left: -5px;
	bottom: 0;
}

div.message.right .corner {
	background:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/bubble-cornerR.png")
		0 0 no-repeat;
	left: auto;
	right: -5px;
}

.bubble span {
	color: #aab8c2;
	font-size: 12.5px; /*時間大小*/
	position: absolute;
	right: 0;
	bottom: -22px;
}

#sendmessage {
	height: 60px;
	border-top: 1px solid #e7ebee;
	position: absolute;
	bottom: 0;
	right: 0px;
	width: 330px;
	background: #fff;
	/*padding-bottom:50px;*/
}

#sendmessage input {
	background: #fff;
	margin: 21px 0 0 21px;
	border: none;
	padding: 0;
	font-size: 15.5px;
	font-family: "Open Sans", sans-serif;
	font-weight: 320px;
	color: #aab8c2;
}

#sendmessage input:focus {
	outline: 0;
}

#sendmessage button {
	background: #fff
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/send.png") 0
		-41px no-repeat;
	width: 30px;
	height: 30px;
	position: absolute;
	right: 15px;
	top: 23px;
	border: none;
}

#sendmessage button:hover {
	cursor: pointer;
	background-position: 0 0;
}

#sendmessage button:focus {
	outline: 0;
}

#close {
	position: absolute;
	top: 8px;
	opacity: 0.8;
	right: 10px;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

#close:hover {
	opacity: 1;
}

.cx, .cy {
	background: #fff;
	position: absolute;
	width: 0px;
	top: 15px;
	right: 15px;
	height: 3px;
	-webkit-transition: all 250ms ease-in-out;
	-moz-transition: all 250ms ease-in-out;
	-ms-transition: all 250ms ease-in-out;
	-o-transition: all 250ms ease-in-out;
	transition: all 250ms ease-in-out;
}

.cx.s1, .cy.s1 {
	right: 0;
	width: 20px;
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cy.s2 {
	-ms-transform: rotate(50deg);
	-webkit-transform: rotate(50deg);
	transform: rotate(50deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cy.s3 {
	-ms-transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s1 {
	right: 0;
	width: 20px;
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s2 {
	-ms-transform: rotate(140deg);
	-webkit-transform: rotate(140deg);
	transform: rotate(140deg);
	-webkit-transition: all 100ms ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

.cx.s3 {
	-ms-transform: rotate(135deg);
	-webkit-transform: rotate(135deg);
	transform: rotate(135deg);
	-webkit-transition: all 100ease-out;
	-moz-transition: all 100ms ease-out;
	-ms-transition: all 100ms ease-out;
	-o-transition: all 100ms ease-out;
	transition: all 100ms ease-out;
}

#chatview, #sendmessage {
	overflow: hidden;
	border-radius: 6px;
}
</style>


</head>

<body>
	<!--連結到 Google Fonts 的程式碼片段-->
	<link
		href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap"
		rel="stylesheet">

	<!--組織和定位網頁中的內容-->
	<div class="app-container">

		<!--一個按鈕，用來在明亮模式和暗黑模式之間切換-->
		<button class="mode-switch">
			<svg class="sun" fill="none" stroke="#fbb046" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2" class="feather feather-sun"
				viewBox="0 0 24 24">
				<defs />
				<circle cx="12" cy="12" r="5" />
				<path
					d="M12 1v2M12 21v2M4.22 4.22l1.42 1.42M18.36 18.36l1.42 1.42M1 12h2M21 12h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42" /></svg>
			<svg class="moon" fill="none" stroke="#ffffff" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2"
				class="feather feather-moon" viewBox="0 0 24 24">
				<defs />
				<path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" /></svg>
		</button>





		<!--Test-->





		<link
			href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
			rel='stylesheet' type='text/css'>



		<!--定位或樣式控制-->
		<div id="menu">
			<!--列出了一個朋友清單。這個清單可能是用來顯示聯繫人列表的-->
			<div id="friendslist">
				<!--包含了一個頂部菜單，裡面包含了三個 <span> 元素，每個 <span> 元素可能用於不同的操作，如顯示好友、聊天、或歷史記錄-->
				<div id="leftmenu">
					<span class="friends"></span>
					<!--<span class="chats"></span>
            <span class="history"></span>-->


					<!--首頁-->
					<a href="#" class="nav-link icon" id="home"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round" class="feather feather-home"
							viewBox="0 0 24 24">
           <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
           <path d="M9 22V12h6v10" />
         </svg>
					</a> <a href="" class="nav-link icon" id="edit"> <svg
							xmlns="http://www.w3.org/2000/svg" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round" class="feather feather-folder"
							viewBox="0 0 24 24">
            <path
								d="M22 19a2 2 0 01-2 2H4a2 2 0 01-2-2V5a2 2 0 012-2h5l2 3h9a2 2 0 012 2z" />
          </svg>
					</a>

				</div>


			</div>

			<!--定位或樣式控制-->
			<div id="chatbox">

				<!--框架-->
				<!--包含了多個朋友的資訊。每個朋友都用一個 <div class="friend"> 元素包裹，裡面包含了朋友的頭像、姓名、電子郵件地址，以及一個顯示在線狀態的 <div> 元素。-->
				<div id="friends">
					<div class="friend">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
						<p>
							<strong>Miro Badev</strong>
							<!--<span>mirobadev@gmail.com</span>-->
						</p>
						<!--在每個朋友的 <div> 元素中，狀態用一個 <div> 元素來表示。根據 class 屬性的不同，可以分為三種狀態：available（在線）、away（離開）、inactive（未活動）。-->
						<div class="status available"></div>
					</div>

					<div class="friend">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" />
						<p>
							<strong>Martin Joseph</strong>
							<!--<span>marjoseph@gmail.com</span>-->
						</p>
						<div class="status away"></div>
					</div>

					<div class="friend">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/3_copy.jpg" />
						<p>
							<strong>Tomas Kennedy</strong>
							<!--<span>tomaskennedy@gmail.com</span>-->
						</p>
						<div class="status inactive"></div>
					</div>

					<div class="friend">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/4_copy.jpg" />
						<p>
							<strong>Enrique Sutton</strong>
							<!--<span>enriquesutton@gmail.com</span>-->
						</p>
						<div class="status inactive"></div>
					</div>

					<div class="friend">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/5_copy.jpg" />
						<p>
							<strong> Darnell Strickland</strong>
							<!--<span>darnellstrickland@gmail.com</span>-->
						</p>
						<div class="status inactive"></div>
					</div>

					<!--在 <div id="search"> 中有一個搜索欄，用於搜索聯繫人列表-->
					<div id="search">
						<input type="text" id="searchfield" value="Search contacts..." />
					</div>

				</div>




				<!--聊天應用的前端介面，使用了HTML和CSS-->
				<!--包含了聊天的訊息和使用者介面元素-->
				<div id="chatview" class="p1">
					<!--使用者資訊：在 <div id="profile"> 中顯示了使用者的名稱和電子郵件地址。-->
					<div id="profile">
						<div id="close">
							<div class="cy"></div>
							<div class="cx"></div>
						</div>

						<p>Miro Badev</p>
						<span>miro@badev@gmail.com</span>
					</div>

					<!--聊天訊息區域 : 包含在 <div id="chat-messages"> 中-->
					<div id="chat-messages">
						<label>Thursday 02</label>

						<!--每個訊息 : 都被包裹在 <div class="message"> 內，並且訊息的內容放在 <div class="bubble"> 中，左右兩側的訊息有不同的類別 left 和 right 來區分。-->
						<div class="message">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
							<div class="bubble">
								Really cool stuff!
								<div class="corner"></div>
								<span>3 min</span>
							</div>
						</div>

						<div class="message right">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" />
							<div class="bubble">
								Can you share a link for the tutorial?
								<div class="corner"></div>
								<span>1 min</span>
							</div>
						</div>

						<div class="message">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
							<div class="bubble">
								Yeah, hold on
								<div class="corner"></div>
								<span>Now</span>
							</div>
						</div>

						<div class="message right">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" />
							<div class="bubble">
								Can you share a link for the tutorial?
								<div class="corner"></div>
								<span>1 min</span>
							</div>
						</div>

						<div class="message">
							<img
								src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" />
							<div class="bubble">
								Yeah, hold on
								<div class="corner"></div>
								<span>Now</span>
							</div>
						</div>

					</div>

					<!--使用者介面：使用者介面部分包括了發送訊息的區域，在 <div id="sendmessage"> 中包含了一個輸入框 <input type="text"> 和一個發送按鈕 <button id="send"></button>。-->
					<div id="sendmessage">
						<input type="text" value="Send message..." />
						<button id="send"></button>
					</div>

				</div>
			</div>
		</div>







		<!--Test-->










		<!--Tinder-->
		<div class="app-main">


			<!--照片-->
			<!-- <div class="card-container">
				<div class="carousel" id="userPhotos1"></div>
				<div class="carousel" id="userPhotos2"></div>
				<div class="carousel" id="userPhotos3"></div>
				<div class="carousel" id="userPhotos4"></div>
				<div class="carousel" id="userPhotos5"></div>
			</div> -->




	<!--照片-->
	  <div class="card-container">
    <div class="carousel" id="userPhotos">
      <img src="https://images.unsplash.com/photo-1566821582776-92b13ab46bb4?ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60" width="580" height="230" alt="destination">
      <img src="https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" width="580" height="230" alt="destination">
      <img src="https://images.unsplash.com/photo-1600207438283-a5de6d9df13e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80" width="580" height="230" alt="destination">
      <img src="https://images.unsplash.com/photo-1581824283135-0666cf353f35?ixlib=rb-1.2.1&auto=format&fit=crop&w=1276&q=80" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination5&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination6&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination7&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination8&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination9&font=lobster" width="580" height="230" alt="destination">
    </div>   
  </div>
  <div class="card-container">
    <div class="carousel">
      <img src="https://images.pexels.com/photos/6241/sky-sunset-red-romantic.jpg?cs=srgb&dl=pexels-6241.jpg&fm=jpg" width="580" height="230" alt="destination">
      <img src="https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80" width="580" height="230" alt="destination">
      <img src="https://images.unsplash.com/photo-1600207438283-a5de6d9df13e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80" width="580" height="230" alt="destination">
      <img src="https://images.unsplash.com/photo-1581824283135-0666cf353f35?ixlib=rb-1.2.1&auto=format&fit=crop&w=1276&q=80" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination5&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination6&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination7&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination8&font=lobster" width="580" height="230" alt="destination">
      <img src="http://fakeimg.pl/580x230/FFF/121212/?text=destination9&font=lobster" width="580" height="230" alt="destination">
    </div>
  </div>



			<!--按鈕-->
			<div class="tinder">
				<div class="tinder--buttons">
					<button id="nope">
						<i class="fa fa-remove"></i>
					</button>
					<button id="love">
						<i class="fa fa-heart"></i>
					</button>
				</div>
			</div>
		</div>







		<!--網頁的右側相關的內容，比如側邊欄、資訊面板或者其他相關元素-->
		<div class="right-side">
			<!--聊天框-->
			<!--容納聊天的相關內容-->
			<div class="chat-container">
				<!--標題聊天的區域-->
				<div class="chat-header">
					<!--用於打開或關閉聊天視窗，其中顯示了 "Live Chat" 這個文本。-->

					<div class="matchsname">${userBean.nickName}</div>
					<div class="social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"> <i
							class="fa fa-twitter"></i></a> <a href="#"> <i
							class="fa fa-google-plus"></i></a>
						<hr class="hr">
					</div>

					<div class="goal">
						尋找關係 <span><c:choose>
								<c:when test="${userBean.goalNo == 1}">不回答</c:when>
								<c:when test="${userBean.goalNo == 2}">網友</c:when>
								<c:when test="${userBean.goalNo == 3}">飯友</c:when>
								<c:when test="${userBean.goalNo == 4}">酒友</c:when>
								<c:when test="${userBean.goalNo == 5}">牌友</c:when>
								<c:when test="${userBean.goalNo == 6}">山友</c:when>
								<c:when test="${userBean.goalNo == 7}">旅伴</c:when>
								<c:when test="${userBean.goalNo == 8}">戀愛伴侶</c:when>
								<c:when test="${userBean.goalNo == 9}">結婚對象</c:when>
								<c:when test="${userBean.goalNo == 10}">朋友關係</c:when>
								<c:when test="${userBean.goalNo == 11}">短暫浪漫</c:when>
								<c:when test="${userBean.goalNo == 12}">匿名網友</c:when>
								<c:when test="${userBean.goalNo == 13}">一起運動</c:when>
								<c:when test="${userBean.goalNo == 14}">一起團購</c:when>
								<c:when test="${userBean.goalNo == 15}">外送拼單</c:when>
								<c:when test="${userBean.goalNo == 16}">不設限</c:when>

								<c:otherwise>其他</c:otherwise>
							</c:choose></span>
						<hr class="hr">
					</div>

					<div class="topic">
						我想聊的話題是
						<hr class="hr">
					</div>

					<div class="aboutMe">
						關於我

						<div class="gender">
							性別 <span><c:choose>
									<c:when test="${userBean.gender == 0}">生理女</c:when>
									<c:otherwise>生理男</c:otherwise>
								</c:choose></span>
						</div>

						<div class="birthday">生日 ${userBean.birthday}</div>

						<!-- <div class="starSign">
          星座 
          </div> -->

						<div class="bloodType">血型 ${userBean.bloodType}</div>

						<div class="MBTI">MBTI ${userBean.MBTI}</div>
					</div>
				</div>



				<!--  
        <button class="chat-header-button">
         Live Chat
        </button>
      </div>-->


				<!--容納聊天視窗或者聊天對話框的內容。在這個元素中，你可以放置聊天訊息、輸入框、發送按鈕等相關元素，以呈現一個完整的聊天介面。-->
				<!--       <div class="chat-area">
         <div class="message-wrapper">
          <div class="profile-picture">
            <img src="https://images.unsplash.com/photo-1576110397661-64a019d88a98?ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80" alt="pp">
          </div>
          <div class="message-content">
            <p class="name">Tim Russel</p>-->
				<!--顯示實際的訊息內容。在這個訊息中，可能包含了一個新的設計文件的連結，具有 CSS 類名為 "message-file"。該連結的內容包含了一個 SVG 圖示和相關的文件信息-->
				<!--              <div class="rightmessage">New design document⬇️</div>
            <div class="message-file">
              <div class="icon sketch">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                  <path fill="#ffd54f" d="M96 191.02v-144l160-30.04 160 30.04v144z"/>
                  <path fill="#ffecb3" d="M96 191.02L256 16.98l160 174.04z"/>
                  <path fill="#ffa000" d="M0 191.02l256 304 256-304z"/>
                  <path fill="#ffca28" d="M96 191.02l160 304 160-304z"/>
                  <g fill="#ffc107">
                    <path d="M0 191.02l96-144v144zM416 47.02v144h96z"/>
                  </g>
                </svg>
              </div>
              <div class="file-info">
                <div class="file-name">NewYear.sketch</div>
                <div class="file-size">120 MB</div>
              </div>
            </div>
          </div>
        </div>

        </div>-->
				<!--顯示一個「擴展」的圖示-->
				<!--    </div>
  <button class="expand-btn">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/></svg>
    </button>-->





				<script>
    
    
    
'use strict';

$(document).ready(function() {
  var cardContainer = $('.card-container');
  var allCards = cardContainer.find('.carousel');
  var currentUserNo;
  var nope = $('#nope');
  var love = $('#love');

  // 獲取當前用戶ID
  function getCurrentUserNo() {
    $.ajax({
      url: '/getCurrentUserNo',
      type: 'GET',
      async: false,
      success: function(userNo) {
        if (userNo !== null) {
          currentUserNo = userNo;
        } else {
          console.log('User not logged in');
        }
      },
      error: function(xhr, status, error) {
        console.error('Error getting current user ID:', error);
      }
    });
  }

  getCurrentUserNo();

  function initCards() {
    var allCards = cardContainer.find('.carousel');
    allCards.each(function(index, card) {
      $(card).css({
        'z-index': allCards.length - index,
        'transform': 'scale(1)',
        'opacity': 1,
        'transition': 'transform 0.5s'
      });
    });
  }

  initCards();

  function createButtonListener(love) {
    return function(event) {
      var cards = cardContainer.find('.carousel:not(.removed)');
      var moveOutWidth = document.body.clientWidth * 1.5;

      if (!cards.length) return false;

      var card = cards.eq(0);
      card.addClass('removed');

      if (love) {
        card.css('transform', 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)');
      } else {
        card.css('transform', 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)');
      }

      setTimeout(function() {
        card.remove();
        getNextUser();
      }, 500);

      event.preventDefault();
    };
  }

  var nopeListener = createButtonListener(false);
  var loveListener = createButtonListener(true);

  nope.on('click', nopeListener);
  love.on('click', loveListener);

  function getNextUser() {
    $.ajax({
      url: '/nextUser',
      type: 'GET',
      data: { currentUserNo: currentUserNo },
      success: function(data) {
    	console.log('Returned data:', data);           /////

    	  
    	var photos = data.photos;
//         var html = '<div class="carousel">';
        var html;
        // 遍歷照片陣列,生成對應的HTML結構
        photos.forEach(function(photo) {
        	  var photoUrl = "/localimages/" + photo;
              console.log('Photo URL:', photoUrl); // 添加調試信息
        	  html += '<img src='+ photoUrl +' width="580" height="230" alt="user photo">';
        });
        
//         html += '</div>';
        
        console.log('Generated HTML:', html);   ///////

        
        // 將生成的HTML結構插入到佔位符中
        $('#userPhotos2').append(html);
        
        // 重新初始化卡片
        initCards();
      },
      error: function(xhr, status, error) {
        console.error('Error getting next user:', error);
      }
    });
  }
});
    
  	
  	
  	

  

// 獲取所有按鈕和內容容器
const buttons = document.querySelectorAll('.nav-link.icon');
const contentContainer = document.querySelector('.content-container');

// 為每個按鈕添加點擊事件監聽器
buttons.forEach(button => {
  button.addEventListener('click', () => {
    // 清空內容容器
    contentContainer.innerHTML = '';

    // 根據按鈕的 ID 或類別創建對應的內容
    const content = document.createElement('div');
    switch (button.id) {
      case 'home':
        content.textContent = '這是主頁內容';
        break;
      case 'messages':
        content.textContent = '這是訊息內容';
        break;
      // 其他按鈕對應的內容
    }

    // 將內容添加到容器中
    contentContainer.appendChild(content);

    // 切換內容容器的可見性
    contentContainer.style.display = contentContainer.style.display === 'none' ? 'block' : 'none';
  });
});







  //確保當文檔完全加載完成後才運行 JavaScript 代碼。
  $(document).ready(function(){
  //切換明亮和暗黑模式
  $('button.mode-switch').click(function(){
    $('body').toggleClass('dark');
  });
  
  $(".btn-close-right").click(function () {
    $(".right-side").removeClass("show");
    $(".expand-btn").addClass("show");
  });
  
  $(".expand-btn").click(function () {
    $(".right-side").addClass("show");
    $(this).removeClass("show");
  });
});
      
      
      
      
  //leftbox    
      
        const friendsBtn = $('#leftmenu .friends');
  const chatbox = $('#chatbox');

  let chatboxVisible = false; // 初始狀態為隱藏

  // 為 friends 按鈕添加點擊事件監聽器
  friendsBtn.click(() => {
    // 切換 chatboxVisible 的值
    chatboxVisible = !chatboxVisible;

    // 根據 chatboxVisible 的值顯示或隱藏 chatbox 區塊
    chatbox.toggle(chatboxVisible);
  });
  
  
    //leftbox 
      
      
  
  
 
  
 	/*在載入完畢後，會創建一個隱藏的圖片物件 preloadbg，*/
    var preloadbg = document.createElement("img");
    preloadbg.src = "https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/timeline1.png";
    
	/*處理搜索欄位 #searchfield 和訊息輸入欄位 #sendmessage input 的焦點事件，當焦點進入時，清空預設的提示文字，焦點離開時，如果輸入為空，則恢復預設的提示文字。*/
      $("#searchfield").focus(function(){
          if($(this).val() == "Search contacts..."){
              $(this).val("");
          }
      });
      $("#searchfield").focusout(function(){
          if($(this).val() == ""){
              $(this).val("Search contacts...");
              
          }
      });
      
      $("#sendmessage input").focus(function(){
          if($(this).val() == "Send message..."){
              $(this).val("");
          }
      });
      $("#sendmessage input").focusout(function(){
          if($(this).val() == ""){
              $(this).val("Send message...");
              
          }
      });
          
      /*對每個 .friend 元素添加點擊事件處理器。當點擊朋友時，會執行以下操作：*/
      $(".friend").each(function(){		

		  /*複製被點擊朋友的頭像，並將其樣式設置為浮動，然後附加到 #chatbox 中。*/
          $(this).click(function(){
              var childOffset = $(this).offset();
              var parentOffset = $(this).parent().parent().offset();
              var childTop = childOffset.top - parentOffset.top;
              var clone = $(this).find('img').eq(0).clone();
              var top = childTop+12+"px";
              
              $(clone).css({'top': top}).addClass("floatingImg").appendTo("#chatbox");									
              
			  /*進行一系列的動畫效果，包括設置 #profile 的樣式和顯示聊天訊息的動畫效果。*/
              setTimeout(function(){$("#profile p").addClass("animate");$("#profile").addClass("animate");}, 100);
              setTimeout(function(){
                  $("#chat-messages").addClass("animate");
                  $('.cx, .cy').addClass('s1');
                  setTimeout(function(){$('.cx, .cy').addClass('s2');}, 100);
                  setTimeout(function(){$('.cx, .cy').addClass('s3');}, 200);			
              }, 150);														
              
			  /*點擊聊天朋友後，顯示相關的聊天內容和資訊*/           /*調整profile頭像位置*/
              $('.floatingImg').animate({
                  'width': "68px",
                  'left':'130px',
                  'top':'20px'
              }, 200);
              
			  /*從被點擊的朋友元素中獲取名字和電子郵件地址*/
              var name = $(this).find("p strong").html();
              var email = $(this).find("p span").html();	
			  
			  /*將獲取到的名字和電子郵件地址分別設置到聊天視窗中的對應元素中，用來顯示朋友的名字和電子郵件地址。*/
              $("#profile p").html(name);
              $("#profile span").html(email);			
              
			  /*這行程式碼用來設置聊天視窗中最後一條訊息的圖像，將其設置為被點擊的朋友的頭像。*/
              $(".message").not(".right").find("img").attr("src", $(clone).attr("src"));	
			  /*這兩行程式碼用來控制朋友列表的淡出效果和聊天視窗的淡入效果，實現在切換朋友時的視覺效果。*/								
              $('#friendslist').fadeOut();
              $('#chatview').fadeIn();
          
              
			  /*實現關閉聊天視窗時的動作*/
			  /*為關閉按鈕 #close 添加了一個點擊事件處理器。使用 unbind("click") 是為了確保在綁定新的點擊事件之前先解除舊的點擊事件，以防止事件重複綁定。*/
              $('#close').unbind("click").click(function(){		
				  /*除了聊天訊息區域、使用者資訊和使用者名稱的動畫效果。*/		
                  $("#chat-messages, #profile, #profile p").removeClass("animate");
				  /*移除了動畫效果中使用的樣式類名，以停止動畫效果。*/
                  $('.cx, .cy').removeClass("s1 s2 s3");
				  /*對浮動的頭像執行動畫效果，將其寬度調整為 40px，並且移回到原始位置，最後在動畫完成後將浮動的頭像移除。*/
                  $('.floatingImg').animate({
                      'width': "40px",
                      'top':top,
                      'left': '12px'
                  }, 200, function(){$('.floatingImg').remove()});				
                  
				  /*使用 setTimeout 函式來延遲執行一段程式碼，在50毫秒後，淡出聊天視窗 #chatview，同時淡入朋友列表 #friendslist。*/
                  setTimeout(function(){
                      $('#chatview').fadeOut();
                      $('#friendslist').fadeIn();				
                  }, 50);
              });
              
          });
      });
      
      
      
      
      
      
      
      
      
      
      //輪播
      
      (function(factory) {
    'use strict';
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);
    } else if (typeof exports !== 'undefined') {
        module.exports = factory(require('jquery'));
    } else {
        factory(jQuery);
    }

}(function($) {
    'use strict';
    var Slick = window.Slick || {};

    Slick = (function() {

        var instanceUid = 0;

        function Slick(element, settings) {

            var _ = this, dataSettings;

            _.defaults = {
                accessibility: true,
                adaptiveHeight: false,
                appendArrows: $(element),
                appendDots: $(element),
                arrows: true,
                asNavFor: null,
                prevArrow: '',
                nextArrow: '',
                autoplay: false,
                autoplaySpeed: 3000,
                centerMode: false,
                centerPadding: '50px',
                cssEase: 'ease',
                customPaging: function(slider, i) {
                    return $('').text(i + 1);
                },
                dots: false,
                dotsClass: 'slick-dots',
                draggable: true,
                easing: 'linear',
                edgeFriction: 0.35,
                fade: false,
                focusOnSelect: false,
                infinite: true,
                initialSlide: 0,
                lazyLoad: 'ondemand',
                mobileFirst: false,
                pauseOnHover: true,
                pauseOnFocus: true,
                pauseOnDotsHover: false,
                respondTo: 'window',
                responsive: null,
                rows: 1,
                rtl: false,
                slide: '',
                slidesPerRow: 1,
                slidesToShow: 1,
                slidesToScroll: 1,
                speed: 500,
                swipe: true,
                swipeToSlide: false,
                touchMove: true,
                touchThreshold: 5,
                useCSS: true,
                useTransform: true,
                variableWidth: false,
                vertical: false,
                verticalSwiping: false,
                waitForAnimate: true,
                zIndex: 1000
            };

            _.initials = {
                animating: false,
                dragging: false,
                autoPlayTimer: null,
                currentDirection: 0,
                currentLeft: null,
                currentSlide: 0,
                direction: 1,
                $dots: null,
                listWidth: null,
                listHeight: null,
                loadIndex: 0,
                $nextArrow: null,
                $prevArrow: null,
                slideCount: null,
                slideWidth: null,
                $slideTrack: null,
                $slides: null,
                sliding: false,
                slideOffset: 0,
                swipeLeft: null,
                $list: null,
                touchObject: {},
                transformsEnabled: false,
                unslicked: false
            };

            $.extend(_, _.initials);

            _.activeBreakpoint = null;
            _.animType = null;
            _.animProp = null;
            _.breakpoints = [];
            _.breakpointSettings = [];
            _.cssTransitions = false;
            _.focussed = false;
            _.interrupted = false;
            _.hidden = 'hidden';
            _.paused = true;
            _.positionProp = null;
            _.respondTo = null;
            _.rowCount = 1;
            _.shouldClick = true;
            _.$slider = $(element);
            _.$slidesCache = null;
            _.transformType = null;
            _.transitionType = null;
            _.visibilityChange = 'visibilitychange';
            _.windowWidth = 0;
            _.windowTimer = null;

            dataSettings = $(element).data('slick') || {};

            _.options = $.extend({}, _.defaults, settings, dataSettings);

            _.currentSlide = _.options.initialSlide;

            _.originalSettings = _.options;

            if (typeof document.mozHidden !== 'undefined') {
                _.hidden = 'mozHidden';
                _.visibilityChange = 'mozvisibilitychange';
            } else if (typeof document.webkitHidden !== 'undefined') {
                _.hidden = 'webkitHidden';
                _.visibilityChange = 'webkitvisibilitychange';
            }

            _.autoPlay = $.proxy(_.autoPlay, _);
            _.autoPlayClear = $.proxy(_.autoPlayClear, _);
            _.autoPlayIterator = $.proxy(_.autoPlayIterator, _);
            _.changeSlide = $.proxy(_.changeSlide, _);
            _.clickHandler = $.proxy(_.clickHandler, _);
            _.selectHandler = $.proxy(_.selectHandler, _);
            _.setPosition = $.proxy(_.setPosition, _);
            _.swipeHandler = $.proxy(_.swipeHandler, _);
            _.dragHandler = $.proxy(_.dragHandler, _);
            _.keyHandler = $.proxy(_.keyHandler, _);

            _.instanceUid = instanceUid++;

            // A simple way to check for HTML strings
            // Strict HTML recognition (must start with <)
            // Extracted from jQuery v1.11 source
            _.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/;


            _.registerBreakpoints();
            _.init(true);

        }

        return Slick;

    }());

    Slick.prototype.activateADA = function() {
        var _ = this;

        _.$slideTrack.find('.slick-active').attr({
            'aria-hidden': 'false'
        }).find('a, input, button, select').attr({
            'tabindex': '0'
        });

    };

    Slick.prototype.addSlide = Slick.prototype.slickAdd = function(markup, index, addBefore) {

        var _ = this;

        if (typeof(index) === 'boolean') {
            addBefore = index;
            index = null;
        } else if (index < 0 || (index >= _.slideCount)) {
            return false;
        }

        _.unload();

        if (typeof(index) === 'number') {
            if (index === 0 && _.$slides.length === 0) {
                $(markup).appendTo(_.$slideTrack);
            } else if (addBefore) {
                $(markup).insertBefore(_.$slides.eq(index));
            } else {
                $(markup).insertAfter(_.$slides.eq(index));
            }
        } else {
            if (addBefore === true) {
                $(markup).prependTo(_.$slideTrack);
            } else {
                $(markup).appendTo(_.$slideTrack);
            }
        }

        _.$slides = _.$slideTrack.children(this.options.slide);

        _.$slideTrack.children(this.options.slide).detach();

        _.$slideTrack.append(_.$slides);

        _.$slides.each(function(index, element) {
            $(element).attr('data-slick-index', index);
        });

        _.$slidesCache = _.$slides;

        _.reinit();

    };

    Slick.prototype.animateHeight = function() {
        var _ = this;
        if (_.options.slidesToShow === 1 && _.options.adaptiveHeight === true && _.options.vertical === false) {
            var targetHeight = _.$slides.eq(_.currentSlide).outerHeight(true);
            _.$list.animate({
                height: targetHeight
            }, _.options.speed);
        }
    };

    Slick.prototype.animateSlide = function(targetLeft, callback) {

        var animProps = {},
            _ = this;

        _.animateHeight();

        if (_.options.rtl === true && _.options.vertical === false) {
            targetLeft = -targetLeft;
        }
        if (_.transformsEnabled === false) {
            if (_.options.vertical === false) {
                _.$slideTrack.animate({
                    left: targetLeft
                }, _.options.speed, _.options.easing, callback);
            } else {
                _.$slideTrack.animate({
                    top: targetLeft
                }, _.options.speed, _.options.easing, callback);
            }

        } else {

            if (_.cssTransitions === false) {
                if (_.options.rtl === true) {
                    _.currentLeft = -(_.currentLeft);
                }
                $({
                    animStart: _.currentLeft
                }).animate({
                    animStart: targetLeft
                }, {
                    duration: _.options.speed,
                    easing: _.options.easing,
                    step: function(now) {
                        now = Math.ceil(now);
                        if (_.options.vertical === false) {
                            animProps[_.animType] = 'translate(' +
                                now + 'px, 0px)';
                            _.$slideTrack.css(animProps);
                        } else {
                            animProps[_.animType] = 'translate(0px,' +
                                now + 'px)';
                            _.$slideTrack.css(animProps);
                        }
                    },
                    complete: function() {
                        if (callback) {
                            callback.call();
                        }
                    }
                });

            } else {

                _.applyTransition();
                targetLeft = Math.ceil(targetLeft);

                if (_.options.vertical === false) {
                    animProps[_.animType] = 'translate3d(' + targetLeft + 'px, 0px, 0px)';
                } else {
                    animProps[_.animType] = 'translate3d(0px,' + targetLeft + 'px, 0px)';
                }
                _.$slideTrack.css(animProps);

                if (callback) {
                    setTimeout(function() {

                        _.disableTransition();

                        callback.call();
                    }, _.options.speed);
                }

            }

        }

    };

    Slick.prototype.getNavTarget = function() {

        var _ = this,
            asNavFor = _.options.asNavFor;

        if ( asNavFor && asNavFor !== null ) {
            asNavFor = $(asNavFor).not(_.$slider);
        }

        return asNavFor;

    };

    Slick.prototype.asNavFor = function(index) {

        var _ = this,
            asNavFor = _.getNavTarget();

        if ( asNavFor !== null && typeof asNavFor === 'object' ) {
            asNavFor.each(function() {
                var target = $(this).slick('getSlick');
                if(!target.unslicked) {
                    target.slideHandler(index, true);
                }
            });
        }

    };

    Slick.prototype.applyTransition = function(slide) {

        var _ = this,
            transition = {};

        if (_.options.fade === false) {
            transition[_.transitionType] = _.transformType + ' ' + _.options.speed + 'ms ' + _.options.cssEase;
        } else {
            transition[_.transitionType] = 'opacity ' + _.options.speed + 'ms ' + _.options.cssEase;
        }

        if (_.options.fade === false) {
            _.$slideTrack.css(transition);
        } else {
            _.$slides.eq(slide).css(transition);
        }

    };

    Slick.prototype.autoPlay = function() {

        var _ = this;

        _.autoPlayClear();

        if ( _.slideCount > _.options.slidesToShow ) {
            _.autoPlayTimer = setInterval( _.autoPlayIterator, _.options.autoplaySpeed );
        }

    };

    Slick.prototype.autoPlayClear = function() {

        var _ = this;

        if (_.autoPlayTimer) {
            clearInterval(_.autoPlayTimer);
        }

    };

    Slick.prototype.autoPlayIterator = function() {

        var _ = this,
            slideTo = _.currentSlide + _.options.slidesToScroll;

        if ( !_.paused && !_.interrupted && !_.focussed ) {

            if ( _.options.infinite === false ) {

                if ( _.direction === 1 && ( _.currentSlide + 1 ) === ( _.slideCount - 1 )) {
                    _.direction = 0;
                }

                else if ( _.direction === 0 ) {

                    slideTo = _.currentSlide - _.options.slidesToScroll;

                    if ( _.currentSlide - 1 === 0 ) {
                        _.direction = 1;
                    }

                }

            }

            _.slideHandler( slideTo );

        }

    };

    Slick.prototype.buildArrows = function() {

        var _ = this;

        if (_.options.arrows === true ) {

            _.$prevArrow = $(_.options.prevArrow).addClass('slick-arrow');
            _.$nextArrow = $(_.options.nextArrow).addClass('slick-arrow');

            if( _.slideCount > _.options.slidesToShow ) {

                _.$prevArrow.removeClass('slick-hidden').removeAttr('aria-hidden tabindex');
                _.$nextArrow.removeClass('slick-hidden').removeAttr('aria-hidden tabindex');

                if (_.htmlExpr.test(_.options.prevArrow)) {
                    _.$prevArrow.prependTo(_.options.appendArrows);
                }

                if (_.htmlExpr.test(_.options.nextArrow)) {
                    _.$nextArrow.appendTo(_.options.appendArrows);
                }

                if (_.options.infinite !== true) {
                    _.$prevArrow
                        .addClass('slick-disabled')
                        .attr('aria-disabled', 'true');
                }

            } else {

                _.$prevArrow.add( _.$nextArrow )

                    .addClass('slick-hidden')
                    .attr({
                        'aria-disabled': 'true',
                        'tabindex': '-1'
                    });

            }

        }

    };

    Slick.prototype.buildDots = function() {

        var _ = this,
            i, dot;

        if (_.options.dots === true && _.slideCount > _.options.slidesToShow) {

            _.$slider.addClass('slick-dotted');

            dot = $('<ul />').addClass(_.options.dotsClass);

            for (i = 0; i <= _.getDotCount(); i += 1) {
                dot.append($('').append(_.options.customPaging.call(this, _, i)));
            }

            _.$dots = dot.appendTo(_.options.appendDots);

            _.$dots.find('').first().addClass('slick-active').attr('aria-hidden', 'false');

        }

    };

    Slick.prototype.buildOut = function() {

        var _ = this;

        _.$slides =
            _.$slider
                .children( _.options.slide + ':not(.slick-cloned)')
                .addClass('slick-slide');

        _.slideCount = _.$slides.length;

        _.$slides.each(function(index, element) {
            $(element)
                .attr('data-slick-index', index)
                .data('originalStyling', $(element).attr('style') || '');
        });

        _.$slider.addClass('slick-slider');

        _.$slideTrack = (_.slideCount === 0) ?
            $('<div class="slick-track"/>').appendTo(_.$slider) :
            _.$slides.wrapAll('<div class="slick-track"/>').parent();

        _.$list = _.$slideTrack.wrap(
            '<div aria-live="polite" class="slick-list"/>').parent();
        _.$slideTrack.css('opacity', 0);

        if (_.options.centerMode === true || _.options.swipeToSlide === true) {
            _.options.slidesToScroll = 1;
        }

        $('img[data-lazy]', _.$slider).not('[src]').addClass('slick-loading');

        _.setupInfinite();

        _.buildArrows();

        _.buildDots();

        _.updateDots();


        _.setSlideClasses(typeof _.currentSlide === 'number' ? _.currentSlide : 0);

        if (_.options.draggable === true) {
            _.$list.addClass('draggable');
        }

    };

    Slick.prototype.buildRows = function() {

        var _ = this, a, b, c, newSlides, numOfSlides, originalSlides,slidesPerSection;

        newSlides = document.createDocumentFragment();
        originalSlides = _.$slider.children();

        if(_.options.rows > 0) {

            slidesPerSection = _.options.slidesPerRow * _.options.rows;
            numOfSlides = Math.ceil(
                originalSlides.length / slidesPerSection
            );

            for(a = 0; a < numOfSlides; a++){
                var slide = document.createElement('div');
                for(b = 0; b < _.options.rows; b++) {
                    var row = document.createElement('div');
                    for(c = 0; c < _.options.slidesPerRow; c++) {
                        var target = (a * slidesPerSection + ((b * _.options.slidesPerRow) + c));
                        if (originalSlides.get(target)) {
                            row.appendChild(originalSlides.get(target));
                        }
                    }
                    slide.appendChild(row);
                }
                newSlides.appendChild(slide);
            }

            _.$slider.empty().append(newSlides);
            _.$slider.children().children().children()
                .css({
                    'width':(100 / _.options.slidesPerRow) + '%',
                    'display': 'inline-block'
                });

        }

    };

    Slick.prototype.checkResponsive = function(initial, forceUpdate) {

        var _ = this,
            breakpoint, targetBreakpoint, respondToWidth, triggerBreakpoint = false;
        var sliderWidth = _.$slider.width();
        var windowWidth = window.innerWidth || $(window).width();

        if (_.respondTo === 'window') {
            respondToWidth = windowWidth;
        } else if (_.respondTo === 'slider') {
            respondToWidth = sliderWidth;
        } else if (_.respondTo === 'min') {
            respondToWidth = Math.min(windowWidth, sliderWidth);
        }

        if ( _.options.responsive &&
            _.options.responsive.length &&
            _.options.responsive !== null) {

            targetBreakpoint = null;

            for (breakpoint in _.breakpoints) {
                if (_.breakpoints.hasOwnProperty(breakpoint)) {
                    if (_.originalSettings.mobileFirst === false) {
                        if (respondToWidth < _.breakpoints[breakpoint]) {
                            targetBreakpoint = _.breakpoints[breakpoint];
                        }
                    } else {
                        if (respondToWidth > _.breakpoints[breakpoint]) {
                            targetBreakpoint = _.breakpoints[breakpoint];
                        }
                    }
                }
            }

            if (targetBreakpoint !== null) {
                if (_.activeBreakpoint !== null) {
                    if (targetBreakpoint !== _.activeBreakpoint || forceUpdate) {
                        _.activeBreakpoint =
                            targetBreakpoint;
                        if (_.breakpointSettings[targetBreakpoint] === 'unslick') {
                            _.unslick(targetBreakpoint);
                        } else {
                            _.options = $.extend({}, _.originalSettings,
                                _.breakpointSettings[
                                    targetBreakpoint]);
                            if (initial === true) {
                                _.currentSlide = _.options.initialSlide;
                            }
                            _.refresh(initial);
                        }
                        triggerBreakpoint = targetBreakpoint;
                    }
                } else {
                    _.activeBreakpoint = targetBreakpoint;
                    if (_.breakpointSettings[targetBreakpoint] === 'unslick') {
                        _.unslick(targetBreakpoint);
                    } else {
                        _.options = $.extend({}, _.originalSettings,
                            _.breakpointSettings[
                                targetBreakpoint]);
                        if (initial === true) {
                            _.currentSlide = _.options.initialSlide;
                        }
                        _.refresh(initial);
                    }
                    triggerBreakpoint = targetBreakpoint;
                }
            } else {
                if (_.activeBreakpoint !== null) {
                    _.activeBreakpoint = null;
                    _.options = _.originalSettings;
                    if (initial === true) {
                        _.currentSlide = _.options.initialSlide;
                    }
                    _.refresh(initial);
                    triggerBreakpoint = targetBreakpoint;
                }
            }

            // only trigger breakpoints during an actual break. not on initialize.
            if( !initial && triggerBreakpoint !== false ) {
                _.$slider.trigger('breakpoint', [_, triggerBreakpoint]);
            }
        }

    };

    Slick.prototype.changeSlide = function(event, dontAnimate) {

        var _ = this,
            $target = $(event.currentTarget),
            indexOffset, slideOffset, unevenOffset;

        // If target is a link, prevent default action.
        if($target.is('a')) {
            event.preventDefault();
        }

        // If target is not the <li> element (ie: a child), find the <li>.
        if(!$target.is('li')) {
            $target = $target.closest('li');
        }

        unevenOffset = (_.slideCount % _.options.slidesToScroll !== 0);
        indexOffset = unevenOffset ? 0 : (_.slideCount - _.currentSlide) % _.options.slidesToScroll;

        switch (event.data.message) {

            case 'previous':
                slideOffset = indexOffset === 0 ? _.options.slidesToScroll : _.options.slidesToShow - indexOffset;
                if (_.slideCount > _.options.slidesToShow) {
                    _.slideHandler(_.currentSlide - slideOffset, false, dontAnimate);
                }
                break;

            case 'next':
                slideOffset = indexOffset === 0 ? _.options.slidesToScroll : indexOffset;
                if (_.slideCount > _.options.slidesToShow) {
                    _.slideHandler(_.currentSlide + slideOffset, false, dontAnimate);
                }
                break;

            case 'index':
                var index = event.data.index === 0 ? 0 :
                    event.data.index || $target.index() * _.options.slidesToScroll;

                _.slideHandler(_.checkNavigable(index), false, dontAnimate);
                $target.children().trigger('focus');
                break;

            default:
                return;
        }

    };

    Slick.prototype.checkNavigable = function(index) {

        var _ = this,
            navigables, prevNavigable;

        navigables = _.getNavigableIndexes();
        prevNavigable = 0;
        if (index > navigables[navigables.length - 1]) {
            index = navigables[navigables.length - 1];
        } else {
            for (var n in navigables) {
                if (index < navigables[n]) {
                    index = prevNavigable;
                    break;
                }
                prevNavigable = navigables[n];
            }
        }

        return index;
    };

    Slick.prototype.cleanUpEvents = function() {

        var _ = this;

        if (_.options.dots && _.$dots !== null) {

            $('li', _.$dots)
                .off('click.slick', _.changeSlide)
                .off('mouseenter.slick', $.proxy(_.interrupt, _, true))
                .off('mouseleave.slick', $.proxy(_.interrupt, _, false));

        }

        _.$slider.off('focus.slick blur.slick');

        if (_.options.arrows === true && _.slideCount > _.options.slidesToShow) {
            _.$prevArrow && _.$prevArrow.off('click.slick', _.changeSlide);
            _.$nextArrow && _.$nextArrow.off('click.slick', _.changeSlide);
        }

        _.$list.off('touchstart.slick mousedown.slick', _.swipeHandler);
        _.$list.off('touchmove.slick mousemove.slick', _.swipeHandler);
        _.$list.off('touchend.slick mouseup.slick', _.swipeHandler);
        _.$list.off('touchcancel.slick mouseleave.slick', _.swipeHandler);

        _.$list.off('click.slick', _.clickHandler);

        $(document).off(_.visibilityChange, _.visibility);

        _.cleanUpSlideEvents();

        if (_.options.accessibility === true) {
            _.$list.off('keydown.slick', _.keyHandler);
        }

        if (_.options.focusOnSelect === true) {
            $(_.$slideTrack).children().off('click.slick', _.selectHandler);
        }

        $(window).off('orientationchange.slick.slick-' + _.instanceUid, _.orientationChange);

        $(window).off('resize.slick.slick-' + _.instanceUid, _.resize);

        $('[draggable!=true]', _.$slideTrack).off('dragstart', _.preventDefault);

        $(window).off('load.slick.slick-' + _.instanceUid, _.setPosition);
        $(document).off('ready.slick.slick-' + _.instanceUid, _.setPosition);

    };

    Slick.prototype.cleanUpSlideEvents = function() {

        var _ = this;

        _.$list.off('mouseenter.slick', $.proxy(_.interrupt, _, true));
        _.$list.off('mouseleave.slick', $.proxy(_.interrupt, _, false));

    };

    Slick.prototype.cleanUpRows = function() {

        var _ = this, originalSlides;

        if(_.options.rows > 0) {
            originalSlides = _.$slides.children().children();
            originalSlides.removeAttr('style');
            _.$slider.empty().append(originalSlides);
        }

    };

    Slick.prototype.clickHandler = function(event) {

        var _ = this;

        if (_.shouldClick === false) {
            event.stopImmediatePropagation();
            event.stopPropagation();
            event.preventDefault();
        }

    };

    Slick.prototype.destroy = function(refresh) {

        var _ = this;

        _.autoPlayClear();

        _.touchObject = {};

        _.cleanUpEvents();

        $('.slick-cloned', _.$slider).detach();

        if (_.$dots) {
            _.$dots.remove();
        }


        if ( _.$prevArrow && _.$prevArrow.length ) {

            _.$prevArrow
                .removeClass('slick-disabled slick-arrow slick-hidden')
                .removeAttr('aria-hidden aria-disabled tabindex')
                .css('display','');

            if ( _.htmlExpr.test( _.options.prevArrow )) {
                _.$prevArrow.remove();
            }
        }

        if ( _.$nextArrow && _.$nextArrow.length ) {

            _.$nextArrow
                .removeClass('slick-disabled slick-arrow slick-hidden')
                .removeAttr('aria-hidden aria-disabled tabindex')
                .css('display','');

            if ( _.htmlExpr.test( _.options.nextArrow )) {
                _.$nextArrow.remove();
            }

        }


        if (_.$slides) {

            _.$slides
                .removeClass('slick-slide slick-active slick-center slick-visible slick-current')
                .removeAttr('aria-hidden')
                .removeAttr('data-slick-index')
                .each(function(){
                    $(this).attr('style', $(this).data('originalStyling'));
                });

            _.$slideTrack.children(this.options.slide).detach();

            _.$slideTrack.detach();

            _.$list.detach();

            _.$slider.append(_.$slides);
        }

        _.cleanUpRows();

        _.$slider.removeClass('slick-slider');
        _.$slider.removeClass('slick-initialized');
        _.$slider.removeClass('slick-dotted');

        _.unslicked = true;

        if(!refresh) {
            _.$slider.trigger('destroy', [_]);
        }

    };

    Slick.prototype.disableTransition = function(slide) {

        var _ = this,
            transition = {};

        transition[_.transitionType] = '';

        if (_.options.fade === false) {
            _.$slideTrack.css(transition);
        } else {
            _.$slides.eq(slide).css(transition);
        }

    };

    Slick.prototype.fadeSlide = function(slideIndex, callback) {

        var _ = this;

        if (_.cssTransitions === false) {

            _.$slides.eq(slideIndex).css({
                zIndex: _.options.zIndex
            });

            _.$slides.eq(slideIndex).animate({
                opacity: 1
            }, _.options.speed, _.options.easing, callback);

        } else {

            _.applyTransition(slideIndex);

            _.$slides.eq(slideIndex).css({
                opacity: 1,
                zIndex: _.options.zIndex
            });

            if (callback) {
                setTimeout(function() {

                    _.disableTransition(slideIndex);

                    callback.call();
                }, _.options.speed);
            }

        }

    };

    Slick.prototype.fadeSlideOut = function(slideIndex) {

        var _ = this;

        if (_.cssTransitions === false) {

            _.$slides.eq(slideIndex).animate({
                opacity: 0,
                zIndex: _.options.zIndex - 2
            }, _.options.speed, _.options.easing);

        } else {

            _.applyTransition(slideIndex);

            _.$slides.eq(slideIndex).css({
                opacity: 0,
                zIndex: _.options.zIndex - 2
            });

        }

    };

    Slick.prototype.filterSlides = Slick.prototype.slickFilter = function(filter) {

        var _ = this;

        if (filter !== null) {

            _.$slidesCache = _.$slides;

            _.unload();

            _.$slideTrack.children(this.options.slide).detach();

            _.$slidesCache.filter(filter).appendTo(_.$slideTrack);

            _.reinit();

        }

    };

    Slick.prototype.focusHandler = function() {

        var _ = this;

        _.$slider
            .off('focus.slick blur.slick')
            .on('focus.slick blur.slick',
                '*:not(.slick-arrow)', function(event) {

            event.stopImmediatePropagation();
            var $sf = $(this);

            setTimeout(function() {

                if( _.options.pauseOnFocus ) {
                    _.focussed = $sf.is(':focus');
                    _.autoPlay();
                }

            }, 0);

        });
    };

    Slick.prototype.getCurrent = Slick.prototype.slickCurrentSlide = function() {

        var _ = this;
        return _.currentSlide;

    };

    Slick.prototype.getDotCount = function() {

        var _ = this;

        var breakPoint = 0;
        var counter = 0;
        var pagerQty = 0;

        if (_.options.infinite === true) {
            while (breakPoint < _.slideCount) {
                ++pagerQty;
                breakPoint = counter + _.options.slidesToScroll;
                counter += _.options.slidesToScroll <= _.options.slidesToShow ? _.options.slidesToScroll : _.options.slidesToShow;
            }
        } else if (_.options.centerMode === true) {
            pagerQty = _.slideCount;
        } else if(!_.options.asNavFor) {
            pagerQty = 1 + Math.ceil((_.slideCount - _.options.slidesToShow) / _.options.slidesToScroll);
        }else {
            while (breakPoint < _.slideCount) {
                ++pagerQty;
                breakPoint = counter + _.options.slidesToScroll;
                counter += _.options.slidesToScroll <= _.options.slidesToShow ? _.options.slidesToScroll : _.options.slidesToShow;
            }
        }

        return pagerQty - 1;

    };

    Slick.prototype.getLeft = function(slideIndex) {

        var _ = this,
            targetLeft,
            verticalHeight,
            verticalOffset = 0,
            targetSlide;

        _.slideOffset = 0;
        verticalHeight = _.$slides.first().outerHeight(true);

        if (_.options.infinite === true) {
            if (_.slideCount > _.options.slidesToShow) {
                _.slideOffset = (_.slideWidth * _.options.slidesToShow) * -1;
                verticalOffset = (verticalHeight * _.options.slidesToShow) * -1;
            }
            if (_.slideCount % _.options.slidesToScroll !== 0) {
                if (slideIndex + _.options.slidesToScroll > _.slideCount && _.slideCount > _.options.slidesToShow) {
                    if (slideIndex > _.slideCount) {
                        _.slideOffset = ((_.options.slidesToShow - (slideIndex - _.slideCount)) * _.slideWidth) * -1;
                        verticalOffset = ((_.options.slidesToShow - (slideIndex - _.slideCount)) * verticalHeight) * -1;
                    } else {
                        _.slideOffset = ((_.slideCount % _.options.slidesToScroll) * _.slideWidth) * -1;
                        verticalOffset = ((_.slideCount % _.options.slidesToScroll) * verticalHeight) * -1;
                    }
                }
            }
        } else {
            if (slideIndex + _.options.slidesToShow > _.slideCount) {
                _.slideOffset = ((slideIndex + _.options.slidesToShow) - _.slideCount) * _.slideWidth;
                verticalOffset = ((slideIndex + _.options.slidesToShow) - _.slideCount) * verticalHeight;
            }
        }

        if (_.slideCount <= _.options.slidesToShow) {
            _.slideOffset = 0;
            verticalOffset = 0;
        }

        if (_.options.centerMode === true && _.options.infinite === true) {
            _.slideOffset += _.slideWidth * Math.floor(_.options.slidesToShow / 2) - _.slideWidth;
        } else if (_.options.centerMode === true) {
            _.slideOffset = 0;
            _.slideOffset += _.slideWidth * Math.floor(_.options.slidesToShow / 2);
        }

        if (_.options.vertical === false) {
            targetLeft = ((slideIndex * _.slideWidth) * -1) + _.slideOffset;
        } else {
            targetLeft = ((slideIndex * verticalHeight) * -1) + verticalOffset;
        }

        if (_.options.variableWidth === true) {

            if (_.slideCount <= _.options.slidesToShow || _.options.infinite === false) {
                targetSlide = _.$slideTrack.children('.slick-slide').eq(slideIndex);
            } else {
                targetSlide = _.$slideTrack.children('.slick-slide').eq(slideIndex + _.options.slidesToShow);
            }

            if (_.options.rtl === true) {
                if (targetSlide[0]) {
                    targetLeft = (_.$slideTrack.width() - targetSlide[0].offsetLeft - targetSlide.width()) * -1;
                } else {
                    targetLeft =  0;
                }
            } else {
                targetLeft = targetSlide[0] ? targetSlide[0].offsetLeft * -1 : 0;
            }

            if (_.options.centerMode === true) {
                if (_.slideCount <= _.options.slidesToShow || _.options.infinite === false) {
                    targetSlide = _.$slideTrack.children('.slick-slide').eq(slideIndex);
                } else {
                    targetSlide = _.$slideTrack.children('.slick-slide').eq(slideIndex + _.options.slidesToShow + 1);
                }

                if (_.options.rtl === true) {
                    if (targetSlide[0]) {
                        targetLeft = (_.$slideTrack.width() - targetSlide[0].offsetLeft - targetSlide.width()) * -1;
                    } else {
                        targetLeft =  0;
                    }
                } else {
                    targetLeft = targetSlide[0] ? targetSlide[0].offsetLeft * -1 : 0;
                }

                targetLeft += (_.$list.width() - targetSlide.outerWidth()) / 2;
            }
        }

        return targetLeft;

    };

    Slick.prototype.getOption = Slick.prototype.slickGetOption = function(option) {

        var _ = this;

        return _.options[option];

    };

    Slick.prototype.getNavigableIndexes = function() {

        var _ = this,
            breakPoint = 0,
            counter = 0,
            indexes = [],
            max;

        if (_.options.infinite === false) {
            max = _.slideCount;
        } else {
            breakPoint = _.options.slidesToScroll * -1;
            counter = _.options.slidesToScroll * -1;
            max = _.slideCount * 2;
        }

        while (breakPoint < max) {
            indexes.push(breakPoint);
            breakPoint = counter + _.options.slidesToScroll;
            counter += _.options.slidesToScroll <= _.options.slidesToShow ? _.options.slidesToScroll : _.options.slidesToShow;
        }

        return indexes;

    };

    Slick.prototype.getSlick = function() {

        return this;

    };

    Slick.prototype.getSlideCount = function() {

        var _ = this,
            slidesTraversed, swipedSlide, centerOffset;

        centerOffset = _.options.centerMode === true ? _.slideWidth * Math.floor(_.options.slidesToShow / 2) : 0;

        if (_.options.swipeToSlide === true) {
            _.$slideTrack.find('.slick-slide').each(function(index, slide) {
                if (slide.offsetLeft - centerOffset + ($(slide).outerWidth() / 2) > (_.swipeLeft * -1)) {
                    swipedSlide = slide;
                    return false;
                }
            });

            slidesTraversed = Math.abs($(swipedSlide).attr('data-slick-index') - _.currentSlide) || 1;

            return slidesTraversed;

        } else {
            return _.options.slidesToScroll;
        }

    };

    Slick.prototype.goTo = Slick.prototype.slickGoTo = function(slide, dontAnimate) {

        var _ = this;

        _.changeSlide({
            data: {
                message: 'index',
                index: parseInt(slide)
            }
        }, dontAnimate);

    };

    Slick.prototype.init = function(creation) {

        var _ = this;

        if (!$(_.$slider).hasClass('slick-initialized')) {

            $(_.$slider).addClass('slick-initialized');

            _.buildRows();
            _.buildOut();
            _.setProps();
            _.startLoad();
            _.loadSlider();
            _.initializeEvents();
            _.updateArrows();
            _.updateDots();
            _.checkResponsive(true);
            _.focusHandler();

        }

        if (creation) {
            _.$slider.trigger('init', [_]);
        }

        if (_.options.accessibility === true) {
            _.initADA();
        }

        if ( _.options.autoplay ) {

            _.paused = false;
            _.autoPlay();

        }

    };

    Slick.prototype.initADA = function() {
        var _ = this;
        _.$slides.add(_.$slideTrack.find('.slick-cloned')).attr({
            'aria-hidden': 'true',
            'tabindex': '-1'
        }).find('a, input, button, select').attr({
            'tabindex': '-1'
        });

        _.$slideTrack.attr('role', 'listbox');

        _.$slides.not(_.$slideTrack.find('.slick-cloned')).each(function(i) {
            $(this).attr({
                'role': 'option',
                'aria-describedby': 'slick-slide' + _.instanceUid + i + ''
            });
        });

        if (_.$dots !== null) {
            _.$dots.attr('role', 'tablist').find('li').each(function(i) {
                $(this).attr({
                    'role': 'presentation',
                    'aria-selected': 'false',
                    'aria-controls': 'navigation' + _.instanceUid + i + '',
                    'id': 'slick-slide' + _.instanceUid + i + ''
                });
            })
                .first().attr('aria-selected', 'true').end()
                .find('button').attr('role', 'button').end()
                .closest('div').attr('role', 'toolbar');
        }
        _.activateADA();

    };

    Slick.prototype.initArrowEvents = function() {

        var _ = this;

        if (_.options.arrows === true && _.slideCount > _.options.slidesToShow) {
            _.$prevArrow
               .off('click.slick')
               .on('click.slick', {
                    message: 'previous'
               }, _.changeSlide);
            _.$nextArrow
               .off('click.slick')
               .on('click.slick', {
                    message: 'next'
               }, _.changeSlide);
        }

    };

    Slick.prototype.initDotEvents = function() {

        var _ = this;

        if (_.options.dots === true && _.slideCount > _.options.slidesToShow) {
            $('li', _.$dots).on('click.slick', {
                message: 'index'
            }, _.changeSlide);
        }

        if ( _.options.dots === true && _.options.pauseOnDotsHover === true ) {

            $('li', _.$dots)
                .on('mouseenter.slick', $.proxy(_.interrupt, _, true))
                .on('mouseleave.slick', $.proxy(_.interrupt, _, false));

        }

    };

    Slick.prototype.initSlideEvents = function() {

        var _ = this;

        if ( _.options.pauseOnHover ) {

            _.$list.on('mouseenter.slick', $.proxy(_.interrupt, _, true));
            _.$list.on('mouseleave.slick', $.proxy(_.interrupt, _, false));

        }

    };

    Slick.prototype.initializeEvents = function() {

        var _ = this;

        _.initArrowEvents();

        _.initDotEvents();
        _.initSlideEvents();

        _.$list.on('touchstart.slick mousedown.slick', {
            action: 'start'
        }, _.swipeHandler);
        _.$list.on('touchmove.slick mousemove.slick', {
            action: 'move'
        }, _.swipeHandler);
        _.$list.on('touchend.slick mouseup.slick', {
            action: 'end'
        }, _.swipeHandler);
        _.$list.on('touchcancel.slick mouseleave.slick', {
            action: 'end'
        }, _.swipeHandler);

        _.$list.on('click.slick', _.clickHandler);

        $(document).on(_.visibilityChange, $.proxy(_.visibility, _));

        if (_.options.accessibility === true) {
            _.$list.on('keydown.slick', _.keyHandler);
        }

        if (_.options.focusOnSelect === true) {
            $(_.$slideTrack).children().on('click.slick', _.selectHandler);
        }

        $(window).on('orientationchange.slick.slick-' + _.instanceUid, $.proxy(_.orientationChange, _));

        $(window).on('resize.slick.slick-' + _.instanceUid, $.proxy(_.resize, _));

        $('[draggable!=true]', _.$slideTrack).on('dragstart', _.preventDefault);

        $(window).on('load.slick.slick-' + _.instanceUid, _.setPosition);
        $(document).on('ready.slick.slick-' + _.instanceUid, _.setPosition);

    };

    Slick.prototype.initUI = function() {

        var _ = this;

        if (_.options.arrows === true && _.slideCount > _.options.slidesToShow) {

            _.$prevArrow.show();
            _.$nextArrow.show();

        }

        if (_.options.dots === true && _.slideCount > _.options.slidesToShow) {

            _.$dots.show();

        }

    };

    Slick.prototype.keyHandler = function(event) {

        var _ = this;
         //Dont slide if the cursor is inside the form fields and arrow keys are pressed
        if(!event.target.tagName.match('TEXTAREA|INPUT|SELECT')) {
            if (event.keyCode === 37 && _.options.accessibility === true) {
                _.changeSlide({
                    data: {
                        message: _.options.rtl === true ? 'next' :  'previous'
                    }
                });
            } else if (event.keyCode === 39 && _.options.accessibility === true) {
                _.changeSlide({
                    data: {
                        message: _.options.rtl === true ? 'previous' : 'next'
                    }
                });
            }
        }

    };

    Slick.prototype.lazyLoad = function() {

        var _ = this,
            loadRange, cloneRange, rangeStart, rangeEnd;

        function loadImages(imagesScope) {

            $('img[data-lazy]', imagesScope).each(function() {

                var image = $(this),
                    imageSource = $(this).attr('data-lazy'),
                    imageToLoad = document.createElement('img');

                imageToLoad.onload = function() {

                    image
                        .animate({ opacity: 0 }, 100, function() {
                            image
                                .attr('src', imageSource)
                                .animate({ opacity: 1 }, 200, function() {
                                    image
                                        .removeAttr('data-lazy')
                                        .removeClass('slick-loading');
                                });
                            _.$slider.trigger('lazyLoaded', [_, image, imageSource]);
                        });

                };

                imageToLoad.onerror = function() {

                    image
                        .removeAttr( 'data-lazy' )
                        .removeClass( 'slick-loading' )
                        .addClass( 'slick-lazyload-error' );

                    _.$slider.trigger('lazyLoadError', [ _, image, imageSource ]);

                };

                imageToLoad.src = imageSource;

            });

        }

        if (_.options.centerMode === true) {
            if (_.options.infinite === true) {
                rangeStart = _.currentSlide + (_.options.slidesToShow / 2 + 1);
                rangeEnd = rangeStart + _.options.slidesToShow + 2;
            } else {
                rangeStart = Math.max(0, _.currentSlide - (_.options.slidesToShow / 2 + 1));
                rangeEnd = 2 + (_.options.slidesToShow / 2 + 1) + _.currentSlide;
            }
        } else {
            rangeStart = _.options.infinite ? _.options.slidesToShow + _.currentSlide : _.currentSlide;
            rangeEnd = Math.ceil(rangeStart + _.options.slidesToShow);
            if (_.options.fade === true) {
                if (rangeStart > 0) rangeStart--;
                if (rangeEnd <= _.slideCount) rangeEnd++;
            }
        }

        loadRange = _.$slider.find('.slick-slide').slice(rangeStart, rangeEnd);
        loadImages(loadRange);

        if (_.slideCount <= _.options.slidesToShow) {
            cloneRange = _.$slider.find('.slick-slide');
            loadImages(cloneRange);
        } else
        if (_.currentSlide >= _.slideCount - _.options.slidesToShow) {
            cloneRange = _.$slider.find('.slick-cloned').slice(0, _.options.slidesToShow);
            loadImages(cloneRange);
        } else if (_.currentSlide === 0) {
            cloneRange = _.$slider.find('.slick-cloned').slice(_.options.slidesToShow * -1);
            loadImages(cloneRange);
        }

    };

    Slick.prototype.loadSlider = function() {

        var _ = this;

        _.setPosition();

        _.$slideTrack.css({
            opacity: 1
        });

        _.$slider.removeClass('slick-loading');

        _.initUI();

        if (_.options.lazyLoad === 'progressive') {
            _.progressiveLazyLoad();
        }

    };

    Slick.prototype.next = Slick.prototype.slickNext = function() {

        var _ = this;

        _.changeSlide({
            data: {
                message: 'next'
            }
        });

    };

    Slick.prototype.orientationChange = function() {

        var _ = this;

        _.checkResponsive();
        _.setPosition();

    };

    Slick.prototype.pause = Slick.prototype.slickPause = function() {

        var _ = this;

        _.autoPlayClear();
        _.paused = true;

    };

    Slick.prototype.play = Slick.prototype.slickPlay = function() {

        var _ = this;

        _.autoPlay();
        _.options.autoplay = true;
        _.paused = false;
        _.focussed = false;
        _.interrupted = false;

    };

    Slick.prototype.postSlide = function(index) {

        var _ = this;

        if( !_.unslicked ) {

            _.$slider.trigger('afterChange', [_, index]);

            _.animating = false;

            _.setPosition();

            _.swipeLeft = null;

            if ( _.options.autoplay ) {
                _.autoPlay();
            }

            if (_.options.accessibility === true) {
                _.initADA();
            }

        }

    };

    Slick.prototype.prev = Slick.prototype.slickPrev = function() {

        var _ = this;

        _.changeSlide({
            data: {
                message: 'previous'
            }
        });

    };

    Slick.prototype.preventDefault = function(event) {

        event.preventDefault();

    };

    Slick.prototype.progressiveLazyLoad = function( tryCount ) {

        tryCount = tryCount || 1;

        var _ = this,
            $imgsToLoad = $( 'img[data-lazy]', _.$slider ),
            image,
            imageSource,
            imageToLoad;

        if ( $imgsToLoad.length ) {

            image = $imgsToLoad.first();
            imageSource = image.attr('data-lazy');
            imageToLoad = document.createElement('img');

            imageToLoad.onload = function() {

                image
                    .attr( 'src', imageSource )
                    .removeAttr('data-lazy')
                    .removeClass('slick-loading');

                if ( _.options.adaptiveHeight === true ) {
                    _.setPosition();
                }

                _.$slider.trigger('lazyLoaded', [ _, image, imageSource ]);
                _.progressiveLazyLoad();

            };

            imageToLoad.onerror = function() {

                if ( tryCount < 3 ) {

                    /**
                     * try to load the image 3 times,
                     * leave a slight delay so we don't get
                     * servers blocking the request.
                     */
                    setTimeout( function() {
                        _.progressiveLazyLoad( tryCount + 1 );
                    }, 500 );

                } else {

                    image
                        .removeAttr( 'data-lazy' )
                        .removeClass( 'slick-loading' )
                        .addClass( 'slick-lazyload-error' );

                    _.$slider.trigger('lazyLoadError', [ _, image, imageSource ]);

                    _.progressiveLazyLoad();

                }

            };

            imageToLoad.src = imageSource;

        } else {

            _.$slider.trigger('allImagesLoaded', [ _ ]);

        }

    };

    Slick.prototype.refresh = function( initializing ) {

        var _ = this, currentSlide, lastVisibleIndex;

        lastVisibleIndex = _.slideCount - _.options.slidesToShow;

        // in non-infinite sliders, we don't want to go past the
        // last visible index.
        if( !_.options.infinite && ( _.currentSlide > lastVisibleIndex )) {
            _.currentSlide = lastVisibleIndex;
        }

        // if less slides than to show, go to start.
        if ( _.slideCount <= _.options.slidesToShow ) {
            _.currentSlide = 0;

        }

        currentSlide = _.currentSlide;

        _.destroy(true);

        $.extend(_, _.initials, { currentSlide: currentSlide });

        _.init();

        if( !initializing ) {

            _.changeSlide({
                data: {
                    message: 'index',
                    index: currentSlide
                }
            }, false);

        }

    };

    Slick.prototype.registerBreakpoints = function() {

        var _ = this, breakpoint, currentBreakpoint, l,
            responsiveSettings = _.options.responsive || null;

        if ( $.type(responsiveSettings) === 'array' && responsiveSettings.length ) {

            _.respondTo = _.options.respondTo || 'window';

            for ( breakpoint in responsiveSettings ) {

                l = _.breakpoints.length-1;
                currentBreakpoint = responsiveSettings[breakpoint].breakpoint;

                if (responsiveSettings.hasOwnProperty(breakpoint)) {

                    // loop through the breakpoints and cut out any existing
                    // ones with the same breakpoint number, we don't want dupes.
                    while( l >= 0 ) {
                        if( _.breakpoints[l] && _.breakpoints[l] === currentBreakpoint ) {
                            _.breakpoints.splice(l,1);
                        }
                        l--;
                    }

                    _.breakpoints.push(currentBreakpoint);
                    _.breakpointSettings[currentBreakpoint] = responsiveSettings[breakpoint].settings;

                }

            }

            _.breakpoints.sort(function(a, b) {
                return ( _.options.mobileFirst ) ? a-b : b-a;
            });

        }

    };

    Slick.prototype.reinit = function() {

        var _ = this;

        _.$slides =
            _.$slideTrack
                .children(_.options.slide)
                .addClass('slick-slide');

        _.slideCount = _.$slides.length;

        if (_.currentSlide >= _.slideCount && _.currentSlide !== 0) {
            _.currentSlide = _.currentSlide - _.options.slidesToScroll;
        }

        if (_.slideCount <= _.options.slidesToShow) {
            _.currentSlide = 0;
        }

        _.registerBreakpoints();

        _.setProps();
        _.setupInfinite();
        _.buildArrows();
        _.updateArrows();
        _.initArrowEvents();
        _.buildDots();
        _.updateDots();
        _.initDotEvents();
        _.cleanUpSlideEvents();
        _.initSlideEvents();

        _.checkResponsive(false, true);

        if (_.options.focusOnSelect === true) {
            $(_.$slideTrack).children().on('click.slick', _.selectHandler);
        }

        _.setSlideClasses(typeof _.currentSlide === 'number' ? _.currentSlide : 0);

        _.setPosition();
        _.focusHandler();

        _.paused = !_.options.autoplay;
        _.autoPlay();

        _.$slider.trigger('reInit', [_]);

    };

    Slick.prototype.resize = function() {

        var _ = this;

        if ($(window).width() !== _.windowWidth) {
            clearTimeout(_.windowDelay);
            _.windowDelay = window.setTimeout(function() {
                _.windowWidth = $(window).width();
                _.checkResponsive();
                if( !_.unslicked ) { _.setPosition(); }
            }, 50);
        }
    };

    Slick.prototype.removeSlide = Slick.prototype.slickRemove = function(index, removeBefore, removeAll) {

        var _ = this;

        if (typeof(index) === 'boolean') {
            removeBefore = index;
            index = removeBefore === true ? 0 : _.slideCount - 1;
        } else {
            index = removeBefore === true ? --index : index;
        }

        if (_.slideCount < 1 || index < 0 || index > _.slideCount - 1) {
            return false;
        }

        _.unload();

        if (removeAll === true) {
            _.$slideTrack.children().remove();
        } else {
            _.$slideTrack.children(this.options.slide).eq(index).remove();
        }

        _.$slides = _.$slideTrack.children(this.options.slide);

        _.$slideTrack.children(this.options.slide).detach();

        _.$slideTrack.append(_.$slides);

        _.$slidesCache = _.$slides;

        _.reinit();

    };

    Slick.prototype.setCSS = function(position) {

        var _ = this,
            positionProps = {},
            x, y;

        if (_.options.rtl === true) {
            position = -position;
        }
        x = _.positionProp == 'left' ? Math.ceil(position) + 'px' : '0px';
        y = _.positionProp == 'top' ? Math.ceil(position) + 'px' : '0px';

        positionProps[_.positionProp] = position;

        if (_.transformsEnabled === false) {
            _.$slideTrack.css(positionProps);
        } else {
            positionProps = {};
            if (_.cssTransitions === false) {
                positionProps[_.animType] = 'translate(' + x + ', ' + y + ')';
                _.$slideTrack.css(positionProps);
            } else {
                positionProps[_.animType] = 'translate3d(' + x + ', ' + y + ', 0px)';
                _.$slideTrack.css(positionProps);
            }
        }

    };

    Slick.prototype.setDimensions = function() {

        var _ = this;

        if (_.options.vertical === false) {
            if (_.options.centerMode === true) {
                _.$list.css({
                    padding: ('0px ' + _.options.centerPadding)
                });
            }
        } else {
            _.$list.height(_.$slides.first().outerHeight(true) * _.options.slidesToShow);
            if (_.options.centerMode === true) {
                _.$list.css({
                    padding: (_.options.centerPadding + ' 0px')
                });
            }
        }

        _.listWidth = _.$list.width();
        _.listHeight = _.$list.height();


        if (_.options.vertical === false && _.options.variableWidth === false) {
            _.slideWidth = Math.ceil(_.listWidth / _.options.slidesToShow);
            _.$slideTrack.width(Math.ceil((_.slideWidth * _.$slideTrack.children('.slick-slide').length)));

        } else if (_.options.variableWidth === true) {
            _.$slideTrack.width(5000 * _.slideCount);
        } else {
            _.slideWidth = Math.ceil(_.listWidth);
            _.$slideTrack.height(Math.ceil((_.$slides.first().outerHeight(true) * _.$slideTrack.children('.slick-slide').length)));
        }

        var offset = _.$slides.first().outerWidth(true) - _.$slides.first().width();
        if (_.options.variableWidth === false) _.$slideTrack.children('.slick-slide').width(_.slideWidth - offset);

    };

    Slick.prototype.setFade = function() {

        var _ = this,
            targetLeft;

        _.$slides.each(function(index, element) {
            targetLeft = (_.slideWidth * index) * -1;
            if (_.options.rtl === true) {
                $(element).css({
                    position: 'relative',
                    right: targetLeft,
                    top: 0,
                    zIndex: _.options.zIndex - 2,
                    opacity: 0
                });
            } else {
                $(element).css({
                    position: 'relative',
                    left: targetLeft,
                    top: 0,
                    zIndex: _.options.zIndex - 2,
                    opacity: 0
                });
            }
        });

        _.$slides.eq(_.currentSlide).css({
            zIndex: _.options.zIndex - 1,
            opacity: 1
        });

    };

    Slick.prototype.setHeight = function() {

        var _ = this;

        if (_.options.slidesToShow === 1 && _.options.adaptiveHeight === true && _.options.vertical === false) {
            var targetHeight = _.$slides.eq(_.currentSlide).outerHeight(true);
            _.$list.css('height', targetHeight);
        }

    };

    Slick.prototype.setOption =
    Slick.prototype.slickSetOption = function() {

        /**
         * accepts arguments in format of:
         *
         *  - for changing a single option's value:
         *     .slick("setOption", option, value, refresh )
         *
         *  - for changing a set of responsive options:
         *     .slick("setOption", 'responsive', [{}, ...], refresh )
         *
         *  - for updating multiple values at once (not responsive)
         *     .slick("setOption", { 'option': value, ... }, refresh )
         */

        var _ = this, l, item, option, value, refresh = false, type;

        if( $.type( arguments[0] ) === 'object' ) {

            option =  arguments[0];
            refresh = arguments[1];
            type = 'multiple';

        } else if ( $.type( arguments[0] ) === 'string' ) {

            option =  arguments[0];
            value = arguments[1];
            refresh = arguments[2];

            if ( arguments[0] === 'responsive' && $.type( arguments[1] ) === 'array' ) {

                type = 'responsive';

            } else if ( typeof arguments[1] !== 'undefined' ) {

                type = 'single';

            }

        }

        if ( type === 'single' ) {

            _.options[option] = value;


        } else if ( type === 'multiple' ) {

            $.each( option , function( opt, val ) {

                _.options[opt] = val;

            });


        } else if ( type === 'responsive' ) {

            for ( item in value ) {

                if( $.type( _.options.responsive ) !== 'array' ) {

                    _.options.responsive = [ value[item] ];

                } else {

                    l = _.options.responsive.length-1;

                    // loop through the responsive object and splice out duplicates.
                    while( l >= 0 ) {

                        if( _.options.responsive[l].breakpoint === value[item].breakpoint ) {

                            _.options.responsive.splice(l,1);

                        }

                        l--;

                    }

                    _.options.responsive.push( value[item] );

                }

            }

        }

        if ( refresh ) {

            _.unload();
            _.reinit();

        }

    };

    Slick.prototype.setPosition = function() {

        var _ = this;

        _.setDimensions();

        _.setHeight();

        if (_.options.fade === false) {
            _.setCSS(_.getLeft(_.currentSlide));
        } else {
            _.setFade();
        }

        _.$slider.trigger('setPosition', [_]);

    };

    Slick.prototype.setProps = function() {

        var _ = this,
            bodyStyle = document.body.style;

        _.positionProp = _.options.vertical === true ? 'top' : 'left';

        if (_.positionProp === 'top') {
            _.$slider.addClass('slick-vertical');
        } else {
            _.$slider.removeClass('slick-vertical');
        }

        if (bodyStyle.WebkitTransition !== undefined ||
            bodyStyle.MozTransition !== undefined ||
            bodyStyle.msTransition !== undefined) {
            if (_.options.useCSS === true) {
                _.cssTransitions = true;
            }
        }

        if ( _.options.fade ) {
            if ( typeof _.options.zIndex === 'number' ) {
                if( _.options.zIndex < 3 ) {
                    _.options.zIndex = 3;
                }
            } else {
                _.options.zIndex = _.defaults.zIndex;
            }
        }

        if (bodyStyle.OTransform !== undefined) {
            _.animType = 'OTransform';
            _.transformType = '-o-transform';
            _.transitionType = 'OTransition';
            if (bodyStyle.perspectiveProperty === undefined && bodyStyle.webkitPerspective === undefined) _.animType = false;
        }
        if (bodyStyle.MozTransform !== undefined) {
            _.animType = 'MozTransform';
            _.transformType = '-moz-transform';
            _.transitionType = 'MozTransition';
            if (bodyStyle.perspectiveProperty === undefined && bodyStyle.MozPerspective === undefined) _.animType = false;
        }
        if (bodyStyle.webkitTransform !== undefined) {
            _.animType = 'webkitTransform';
            _.transformType = '-webkit-transform';
            _.transitionType = 'webkitTransition';
            if (bodyStyle.perspectiveProperty === undefined && bodyStyle.webkitPerspective === undefined) _.animType = false;
        }
        if (bodyStyle.msTransform !== undefined) {
            _.animType = 'msTransform';
            _.transformType = '-ms-transform';
            _.transitionType = 'msTransition';
            if (bodyStyle.msTransform === undefined) _.animType = false;
        }
        if (bodyStyle.transform !== undefined && _.animType !== false) {
            _.animType = 'transform';
            _.transformType = 'transform';
            _.transitionType = 'transition';
        }
        _.transformsEnabled = _.options.useTransform && (_.animType !== null && _.animType !== false);
    };


    Slick.prototype.setSlideClasses = function(index) {

        var _ = this,
            centerOffset, allSlides, indexOffset, remainder;

        allSlides = _.$slider
            .find('.slick-slide')
            .removeClass('slick-active slick-center slick-current')
            .attr('aria-hidden', 'true');

        _.$slides
            .eq(index)
            .addClass('slick-current');

        if (_.options.centerMode === true) {

            centerOffset = Math.floor(_.options.slidesToShow / 2);

            if (_.options.infinite === true) {

                if (index >= centerOffset && index <= (_.slideCount - 1) - centerOffset) {

                    _.$slides
                        .slice(index - centerOffset, index + centerOffset + 1)
                        .addClass('slick-active')
                        .attr('aria-hidden', 'false');

                } else {

                    indexOffset = _.options.slidesToShow + index;
                    allSlides
                        .slice(indexOffset - centerOffset + 1, indexOffset + centerOffset + 2)
                        .addClass('slick-active')
                        .attr('aria-hidden', 'false');

                }

                if (index === 0) {

                    allSlides
                        .eq(allSlides.length - 1 - _.options.slidesToShow)
                        .addClass('slick-center');

                } else if (index === _.slideCount - 1) {

                    allSlides
                        .eq(_.options.slidesToShow)
                        .addClass('slick-center');

                }

            }

            _.$slides
                .eq(index)
                .addClass('slick-center');

        } else {

            if (index >= 0 && index <= (_.slideCount - _.options.slidesToShow)) {

                _.$slides
                    .slice(index, index + _.options.slidesToShow)
                    .addClass('slick-active')
                    .attr('aria-hidden', 'false');

            } else if (allSlides.length <= _.options.slidesToShow) {

                allSlides
                    .addClass('slick-active')
                    .attr('aria-hidden', 'false');

            } else {

                remainder = _.slideCount % _.options.slidesToShow;
                indexOffset = _.options.infinite === true ? _.options.slidesToShow + index : index;

                if (_.options.slidesToShow == _.options.slidesToScroll && (_.slideCount - index) < _.options.slidesToShow) {

                    allSlides
                        .slice(indexOffset - (_.options.slidesToShow - remainder), indexOffset + remainder)
                        .addClass('slick-active')
                        .attr('aria-hidden', 'false');

                } else {

                    allSlides
                        .slice(indexOffset, indexOffset + _.options.slidesToShow)
                        .addClass('slick-active')
                        .attr('aria-hidden', 'false');

                }

            }

        }

        if (_.options.lazyLoad === 'ondemand') {
            _.lazyLoad();
        }

    };

    Slick.prototype.setupInfinite = function() {

        var _ = this,
            i, slideIndex, infiniteCount;

        if (_.options.fade === true) {
            _.options.centerMode = false;
        }

        if (_.options.infinite === true && _.options.fade === false) {

            slideIndex = null;

            if (_.slideCount > _.options.slidesToShow) {

                if (_.options.centerMode === true) {
                    infiniteCount = _.options.slidesToShow + 1;
                } else {
                    infiniteCount = _.options.slidesToShow;
                }

                for (i = _.slideCount; i > (_.slideCount -
                        infiniteCount); i -= 1) {
                    slideIndex = i - 1;
                    $(_.$slides[slideIndex]).clone(true).attr('id', '')
                        .attr('data-slick-index', slideIndex - _.slideCount)
                        .prependTo(_.$slideTrack).addClass('slick-cloned');
                }
                for (i = 0; i < infiniteCount; i += 1) {
                    slideIndex = i;
                    $(_.$slides[slideIndex]).clone(true).attr('id', '')
                        .attr('data-slick-index', slideIndex + _.slideCount)
                        .appendTo(_.$slideTrack).addClass('slick-cloned');
                }
                _.$slideTrack.find('.slick-cloned').find('[id]').each(function() {
                    $(this).attr('id', '');
                });

            }

        }

    };

    Slick.prototype.interrupt = function( toggle ) {

        var _ = this;

        if( !toggle ) {
            _.autoPlay();
        }
        _.interrupted = toggle;

    };

    Slick.prototype.selectHandler = function(event) {

        var _ = this;

        var targetElement =
            $(event.target).is('.slick-slide') ?
                $(event.target) :
                $(event.target).parents('.slick-slide');

        var index = parseInt(targetElement.attr('data-slick-index'));

        if (!index) index = 0;

        if (_.slideCount <= _.options.slidesToShow) {

            _.setSlideClasses(index);
            _.asNavFor(index);
            return;

        }

        _.slideHandler(index);

    };

    Slick.prototype.slideHandler = function(index, sync, dontAnimate) {

        var targetSlide, animSlide, oldSlide, slideLeft, targetLeft = null,
            _ = this, navTarget;

        sync = sync || false;

        if (_.animating === true && _.options.waitForAnimate === true) {
            return;
        }

        if (_.options.fade === true && _.currentSlide === index) {
            return;
        }

        if (_.slideCount <= _.options.slidesToShow) {
            return;
        }

        if (sync === false) {
            _.asNavFor(index);
        }

        targetSlide = index;
        targetLeft = _.getLeft(targetSlide);
        slideLeft = _.getLeft(_.currentSlide);

        _.currentLeft = _.swipeLeft === null ? slideLeft : _.swipeLeft;

        if (_.options.infinite === false && _.options.centerMode === false && (index < 0 || index > _.getDotCount() * _.options.slidesToScroll)) {
            if (_.options.fade === false) {
                targetSlide = _.currentSlide;
                if (dontAnimate !== true) {
                    _.animateSlide(slideLeft, function() {
                        _.postSlide(targetSlide);
                    });
                } else {
                    _.postSlide(targetSlide);
                }
            }
            return;
        } else if (_.options.infinite === false && _.options.centerMode === true && (index < 0 || index > (_.slideCount - _.options.slidesToScroll))) {
            if (_.options.fade === false) {
                targetSlide = _.currentSlide;
                if (dontAnimate !== true) {
                    _.animateSlide(slideLeft, function() {
                        _.postSlide(targetSlide);
                    });
                } else {
                    _.postSlide(targetSlide);
                }
            }
            return;
        }

        if ( _.options.autoplay ) {
            clearInterval(_.autoPlayTimer);
        }

        if (targetSlide < 0) {
            if (_.slideCount % _.options.slidesToScroll !== 0) {
                animSlide = _.slideCount - (_.slideCount % _.options.slidesToScroll);
            } else {
                animSlide = _.slideCount + targetSlide;
            }
        } else if (targetSlide >= _.slideCount) {
            if (_.slideCount % _.options.slidesToScroll !== 0) {
                animSlide = 0;
            } else {
                animSlide = targetSlide - _.slideCount;
            }
        } else {
            animSlide = targetSlide;
        }

        _.animating = true;

        _.$slider.trigger('beforeChange', [_, _.currentSlide, animSlide]);

        oldSlide = _.currentSlide;
        _.currentSlide = animSlide;

        _.setSlideClasses(_.currentSlide);

        if ( _.options.asNavFor ) {

            navTarget = _.getNavTarget();
            navTarget = navTarget.slick('getSlick');

            if ( navTarget.slideCount <= navTarget.options.slidesToShow ) {
                navTarget.setSlideClasses(_.currentSlide);
            }

        }

        _.updateDots();
        _.updateArrows();

        if (_.options.fade === true) {
            if (dontAnimate !== true) {

                _.fadeSlideOut(oldSlide);

                _.fadeSlide(animSlide, function() {
                    _.postSlide(animSlide);
                });

            } else {
                _.postSlide(animSlide);
            }
            _.animateHeight();
            return;
        }

        if (dontAnimate !== true) {
            _.animateSlide(targetLeft, function() {
                _.postSlide(animSlide);
            });
        } else {
            _.postSlide(animSlide);
        }

    };

    Slick.prototype.startLoad = function() {

        var _ = this;

        if (_.options.arrows === true && _.slideCount > _.options.slidesToShow) {

            _.$prevArrow.hide();
            _.$nextArrow.hide();

        }

        if (_.options.dots === true && _.slideCount > _.options.slidesToShow) {

            _.$dots.hide();

        }

        _.$slider.addClass('slick-loading');

    };

    Slick.prototype.swipeDirection = function() {

        var xDist, yDist, r, swipeAngle, _ = this;

        xDist = _.touchObject.startX - _.touchObject.curX;
        yDist = _.touchObject.startY - _.touchObject.curY;
        r = Math.atan2(yDist, xDist);

        swipeAngle = Math.round(r * 180 / Math.PI);
        if (swipeAngle < 0) {
            swipeAngle = 360 - Math.abs(swipeAngle);
        }

        if ((swipeAngle <= 45) && (swipeAngle >= 0)) {
            return (_.options.rtl === false ? 'left' : 'right');
        }
        if ((swipeAngle <= 360) && (swipeAngle >= 315)) {
            return (_.options.rtl === false ? 'left' : 'right');
        }
        if ((swipeAngle >= 135) && (swipeAngle <= 225)) {
            return (_.options.rtl === false ? 'right' : 'left');
        }
        if (_.options.verticalSwiping === true) {
            if ((swipeAngle >= 35) && (swipeAngle <= 135)) {
                return 'down';
            } else {
                return 'up';
            }
        }

        return 'vertical';

    };

    Slick.prototype.swipeEnd = function(event) {

        var _ = this,
            slideCount,
            direction;

        _.dragging = false;
        _.interrupted = false;
        _.shouldClick = ( _.touchObject.swipeLength > 10 ) ? false : true;

        if ( _.touchObject.curX === undefined ) {
            return false;
        }

        if ( _.touchObject.edgeHit === true ) {
            _.$slider.trigger('edge', [_, _.swipeDirection() ]);
        }

        if ( _.touchObject.swipeLength >= _.touchObject.minSwipe ) {

            direction = _.swipeDirection();

            switch ( direction ) {

                case 'left':
                case 'down':

                    slideCount =
                        _.options.swipeToSlide ?
                            _.checkNavigable( _.currentSlide + _.getSlideCount() ) :
                            _.currentSlide + _.getSlideCount();

                    _.currentDirection = 0;

                    break;

                case 'right':
                case 'up':

                    slideCount =
                        _.options.swipeToSlide ?
                            _.checkNavigable( _.currentSlide - _.getSlideCount() ) :
                            _.currentSlide - _.getSlideCount();

                    _.currentDirection = 1;

                    break;

                default:


            }

            if( direction != 'vertical' ) {

                _.slideHandler( slideCount );
                _.touchObject = {};
                _.$slider.trigger('swipe', [_, direction ]);

            }

        } else {

            if ( _.touchObject.startX !== _.touchObject.curX ) {

                _.slideHandler( _.currentSlide );
                _.touchObject = {};

            }

        }

    };

    Slick.prototype.swipeHandler = function(event) {

        var _ = this;

        if ((_.options.swipe === false) || ('ontouchend' in document && _.options.swipe === false)) {
            return;
        } else if (_.options.draggable === false && event.type.indexOf('mouse') !== -1) {
            return;
        }

        _.touchObject.fingerCount = event.originalEvent && event.originalEvent.touches !== undefined ?
            event.originalEvent.touches.length : 1;

        _.touchObject.minSwipe = _.listWidth / _.options
            .touchThreshold;

        if (_.options.verticalSwiping === true) {
            _.touchObject.minSwipe = _.listHeight / _.options
                .touchThreshold;
        }

        switch (event.data.action) {

            case 'start':
                _.swipeStart(event);
                break;

            case 'move':
                _.swipeMove(event);
                break;

            case 'end':
                _.swipeEnd(event);
                break;

        }

    };

    Slick.prototype.swipeMove = function(event) {

        var _ = this,
            edgeWasHit = false,
            curLeft, swipeDirection, swipeLength, positionOffset, touches;

        touches = event.originalEvent !== undefined ? event.originalEvent.touches : null;

        if (!_.dragging || touches && touches.length !== 1) {
            return false;
        }

        curLeft = _.getLeft(_.currentSlide);

        _.touchObject.curX = touches !== undefined ? touches[0].pageX : event.clientX;
        _.touchObject.curY = touches !== undefined ? touches[0].pageY : event.clientY;

        _.touchObject.swipeLength = Math.round(Math.sqrt(
            Math.pow(_.touchObject.curX - _.touchObject.startX, 2)));

        if (_.options.verticalSwiping === true) {
            _.touchObject.swipeLength = Math.round(Math.sqrt(
                Math.pow(_.touchObject.curY - _.touchObject.startY, 2)));
        }

        swipeDirection = _.swipeDirection();

        if (swipeDirection === 'vertical') {
            return;
        }

        if (event.originalEvent !== undefined && _.touchObject.swipeLength > 4) {
            event.preventDefault();
        }

        positionOffset = (_.options.rtl === false ? 1 : -1) * (_.touchObject.curX > _.touchObject.startX ? 1 : -1);
        if (_.options.verticalSwiping === true) {
            positionOffset = _.touchObject.curY > _.touchObject.startY ? 1 : -1;
        }


        swipeLength = _.touchObject.swipeLength;

        _.touchObject.edgeHit = false;

        if (_.options.infinite === false) {
            if ((_.currentSlide === 0 && swipeDirection === 'right') || (_.currentSlide >= _.getDotCount() && swipeDirection === 'left')) {
                swipeLength = _.touchObject.swipeLength * _.options.edgeFriction;
                _.touchObject.edgeHit = true;
            }
        }

        if (_.options.vertical === false) {
            _.swipeLeft = curLeft + swipeLength * positionOffset;
        } else {
            _.swipeLeft = curLeft + (swipeLength * (_.$list.height() / _.listWidth)) * positionOffset;
        }
        if (_.options.verticalSwiping === true) {
            _.swipeLeft = curLeft + swipeLength * positionOffset;
        }

        if (_.options.fade === true || _.options.touchMove === false) {
            return false;
        }

        if (_.animating === true) {
            _.swipeLeft = null;
            return false;
        }

        _.setCSS(_.swipeLeft);

    };

    Slick.prototype.swipeStart = function(event) {

        var _ = this,
            touches;

        _.interrupted = true;

        if (_.touchObject.fingerCount !== 1 || _.slideCount <= _.options.slidesToShow) {
            _.touchObject = {};
            return false;
        }

        if (event.originalEvent !== undefined && event.originalEvent.touches !== undefined) {
            touches = event.originalEvent.touches[0];
        }

        _.touchObject.startX = _.touchObject.curX = touches !== undefined ? touches.pageX : event.clientX;
        _.touchObject.startY = _.touchObject.curY = touches !== undefined ? touches.pageY : event.clientY;

        _.dragging = true;

    };

    Slick.prototype.unfilterSlides = Slick.prototype.slickUnfilter = function() {

        var _ = this;

        if (_.$slidesCache !== null) {

            _.unload();

            _.$slideTrack.children(this.options.slide).detach();

            _.$slidesCache.appendTo(_.$slideTrack);

            _.reinit();

        }

    };

    Slick.prototype.unload = function() {

        var _ = this;

        $('.slick-cloned', _.$slider).remove();

        if (_.$dots) {
            _.$dots.remove();
        }

        if (_.$prevArrow && _.htmlExpr.test(_.options.prevArrow)) {
            _.$prevArrow.remove();
        }

        if (_.$nextArrow && _.htmlExpr.test(_.options.nextArrow)) {
            _.$nextArrow.remove();
        }

        _.$slides
            .removeClass('slick-slide slick-active slick-visible slick-current')
            .attr('aria-hidden', 'true')
            .css('width', '');

    };

    Slick.prototype.unslick = function(fromBreakpoint) {

        var _ = this;
        _.$slider.trigger('unslick', [_, fromBreakpoint]);
        _.destroy();

    };

    Slick.prototype.updateArrows = function() {

        var _ = this,
            centerOffset;

        centerOffset = Math.floor(_.options.slidesToShow / 2);

        if ( _.options.arrows === true &&
            _.slideCount > _.options.slidesToShow &&
            !_.options.infinite ) {

            _.$prevArrow.removeClass('slick-disabled').attr('aria-disabled', 'false');
            _.$nextArrow.removeClass('slick-disabled').attr('aria-disabled', 'false');

            if (_.currentSlide === 0) {

                _.$prevArrow.addClass('slick-disabled').attr('aria-disabled', 'true');
                _.$nextArrow.removeClass('slick-disabled').attr('aria-disabled', 'false');

            } else if (_.currentSlide >= _.slideCount - _.options.slidesToShow && _.options.centerMode === false) {

                _.$nextArrow.addClass('slick-disabled').attr('aria-disabled', 'true');
                _.$prevArrow.removeClass('slick-disabled').attr('aria-disabled', 'false');

            } else if (_.currentSlide >= _.slideCount - 1 && _.options.centerMode === true) {

                _.$nextArrow.addClass('slick-disabled').attr('aria-disabled', 'true');
                _.$prevArrow.removeClass('slick-disabled').attr('aria-disabled', 'false');

            }

        }

    };

    Slick.prototype.updateDots = function() {

        var _ = this;

        if (_.$dots !== null) {

            _.$dots
                .find('li')
                .removeClass('slick-active')
                .attr('aria-hidden', 'true');

            _.$dots
                .find('li')
                .eq(Math.floor(_.currentSlide / _.options.slidesToScroll))
                .addClass('slick-active')
                .attr('aria-hidden', 'false');

        }

    };

    Slick.prototype.visibility = function() {

        var _ = this;

        if ( _.options.autoplay ) {

            if ( document[_.hidden] ) {

                _.interrupted = true;

            } else {

                _.interrupted = false;

            }

        }

    };

    $.fn.slick = function() {
        var _ = this,
            opt = arguments[0],
            args = Array.prototype.slice.call(arguments, 1),
            l = _.length,
            i,
            ret;
        for (i = 0; i < l; i++) {
            if (typeof opt == 'object' || typeof opt == 'undefined')
                _[i].slick = new Slick(_[i], opt);
            else
                ret = _[i].slick[opt].apply(_[i].slick, args);
            if (typeof ret != 'undefined') return ret;
        }
        return _;
    };

}));
$(document).ready(function(){
  $('.carousel').slick({
      dots: true,
      slidesPerRow: 2,
      rows: 2,
      responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesPerRow: 2,
          rows: 1,
        }
      },
      {
        breakpoint: 640,
        settings: {
          slidesPerRow: 1,
          rows: 1,
        }
      }
    ]
  });
});
         





                          
                          
//tinder 
                          
/*const carouselItems = document.querySelectorAll('.carousel');
const nopeButton = document.getElementById('nope');
const loveButton = document.getElementById('love');

function handleNope() {
  const currentCarousel = carouselItems[0];
  if (currentCarousel) {
    currentCarousel.classList.add('removed');
    setTimeout(() => currentCarousel.remove(), 500);
  }
}

function handleLove() {
  const currentCarousel = carouselItems[0];
  if (currentCarousel) {
    currentCarousel.classList.add('loved');
    setTimeout(() => currentCarousel.remove(), 500);
  }
}

nopeButton.addEventListener('click', handleNope);
loveButton.addEventListener('click', handleLove);*/
                          

                   


      
      
    </script>
			</div>
		</div>
</body>
</html>