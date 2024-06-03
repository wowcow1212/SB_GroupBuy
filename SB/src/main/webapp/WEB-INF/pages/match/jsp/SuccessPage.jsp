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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
   
    <style>
    

    
	.middle-page {
	  background-color: #eee;
	  overflow: hidden;
	  height: 80vh;
	  display: flex;
	  align-items: center;
	}
    
	.success-page {
	  max-width: 400px;
	  display: block;
	  margin: 0 auto;
	  text-align: center;
	  margin-top : 100px;
	}

    .success-page img {
        max-width: 62px;
        display: block;
        margin: 0 auto;
    }

    .btn-view-orders {
        display: block;
        border: 1px solid #47c7c5;
        width: 120px;
        margin: 0 auto;
        margin-top: 45px;
        padding: 10px;
        color: #fff;
        background-color: #47c7c5;
        text-decoration: none;
        margin-bottom: 20px;
    }

    h2 {
        color: #47c7c5;
        margin-top: -150px;
        font-size: 40px;
        
    }

    a {
        text-decoration: none;
    }
    
    h6 {
    	margin-top: 10px;    	
    }
    
#heart-container {
  position: relative;
  display: inline-block;
  top: 50px; /* 調整這個值來改變與頂部的距離 */
  margin-bottom: 100px; /* 調整這個值來改變與下方元素的距離 */
}

#heart {
  background: white;
  box-sizing: border-box;
  box-shadow: 0 5px 10px -5px rgba(0, 0, 0, 0.2);
  display: flex;
  height: 128px;
  width: 128px;
  align-items: center;
  justify-content: center;
  border-radius: 128px;
  transform: scale(1) rotateX(0deg);
  transition: transform 0.25s ease-in-out;
}

#heart .fa-heart {
  color: #E94D5A;
  font-size: 60px;
  padding-top: 5px;
  padding-left: 3px;
}

#heart .tick {
  position: absolute;
  background: #00AEBC;
  color: white;
  display: flex;
  height: 44px;
  width: 44px;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  border-radius: 44px;
  bottom: 0;
  right: 0;
  transition: transform 0.25s ease-in-out 0.125s, opacity 0.25s ease-in-out 0.125s, bottom 0.25s ease-in-out;
  transform-origin: top left;
}

#heart.loading {
  transform: scale(0) rotateZ(-40deg);
  transition: transform 0.25s ease-in-out 0.25s;
}

#heart.loading .tick {
  transform: scale(0);
  opacity: 0;
  bottom: -10px;
  transition: transform 0.25s ease-in-out, opacity 0.125s ease-in-out, bottom 0.25s ease-in-out;
}
    
    </style>

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
         
			  <div class="middle-page">       
  
			    <div class="success-page">
        
			        <h2>配對成功 !</h2>
			        <p>可以到聊天室做進一步的認識</p>
        
 			       <div id="heart-container">
					  <div id="heart" class="loading">
					    <i class="fa fa-heart"></i>
					    <div class="tick">
					      <i class="fa fa-fw fa-check"></i>
					    </div>
					  </div>
					</div>
					
					<h6>交友時要保持警惕，避免輕信陌生人 
					<h6>建議在公共場所見面，並告知朋友或家人你的行蹤
  
		        <a href="/newMatchPage" class="btn-view-orders" onclick="changePage()">回到配對頁面</a>
           </div>
           
           
           
               		<script>

				document.addEventListener('DOMContentLoaded', function() {
				    setTimeout(function() {
				        document.getElementById('heart').classList.remove('loading');        
				    }, 1000);
				});

				setInterval(function() {
				    var heartElement = document.getElementById('heart');
				    if (heartElement.classList.contains('loading')) {
				        heartElement.classList.remove('loading');
				    } else {
				        heartElement.classList.add('loading');
				    }
				}, 5000);

				</script>   
				
				
				<script>
  
				function changePage() {
				    JSReceiver.changePricing(500);
				}
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