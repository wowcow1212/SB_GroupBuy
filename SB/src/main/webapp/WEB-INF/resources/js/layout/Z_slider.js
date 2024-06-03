slider = `<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SB 後台頁面</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Interface
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#userPages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-users"></i>
            <span>使用者</span>
        </a>
        <div id="userPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">user</h6>
                <a class="collapse-item" href="/users">使用者後台</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#forumPages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-file"></i>
            <span>論壇</span>
        </a>
        <div id="forumPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">forum</h6>
                <a class="collapse-item" href="/CategoriesController/CategoriesAll">論壇後台</a>
                <a class="collapse-item" href="/reports/AllReports">檢舉管理</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#groupPages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-shopping-cart"></i>
            <span>團購</span>
        </a>
        <div id="groupPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">group</h6>
                <a class="collapse-item" href="/group/backgroups">團購活動</a>
                <a class="collapse-item" href="/group/backdonegroups">結單團購</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#activityPages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-calendar"></i>
            <span>活動</span>
        </a>
        <div id="activityPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">activity</h6>
                <a class="collapse-item" href="/activityHomepage">活動後台</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#matchPages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-sign-language"></i>
            <span>配對</span>
        </a>
        <div id="matchPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">match</h6>
                <a class="collapse-item" href="/goalsHP">尋找關係後台</a>
                <a class="collapse-item" href="/tagsHP">個性標籤後台</a>
                <a class="collapse-item" href="/socialPhotosHP">交友照片後台</a>
                <a class="collapse-item" href="/matchHP">配對後台</a>
            </div>
        </div>
    </li>

    

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    

</ul>
<!-- End of Sidebar -->`;
document.write(slider);