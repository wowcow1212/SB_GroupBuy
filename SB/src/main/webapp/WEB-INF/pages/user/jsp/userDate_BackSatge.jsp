<%@page import="java.time.format.DateTimeFormatter" %>
    <%@page import="java.util.ArrayList" %>
        <%@page import="java.util.List" %>
            <%@page import="com.user.bean.UserBean" %>
                <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                            <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                            <link
                                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                                rel="stylesheet">

                            <!-- Custom styles for this template -->
                            <link href="css/sb-admin-2.min.css" rel="stylesheet">

                            <!-- Custom styles for this page -->
                            <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

                        </head>

                        <body id="page-top">

                            <!-- Page Wrapper -->
                            <div id="wrapper">

                                <script src="js/layout/Z_slider.js"></script>

                                <!-- Content Wrapper -->
                                <div id="content-wrapper" class="d-flex flex-column">

                                    <!-- Main Content -->
                                    <div id="content">

                                        <!-- Topbar -->
                                        <script src="js/layout/Z_TopBar.js"></script>

                                        <!-- 主要內容 -->
                                        <div class="card shadow mb-4">
                                            <div class="card-header py-3">
                                                <h6 class="m-0 font-weight-bold text-primary">會員資料</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered" id="dataTable" width="100%"
                                                        cellspacing="0">
                                                        <thead>
                                                            <tr>
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

                                                            <% List<UserBean> users = (ArrayList<UserBean>
                                                                    )request.getAttribute("userBeans");
                                                                    DateTimeFormatter df =
                                                                    DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                                                                    for(UserBean user : users){ %>

                                                                    <tr>
                                                                        <td>
                                                                            <%=user.getUserNo() %>
                                                                        </td>
                                                                        <td>
                                                                            <%=user.getUserAccount() %>
                                                                        </td>
                                                                        <td>
                                                                            <%=user.getUserChineseName() %>
                                                                        </td>
                                                                        <td>
                                                                            <%=user.getPhone() %>
                                                                        </td>
                                                                        <td>
                                                                            <%=df.format(user.getCreationDatetime()) %>
                                                                        </td>
                                                                        <td>
                                                                            <%=df.format(user.getLastLoginDatetime()) %>
                                                                        </td>
                                                                        <td>
                                                                            <%=user.getGender()==1 ? "生理男" : "生理女" %>
                                                                        </td>
                                                                        <td>
                                                                            <%=user.getIsManager()==1 ? "是" : "否" %>
                                                                        </td>
                                                                        <td><button type="button" data-toggle="modal"
                                                                                data-target="#updateUserModel"
                                                                                class="btn btn-warning"
                                                                                onclick="importUpdateUserDate(<%=user.getUserNo() %>)">修改</button>
                                                                        </td>


                                                                        <td>
                                                                            <form action="user/<%=user.getUserNo() %>"
                                                                                method="post">
                                                                                <input type="hidden" name="_method"
                                                                                    value="delete" />
                                                                                <input type="submit"
                                                                                    class="btn btn-danger" value="刪除" />
                                                                            </form>
                                                                        </td>
                                                                    </tr>
                                                                    <% } %>
                                                        </tbody>


                                                    </table>
                                                </div>
                                            </div>
                                        </div>

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

                            <!-- 彈出視窗 -->
                            <div class="modal fade" id="updateUserModel" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">會員資料細項</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" action="../userUpdate" enctype="multipart/form-data">
                                                <table class="table">
                                                    <tr>
                                                        <td>使用者編號</td>
                                                        <td><input type="text" id="updateUserNo" readonly
                                                                class="form-control" name="userNo"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>使用者帳號</td>
                                                        <td><input type="text" id="updateUserAccount" name="account"
                                                                class="form-control"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>使用者密碼</td>
                                                        <td><input type="text" id="updateUserPassword" name="password"
                                                                class="form-control">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>中文姓名</td>
                                                        <td><input type="text" id="updateUCName" name="UCName"
                                                                class="form-control"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>英文姓名</td>
                                                        <td><input type="text" id="updateUEName" name="UEName"
                                                                class="form-control"></td>
                                                    </tr>
                                                    <!-- <tr>
                                                        <td>暱稱</td>
                                                        <td><input type="text" id="updateNickName" name="nickName"
                                                                class="form-control">
                                                        </td>
                                                    </tr> -->
                                                    <tr>
                                                        <td>
                                                            <figure class="figure col-md-4 col-sm-5 col-xs-12">
                                                                <img class="rounded" style="width: 100px;"
                                                                    id="avatarImg" alt="">
                                                            </figure>
                                                        </td>

                                                        <td>
                                                            <input type="file" name="avatar"
                                                                class="file-uploader pull-left col-9"
                                                                onchange="selectImgFile(this.files)">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>電子信箱</td>
                                                        <td><input type="text" id="updateEmail" name="email"
                                                                class="form-control">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>生日</td>
                                                        <td><input type="date" id="updateBirthday" name="birthday"
                                                                class="form-control">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>電話</td>
                                                        <td><input type="text" id="updatePhone" name="phone"
                                                                class="form-control">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>住址</td>
                                                        <td><input type="text" id="updateAddress" name="address"
                                                                class="form-control"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>創建時間</td>
                                                        <td><input type="datetime-local" id="updateCreationDateTime"
                                                                readonly name="creationDateTime" class="form-control">
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>最後登入時間</td>
                                                        <td><input type="datetime-local" id="updateLastLoginDatetime"
                                                                readonly name="lastLoginDatetime" class="form-control">
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>性別</td>
                                                        <td><select name="gender" id="updateGender"
                                                                class="form-control">
                                                                <option selected value="1">生理男</option>
                                                                <option value="0">生理女</option>
                                                            </select></td>
                                                    </tr>

                                                    <!-- <tr>
                                                        <td>交友目標編號</td>
                                                        <td><input type="text" id="updateGoalNo" name="goalNo"
                                                                class="form-control"></td>
                                                    </tr>

                                                    <tr>
                                                        <td>血型</td>
                                                        <td><input type="text" id="updateBloodType" name="bloodType"
                                                                class="form-control">
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>MBTI</td>
                                                        <td><input type="text" id="updateMBTI" name="MBTI"
                                                                class="form-control">
                                                        </td>
                                                    </tr> -->

                                                    <tr>
                                                        <td>是否已停權</td>
                                                        <td>
                                                            <select name="suspension" id="updateSuspension"
                                                                class="form-control">
                                                                <option selected value="1">停權</option>
                                                                <option value="0">未停權</option>
                                                            </select>
                                                        </td>
                                                        <!-- <input type="text" id="updateSuspension" name="suspension"
                                                            class="form-control">
                                                        </td> -->
                                                    </tr>

                                                    <tr>
                                                        <td>是否已驗證</td>
                                                        <td>
                                                            <select readonly name="verify" id="updateVerify"
                                                                class="form-control">
                                                                <option selected value="1">已驗證</option>
                                                                <option value="0">未驗證</option>
                                                            </select>
                                                            <!-- <input type="text" id="updateVerify" readonly name="verify"
                                                                class="form-control"> -->
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>是否已刪除</td>
                                                        <td>
                                                            <select readonly name="isDelete" id="updateIsDelete"
                                                                class="form-control">
                                                                <option selected value="1">已刪除</option>
                                                                <option value="0">未刪除</option>
                                                            </select>
                                                            <!-- <input type="text" id="updateIsDelete" name="isDelete"
                                                                class="form-control"> -->
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>是否為管理者</td>
                                                        <td><select name="isManager" id="updateIsManager"
                                                                class="form-control">
                                                                <option selected value="1">管理員</option>
                                                                <option value="0">非管理員</option>
                                                            </select></td>
                                                    </tr>
                                                </table>

                                                <input type="hidden" name="_method" value="put" />

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">關閉</button>
                                                    <button type="submit" class="btn btn-primary">儲存</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- 彈出視窗結尾 -->

                            <!-- Logout Modal-->
                            <script src="js/layout/Z_Logout Modal.js"></script>

                            <!-- Bootstrap core JavaScript-->
                            <script src="vendor/jquery/jquery.min.js"></script>
                            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                            <!-- Core plugin JavaScript-->
                            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                            <!-- Custom scripts for all pages-->
                            <script src="js/sb-admin-2.min.js"></script>

                            <!-- Page level plugins -->
                            <script src="vendor/datatables/jquery.dataTables.min.js"></script>
                            <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

                            <!-- Page level custom scripts -->
                            <script src="js/demo/datatables-demo.js"></script>

                            <!-- 彈出視窗用的js -->
                            <script>
                                function importUpdateUserDate(userNo) {
                                    console.log("userNO:" + userNo)
                                    fetch("userResponseBody/" + userNo).then(function (response) {
                                        if (response.status != 200) {
                                            console.log(response.status + " " + response.statusText);
                                            return;
                                        }

                                        response.json().then(function (data) {
                                            console.log(data);
                                            console.log(data.birthday[0] + "-" + data.birthday[1] + "-" + data.birthday[2])
                                            document.querySelector("#updateUserNo").value = data.userNo;
                                            document.querySelector("#updateUserAccount").value = data.userAccount;
                                            document.querySelector("#updateUserPassword").value = data.userPassword;
                                            document.querySelector("#updateUCName").value = data.userChineseName;
                                            document.querySelector("#updateUEName").value = data.userEnglishName;
                                            // document.querySelector("#updateNickName").value = data.nickName;

                                            document.querySelector("#avatarImg").src = "/localimages/" + data.avatar;
                                            // document.querySelector("#updateAvatar").value = data.avatar;
                                            document.querySelector("#updateEmail").value = data.email;

                                            const dateData = data.birthday;
                                            const dateObject = new Date(dateData[0], dateData[1], dateData[2], dateData[3], dateData[4]);
                                            const formattedDate = dateObject.toISOString().split('T')[0];
                                            document.querySelector("#updateBirthday").value = formattedDate;

                                            document.querySelector("#updatePhone").value = data.phone;
                                            document.querySelector("#updateAddress").value = data.userAddress;

                                            const CDT = data.creationDatetime;
                                            const CDTO = new Date(CDT[0], CDT[1], CDT[2], CDT[3], CDT[4]);
                                            const CFDT = CDTO.toISOString().slice(0, 19);
                                            document.querySelector("#updateCreationDateTime").value = CFDT;

                                            const dateTimeData = data.lastLoginDatetime;
                                            const dateTimeObject = new Date(dateTimeData[0], dateTimeData[1], dateTimeData[2], dateTimeData[3], dateTimeData[4]);
                                            const formattedDateTime = dateTimeObject.toISOString().slice(0, 19);
                                            document.querySelector("#updateLastLoginDatetime").value = formattedDateTime;

                                            document.querySelector("#updateGender").value = data.gender;
                                            // document.querySelector("#updateGoalNo").value = data.goalNo;
                                            // document.querySelector("#updateBloodType").value = data.bloodType;
                                            // document.querySelector("#updateMBTI").value = data.MBTI;
                                            document.querySelector("#updateSuspension").value = data.suspension;
                                            document.querySelector("#updateVerify").value = data.verify;
                                            document.querySelector("#updateIsDelete").value = data.isDelete;
                                            document.querySelector("#updateIsManager").value = data.isManager;

                                        });
                                    });
                                };

                                function selectImgFile(files) {
                                    if (!files.length) {
                                        return false;
                                    }

                                    let file = files[0];
                                    let reader = new FileReader();
                                    reader.onload = function () {
                                        document.querySelector('#avatarImg').src = this.result;
                                    };

                                    reader.readAsDataURL(file);
                                }
                            </script>

                        </body>

                        </html>