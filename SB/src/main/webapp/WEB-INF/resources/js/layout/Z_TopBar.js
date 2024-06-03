Topbar = `<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <a href="/postsFrontDesk/AllPosts"
        class="m-b-5" title="首頁" style="color:#d1d3e2;">
        <i class="fas fa-home fa-2x fa-fw" aria-hidden="true"></i>
    </a>

    <!-- Topbar Search -->
    <form
        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group position-relative">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                aria-label="Search" aria-describedby="basic-addon2" id="search">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" id="searchButton">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
            <div id="searchSuggestions" class="suggestions"></div>
        </div>
    </form>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                            placeholder="Search for..." aria-label="Search"
                            aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter" id="friendMesConut"></span>
            </a>
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="alertsDropdown" id="friendDropdown">
                <h6 class="dropdown-header">交友通知</h6>
                
            </div>
        </li>

        <!-- Nav Item - Messages -->
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link " href="/userChat" id="messagesDropdown" role="button"
                 aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                
            </a>
            <!-- Dropdown - Messages -->
            
        </li>

        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small" id="userName">Douglas McGee</span>
                <img class="img-profile rounded-circle object-fit-cover" id="topBarAvatar" src="img/undraw_profile.svg">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/aboutMe">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    個人資料
                </a>
                <a class="dropdown-item" href="/activityList">
                    <i class="fas fa-calendar fa-sm fa-fw mr-2 text-gray-400"></i>
                    活動
                </a>
                <a class="dropdown-item" href="/group/groups">
                    <i class="fa fa-shopping-cart fa-sm fa-fw mr-2 text-gray-400"></i>
                    團購
                </a>
                <a class="dropdown-item" href="/group/mygroups">
                    <i class="fa fa-shopping-cart fa-sm fa-fw mr-2 text-gray-400"></i>
                    我的團購
                </a>
                <a class="dropdown-item" href="/match.HeartLoading">
                    <i class="fas fa-sign-language fa-sm fa-fw mr-2 text-gray-400"></i>
                    配對
                </a>
                <a class="dropdown-item" href="/chatPage">
                    <i class="fas fa-sign-language fa-sm fa-fw mr-2 text-gray-400"></i>
                    快速移動(DEMO用)
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    登出
                </a>
            </div>
        </li>

    </ul>

</nav>
<!-- End of Topbar -->`;
document.write(Topbar);

fetch("/getTopBarData").then(function (response) {
    if (response.status != 200) {
        console.log(response.status + " " + response.statusText);

        return;
    }

    response.json().then(function (data) {
        console.log(data);
        document.querySelector("#userName").innerHTML = data.userChineseName;
        document.querySelector("#topBarAvatar").src = "/localimages/" + data.avatar;

        // var resultText = "";
        // for (var i = 0; i < data.length; i++) {
        //     resultText += data[i].houseid + " " + data[i].housename + "<br/>";
        // }

        // document.querySelector("#result").innerHTML = resultText;
    });
});

fetch("/findWaitAgreeFriend").then(function (response) {
    if (response.status != 200) {
        console.log(response.status + " " + response.statusText);

        return;
    }

    response.json().then(function (data) {
        console.log(data);
        // document.querySelector("#userName").innerHTML = data.userChineseName;
        // document.querySelector("#topBarAvatar").src = "/localimages/" + data.avatar;

        document.querySelector("#friendMesConut").innerHTML = data.length;

        var resultText = "";
        for (var i = 0; i < data.length; i++) {
            resultText += `
                <div class="dropdown-item d-flex align-items-center">
                    <div class="mr-3">
                        <img src="/localimages/${data[i].avatar}" class="rounded-circle" width="40" height="40" alt="Profile Picture" onclick="window.location.href='/setOtherUserNo/${data[i].userNo}'" style="cursor: pointer;">
                    </div>
                    <div>
                        <div class="font-weight-bold">${data[i].userChineseName}向您提出了交友申請</div>
                        <div class="d-flex justify-content-end mt-2">
                            <button class="btn btn-sm btn-primary mr-2" onclick="window.location.href='/agreeApplication/${data[i].userNo}'">同意</button>
                            <button class="btn btn-sm btn-outline-primary" onclick="window.location.href='/cancelApplication/${data[i].userNo}'">拒絕</button>
                        </div>
                    </div>
                </div>
            `;
        }

        if(data.length <= 0){
            resultText = `
                <div class="dropdown-item d-flex align-items-center">
                    暫無交友邀請
                </div>
            `;
        }
        document.querySelector("#friendDropdown").innerHTML += resultText;
    });
});




