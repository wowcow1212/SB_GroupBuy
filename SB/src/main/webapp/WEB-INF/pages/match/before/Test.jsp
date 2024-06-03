<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.user.bean.UserBean"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>MatchProfileEdit</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<link rel="stylesheet" href="/mycss/custom.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body {
	margin-top: 20px;
	color: #9b9ca1;
}

.bg-secondary-soft {
	background-color: rgba(208, 212, 217, 0.1) !important;
}

.rounded {
	border-radius: 5px !important;
}

.py-5 {
	padding-top: 3rem !important;
	padding-bottom: 3rem !important;
}

.px-4 {
	padding-right: 1.5rem !important;
	padding-left: 1.5rem !important;
}

/*標籤樣式設置*/
.nav-tabs .nav-link {
	font-weight: bold;
}

/* 未選中的顏色 */
.nav-tabs .nav-link {
	color: #ADD8E6;
}

/* 鼠標懸停時的顏色 */
.nav-tabs .nav-link:hover {
	color: #ACC3CA;
}

/* 點選時的顏色 */
.nav-tabs .nav-link.active, .nav-tabs .nav-link:focus {
	color: #656363;
}

/*整個頁面增加底部間距*/
.container {
	margin-bottom: 200px;
	/* 調整這個數值來增加或減少底部間距 */
}

.file-upload .square {
	height: 250px;
	width: 250px;
	margin: auto;
	vertical-align: middle;
	border: 1px solid #e5dfe4;
	background-color: #fff;
	border-radius: 5px;
}

.text-secondary {
	--bs-text-opacity: 1;
	color: rgba(208, 212, 217, 0.5) !important;
}

/*頭像上傳跟刪除按鈕*/
.btn-success-soft {
	color: #28a745;
	background-color: rgba(40, 167, 69, 0.1);
}

.btn-danger-soft {
	color: #dc3545;
	background-color: rgba(220, 53, 69, 0.1);
}

/*頭像按鈕移上去樣式*/
.btn-success-soft:hover {
	color: #222121;
	background-color: #E5F2E8;
}

.btn-danger-soft:hover {
	color: #222121;
	background-color: #F7E6E8;
}

/*頭像圖片框*/
.form-control {
	display: block;
	width: 100%;
	padding: 0.5rem 1rem;
	font-size: 0.9375rem;
	font-weight: 400;
	line-height: 1.6;
	color: #29292e;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #e5dfe4;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 5px;
	-webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow
		0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s
		ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
}

/* 頭像樣式 */
.avatar {
	width: 100%;
	/* 設置頭像的寬度 */
	height: 100%;
	/* 設置頭像的高度 */
	object-fit: cover;
	/* 確保圖像完全填充頭像框 */
	border-radius: 5px;
}

/*輪播*/
.owl-carousel .item {
	margin: 5px;
}

.owl-carousel .item img {
	display: block;
	width: 100%;
	height: 500px;
	/* 調整這個值來設定照片高度 */
	object-fit: cover;
	/* 確保照片不會被拉伸或壓縮 */
}

/*輪播圖片 - 框跟圖示*/
.photo-container {
	position: relative;
}

/*主題名稱區塊*/
.theme-name {
	background-color: #918e8e77;
	/* 背景顏色 */
	color: #333;
	/* 文字顏色 */
	padding: 20px;
	/* 內邊距 */
	font-size: 16.5px;
	/* 字體大小 */
	border-radius: 5px;
	/* 圓角 */
	border-top-left-radius: 0px;
	/* 上左角方形 */
	border-top-right-radius: 0px;
	/* 上右角方形 */
	border-bottom-left-radius: 5px;
	/* 下左角圓形 */
	border-bottom-right-radius: 5px;
	/* 下右角圓形 */
}

.photo-container .square {
	opacity: 0;
	transition: opacity 0.3s;
}

.photo-container:hover .square {
	opacity: 1;
}

.add-photo {
	cursor: pointer;
}

/*框線長寬*/
.image-frame {
	width: 200px;
	/* 調整寬度 */
	height: 500px;
	/* 調整高度 */
	display: inline-block;
	/* 或者 float:left; */
	overflow: hidden;
	/* 裁切超出框架的部分 */
}

/*主題照片框線樣式*/
.photo-container .image-frame {
	display: block;
	width: 100%;
	padding: 0;
	/* 移除內邊距 */
	font-size: 0.9375rem;
	font-weight: 400;
	line-height: 1.6;
	color: #29292e;
	background-color: #d8d8d86d;
	background-clip: padding-box;
	border: 1px solid #e5dfe4;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 5px;
	overflow: hidden;
	/* 確保圖片不會溢出框 */
	border-top-left-radius: 5px;
	/* 上左角方形 */
	border-top-right-radius: 5px;
	/* 上右角方形 */
	border-bottom-left-radius: 0px;
	/* 下左角圓形 */
	border-bottom-right-radius: 0px;
	/* 下右角圓形 */
	-webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow
		0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s
		ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
}

