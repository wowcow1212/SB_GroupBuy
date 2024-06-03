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
                                        /* margin-top: 20px; */
                                        background: #eee;
                                    }

                                    .profile-header {
                                        position: relative;
                                        overflow: hidden
                                    }

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
                                        content: '';
                                        position: absolute;
                                        top: 0;
                                        left: 0;
                                        right: 0;
                                        bottom: 0;
                                        background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, .75) 100%)
                                    }

                                    .profile-header .profile-header-content {
                                        color: #fff;
                                        padding: 25px
                                    }

                                    .profile-header-img {
                                        float: left;
                                        width: 120px;
                                        height: 120px;
                                        overflow: hidden;
                                        position: relative;
                                        z-index: 10;
                                        margin: 0 0 -20px;
                                        padding: 3px;
                                        border-radius: 4px;
                                        background: #fff
                                    }

                                    .profile-header-img img {
                                        max-width: 100%
                                    }

                                    .profile-header-info h4 {
                                        font-weight: 500;
                                        color: #fff
                                    }

                                    .profile-header-img+.profile-header-info {
                                        margin-left: 140px
                                    }

                                    .profile-header .profile-header-content,
                                    .profile-header .profile-header-tab {
                                        position: relative
                                    }

                                    .b-minus-1,
                                    .b-minus-10,
                                    .b-minus-2,
                                    .b-minus-3,
                                    .b-minus-4,
                                    .b-minus-5,
                                    .b-minus-6,
                                    .b-minus-7,
                                    .b-minus-8,
                                    .b-minus-9,
                                    .b-plus-1,
                                    .b-plus-10,
                                    .b-plus-2,
                                    .b-plus-3,
                                    .b-plus-4,
                                    .b-plus-5,
                                    .b-plus-6,
                                    .b-plus-7,
                                    .b-plus-8,
                                    .b-plus-9,
                                    .l-minus-1,
                                    .l-minus-2,
                                    .l-minus-3,
                                    .l-minus-4,
                                    .l-minus-5,
                                    .l-minus-6,
                                    .l-minus-7,
                                    .l-minus-8,
                                    .l-minus-9,
                                    .l-plus-1,
                                    .l-plus-10,
                                    .l-plus-2,
                                    .l-plus-3,
                                    .l-plus-4,
                                    .l-plus-5,
                                    .l-plus-6,
                                    .l-plus-7,
                                    .l-plus-8,
                                    .l-plus-9,
                                    .r-minus-1,
                                    .r-minus-10,
                                    .r-minus-2,
                                    .r-minus-3,
                                    .r-minus-4,
                                    .r-minus-5,
                                    .r-minus-6,
                                    .r-minus-7,
                                    .r-minus-8,
                                    .r-minus-9,
                                    .r-plus-1,
                                    .r-plus-10,
                                    .r-plus-2,
                                    .r-plus-3,
                                    .r-plus-4,
                                    .r-plus-5,
                                    .r-plus-6,
                                    .r-plus-7,
                                    .r-plus-8,
                                    .r-plus-9,
                                    .t-minus-1,
                                    .t-minus-10,
                                    .t-minus-2,
                                    .t-minus-3,
                                    .t-minus-4,
                                    .t-minus-5,
                                    .t-minus-6,
                                    .t-minus-7,
                                    .t-minus-8,
                                    .t-minus-9,
                                    .t-plus-1,
                                    .t-plus-10,
                                    .t-plus-2,
                                    .t-plus-3,
                                    .t-plus-4,
                                    .t-plus-5,
                                    .t-plus-6,
                                    .t-plus-7,
                                    .t-plus-8,
                                    .t-plus-9 {
                                        position: relative !important
                                    }

                                    .profile-header .profile-header-tab {
                                        background: #fff;
                                        list-style-type: none;
                                        margin: -10px 0 0;
                                        padding: 0 0 0 140px;
                                        white-space: nowrap;
                                        border-radius: 0
                                    }

                                    .text-ellipsis,
                                    .text-nowrap {
                                        white-space: nowrap !important
                                    }

                                    .profile-header .profile-header-tab>li {
                                        display: inline-block;
                                        margin: 0
                                    }

                                    .profile-header .profile-header-tab>li>a {
                                        display: block;
                                        color: #929ba1;
                                        line-height: 20px;
                                        padding: 10px 20px;
                                        text-decoration: none;
                                        font-weight: 700;
                                        font-size: 12px;
                                        border: none
                                    }

                                    .profile-header .profile-header-tab>li.active>a,
                                    .profile-header .profile-header-tab>li>a.active {
                                        color: #007aff
                                    }

                                    .profile-content {
                                        padding: 25px;
                                        border-radius: 4px
                                    }

                                    .profile-content:after,
                                    .profile-content:before {
                                        content: '';
                                        display: table;
                                        clear: both
                                    }

                                    .profile-content .tab-content,
                                    .profile-content .tab-pane {
                                        background: 0 0
                                    }

                                    .profile-left {
                                        width: 200px;
                                        float: left
                                    }

                                    .profile-right {
                                        margin-left: 240px;
                                        padding-right: 20px
                                    }

                                    .profile-image {
                                        height: 175px;
                                        line-height: 175px;
                                        text-align: center;
                                        font-size: 72px;
                                        margin-bottom: 10px;
                                        border: 2px solid #E2E7EB;
                                        overflow: hidden;
                                        border-radius: 4px
                                    }

                                    .profile-image img {
                                        display: block;
                                        max-width: 100%
                                    }

                                    .profile-highlight {
                                        padding: 12px 15px;
                                        background: #FEFDE1;
                                        border-radius: 4px
                                    }

                                    .profile-highlight h4 {
                                        margin: 0 0 7px;
                                        font-size: 12px;
                                        font-weight: 700
                                    }

                                    .table.table-profile>thead>tr>th {
                                        border-bottom: none !important
                                    }

                                    .table.table-profile>thead>tr>th h4 {
                                        font-size: 20px;
                                        margin-top: 0
                                    }

                                    .table.table-profile>thead>tr>th h4 small {
                                        display: block;
                                        font-size: 12px;
                                        font-weight: 400;
                                        margin-top: 5px
                                    }

                                    .table.table-profile>tbody>tr>td,
                                    .table.table-profile>thead>tr>th {
                                        border: none;
                                        padding-top: 7px;
                                        padding-bottom: 7px;
                                        color: #242a30;
                                        background: 0 0
                                    }

                                    .table.table-profile>tbody>tr>td.field {
                                        width: 20%;
                                        text-align: right;
                                        font-weight: 600;
                                        color: #2d353c
                                    }

                                    .table.table-profile>tbody>tr.highlight>td {
                                        border-top: 1px solid #b9c3ca;
                                        border-bottom: 1px solid #b9c3ca
                                    }

                                    .table.table-profile>tbody>tr.divider>td {
                                        padding: 0 !important;
                                        height: 10px
                                    }

                                    .profile-section+.profile-section {
                                        margin-top: 20px;
                                        padding-top: 20px;
                                        border-top: 1px solid #b9c3ca
                                    }

                                    .profile-section:after,
                                    .profile-section:before {
                                        content: '';
                                        display: table;
                                        clear: both
                                    }

                                    .profile-section .title {
                                        font-size: 20px;
                                        margin: 0 0 15px
                                    }

                                    .profile-section .title small {
                                        font-weight: 400
                                    }

                                    body.flat-black {
                                        background: #E7E7E7
                                    }

                                    .flat-black .navbar.navbar-inverse {
                                        background: #212121
                                    }

                                    .flat-black .navbar.navbar-inverse .navbar-form .form-control {
                                        background: #4a4a4a;
                                        border-color: #4a4a4a
                                    }

                                    .flat-black .sidebar,
                                    .flat-black .sidebar-bg {
                                        background: #3A3A3A
                                    }

                                    .flat-black .page-with-light-sidebar .sidebar,
                                    .flat-black .page-with-light-sidebar .sidebar-bg {
                                        background: #fff
                                    }

                                    .flat-black .sidebar .nav>li>a {
                                        color: #b2b2b2
                                    }

                                    .flat-black .sidebar.sidebar-grid .nav>li>a {
                                        border-bottom: 1px solid #474747;
                                        border-top: 1px solid #474747
                                    }

                                    .flat-black .sidebar .active .sub-menu>li.active>a,
                                    .flat-black .sidebar .nav>li.active>a,
                                    .flat-black .sidebar .nav>li>a:focus,
                                    .flat-black .sidebar .nav>li>a:hover,
                                    .flat-black .sidebar .sub-menu>li>a:focus,
                                    .flat-black .sidebar .sub-menu>li>a:hover,
                                    .sidebar .nav>li.nav-profile>a {
                                        color: #fff
                                    }

                                    .flat-black .sidebar .sub-menu>li>a,
                                    .flat-black .sidebar .sub-menu>li>a:before {
                                        color: #999
                                    }

                                    .flat-black .page-with-light-sidebar .sidebar .active .sub-menu>li.active>a,
                                    .flat-black .page-with-light-sidebar .sidebar .active .sub-menu>li.active>a:focus,
                                    .flat-black .page-with-light-sidebar .sidebar .active .sub-menu>li.active>a:hover,
                                    .flat-black .page-with-light-sidebar .sidebar .nav>li.active>a,
                                    .flat-black .page-with-light-sidebar .sidebar .nav>li.active>a:focus,
                                    .flat-black .page-with-light-sidebar .sidebar .nav>li.active>a:hover {
                                        color: #000
                                    }

                                    .flat-black .page-sidebar-minified .sidebar .nav>li.has-sub:focus>a,
                                    .flat-black .page-sidebar-minified .sidebar .nav>li.has-sub:hover>a {
                                        background: #323232
                                    }

                                    .flat-black .page-sidebar-minified .sidebar .nav li.has-sub>.sub-menu,
                                    .flat-black .sidebar .nav>li.active>a,
                                    .flat-black .sidebar .nav>li.active>a:focus,
                                    .flat-black .sidebar .nav>li.active>a:hover,
                                    .flat-black .sidebar .nav>li.nav-profile,
                                    .flat-black .sidebar .sub-menu>li.has-sub>a:before,
                                    .flat-black .sidebar .sub-menu>li:before,
                                    .flat-black .sidebar .sub-menu>li>a:after {
                                        background: #2A2A2A
                                    }

                                    .flat-black .page-sidebar-minified .sidebar .sub-menu>li:before,
                                    .flat-black .page-sidebar-minified .sidebar .sub-menu>li>a:after {
                                        background: #3e3e3e
                                    }

                                    .flat-black .sidebar .nav>li.nav-profile .cover.with-shadow:before {
                                        background: rgba(42, 42, 42, .75)
                                    }

                                    .bg-white {
                                        background-color: #fff !important;
                                    }

                                    .p-10 {
                                        padding: 10px !important;
                                    }

                                    .media.media-xs .media-object {
                                        width: 32px;
                                    }

                                    .m-b-2 {
                                        margin-bottom: 2px !important;
                                    }

                                    .media>.media-left,
                                    .media>.pull-left {
                                        padding-right: 15px;
                                    }

                                    .media-body,
                                    .media-left,
                                    .media-right {
                                        display: table-cell;
                                        vertical-align: top;
                                    }

                                    /* 真正內容 */
                                    /* body {
                                        margin-top: 20px;
                                    } */

                                    .rs-team .team-item {
                                        position: relative;
                                        overflow: hidden;
                                        margin-bottom: 30px;
                                    }

                                    .rs-team .team-item:before {
                                        content: '';
                                        position: absolute;
                                        left: 0;
                                        top: 0;
                                        height: 100%;
                                        width: 100%;
                                        background-color: rgba(0, 0, 0, 0.3);
                                        z-index: 1;
                                    }

                                    .rs-team .team-item .team-img {
                                        position: relative;
                                    }

                                    .rs-team .team-item .team-img .normal-text {
                                        position: absolute;
                                        text-align: center;
                                        height: 80px;
                                        bottom: -1px;
                                        padding: 17px 0;
                                        width: 100%;
                                        left: 50%;
                                        transform: translateX(-50%);
                                        -webkit-transform: translateX(-50%);
                                        background-color: rgba(217, 8, 69, 0.7);
                                        transition: .3s ease all;
                                        z-index: 10;
                                    }

                                    .rs-team .team-item .team-img .normal-text .team-name {
                                        color: #fff;
                                        font-size: 20px;
                                        font-weight: 500;
                                        margin: 0;
                                        display: block;
                                        text-transform: uppercase;
                                        padding: 0 0 3px;
                                    }

                                    .rs-team .team-item .team-img .normal-text .subtitle {
                                        color: #fff;
                                        margin: 0;
                                        display: block;
                                    }

                                    .rs-team .team-item .team-img img {
                                        width: 100%;
                                    }

                                    .rs-team .team-item .team-content {
                                        position: absolute;
                                        width: 100%;
                                        height: 100%;
                                        top: 10%;
                                        left: 0;
                                        text-align: center;
                                        z-index: 1;
                                        padding: 30px;
                                        opacity: 0;
                                        -webkit-transition: 0.3s all ease-out;
                                        transition: 0.3s all ease-out;
                                        visibility: hidden;
                                    }

                                    .rs-team .team-item .team-content:before {
                                        content: '';
                                        position: absolute;
                                        left: 0;
                                        top: 0;
                                        height: 100%;
                                        width: 100%;
                                        background: rgba(217, 8, 69, 0.8);
                                        z-index: -1;
                                    }

                                    .rs-team .team-item .team-name {
                                        margin-bottom: 2px;
                                    }

                                    .rs-team .team-item .team-name a {
                                        margin-bottom: 6px;
                                        font-size: 20px;
                                        color: #fff;
                                        text-transform: uppercase;
                                        position: relative;
                                        z-index: 1;
                                    }

                                    .rs-team .team-item .team-name a:hover {
                                        color: #fff;
                                    }

                                    .rs-team .team-item .postion {
                                        position: relative;
                                        z-index: 1;
                                        color: #fff;
                                    }

                                    .rs-team .team-item .share-icons {
                                        position: relative;
                                        max-width: 255px;
                                        margin: 0 auto 15px;
                                        opacity: 0;
                                        visibility: hidden;
                                    }

                                    .rs-team .team-item .share-icons .border {
                                        content: '';
                                        position: absolute;
                                        background: #fff;
                                        z-index: 1;
                                        opacity: 1;
                                    }

                                    .rs-team .team-item .share-icons .border {
                                        width: 25px;
                                        height: 25px;
                                        top: 50%;
                                        left: 50%;
                                        transform: translate(-50%, -50%);
                                        -webkit-transform: translate(-50%, -50%);
                                        border-radius: 100px;
                                        z-index: 11;
                                    }

                                    .rs-team .team-item .team-social {
                                        position: relative;
                                    }

                                    .rs-team .team-item .team-social.icons-1:after,
                                    .rs-team .team-item .team-social.icons-1:before {
                                        content: '';
                                        position: absolute;
                                        background: #fff;
                                        z-index: 1;
                                        opacity: 1;
                                    }

                                    .rs-team .team-item .team-social.icons-1:after {
                                        top: 0%;
                                        left: 50%;
                                        height: 95px;
                                        width: 1px;
                                    }

                                    .rs-team .team-item .team-social.icons-1:before {
                                        bottom: 0;
                                        left: 10px;
                                        height: 1px;
                                        width: 100px;
                                    }

                                    .rs-team .team-item .team-social.icons-2:after,
                                    .rs-team .team-item .team-social.icons-2:before {
                                        content: '';
                                        position: absolute;
                                        background: #fff;
                                        z-index: 1;
                                        opacity: 1;
                                    }

                                    .rs-team .team-item .team-social.icons-2:after {
                                        bottom: 0;
                                        left: 50%;
                                        height: 95px;
                                        width: 1px;
                                    }

                                    .rs-team .team-item .team-social.icons-2:before {
                                        top: 0;
                                        right: 10px;
                                        height: 1px;
                                        width: 100px;
                                    }

                                    .rs-team .team-item .team-social li {
                                        display: inline-block;
                                        position: relative;
                                        transition: all 0.3s ease-in-out 0s;
                                        padding: 34px;
                                    }

                                    .rs-team .team-item .team-social li a {
                                        display: block;
                                        color: #fff;
                                        width: 50px;
                                        height: 50px;
                                        line-height: 50px;
                                        border: 1px solid #fff;
                                        text-align: center;
                                        border-radius: 100px;
                                        font-size: 20px;
                                    }

                                    .rs-team .team-item .team-social li a:hover {
                                        background: #fff;
                                        border-color: #fff;
                                        color: #d90845;
                                    }

                                    .rs-team .team-item:hover .team-content {
                                        top: 0;
                                    }

                                    .rs-team .team-item:hover .share-icons,
                                    .rs-team .team-item:hover .team-content,
                                    .rs-team .team-item:hover .team-social {
                                        opacity: 1;
                                        visibility: visible;
                                    }

                                    .rs-team .team-item:hover .normal-text {
                                        opacity: 0;
                                        visibility: hidden;
                                    }

                                    .rs-team.fullwidth-team .col-lg-3 {
                                        padding: 0;
                                    }

                                    .rs-team.fullwidth-team .col-lg-3 .team-item {
                                        margin-bottom: 0;
                                    }

                                    .rs-team.fullwidth-team .col-lg-3 .team-item .team-img .normal-text {
                                        text-align: left;
                                        background: transparent;
                                        padding-left: 15px;
                                    }

                                    .rs-team.rs-team2 .normal-text {
                                        clip-path: polygon(100% 100%, 0% 100%, 50% -95%);
                                    }

                                    .rs-team#rs-team3 .share-icons {
                                        max-width: 230px;
                                    }

                                    .rs-team#rs-team3.bg6,
                                    .rs-team#rs-team3.bg4 {
                                        position: relative;
                                    }

                                    .rs-team#rs-team3.bg6:after,
                                    .rs-team#rs-team3.bg4:after {
                                        content: "";
                                        background-position: top center;
                                        height: 460px;
                                        width: 100%;
                                        position: absolute;
                                        top: 0;
                                        z-index: 0;
                                    }

                                    .rs-team#rs-team3 .container-fullwidth {
                                        position: relative;
                                        z-index: 1;
                                    }

                                    .rs-team#rs-team3 .team-item {
                                        margin-bottom: 30px;
                                    }

                                    .rs-team#rs-team3 .team-item .team-img .normal-text {
                                        height: 205px;
                                        bottom: -23%;
                                        padding: 30px 0;
                                        width: 86%;
                                        border-radius: 50%;
                                        clip-path: none;
                                    }

                                    .rs-team#rs-team3 .team-item .team-social li {
                                        padding: 20px;
                                    }

                                    .rs-team#rs-team3 .team-item .team-social.icons-1:before,
                                    .rs-team#rs-team3 .team-item .team-social.icons-2:before {
                                        width: 80px;
                                    }

                                    .rs-team#rs-team3 .team-item .team-social.icons-1:after,
                                    .rs-team#rs-team3 .team-item .team-social.icons-2:after {
                                        height: 70px;
                                    }

                                    .home5 .rs-team .team-item .team-img img {
                                        border-radius: 5px;
                                    }

                                    .pagination {
                                        margin-top: 25px;
                                    }

                                    .pagination .page-item {
                                        margin-right: 6px;
                                    }

                                    .pagination .page-item>* {
                                        width: 40px;
                                        height: 40px;
                                        line-height: 40px;
                                        text-align: center;
                                        font-size: 18px;
                                        padding: 0;
                                        font-weight: 600;
                                        color: #676767;
                                        border-radius: 3px;
                                        outline: none;
                                        border-color: #e8e8e8;
                                        background: #fff;
                                    }

                                    .pagination .page-item>*:hover,
                                    .pagination .page-item>*.active {
                                        color: #d90845;
                                        border-color: #d90845;
                                    }

                                    .pagination .page-item>*.dotted {
                                        line-height: 40px;
                                    }

                                    ul {
                                        list-style: outside none none;
                                        margin: 0;
                                        padding: 0;
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
                                                                                            class="nav-link_">照片</a>
                                                                                    </li>

                                                                                    <li class="nav-item"><a
                                                                                            href="/otherUserFriends"
                                                                                            class="nav-link_ show active">好友</a>
                                                                                    </li>
                                                                                </ul>
                                                                                <!-- END profile-header-tab -->
                                                                            </div>
                                                                        </div>
                                                                        <!-- end profile -->
                                                                        <!-- begin 不包括上面那攔 -->
                                                                        <link
                                                                            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
                                                                            rel="stylesheet" />

                                                                        <div id="rs-team"
                                                                            class="rs-team fullwidth-team pt-100 pb-70">
                                                                            <h4 class="mt-3 mb-3"
                                                                                style="margin-left: 22px;">Friend List
                                                                                (${userFriendsCount})</h4>
                                                                            <div class="container">
                                                                                <div class="row">
                                                                                    <c:forEach var="friend"
                                                                                        items="${userFriends}">
                                                                                        <div class="col-lg-4 col-md-6">
                                                                                            <div class="team-item">
                                                                                                <div class="team-img">

                                                                                                    <img src="/localimages/${friend.avatar}"
                                                                                                        alt="team Image"
                                                                                                        style="width: 315px; height: 315px; object-fit: cover;">
                                                                                                    <div
                                                                                                        class="normal-text">
                                                                                                        <h4
                                                                                                            class="team-name">
                                                                                                            ${friend.userChineseName}
                                                                                                        </h4>
                                                                                                        <span
                                                                                                            class="subtitle">${friend.userEnglishName}</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div
                                                                                                    class="team-content">
                                                                                                    <div
                                                                                                        class="display-table">
                                                                                                        <div
                                                                                                            class="display-table-cell">
                                                                                                            <div
                                                                                                                class="share-icons">
                                                                                                                <div
                                                                                                                    class="border">
                                                                                                                </div>
                                                                                                                <ul
                                                                                                                    class="team-social icons-1">
                                                                                                                    <li><a href="otherUserPosts/${friend.userNo}"
                                                                                                                            class="social-icon"><i
                                                                                                                                class="fa fa-newspaper-o"></i></a>
                                                                                                                    </li>
                                                                                                                    <li><a href="/otherAboutMe/${friend.userNo}"
                                                                                                                            class="social-icon"><i
                                                                                                                                class="fa fa-info"></i></a>
                                                                                                                    </li>
                                                                                                                </ul>

                                                                                                                <ul
                                                                                                                    class="team-social icons-2">
                                                                                                                    <li><a href="/otherUserPhotos/${friend.userNo}"
                                                                                                                            class="social-icon"><i
                                                                                                                                class="fa fa-picture-o"></i></a>
                                                                                                                    </li>
                                                                                                                    <li><a href="/otherUserFriends/${friend.userNo}"
                                                                                                                            class="social-icon"><i
                                                                                                                                class="fa fa-handshake-o"></i></a>
                                                                                                                    </li>
                                                                                                                </ul>
                                                                                                            </div>
                                                                                                            <div
                                                                                                                class="team-details">
                                                                                                                <h4
                                                                                                                    class="team-name">
                                                                                                                    <a
                                                                                                                        href="#"></a>
                                                                                                                </h4>

                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                    </c:forEach>

                                                                                    <!-- <div class="col-lg-4 col-md-6">
                                                                                        <div class="team-item">
                                                                                            <div class="team-img">
                                                                                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png"
                                                                                                    alt="team Image">
                                                                                                <div
                                                                                                    class="normal-text">
                                                                                                    <h4
                                                                                                        class="team-name">
                                                                                                        Seroun Pawor
                                                                                                    </h4>
                                                                                                    <span
                                                                                                        class="subtitle">CEO
                                                                                                        &amp;
                                                                                                        Founder</span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="team-content">
                                                                                                <div
                                                                                                    class="display-table">
                                                                                                    <div
                                                                                                        class="display-table-cell">
                                                                                                        <div
                                                                                                            class="share-icons">
                                                                                                            <div
                                                                                                                class="border">
                                                                                                            </div>
                                                                                                            <ul
                                                                                                                class="team-social icons-1">
                                                                                                                <li><a href="#"
                                                                                                                        class="social-icon"><i
                                                                                                                            class="fa fa-facebook"></i></a>
                                                                                                                </li>
                                                                                                                <li><a href="#"
                                                                                                                        class="social-icon"><i
                                                                                                                            class="fa fa-twitter"></i></a>
                                                                                                                </li>
                                                                                                            </ul>

                                                                                                            <ul
                                                                                                                class="team-social icons-2">
                                                                                                                <li><a href="#"
                                                                                                                        class="social-icon"><i
                                                                                                                            class="fa fa-skype"></i></a>
                                                                                                                </li>
                                                                                                                <li><a href="#"
                                                                                                                        class="social-icon"><i
                                                                                                                            class="fa fa-linkedin"></i></a>
                                                                                                                </li>
                                                                                                            </ul>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="team-details">
                                                                                                            <h4
                                                                                                                class="team-name">
                                                                                                                <a
                                                                                                                    href="speakers-single.html">Seroun
                                                                                                                    Pawor</a>
                                                                                                            </h4>
                                                                                                            <span
                                                                                                                class="postion">CEO
                                                                                                                &amp;
                                                                                                                Founder</span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div> -->
                                                                                </div>
                                                                            </div>
                                                                            <!-- .container-fullwidth -->
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
                                            <form action="/userUploadImages" method="post"
                                                enctype="multipart/form-data">
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
                                                    <button type="submit" class="btn btn-danger"
                                                        id="imgPreviewDelBtn">刪除</button>
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
                                        document.querySelector("#previewImg").src = "localimages/" + imgSrc;
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