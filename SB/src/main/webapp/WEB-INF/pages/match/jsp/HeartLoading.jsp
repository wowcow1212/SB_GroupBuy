<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.match.bean.MatchBean"%>
<%@ page import="java.util.List"%>
    
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
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
                
                
                    <style>
        .heart-loader {
  width: 100px;
  height: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.heart {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  display:inline-block;
  -webkit-mask:
     radial-gradient(circle at 60% 65%, red 64%, transparent 65%) top left,
     radial-gradient(circle at 40% 65%, red 64%, transparent 65%) top right,
     linear-gradient(to bottom left, red 43%,transparent 43%) bottom left ,
     linear-gradient(to bottom right,red 43%,transparent 43%) bottom right;
  -webkit-mask-size:50% 50%;
  -webkit-mask-repeat:no-repeat;
  mask:
     radial-gradient(circle at 60% 65%, red 64%, transparent 65%) top left,
     radial-gradient(circle at 40% 65%, red 64%, transparent 65%) top right,
     linear-gradient(to bottom left, red 43%,transparent 43%) bottom left ,
     linear-gradient(to bottom right,red 43%,transparent 43%) bottom right;
  mask-size: 50% 50%;
  mask-repeat: no-repeat;
  background: linear-gradient(180deg, rgba(254,215,255,1) 0%, rgba(110,50,100,1) 85%);
}
.heart::before {
  content:"";
  display:block;
  padding-top:100%;
}

.wrap {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
}

.pulse {
  animation-duration: 1s;
  animation-name: pulse;
  animation-iteration-count: infinite;
  animation-timing-function: ease-out;
}

.echo {
  animation-duration: 1s;
  animation-name: echo;
  animation-iteration-count: infinite;
  animation-timing-function: ease-out;
}


@keyframes pulse {
  0% {
    transform: scale(1);
  }
  
  10% {
    transform: scale(1.1);
  }
  
  20% {
    transform: scale(1);
  }
  
  100% {
    transform: scale(1);
  }
}

@keyframes echo {
  0% {
    transform: scale(1);
    opacity: 0.3;
  }
  
  10% {
    transform: scale(1.1);
    opacity: 0.3;
  }
  
  100% {
    transform: scale(2);
    opacity: 0;
  }
}

  </style>
</head>



<body>
    <div class="heart-loader">
        <div class="heart pulse"></div>
        <div class="heart echo"></div>
      </div>
      
      
      
    <script>
    
    
    window.onload = function() {
        setTimeout(function() {
            window.location.href = "/createMatchProfile";
        }, 2800); // 3000毫秒 = 3秒
    };
    	
    
    </script>
                
                

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

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>


</body>

</html>