.image-frame img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* 確保圖片完全覆蓋框架區域 */
}

.delete-photo {
	color: #6c757d;
	/* 初始狀態下的顏色 */
	border-color: transparent;
	background-color: transparent;
}

.delete-photo:hover {
	background-color: #dc3545;
	/* 移上去後的背景色（紅色） */
	border-color: #dc3545;
}

.delete-photo i {
	color: #111111;
	/* "x" 圖標顏色 */
}

.delete-photo:hover i {
	color: #fff;
	/* 移上去後的 "x" 圖標顏色 */
}

/*頁籤與個性標籤頁面的距離*/
.nav.nav-tabs {
	margin-bottom: 5px;
}

#tagsTabPane .bg-secondary-soft {
	margin-top: 25px;
}

#tagsTabPane .gap-3 {
	margin-top: 25px;
}

/*可選標籤 : 下拉式選單 */
.customSuggestionsList>div {
	max-height: 300px;
	min-height: 50px;
	border: 2px solid #80ade8;
	overflow: auto;
}

.customSuggestionsList .empty {
	color: #999;
	font-size: 20px;
	text-align: center;
	padding: 1em;
}

/*可選標籤 : 框裡選擇再在外面顯示標籤*/
.tagify--outside {
	border: 0;
}

/* 在外部的 tagify 輸入框樣式 */
.tagify--outside .tagify__input {
	order: -1;
	flex: 100%;
	border: 1px solid var(--tags-border-color);
	margin-bottom: 1em;
	transition: .1s;
}

.tagify--outside .tagify__input:hover {
	border-color: var(--tags-hover-border-color);
}

.tagify--outside.tagify--focus .tagify__input {
	transition: 0s;
	border-color: var(--tags-focus-border-color);
}

/* 清除全部按鈕樣式 */
.tags--removeAllBtn {
	background-color: #80ade8;
	/* 更改背景顏色 */
	color: #ffffff;
	/* 更改文本顏色 */
	font-size: 12px;
	/* 調整按鈕文字大小 */
	border: 1px solid #80ade8;
	/* 更改邊框顏色 */
	padding: 3px 15px;
	/* 調整內邊距 */
	border-radius: 5px;
	/* 圓角 */
	margin-top: 39px;
	/* 調整上方 margin */
	margin-bottom: 0;
	width: auto;
	/* 自動調整寬度 */
	height: 25px;
	/* 自動調整高度 */
}

.tags--removeAllBtn:hover {
	background-color: #c82333;
	/* 滑鼠移過時的背景顏色 */
	border-color: #c82333;
	/* 滑鼠移過時的邊框顏色 */
}

/*從以下清單中新增標籤: 樣式*/
.tag-label {
	font-size: 15px;
	color: #80ade8;
	font-weight: bold;
	margin-bottom: 0;
	margin-top: 35px;
	/* 調整上方 margin */
}
</style>


