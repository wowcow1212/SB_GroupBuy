<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.user.bean.UserBean"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous"/>
	<link rel="stylesheet" href="/mycss/custom.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css">
	<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
	<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="mycss/MatchEdit.css">
	

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!--        <script src="js/test/Z_slider.js"></script>-->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <script src="js/layout/Z_TopBar.js"></script>

                <!-- 主要內容 -->

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
					<button class="nav-link active" id="profileTab" data-bs-toggle="tab" data-bs-target="#profileTabPane" type="button" role="tab" aria-controls="profileTabPane" aria-selected="true">基本資料</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="accordionTab" data-bs-toggle="tab" data-bs-target="#tagsTabPane" type="button" role="tab" aria-controls="accordionTabPane" aria-selected="false">
						自訂標籤</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="photosTab" data-bs-toggle="tab" data-bs-target="#photosTabPane" type="button" role="tab" aria-controls="photosTabPane" aria-selected="false">主題照片
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="accordionTab" data-bs-toggle="tab" data-bs-target="#othersTabPane" type="button" role="tab" aria-controls="accordionTabPane" aria-selected="false">
						其他</button>
				</li>
			</ul>


			<!-- 內容 -->
			<div class="tab-content" id="tabContent">

				<!-- 基本資料 -->
				<div class="tab-pane fade show active" id="profileTabPane" role="tabpanel" aria-labelledby="profileTab" tabindex="0">
					<div class="mb-3">
						<div>
							<form class="file-upload" action="/editUserProfile" method="post">
								<div class="row mb-5 gx-5">
									<div class="tab-content">

										<div class="tab-content">
											<div class="tab-pane fade show active" id="tab-basic" role="tabpanel">
												<!-- 基本資料內容 -->
											</div>
										</div>
									</div>

									<div class="col-xxl-8 mb-5 mb-xxl-0">
										<div class="bg-secondary-soft px-4 py-5 rounded">
											<div class="row g-3">

												<div class="col-md-6">
													<label class="form-label"> 暱稱 </label> 
													<input type="text" class="form-control" name="nickName" value="${userBean.nickName}" placeholder="輸入暱稱">
												</div>

												<div class="col-md-6">
													<label for="inputGender" class="form-label"> 性別 </label> <select
														id="inputGender" class="form-select" name="gender">
														<option value="" ${empty userBean.gender ? "selected" : ""}>選擇性別</option>
														<option value="1" ${userBean.gender == 1? "selected" : ""}>生理男</option>
														<option value="0" ${userBean.gender == 0? "selected" : ""}>生理女</option>
													</select>
												</div>

												<div class="col-md-6">
													<label class="form-label">生日 </label> 
													<input type="date" class="form-control" id="date" name="birthday" value="${localDateTimeDateFormat.format(userBean.birthday)}" pattern='yyyy-MM-dd' onchange="calculateZodiac()">
												</div>
												
												<div class="col-md-6">
                                                    <label class="form-label">星座</label>
                                                    <input type="text" class="form-control" id="zodiac" placeholder="射手座" readonly>
                                                </div>

												<div class="col-md-6">
													<label for="inputBloodType" class="form-label">血型 </label>
													<select id="inputBloodType" class="form-select" name="bloodType">
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
													<label for="inputGoalNo" class="form-label">尋找關係 </label> <select
														id="inputGoalNo" class="form-select" name="goalNo">
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
														<img src="/localimages/${userData.avatar}" alt="Avatar" class="position-absolute avatar top-50 start-50 translate-middle img-fluid">
													</div>

													<input type="file" id="customFile" name="file" hidden>
													<label class="btn btn-success-soft btn-block" for="customFile">Upload</label>
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
													<label class="form-label"><i class="fab fa-fw fa-twitter text-twitter me-2"></i>Twitter
														*</label> <input type="text" class="form-control" placeholder aria-label="Twitter" value="http://www.twitter.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i class="fab fa-fw fa-linkedin-in text-linkedin me-2"></i>Linkedin
														*</label> <input type="text" class="form-control" placeholder aria-label="Linkedin" value="http://www.linkedin.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i class="fab fa-fw fa-instagram text-instagram me-2"></i>Instagram
														*</label> <input type="text" class="form-control" placeholder aria-label="Instragram" value="http://www.instragram.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i class="fas fa-fw fa-basketball-ball text-dribbble me-2"></i>Dribble
														*</label> <input type="text" class="form-control" placeholder aria-label="Dribble" value="http://www.dribble.com">
												</div>

												<div class="col-md-6">
													<label class="form-label"><i class="fab fa-fw fa-pinterest text-pinterest"></i>Pinterest
														*</label> <input type="text" class="form-control" placeholder aria-label="Pinterest" value="http://www.pinterest.com">
												</div>
											</div>
										</div>
									</div>

									<div class="col-xxl-6">
										<div class="bg-secondary-soft px-4 py-5 rounded">
											<div class="row g-3">
												<h4 class="my-4">Change Password</h4>

												<div class="col-md-6">
													<label for="exampleInputPassword1" class="form-label">Old password *</label> <input type="password" class="form-control"
														id="exampleInputPassword1">
												</div>

												<div class="col-md-6">
													<label for="exampleInputPassword2" class="form-label">New password *</label> <input type="password" class="form-control"
														id="exampleInputPassword2">
												</div>

												<div class="col-md-12">
													<label for="exampleInputPassword3" class="form-label">Confirm Password *</label> <input type="password" class="form-control" id="exampleInputPassword3">
												</div>
											</div>
										</div>
									</div>
								</div>

										
								<div class="gap-3 d-md-flex justify-content-md-end text-center my-5">
									<button type="submit" class="btn btn-primary btn-lg">確定修改</button>
									<button type="button" class="btn btn-danger btn-lg" onclick="window.location.href='/newMatchPage'">配對頁面</button>								 
								</div>
							</form>
						</div>
					</div>
				</div>

				
				
				
								<!-- 個性標籤 -->
				<div class="tab-pane fade" id="tagsTabPane" role="tabpanel" aria-labelledby="tagsTab" tabindex="0">

					<!-- 在這裡添加你的個性標籤頁籤的內容 -->
					<div class="row mb-5 gx-5">
						<div class="col-xxl-6 mb-5 mb-xxl-0">
							<div class="bg-secondary-soft px-4 py-5 rounded">
								<div class="row g-3">
									<h4 class="mb-4 mt-0">個性標籤</h4>

									<!--Tagify標籤輸入外掛-->
									<input name='tags-manual-suggestions' placeholder='輸入文字查詢標籤 / 限制只能選15個' style="margin-bottom: 10px;">
									<!-- 調整下方 margin -->
									<div class="d-flex justify-content-between align-items-center mt-4">
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
									<input name='tags-outside' class='tagify--outside' type="text" placeholder='選擇聊天話題 / 限制只能選3個'>
								</div>
							</div>
						</div>
					</div>

					<div class="gap-3 d-md-flex justify-content-md-end text-center my-5">
						<button type="button" class="btn btn-primary btn-lg" id="updateButton" onclick="updateTags()">確定修改</button>
									<button type="button" class="btn btn-danger btn-lg" onclick="window.location.href='/newMatchPage'">配對頁面</button>
					</div>
				</div>
			</div>
			
			
			
			<form id="upload-form" method="post" enctype="multipart/form-data" action="/updatePhotos">
			   <input type="hidden" name="userNo" value="${userBean.userNo}">
				
				<!--主題照片- 輪播-->
                <div class="tab-pane fade my-5" id="photosTabPane" role="tabpanel" aria-labelledby="photosTab" tabindex="0">
                    <div class="mb-3">
                        <div class="owl-carousel owl-theme">

                            <!--第一個主題-->
                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo1}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo1 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile1" class="square position-absolute top-50 start-50 translate-middle display-2 ">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile1" name="file1" hidden>
                                    <input type="text" name="file1Theme" value="我的照片" hidden>                                   
                                    <div class="theme-name text-center p-2">
                                        我的照片
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo2}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo2 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile2" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile2" name="file2" hidden>
                                    <input type="text" name="file2Theme" value="旅行壯遊" hidden>                                                                       
                                    <div class="theme-name text-center p-2">
                                        旅行壯遊
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo3}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo3 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile3" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile3" name="file3" hidden>
                                    <input type="text" name="file3Theme" value="我的寵物" hidden>                                                                                                           
                                    <div class="theme-name text-center p-2">
                                        我的寵物
                                    </div>
                                </div>
                            </div>


                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo4}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo4 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile4" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile4" name="file4" hidden>
                                    <input type="text" name="file4Theme" value="偉大紀錄" hidden>                                                                                                                                               
                                    <div class="theme-name text-center p-2">
                                        偉大紀錄
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo5}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo5 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button"
                                        class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile5" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile5" name="file5" hidden>
                                    <input type="text" name="file5Theme" value="展露身材" hidden>                                                                                                                                                                                   
                                    <div class="theme-name text-center p-2">
                                        展露身材
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo6}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo6 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile6" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile6" name="file6" hidden>
                                    <input type="text" name="file6Theme" value="我的收藏" hidden>                                                                                                                                                                                                                       
                                    <div class="theme-name text-center p-2">
                                        我的收藏
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo7}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo7 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile7" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile7" name="file7" hidden>
                                    <input type="text" name="file7Theme" value="最愛的電影" hidden>                                                                                                                                                                                                                                                          
                                    <div class="theme-name text-center p-2">
                                        最愛的電影
                                    </div>
                                </div>
                            </div>

                            <div class="item">
                                <div class="photo-container position-relative">
                                    <div class="image-frame">
                                    	<img class="imgBody" src="/localimages/${photo8}" alt="" style="width: 100%; height: 100%; object-fit: cover;" ${photo8 == null ? "hidden" : ""}>
                                    </div>
                                    <!--刪除按鈕-->
                                    <button type="button" class="btn btn-outline-secondary rounded-circle delete-photo position-absolute top-0 end-0 m-2">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <label for="customFile8" class="square position-absolute top-50 start-50 translate-middle display-2">
                                        <i class="fas fa-fw fa-plus text-secondary add-photo"></i>
                                    </label>
                                    <input type="file" id="customFile8" name="file8" hidden>
                                    <input type="text" name="file8Theme" value="最愛的遊戲" hidden>                                                                                                                                                                                                                                                                                              
                                    <div class="theme-name text-center p-2">
                                        最愛的遊戲
                                    </div>
                                </div>
                            </div>
                        </div>


						<div class="gap-3 d-md-flex justify-content-md-end text-center my-5">
					    	<button type="submit" class="btn btn-primary btn-lg" id="submit-btn">確定修改</button>
							<button type="button" class="btn btn-danger btn-lg" onclick="window.location.href='/newMatchPage'">配對頁面</button>
						</div>
                    </div>
                </div>	
             </form>		
		  </div>
	   </div>


		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script>



                <!-- 主要內容結尾 -->

            </div>
            <!-- End of Main Content -->

            <!-- footer -->
            <script src="js/layout/Z_footer.js"></script>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <script src="js/layout/Z_Logout Modal.js"></script>


    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
    
    
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
		
	    <!-- 請注意,您需要根據實際的後端接口地址來修改 xhr.open() 中的 URL。同時,您可能還需要設置一些額外的請求頭,例如 Content-Type,以確保後端能夠正確處理請求。 -->

		<!-- 如果您在後端使用了不同的接口名稱或參數名稱,也需要對代碼進行相應的調整。 -->
		
		
