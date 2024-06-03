<%@page import="java.time.format.DateTimeFormatter" %>
    <%@page import="java.util.ArrayList" %>
        <%@page import="java.util.List" %>
            <%@page import="com.user.bean.UserBean" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                        <%! @SuppressWarnings("unchecked") %>

                            <!DOCTYPE html>
                            <html lang="en">

                            <head>

                                <meta charset="utf-8">
                                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                                <meta name="description" content="">
                                <meta name="author" content="">

                                <title>SB Admin 2 - Dashboard</title>

                                <!-- Custom fonts for this template -->
                                <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                                <link
                                    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                                    rel="stylesheet">

                                <!-- Custom styles for this template -->
                                <link href="/css/sb-admin-2.min.css" rel="stylesheet">

                                <!-- Custom styles for this page -->
                                <link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

                                <!-- swing alert要用的一些工具 -->
                                <link rel="stylesheet"
                                    href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
                                <script
                                    src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>

                                <!-- 主要內容的樣式 -->
                                <style>
                                    body {
                                        background: #eaeaea;
                                        /* margin-top:20px; */
                                    }

                                    .profile-info-list {
                                        padding: 0;
                                        margin: 0;
                                        list-style-type: none;
                                    }

                                    .friend-list,
                                    .img-grid-list {
                                        margin: -1px;
                                        list-style-type: none;
                                    }

                                    .profile-info-list>li.title {
                                        font-size: 0.625rem;
                                        font-weight: 700;
                                        color: #8a8a8f;
                                        padding: 0 0 0.3125rem;
                                    }

                                    .profile-info-list>li+li.title {
                                        padding-top: 1.5625rem;
                                    }

                                    .profile-info-list>li {
                                        padding: 0.625rem 0;
                                    }

                                    .profile-info-list>li .field {
                                        font-weight: 700;
                                    }

                                    .profile-info-list>li .value {
                                        color: #666;
                                    }

                                    .profile-info-list>li.img-list a {
                                        display: inline-block;
                                    }

                                    .profile-info-list>li.img-list a img {
                                        max-width: 2.25rem;
                                        -webkit-border-radius: 2.5rem;
                                        -moz-border-radius: 2.5rem;
                                        border-radius: 2.5rem;
                                    }

                                    .coming-soon-cover img,
                                    .email-detail-attachment .email-attachment .document-file img,
                                    .email-sender-img img,
                                    .friend-list .friend-img img,
                                    .profile-header-img img {
                                        max-width: 100%;
                                    }

                                    .table.table-profile th {
                                        border: none;
                                        color: #000;
                                        padding-bottom: 0.3125rem;
                                        padding-top: 0;
                                    }

                                    .table.table-profile td {
                                        border-color: #c8c7cc;
                                    }

                                    .table.table-profile tbody+thead>tr>th {
                                        padding-top: 1.5625rem;
                                    }

                                    .table.table-profile .field {
                                        color: #666;
                                        font-weight: 600;
                                        width: 25%;
                                        text-align: right;
                                    }

                                    .table.table-profile .value {
                                        font-weight: 500;
                                    }

                                    .profile-header {
                                        position: relative;
                                        overflow: hidden;
                                    }

                                    /* .profile-header .profile-header-cover {
                                    background: url(https://www.bootdey.com/image/600x350/6495ED/000000) center no-repeat;
                                    background-size: 100% auto;
                                    position: absolute;
                                    left: 0;
                                    right: 0;
                                    top: 0;
                                    bottom: 0;
                                } */
                                    .profile-header .profile-header-cover {
                                        background-color: #00b5ec;
                                        background-size: cover;
                                        background-position: center;
                                        background-repeat: no-repeat;
                                        position: absolute;
                                        left: 0;
                                        right: 0;
                                        top: 0;
                                        bottom: 0
                                    }

                                    .profile-header .profile-header-cover:before {
                                        content: "";
                                        position: absolute;
                                        top: 0;
                                        left: 0;
                                        right: 0;
                                        bottom: 0;
                                        background: linear-gradient(to bottom, rgba(0, 0, 0, 0.25) 0, rgba(0, 0, 0, 0.85) 100%);
                                    }

                                    .profile-header .profile-header-content,
                                    .profile-header .profile-header-tab,
                                    .profile-header-img,
                                    body .fc-icon {
                                        position: relative;
                                    }

                                    .profile-header .profile-header-tab {
                                        background: #fff;
                                        list-style-type: none;
                                        margin: -1.25rem 0 0;
                                        padding: 0 0 0 8.75rem;
                                        border-bottom: 1px solid #c8c7cc;
                                        white-space: nowrap;
                                    }

                                    .profile-header .profile-header-tab>li {
                                        display: inline-block;
                                        margin: 0;
                                    }

                                    .profile-header .profile-header-tab>li>a {
                                        display: block;
                                        color: #000;
                                        line-height: 1.25rem;
                                        padding: 0.625rem 1.25rem;
                                        text-decoration: none;
                                        font-weight: 700;
                                        font-size: 0.75rem;
                                        border: none;
                                    }

                                    .profile-header .profile-header-tab>li.active>a,
                                    .profile-header .profile-header-tab>li>a.active {
                                        color: #007aff;
                                    }

                                    .profile-header .profile-header-content:after,
                                    .profile-header .profile-header-content:before {
                                        content: "";
                                        display: table;
                                        clear: both;
                                    }

                                    .profile-header .profile-header-content {
                                        color: #fff;
                                        padding: 1.25rem;
                                    }

                                    body .fc th a,
                                    body .fc-ltr .fc-basic-view .fc-day-top .fc-day-number,
                                    body .fc-widget-header a {
                                        color: #000;
                                    }

                                    .profile-header-img {
                                        float: left;
                                        width: 7.5rem;
                                        height: 7.5rem;
                                        overflow: hidden;
                                        z-index: 10;
                                        margin: 0 1.25rem -1.25rem 0;
                                        padding: 0.1875rem;
                                        -webkit-border-radius: 0.25rem;
                                        -moz-border-radius: 0.25rem;
                                        border-radius: 0.25rem;
                                        background: #fff;
                                    }

                                    .profile-header-info h4 {
                                        font-weight: 500;
                                        margin-bottom: 0.3125rem;
                                    }

                                    .profile-container {
                                        padding: 1.5625rem;
                                    }

                                    @media (max-width: 967px) {
                                        .profile-header-img {
                                            width: 5.625rem;
                                            height: 5.625rem;
                                            margin: 0;
                                        }

                                        .profile-header-info {
                                            margin-left: 6.5625rem;
                                            padding-bottom: 0.9375rem;
                                        }

                                        .profile-header .profile-header-tab {
                                            padding-left: 0;
                                        }
                                    }

                                    @media (max-width: 767px) {
                                        .profile-header .profile-header-cover {
                                            background-position: top;
                                        }

                                        .profile-header-img {
                                            width: 3.75rem;
                                            height: 3.75rem;
                                            margin: 0;
                                        }

                                        .profile-header-info {
                                            margin-left: 4.6875rem;
                                            padding-bottom: 0.9375rem;
                                        }

                                        .profile-header-info h4 {
                                            margin: 0 0 0.3125rem;
                                        }

                                        .profile-header .profile-header-tab {
                                            white-space: nowrap;
                                            overflow: scroll;
                                            padding: 0;
                                        }

                                        .profile-container {
                                            padding: 0.9375rem 0.9375rem 3.6875rem;
                                        }

                                        .friend-list>li {
                                            float: none;
                                            width: auto;
                                        }
                                    }

                                    .profile-info-list {
                                        padding: 0;
                                        margin: 0;
                                        list-style-type: none;
                                    }

                                    .friend-list,
                                    .img-grid-list {
                                        margin: -1px;
                                        list-style-type: none;
                                    }

                                    .profile-info-list>li.title {
                                        font-size: 0.625rem;
                                        font-weight: 700;
                                        color: #8a8a8f;
                                        padding: 0 0 0.3125rem;
                                    }

                                    .profile-info-list>li+li.title {
                                        padding-top: 1.5625rem;
                                    }

                                    .profile-info-list>li {
                                        padding: 0.625rem 0;
                                    }

                                    .profile-info-list>li .field {
                                        font-weight: 700;
                                    }

                                    .profile-info-list>li .value {
                                        color: #666;
                                    }

                                    .profile-info-list>li.img-list a {
                                        display: inline-block;
                                    }

                                    .profile-info-list>li.img-list a img {
                                        max-width: 2.25rem;
                                        -webkit-border-radius: 2.5rem;
                                        -moz-border-radius: 2.5rem;
                                        border-radius: 2.5rem;
                                    }

                                    .coming-soon-cover img,
                                    .email-detail-attachment .email-attachment .document-file img,
                                    .email-sender-img img,
                                    .friend-list .friend-img img,
                                    .profile-header-img img {
                                        max-width: 100%;
                                    }

                                    .table.table-profile th {
                                        border: none;
                                        color: #000;
                                        padding-bottom: 0.3125rem;
                                        padding-top: 0;
                                    }

                                    .table.table-profile td {
                                        border-color: #c8c7cc;
                                    }

                                    .table.table-profile tbody+thead>tr>th {
                                        padding-top: 1.5625rem;
                                    }

                                    .table.table-profile .field {
                                        color: #666;
                                        font-weight: 600;
                                        width: 25%;
                                        text-align: right;
                                    }

                                    .table.table-profile .value {
                                        font-weight: 500;
                                    }

                                    .friend-list,
                                    .img-grid-list {
                                        margin: -1px;
                                        list-style-type: none;
                                    }

                                    .img-grid-list {
                                        padding: 0;
                                    }

                                    .img-grid-list>li {
                                        float: left;
                                        width: 20%;
                                        padding: 1px;
                                    }

                                    .img-grid-list>li a {
                                        position: relative;
                                        overflow: hidden;
                                        padding-top: 75%;
                                        display: block;
                                    }

                                    .img-grid-list>li a img {
                                        position: absolute;
                                        right: 0;
                                        top: 0;
                                        bottom: 0;
                                        left: 0;
                                        max-width: 100%;
                                    }
                                </style>

                                <link rel="stylesheet" href="/css/userSearch.css">
                            </head>

                            <body id="page-top">

                                <!-- Page Wrapper -->
                                <div id="wrapper">
                                    <!-- Content Wrapper -->
                                    <div id="content-wrapper" class="d-flex flex-column">

                                        <!-- Main Content -->
                                        <div id="content">

                                            <!-- Topbar -->
                                            <script src="/js/layout/Z_TopBar.js"></script>

                                            <!-- 主要內容 -->
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <link
                                                            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
                                                            rel="stylesheet">
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div id="content"
                                                                        class="content content-full-width">
                                                                        <!-- begin profile -->
                                                                        <div class="profile">
                                                                            <div class="profile-header">
                                                                                <!-- BEGIN profile-header-cover -->
                                                                                <div class="profile-header-cover"></div>
                                                                                <!-- END profile-header-cover -->
                                                                                <!-- BEGIN profile-header-content -->
                                                                                <div class="profile-header-content">
                                                                                    <!-- BEGIN profile-header-img -->
                                                                                    <div class="profile-header-img">
                                                                                        <img src="/localimages/${userBean.avatar}"
                                                                                            alt="">
                                                                                    </div>
                                                                                    <!-- END profile-header-img -->
                                                                                    <!-- BEGIN profile-header-info -->
                                                                                    <div class="profile-header-info">
                                                                                        <h4 class="m-t-10 m-b-5">
                                                                                            ${userBean.userChineseName}
                                                                                        </h4>
                                                                                        <p class="mb-5">
                                                                                            ${userBean.userEnglishName}
                                                                                        </p>
                                                                                        <!-- <a href="#"
                                                                                        class="btn btn-xs btn-success disabled">編輯</a> -->

                                                                                    </div>
                                                                                    <!-- END profile-header-info -->
                                                                                </div>
                                                                                <!-- END profile-header-content -->
                                                                                <!-- BEGIN profile-header-tab -->
                                                                                <ul
                                                                                    class="profile-header-tab nav nav-tabs">
                                                                                    <li class="nav-item"><a
                                                                                            href="/otherUserPosts"
                                                                                            class="nav-link_">貼文</a>
                                                                                    </li>
                                                                                    <li class="nav-item"><a
                                                                                            href="/otherAboutMe"
                                                                                            class="nav-link_">關於我</a>
                                                                                    </li>
                                                                                    <li class="nav-item"><a
                                                                                            href="/otherUserPhotos"
                                                                                            class="nav-link_ active">照片</a>
                                                                                    </li>

                                                                                    <li class="nav-item"><a
                                                                                            href="/otherUserFriends"
                                                                                            class="nav-link_ show">好友</a>
                                                                                    </li>
                                                                                </ul>
                                                                                <!-- END profile-header-tab -->
                                                                            </div>
                                                                        </div>
                                                                        <!-- end profile -->
                                                                        <!-- begin 不包括上面那攔 -->
                                                                        <div class="profile-container">
                                                                            <div class="row row-space-20">
                                                                                <div class="col-md-8">
                                                                                    <!-- <div
                                                                                        class="d-flex justify-content-end">
                                                                                        <div class="tab-content p-0">
                                                                                            <button type="button"
                                                                                                class="btn btn-primary btn-lg float-right"
                                                                                                id="uploadBtn"
                                                                                                data-toggle="modal"
                                                                                                data-target="#uploadImgs">上傳</button>
                                                                                        </div>
                                                                                    </div> -->
                                                                                    <div class="tab-content p-0">
                                                                                        <div class="tab-pane active show"
                                                                                            id="profile-photos">
                                                                                            <div class="m-b-10"><b>照片
                                                                                                    (${userImagesCount})</b>
                                                                                            </div>
                                                                                            <ul class="img-grid-list">
                                                                                                <c:forEach var="aImg"
                                                                                                    items="${userBean.userImages}">
                                                                                                    <li>
                                                                                                        <!-- <button type="button" class="btn btn-primary btn-lg float-right" id="uploadBtn" data-toggle="modal" data-target="#uploadImgs">上傳</button> -->
                                                                                                        <a style="cursor: pointer;"
                                                                                                            data-toggle="modal"
                                                                                                            data-target="#imgPreview"
                                                                                                            onclick="loadPreviewImgData('${aImg.imagePath}', '${aImg.userImageNo}')">
                                                                                                            <img src="/localimages/<c:out value="${aImg.imagePath}" />"
                                                                                                            alt=""
                                                                                                            class="img-portrait"
                                                                                                            />
                                                                                                        </a>
                                                                                                    </li>
                                                                                                </c:forEach>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div
                                                                                    class="col-md-4 hidden-xs hidden-sm">
                                                                                    <ul class="profile-info-list">
                                                                                        <li class="title">個人資訊</li>
                                                                                        <li>
                                                                                            <div class="field">姓名:</div>
                                                                                            <div class="value">
                                                                                                ${userBean.userChineseName}
                                                                                            </div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="field">暱稱:</div>
                                                                                            <div class="value">
                                                                                                ${userBean.nickName
                                                                                                == null ? "尚未設定" :
                                                                                                userBean.nickName}</div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="field">生日:</div>
                                                                                            <div class="value">
                                                                                                ${localDateTimeDateFormat.format(userBean.birthday)}
                                                                                            </div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="field">來自:</div>
                                                                                            <div class="value">
                                                                                                ${userBean.userAddress}
                                                                                            </div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="field">電子郵件:
                                                                                            </div>
                                                                                            <div class="value">
                                                                                                ${userBean.email}</div>
                                                                                        </li>
                                                                                        <li>
                                                                                            <div class="field">Phone
                                                                                                No.:</div>
                                                                                            <div class="value">
                                                                                                ${userBean.phone}</div>
                                                                                        </li>
                                                                                        <li class="title">朋友清單 (${userFriendsCount})</li>
                                                                                        <li class="img-list">
                                                                                            <c:forEach var="friendBean"
                                                                                                    items="${userFriends}">
                                                                                                <a href="/otherAboutMe/${friendBean.userNo}"
                                                                                                    class="m-b-5" title="${friendBean.userChineseName}">
                                                                                                    <img src="/localimages/${friendBean.avatar}" alt="" style="width: 36px; height: 36px; object-fit: cover;"/></a>
                                                                                            </c:forEach>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!-- end 不包括上面那攔 -->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 主要內容結尾 -->

                                        </div>
                                        <!-- End of Main Content -->

                                        <!-- footer -->
                                        <script src="/js/layout/Z_footer.js"></script>

                                    </div>
                                    <!-- End of Content Wrapper -->

                                </div>
                                <!-- End of Page Wrapper -->

                                <!-- 上傳多張照片的modal -->
                                <div class="modal fade" id="uploadImgs" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <form action="/userUploadImages" method="post" enctype="multipart/form-data">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">上傳圖片</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div id="showImgs">

                                                    </div>
                                                    <div class="pt-5">
                                                        <input type="file" name="images" multiple
                                                            onchange="selectImgFile(this.files)">
                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">上傳</button>
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">關閉</button>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                </div>

                                <!-- 每張照片被點擊時的modal -->
                                <div class="modal fade" id="imgPreview" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <form action="/deleteUserImage" method="post" enctype="multipart/form-data">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <img id="previewImg" src="" alt="" width="466"
                                                        style="object-fit: cover;">
                                                    <input type="hidden" name="imgNo" id="imgNo" value="">
                                                    <input type="hidden" name="_method" value="delete">
                                                </div>
                                                <div class="modal-footer">
                                                    <!-- <button type="submit" class="btn btn-danger"
                                                        id="imgPreviewDelBtn">刪除</button> -->
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">關閉</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                </div>

                                <!-- Scroll to Top Button-->
                                <a class="scroll-to-top rounded" href="#page-top">
                                    <i class="fas fa-angle-up"></i>
                                </a>

                                <!-- Logout Modal-->
                                <script src="/js/layout/Z_Logout Modal.js"></script>

                                <!-- Bootstrap core JavaScript-->
                                <script src="/vendor/jquery/jquery.min.js"></script>
                                <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                                <!-- Core plugin JavaScript-->
                                <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

                                <!-- Custom scripts for all pages-->
                                <script src="/js/sb-admin-2.min.js"></script>

                                <!-- Page level plugins -->
                                <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
                                <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

                                <!-- Page level custom scripts -->
                                <script src="/js/demo/datatables-demo.js"></script>


                                <script>
                                    //顯示選到的圖片們
                                    function selectImgFile(files) {

                                        if (!files.length) {
                                            return false;
                                        }

                                        document.querySelector('#showImgs').innerHTML = "";
                                        for (var i = 0; i < files.length; i++) {
                                            let file = files[i];
                                            let reader = new FileReader();
                                            reader.onload = function () {
                                                let currentImg = document.createElement("img");
                                                currentImg.classList.add("img-fluid", "border", "border-secondary", "rounded");
                                                currentImg.style.width = "150px";
                                                currentImg.style.height = "150px";
                                                currentImg.style.objectFit = "cover";
                                                currentImg.src = this.result;
                                                document.querySelector('#showImgs').append(currentImg);
                                            };

                                            reader.readAsDataURL(file);
                                        }
                                    };

                                    //讀入modal的圖片
                                    function loadPreviewImgData(imgSrc, imgNo) {
                                        document.querySelector("#previewImg").src = "/localimages/" + imgSrc;
                                        document.querySelector("#imgNo").value = imgNo;
                                    };



                                    //按刪除圖片的swing alert
                                    const deleteBtn = document.querySelector('#imgPreviewDelBtn');

                                    deleteBtn.addEventListener('click', (e) => {
                                        e.preventDefault();

                                        Swal.fire({
                                            title: '確定要刪除嗎?',
                                            text: '刪除後將無法恢復!',
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#d33',
                                            cancelButtonColor: '#858796',
                                            confirmButtonText: '刪除',
                                            cancelButtonText: '取消'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                swal.fire({
                                                    icon: "success",
                                                    title: "刪除成功",
                                                    showConfirmButton: false,
                                                    timer: 1500
                                                }).then(() => {
                                                    e.target.closest('form').submit();
                                                });

                                            }
                                        });
                                    });
                                </script>

                                <script src="/js/user/userSearch.js"></script>
                            </body>

                            </html>