</head>
<body>



	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
		integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
		crossorigin="anonymous" />
	<div class="container">

		<div class="row g-3">
			<!-- 內容 -->
			<div class="col-12 col-sm-8"></div>
			<div class="my-5">
				<h3>My Profile</h3>
			</div>

			<!-- 頁籤 -->
			<ul class="nav nav-tabs" id="tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="profileTab"
						data-bs-toggle="tab" data-bs-target="#profileTabPane"
						type="button" role="tab" aria-controls="profileTabPane"
						aria-selected="true">基本資料</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="photosTab" data-bs-toggle="tab"
						data-bs-target="#photosTabPane" type="button" role="tab"
						aria-controls="photosTabPane" aria-selected="false">主題照片
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="accordionTab" data-bs-toggle="tab"
						data-bs-target="#tagsTabPane" type="button" role="tab"
						aria-controls="accordionTabPane" aria-selected="false">
						自訂標籤</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="accordionTab" data-bs-toggle="tab"
						data-bs-target="#othersTabPane" type="button" role="tab"
						aria-controls="accordionTabPane" aria-selected="false">
						其他</button>
				</li>
			</ul>


			<!-- 內容 -->
			<div class="tab-content" id="tabContent">

				<!-- 基本資料 -->
				<div class="tab-pane fade show active" id="profileTabPane"
					role="tabpanel" aria-labelledby="profileTab" tabindex="0">
					<div class="mb-3">
						<div>
							<form class="file-upload">
								<div class="row mb-5 gx-5">
									<div class="tab-content">

										<div class="tab-content">
											<div class="tab-pane fade show active" id="tab-basic"
												role="tabpanel">
												<!-- 基本資料內容 -->
											</div>
										</div>
									</div>

									<div class="col-xxl-8 mb-5 mb-xxl-0">
										<div class="bg-secondary-soft px-4 py-5 rounded">
											<div class="row g-3">

												<div class="col-md-6">
													<label class="form-label"> 暱稱 *</label> <input type="text"
														class="form-control" name="nickName"
														value="${userBean.nickName}" placeholder="輸入暱稱">
												</div>

												<div class="col-md-6">
													<label for="inputGender" class="form-label"> 性別 *</label> <select
														id="inputGender" class="form-select" name="gender">
														<option value=""
															${empty userBean.gender ? "selected" : ""}>選擇性別</option>
														<option value="1" ${userBean.gender == 1? "selected" : ""}>生理男</option>
														<option value="0" ${userBean.gender == 0? "selected" : ""}>生理女</option>
													</select>
												</div>

												<div class="col-md-6">
													<label class="form-label">生日 *</label> <input type="date"
														class="form-control" id="date" name="birthday"
														value="${localDateTimeDateFormat.format(userBean.birthday)}"
														pattern='yyyy-MM-dd' onchange="calculateZodiac()">
												</div>

												<div class="col-md-6">
													<label class="form-label">星座 *</label> <input type="text"
														class="form-control" id="zodiac" name="starSign"
														placeholder="自動載入星座" readonly>
												</div>

												<div class="col-md-6">
													<label for="inputBloodType" class="form-label">血型 </label>
													<select id="inputBloodType" class="form-select"
														name="bloodType">
														<option value=""
															${empty userBean.bloodType ? "selected" : ""}>選擇血型</option>
														<option value="A"
															${userBean.bloodType == "A" ? "selected" : ""}>A</option>
														<option value="B"
															${userBean.bloodType == "B" ? "selected" : ""}>B</option>
														<option value="O"
															${userBean.bloodType == "O" ? "selected" : ""}>O</option>
														<option value="AB"
															${userBean.bloodType == "AB" ? "selected" : ""}>AB</option>
														<option value="其他"
															${userBean.bloodType == "其他" ? "selected" : ""}>其他</option>
													</select>
												</div>

												<div class="col-md-6">
													<label for="inputMBTI" class="form-label"> MBTI </label>
													<div class="input-group">
														<select id="inputMBTI" class="form-select" name="MBTI">
															<option value="" ${empty userBean.MBTI ? "selected" : ""}>選擇
																MBTI 類型</option>
															<option value="ISTJ"
																${userBean.MBTI == "ISTJ" ? "selected" : ""}>ISTJ</option>
															<option value="ISTP"
																${userBean.MBTI == "ISTP" ? "selected" : ""}>ISTP</option>
															<option value="ISFJ"
																${userBean.MBTI == "ISFJ" ? "selected" : ""}>ISFJ</option>
															<option value="ISFP"
																${userBean.MBTI == "ISFP" ? "selected" : ""}>ISFP</option>
															<option value="INTJ"
																${userBean.MBTI == "INTJ" ? "selected" : ""}>INTJ</option>
															<option value="INTP"
																${userBean.MBTI == "INTP" ? "selected" : ""}>INTP</option>
															<option value="INFJ"
																${userBean.MBTI == "INFJ" ? "selected" : ""}>INFJ</option>
															<option value="INFP"
																${userBean.MBTI == "INFP" ? "selected" : ""}>INFP</option>
															<option value="ESTJ"
																${userBean.MBTI == "ESTJ" ? "selected" : ""}>ESTJ</option>
															<option value="ESTP"
																${userBean.MBTI == "ESTP" ? "selected" : ""}>ESTP</option>
															<option value="ESFJ"
																${userBean.MBTI == "ESFJ" ? "selected" : ""}>ESFJ</option>
															<option value="ESFP"
																${userBean.MBTI == "ESFP" ? "selected" : ""}>ESFP</option>
															<option value="ENTJ"
																${userBean.MBTI == "ENTJ" ? "selected" : ""}>ENTJ</option>
															<option value="ENTP"
																${userBean.MBTI == "ENTP" ? "selected" : ""}>ENTP</option>
															<option value="ENFJ"
																${userBean.MBTI == "ENFJ" ? "selected" : ""}>ENFJ</option>
															<option value="ENFP"
																${userBean.MBTI == "ENFP" ? "selected" : ""}>ENFP</option>
														</select>
													</div>
												</div>


												<div class="col-md-6">
													<label for="inputGoalNo" class="form-label">尋找關係* </label>
													<select id="inputGoalNo" class="form-select" name="goalNo">
														<option value=""
															${empty userBean.goalNo ? "selected" : ""}>選擇想要尋找的關係</option>
														<option value="1"
															${userBean.goalNo == 1 ? "selected" : ""}>不回答</option>
														<option value="2"
															${userBean.goalNo == 2 ? "selected" : ""}>網友</option>
														<option value="3"
															${userBean.goalNo == 3 ? "selected" : ""}>飯友</option>
														<option value="4"
															${userBean.goalNo == 4 ? "selected" : ""}>酒友</option>
														<option value="5"
															${userBean.goalNo == 5 ? "selected" : ""}>牌友</option>
														<option value="6"
															${userBean.goalNo == 6 ? "selected" : ""}>山友</option>
														<option value="7"
															${userBean.goalNo == 7 ? "selected" : ""}>旅伴</option>
														<option value="8"
															${userBean.goalNo == 8 ? "selected" : ""}>戀愛伴侶</option>
														<option value="9"
															${userBean.goalNo == 9 ? "selected" : ""}>結婚對象</option>
														<option value="10"
															${userBean.goalNo == 10 ? "selected" : ""}>朋友關係</option>
														<option value="11"
															${userBean.goalNo == 11 ? "selected" : ""}>短暫浪漫</option>
														<option value="12"
															${userBean.goalNo == 12 ? "selected" : ""}>匿名網友</option>
														<option value="13"
															${userBean.goalNo == 13 ? "selected" : ""}>一起運動</option>
														<option value="14"
															${userBean.goalNo == 14 ? "selected" : ""}>一起團購</option>
														<option value="15"
															${userBean.goalNo == 15 ? "selected" : ""}>外送拼單</option>
														<option value="16"
															${userBean.goalNo == 16 ? "selected" : ""}>不設限</option>
													</select>
												</div>
											</div>
										</div>
									</div>


									<!-- 照片 -->
									<div class="col-xxl-4">
										<div class="bg-secondary-soft px-4 py-5 rounded">
											<div class="row g-3">
												<h4 class="mb-4 mt-0 text-center">上傳頭像</h4>
												<!-- 將這行文字置中 -->
												<div class="text-center">
													<!-- 要加上 text-center 類，要不然下面的樣式會跑掉 -->

													<!--顯示用戶的頭像或者預設的用戶圖示 - Font Awesome圖標-->
													<div class="square position-relative display-2 mb-3">
														<img
															src="https://p1-tt.byteimg.com/origin/tos-cn-i-qvj2lq49k0/a2752baadcc147cb80408dc7179fe65b.jpg"
															alt="Avatar"
															class="position-absolute avatar top-50 start-50 translate-middle img-fluid">
													</div>

													<input type="file" id="customFile" name="file" hidden>
													<label class="btn btn-success-soft btn-block"
														for="customFile">Upload</label>
													<button type="button" class="btn btn-danger-soft">Remove</button>

													<p class="text-muted mt-3 mb-0">
														<span class="me-1">Note:</span>Minimum size 300px x 300px
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>




								<!-- 最下面 -->
								<div class="row mb-5 gx-5">
									<div class="col-xxl-6 mb-5 mb-xxl-0">
										<div class="bg-secondary-soft px-4 py-5 rounded">
											<div class="row g-3">
												<h4 class="mb-4 mt-0">Social media detail</h4>

												<div class="col-md-6">
													<label class="form-label"><i
														class="fab fa-fw fa-facebook me-2 text-facebook"></i>Facebook
														*</label> <input type="text" class="form-control" placeholder
														aria-label="Facebook" value="http://www.facebook.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i
														class="fab fa-fw fa-twitter text-twitter me-2"></i>Twitter
														*</label> <input type="text" class="form-control" placeholder
														aria-label="Twitter" value="http://www.twitter.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i
														class="fab fa-fw fa-linkedin-in text-linkedin me-2"></i>Linkedin
														*</label> <input type="text" class="form-control" placeholder
														aria-label="Linkedin" value="http://www.linkedin.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i
														class="fab fa-fw fa-instagram text-instagram me-2"></i>Instagram
														*</label> <input type="text" class="form-control" placeholder
														aria-label="Instragram" value="http://www.instragram.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i
														class="fas fa-fw fa-basketball-ball text-dribbble me-2"></i>Dribble
														*</label> <input type="text" class="form-control" placeholder
														aria-label="Dribble" value="http://www.dribble.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i
														class="fab fa-fw fa-pinterest text-pinterest"></i>Pinterest
														*</label> <input type="text" class="form-control" placeholder
														aria-label="Pinterest" value="http://www.pinterest.com">
												</div>
											</div>
										</div>
									</div>

									<div class="col-xxl-6">
										<div class="bg-secondary-soft px-4 py-5 rounded">
											<div class="row g-3">
												<h4 class="my-4">Change Password</h4>

												<div class="col-md-6">
													<label for="exampleInputPassword1" class="form-label">Old
														password *</label> <input type="password" class="form-control"
														id="exampleInputPassword1">
												</div>

												<div class="col-md-6">
													<label for="exampleInputPassword2" class="form-label">New
														password *</label> <input type="password" class="form-control"
														id="exampleInputPassword2">
												</div>

												<div class="col-md-12">
													<label for="exampleInputPassword3" class="form-label">Confirm
														Password *</label> <input type="password" class="form-control"
														id="exampleInputPassword3">
												</div>
											</div>
										</div>
									</div>
								</div>

								<div
									class="gap-3 d-md-flex justify-content-md-end text-center my-5">
									<button type="button" class="btn btn-primary btn-lg">確定修改</button>
									<button type="button" class="btn btn-danger btn-lg">
										確定刪除</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!--主題照片- 輪播-->