<script>

// 獲取表單元素和按鈕元素
const uploadForm = document.getElementById('upload-form');
const submitBtn = document.getElementById('submit-btn');
const deleteBtn = document.getElementById('delete-btn');

// 獲取所有文件輸入框
const fileInputs = uploadForm.querySelectorAll('input[type="file"]');

// 遍歷每個文件輸入框,並綁定事件監聽器
fileInputs.forEach((input) => {
    input.addEventListener('change', (event) => {
        const file = event.target.files[0]; // 獲取選擇的文件
        const imageFrame = event.target.parentNode.querySelector('.image-frame'); // 獲取對應的圖片框
        const imageBody = event.target.parentNode.querySelector('.imgBody'); // 獲取對應的圖片框

        if (file) {
            const reader = new FileReader(); // 創建一個新的 FileReader 對象

            reader.onload = (e) => {
                // // 清空圖片框
                // imageFrame.innerHTML = '';

                // // 創建一個新的 <img> 元素,並設置其 src 屬性為文件的數據 URL
                // const img = document.createElement('img');
                // img.src = e.target.result;
                // img.style.width = '100%';
                // img.style.height = '100%';
                // img.style.objectFit = 'cover';

                // // 將新的圖片元素添加到圖片框中
                // imageFrame.appendChild(img);

                imageBody.src = e.target.result;
                imageBody.hidden = false;
            };

            reader.readAsDataURL(file); // 讀取文件並將其轉換為數據 URL
        }
    });
});