<!-- 				<form id="photoForm" method="post" enctype="multipart/form-data" action="/insertSPhoto"> -->
					<div class="tab-pane fade my-5" id="photosTabPane" role="tabpanel"
						aria-labelledby="photosTab" tabindex="0">
						<div class="mb-3">
							<div class="owl-carousel owl-theme">

								<!-- 第一個主題 -->
								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!-- 刪除按鈕 -->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile1"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label>
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->
										<input type="file" id="customFile1" name="sPhoto" hidden>
										<!-- 主題文字 -->
										<div class="theme-name text-center p-2">
											<!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="我的照片" hidden>
											我的照片
										</div>
									</div>
								</div>

								<!-- 第二個主題 -->
								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile2"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->										
										<input type="file" id="customFile2" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
										<!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="旅行壯遊" hidden>
											旅行壯遊
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile3"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																				
										<input type="file" id="customFile3" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="我的寵物" hidden>										
											我的寵物
										</div>
									</div>
								</div>


								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile4"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																														
										<input type="file" id="customFile4" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="偉大紀錄" hidden>																				
											偉大紀錄
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile5"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																																								
										<input type="file" id="customFile5" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="展露身材" hidden>																														
											展露身材
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile6"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																																																		
										<input type="file" id="customFile6" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->										
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="性感的我" hidden>										
											性感的我
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile7"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																																																												
										<input type="file" id="customFile7" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="玩樂的我" hidden>										
											玩樂的我
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile8"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																																																																						
										<input type="file" id="customFile8" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="時尚的我" hidden>											
											時尚的我
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile9"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<!-- 使用 name 屬性定義文件輸入字段的名稱 -->																																																																						
										<input type="file" id="customFile9" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="我的作品" hidden>																					
											我的作品
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile10"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<input type="file" id="customFile10" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="我的收藏" hidden>																															
											我的收藏
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile11"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<input type="file" id="customFile11" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="最愛的美食" hidden>																																								    											
											最愛的美食
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile12"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<input type="file" id="customFile12" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="最愛的電影" hidden>																																								    																					
											最愛的電影
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile13"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<input type="file" id="customFile13" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="最愛的書本" hidden>																																								    																															
											最愛的書本
										</div>
									</div>
								</div>

								<div class="item">
									<div class="photo-container position-relative">
										<div class="image-frame"></div>
										<!--刪除按鈕-->
										<button type="button"
											class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
											<i class="fas fa-times"></i>
										</button>
										<label for="customFile14"
											class="square position-absolute top-50 start-50 translate-middle display-2">
											<i class="fas fa-fw fa-plus text-secondary add-photo"></i>
										</label> 
										<input type="file" id="customFile14" name="sPhoto" hidden>
										<!-- 新增的空白區塊用來放置主題文字 -->
										<div class="theme-name text-center p-2">
									    <!-- 使用 name 屬性定義主題輸入字段的名稱 -->
											<input type="text" name="photoTheme" value="最愛的遊戲" hidden>																																								    																																									
											最愛的遊戲
										</div>
									</div>
								</div>
							</div>


							<div class="gap-3 d-md-flex justify-content-md-end text-center my-5">
							  <input type="hidden" name="userNo" value="${userBean.userNo}">							  
							  <button type="submit" class="btn btn-primary btn-lg">確定修改</button>
							  <button type="submit" class="btn btn-danger btn-lg">確定刪除</button>
							</div>
						</div>
					</div>
						<!-- </form>  -->
						
						
						
											<!-- 個性標籤 -->
					<div class="tab-pane fade" id="tagsTabPane" role="tabpanel"
						aria-labelledby="tagsTab" tabindex="0">

						<!-- 在這裡添加你的個性標籤頁籤的內容 -->
						<div class="row mb-5 gx-5">
							<div class="col-xxl-6 mb-5 mb-xxl-0">
								<div class="bg-secondary-soft px-4 py-5 rounded">
									<div class="row g-3">
										<h4 class="mb-4 mt-0">個性標籤</h4>

										<!--Tagify標籤輸入外掛-->
										<input name='tags-manual-suggestions'
											placeholder='輸入文字查詢標籤 / 限制只能選15個'
											style="margin-bottom: 10px;">
										<!-- 調整下方 margin -->
										<div
											class="d-flex justify-content-between align-items-center mt-4">
											<h3 class="mb-0 tag-label">☝ 從以下清單中新增標籤:</h3>
											<button class='tags--removeAllBtn'>清除全部</button>
											<!-- 調整上方 margin -->
										</div>
									</div>
								</div>
							</div>



							<div class="col-xxl-6">
								<div class="bg-secondary-soft px-4 py-5 rounded">
									<div class="row g-3">
										<h4 class="my-4 mt-0">聊天話題</h4>
										<input name='tags-outside' class='tagify--outside' type="text"
											placeholder='選擇聊天話題 / 限制只能選3個'>
									</div>
								</div>
							</div>
						</div>

						<div
							class="gap-3 d-md-flex justify-content-md-end text-center my-5">
							<button type="button" class="btn btn-primary btn-lg" onclick="updateTags()">確定修改</button>
							<button type="button" class="btn btn-danger btn-lg">確定刪除</button>
						</div>
			</div>
		</div>
	</div>
	
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>




	<!--如果日期欄位為空,就清空星座欄位-->
	<script>
            function calculateZodiac() {
                var dateInput = document.getElementById("date");
                var zodiacInput = document.getElementById("zodiac");

                if (dateInput.value === "") {
                    zodiacInput.value = "";
                    return;
                }

                var birthDate = new Date(dateInput.value);
                var month = birthDate.getMonth() + 1;
                var day = birthDate.getDate();

                var zodiac = "";
                if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
                    zodiac = "牡羊座";
                } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
                    zodiac = "金牛座";
                } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
                    zodiac = "雙子座";
                } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
                    zodiac = "巨蟹座";
                } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
                    zodiac = "獅子座";
                } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
                    zodiac = "處女座";
                } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
                    zodiac = "天秤座";
                } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
                    zodiac = "天蠍座";
                } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
                    zodiac = "射手座";
                } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
                    zodiac = "魔羯座";
                } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
                    zodiac = "水瓶座";
                } else {
                    zodiac = "雙魚座";
                }

                zodiacInput.value = zodiac;
            }
        </script>


	<!--輪播-->
	<script>
            $(document).ready(function () {
                $(".owl-carousel").owlCarousel({
                    loop: false,      // 循環播放
                    margin: 10,       // 外距 10px
                    responsiveClass: true,
                    nav: true, // 顯示點點
                    dots: true,
                    responsive: {
                        0: {
                            items: 1  // 螢幕大小為 0~600 顯示 1 個項目
                        },
                        600: {
                            items: 3  //螢幕大小為 600~1000 顯示 3 個項目
                        },
                        1000: {
                            items: 3  //螢幕大小為 1000 以上 顯示 3 個項目
                        }
                    }
                });
            });
        </script>


	<!--輪播 - 上傳圖片-->
	<script>
            // 獲取所有的文件輸入框
            const fileInputs = document.querySelectorAll('input[type="file"]');

            // 遍歷每個文件輸入框,並綁定事件監聽器
            fileInputs.forEach((input, index) => {
                input.addEventListener('change', (event) => {
                    const file = event.target.files[0];
                    const reader = new FileReader();

                    reader.onload = (e) => {
                        // 獲取對應的圖片框
                        const imageFrame = event.target.parentNode.querySelector('.image-frame');

                        // 清空圖片框
                        imageFrame.innerHTML = '';

                        // 創建一個新的 <img> 元素,並設置其 src 屬性為文件的數據 URL
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.style.width = '100%';
                        img.style.height = '100%';
                        img.style.objectFit = 'cover';

                        // 將新的圖片元素添加到圖片框中
                        imageFrame.appendChild(img);
                    }

                    reader.readAsDataURL(file);
                });
            });
        </script>


	<script>
            //按下"x"刪除圖片

            // 獲取所有的刪除按鈕
            const deleteButtons = document.querySelectorAll('.delete-photo');

            // 遍歷每個刪除按鈕,並綁定事件監聽器
            deleteButtons.forEach((button) => {
                button.addEventListener('click', () => {
                    // 獲取對應的圖片框
                    const imageFrame = button.parentNode.querySelector('.image-frame');

                    // 清空圖片框
                    imageFrame.innerHTML = '';

                    // 還原默認的加號圖標
                    const addPhotoIcon = button.parentNode.querySelector('.add-photo');
                    addPhotoIcon.style.display = 'block';
                });
            });
        </script>
        
        
        	<script>
            //可選標籤 : 下拉式選單
            var input = document.querySelector('input[name=tags-manual-suggestions]'),
                // init Tagify script on the above inputs
                tagify = new Tagify(input, {
                    whitelist: ["JAVA", "懶癌末期", "無話不談", "美劇", "健身", "韓劇", "NBA", "咖啡成癮", "爬山", "游泳", "馬拉松", "ABC", "今天吃什麼", "健行", "打工度假", "留學生活", "Youtube", "新移民", "唱歌", "打工", "貓", "狗", "奶茶控", "夜貓子", "手控", "音控", "顏控", "喜歡年上", "喜歡年下", "穩聊", "古風", "文青", "愛動物", "鬼片", "泰拳", "重訓", "衝浪", "不抽菸", "不喝酒", "作息規律", "素食主義者", "大叔", "不會說謊", "好相處", "美食甜點", "運動", "不菸不酒", "下廚小能手", "真心", "手遊", "閱讀", "正能量", "脾氣好", "陽光男孩", "愛睡覺", "背包客", "野外活動", "心理學", "數學", "股票", "攝影", "自煮", "外食", "影集", "陸劇", "找個聊得來的人", "滑雪", "熱愛生活", "情感豐富", "單身", "刺青", "擋車", "傳說對決", "園藝", "下棋", "棒球", "來個說走就走的旅行", "成人話題", "不排除聊色", "LOL", "KTV", "演戲", "打code", "工程師", "樂觀", "金融投資", "愛音樂", "ROCK!", "看展", "研究歷史", "獨立樂團", "韓團", "追星", "Y2K", "時尚", "reddit", "友善食光", "i珍食", "小資族", "英文", "日文", "生活要自己學會快樂", "想找個互相陪伴的人", "無釐頭", "愛笑", "熟了就很瘋", "學生", "上班族", "創業", "原神", "鋼琴", "武術", "科技產品", "幽默風趣", "熱愛生活", "瘋瘋癲癲", "藝術家", "可愛", "帥氣", "率性", "走在夢想的路上", "溫柔體貼", "專一", "老實人", "轉職", "設計", "抖S", "抖M", "黑客", "愛冒險", "我都可以聊喔", "手工藝", "高蛋白飲食", "佛系交友", "討厭人多的地方", "插畫家", "愛發呆", "塔羅", "算命", "夾娃娃", "智性戀", "音樂創作", "鬼才", "搞怪", "跳tone", "理性", "感性", "逛街", "小酌", "喜歡交朋友", "害羞", "慢熟", "可靠", "講幹話", "穿搭", "電視劇"],
                    dropdown: {
                        position: "manual",
                        maxItems: Infinity,
                        enabled: 0,
                        classname: "customSuggestionsList"
                    },
                    templates: {
                        dropdownItemNoMatch() {
                            return `Nothing Found`;
                        }
                    },
                    enforceWhitelist: true,


                    maxTags: 15 // 在這一行添加 maxTags 選項  // 限制只能選15個
                })

            tagify.on("dropdown:show", onSuggestionsListUpdate)
                .on("dropdown:hide", onSuggestionsListHide)
                .on('dropdown:scroll', onDropdownScroll)

            renderSuggestionsList()  // defined down below

            // ES2015 argument destructuring
            function onSuggestionsListUpdate({ detail: suggestionsElm }) {
                console.log(suggestionsElm)
            }

            function onSuggestionsListHide() {
                console.log("hide dropdown")
            }

            function onDropdownScroll(e) {
                console.log(e.detail)
            }

            // https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentElement
            function renderSuggestionsList() {
                tagify.dropdown.show() // load the list
                tagify.DOM.scope.parentNode.appendChild(tagify.DOM.dropdown)
            }

            //清除全部
            //可選標籤 : 下拉式選單
            var personalTagsInput = document.querySelector('input[name=tags-manual-suggestions]');
            var personalTagify = new Tagify(personalTagsInput, {
                // 個性標籤的 Tagify 選項
            });

            const removeAllBtn = document.querySelector('.tags--removeAllBtn');
            removeAllBtn.addEventListener('click', () => {
                personalTagify.removeAllTags(); // 現在綁定到第一個 Tagify 實例上
            });
	
	
            // ------實作-----
            
            
            
            // 獲取 Tagify 實例中用戶選擇的標籤值，我們可以在 Tagify 實例上註冊一個事件監聽器,監聽標籤值的變化,並在事件處理函數中獲取用戶選擇的標籤值。
            
            
            // 獲取 Tagify 實例
/*			var tagify = new Tagify(input, {
				whitelist: ["JAVA", "懶癌末期", "無話不談", "美劇", "健身", "韓劇", "NBA", "咖啡成癮", "爬山", "游泳", "馬拉松", "ABC", "今天吃什麼", "健行", "打工度假", "留學生活", "Youtube", "新移民", "唱歌", "打工", "貓", "狗", "奶茶控", "夜貓子", "手控", "音控", "顏控", "喜歡年上", "喜歡年下", "穩聊", "古風", "文青", "愛動物", "鬼片", "泰拳", "重訓", "衝浪", "不抽菸", "不喝酒", "作息規律", "素食主義者", "大叔", "不會說謊", "好相處", "美食甜點", "運動", "不菸不酒", "下廚小能手", "真心", "手遊", "閱讀", "正能量", "脾氣好", "陽光男孩", "愛睡覺", "背包客", "野外活動", "心理學", "數學", "股票", "攝影", "自煮", "外食", "影集", "陸劇", "找個聊得來的人", "滑雪", "熱愛生活", "情感豐富", "單身", "刺青", "擋車", "傳說對決", "園藝", "下棋", "棒球", "來個說走就走的旅行", "成人話題", "不排除聊色", "LOL", "KTV", "演戲", "打code", "工程師", "樂觀", "金融投資", "愛音樂", "ROCK!", "看展", "研究歷史", "獨立樂團", "韓團", "追星", "Y2K", "時尚", "reddit", "友善食光", "i珍食", "小資族", "英文", "日文", "生活要自己學會快樂", "想找個互相陪伴的人", "無釐頭", "愛笑", "熟了就很瘋", "學生", "上班族", "創業", "原神", "鋼琴", "武術", "科技產品", "幽默風趣", "熱愛生活", "瘋瘋癲癲", "藝術家", "可愛", "帥氣", "率性", "走在夢想的路上", "溫柔體貼", "專一", "老實人", "轉職", "設計", "抖S", "抖M", "黑客", "愛冒險", "我都可以聊喔", "手工藝", "高蛋白飲食", "佛系交友", "討厭人多的地方", "插畫家", "愛發呆", "塔羅", "算命", "夾娃娃", "智性戀", "音樂創作", "鬼才", "搞怪", "跳tone", "理性", "感性", "逛街", "小酌", "喜歡交朋友", "害羞", "慢熟", "可靠", "講幹話", "穿搭", "電視劇"] });

			// 監聽標籤值的變化
			tagify.on('add', function(e) {
			  console.log('新增標籤:', e.detail.data.value);
			});

			tagify.on('remove', function(e) {
			  console.log('移除標籤:', e.detail.data.value);
			});*/
			
			
			
			//將標籤值封裝成 JSON 格式
			
    function updateTags() {
    // 獲取用戶選擇的標籤值
    var selectedTags = tagify.value.map(function(tag) {
        return tag.value;
    });
    
    // 發送 POST 請求到後端
    fetch('/updateTags', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(selectedTags)
    })
    .then(function(response) {
        // 處理後端的回應
        if (response.ok) {
            console.log('標籤更新成功');
        } else {
            console.error('標籤更新失敗');
        }
    })
    .catch(function(error) {
        console.error('發生錯誤:', error);
    });
}
            
			

        </script>

	<script>
            //可選標籤 : 框裡選擇再在外面顯示標籤
            var input = document.querySelector('input[name=tags-outside]')
            var tagify = new Tagify(input, {
                whitelist: ['感情心事', '唱歌', '電玩', '美食', '購物', '運動', '動漫', '音樂', '寵物', '人生夢想', '旅行壯遊', '文青對話', '語言交換', '打工旅遊', '影視討論', '工作', '隨便', '深夜話題'],
                focusable: false,
                dropdown: {
                    position: 'input',
                    enabled: 0, // always opens dropdown when input gets focus
                    maxItems: 99999 // 增加這一行以顯示所有選項
                },
                maxTags: 3 // 限制選擇的標籤數量為3
            })
        </script>







	<script>