// 按下"x"刪除圖片
const deleteButtons = document.querySelectorAll('.delete-photo');

deleteButtons.forEach((button) => {
    button.addEventListener('click', () => {
        const imageFrame = button.parentNode.querySelector('.image-frame');
        imageFrame.innerHTML = '';
        const addPhotoIcon = button.parentNode.querySelector('.add-photo');
        addPhotoIcon.style.display = 'block';
        console.log('確定刪除照片');
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
            
            var optionsList = [];
            
            // 獲取 Tagify 實例中用戶選擇的標籤值，我們可以在 Tagify 實例上註冊一個事件監聽器,監聽標籤值的變化,並在事件處理函數中獲取用戶選擇的標籤值。
            
            
            // 獲取 Tagify 實例
			var tagify = new Tagify(input, {
				whitelist: ["JAVA", "懶癌末期", "無話不談", "美劇", "健身", "韓劇", "NBA", "咖啡成癮", "爬山", "游泳", "馬拉松", "ABC", "今天吃什麼", "健行", "打工度假", "留學生活", "Youtube", "新移民", "唱歌", "打工", "貓", "狗", "奶茶控", "夜貓子", "手控", "音控", "顏控", "喜歡年上", "喜歡年下", "穩聊", "古風", "文青", "愛動物", "鬼片", "泰拳", "重訓", "衝浪", "不抽菸", "不喝酒", "作息規律", "素食主義者", "大叔", "不會說謊", "好相處", "美食甜點", "運動", "不菸不酒", "下廚小能手", "真心", "手遊", "閱讀", "正能量", "脾氣好", "陽光男孩", "愛睡覺", "背包客", "野外活動", "心理學", "數學", "股票", "攝影", "自煮", "外食", "影集", "陸劇", "找個聊得來的人", "滑雪", "熱愛生活", "情感豐富", "單身", "刺青", "擋車", "傳說對決", "園藝", "下棋", "棒球", "來個說走就走的旅行", "成人話題", "不排除聊色", "LOL", "KTV", "演戲", "打code", "工程師", "樂觀", "金融投資", "愛音樂", "ROCK!", "看展", "研究歷史", "獨立樂團", "韓團", "追星", "Y2K", "時尚", "reddit", "友善食光", "i珍食", "小資族", "英文", "日文", "生活要自己學會快樂", "想找個互相陪伴的人", "無釐頭", "愛笑", "熟了就很瘋", "學生", "上班族", "創業", "原神", "鋼琴", "武術", "科技產品", "幽默風趣", "熱愛生活", "瘋瘋癲癲", "藝術家", "可愛", "帥氣", "率性", "走在夢想的路上", "溫柔體貼", "專一", "老實人", "轉職", "設計", "抖S", "抖M", "黑客", "愛冒險", "我都可以聊喔", "手工藝", "高蛋白飲食", "佛系交友", "討厭人多的地方", "插畫家", "愛發呆", "塔羅", "算命", "夾娃娃", "智性戀", "音樂創作", "鬼才", "搞怪", "跳tone", "理性", "感性", "逛街", "小酌", "喜歡交朋友", "害羞", "慢熟", "可靠", "講幹話", "穿搭", "電視劇"] });

			// 監聽標籤值的變化
			tagify.on('add', function(e) {
			  console.log('新增標籤:', e.detail.data.value);
			  optionsList.push(e.detail.data.value);
			});

			tagify.on('remove', function(e) {
			  console.log('移除標籤:', e.detail.data.value);
			  let index = optionsList.indexOf(e.detail.data.value);
			  optionsList.splice(index, 1)
			});
			
			tagify.on("dropdown:show", onSuggestionsListUpdate)

			
			
	//將標籤值封裝成 JSON 格式
			
    function updateTags() {
    // 獲取用戶選擇的標籤值
//     var selectedTags = tagify.value.map(function(tag) {
//         return tag.value;
//     });
    
   var selectedTags1 = JSON.stringify({
    	"selectedTags":optionsList
    });
   
   

    // 發送 POST 請求到後端
    fetch('/updateTags', {
        method: 'POST',
        headers: {
        	'Content-Type': 'application/json'   // 告訴服務器請求體的格式是 JSON
        },
        body: JSON.stringify({
        	"selectedTags":optionsList
        })  // 將 optionsList 物件轉換為 JSON 字符串並作為請求的主體
    })                                     // selectList  :  -包含用戶選擇的一組選項    
                                           // optionsList : 包含所有可供選擇的選項 
    .then(function(response) {
        // 處理後端的回應
        if (response.ok) {
            console.log('標籤更新成功');
        } else {
            console.error('標籤更新失敗', response);
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


</body>

</html>