/*	function updatePhotos() {
		  const form = document.getElementById('photoForm');
		  const formData = new FormData(form);

		  const photoContainers = document.querySelectorAll('.photo-container');
		  photoContainers.forEach((container, index) => {
		    const imageFrame = container.querySelector('.image-frame');
		    const img = imageFrame.querySelector('img');

		    if (img) {
		      const photoTheme = container.querySelector('.theme-name input[name="photoTheme"]').value;
		      const photoPath = dataURLtoFile(img.src, `photo_${index}.jpg`);

		      formData.append(`photoTheme[${index}]`, photoTheme);
		      formData.append(`photoPath`, photoPath);
		    }
		  });

		  fetch('/updateSPhotos', {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/json'
		      },
		    body: formData
		  })
		  .then(response => response.json())
		  .then(data => {
		    console.log(data);
		    alert('照片已成功更新');
		  })
		  .catch(error => {
		    console.error('Error:', error);
		    alert('更新照片時發生錯誤');
		  });
		}

		function dataURLtoFile(dataurl, filename) {
		  var arr = dataurl.split(','),
		      mime = arr[0].match(/:(.*?);/)[1],
		      bstr = atob(arr[1]), 
		      n = bstr.length, 
		      u8arr = new Uint8Array(n);
		      
		  while(n--){
		      u8arr[n] = bstr.charCodeAt(n);
		  }
		  
		  return new File([u8arr], filename, {type:mime});
		}*/
        
        </script>


</body>
</html>