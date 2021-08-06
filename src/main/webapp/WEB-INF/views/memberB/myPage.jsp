<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Mypage - Info and Service
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" />
  <!--   jquery 관련 -->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

 <style>
      p{display:inline-block;}
    .card-body div{ display:inline-block;}
  </style>

</head>

<body class="">

  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->

      <div class="logo">
          <a href="" class="simple-text logo-normal">
          Tasty Korea! 로고</a>
      </div>



      <div class="sidebar-wrapper">

        <div id="profileBox"  style="height:30%">
            <div>
             <p></p>
            </div>
           <div style="text-align: center;">
            <i class="material-icons" style="font-size: 100px;">person_outline</i>
           </div>
           <div id="idBox" style="text-align: center;">
            ID  hhahaHoHo
           </div>
        </div>

        <div id="naviBox" style="height:50%">
        <ul class="nav" style="height:100%">

          <li class="nav-item active ">
             <a class="nav-link" href="">
                  <i class="material-icons">person</i>
                  <p>My Page</p>
             </a>
          </li>

          <li class="nav-item ">
            <a class="nav-link" href="">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
          

          <li class="nav-item ">
            <a class="nav-link" href="link.html">
              <i class="material-icons">chat</i>
              <p>Chatting</p>
            </a>
          </li>


          <div style="height:55%"></div>

          
            <li class="nav-item ">
              <a class="nav-link" href="">
                <i class="material-icons">west</i>
                <p>Exit this Page</p>
              </a>
            </li>
          

        </ul>
        </div>

        <!-- <div id="outBox" style="height:20%">
        
        </div> -->


      </div>
    </div>




    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="">My Page</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          

        </div>
      </nav>
      <!-- End Navbar -->



      <div class="content">
        <div class="container-fluid">
         
         
            
        <!-- Info 관련 카드 2 섹션 -->
            <div class="row">  
                <!-- ==== 개인정보 관련 ==== -->
                <div class="col-lg-12">
                    <form id="" action="">
                    <div class="card">

                      <div class="card-header card-header-warning">
                        <div class="ct-chart" id="dailySalesChart">
                            Personal Info
                        </div>
                      </div>

                      <!-- <div style="border-top: 1px solid rgb(128, 50, 50);">
                      </div> -->

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">ID</div>
                        <div style="width:60%">${dto.id} <input type=text value="${dto.id}"></div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">PW</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">PW 재입력</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Name</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Email</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Phone</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Phone</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                       <div style="text-align: right; padding:10px">
                        <button class="btn" type="button" style="background-color:tomato">탈퇴하기</button>
                        <button class="btn" type="button">Edit</button>
                       </div>

                    </div>
                    
                     </form>
                </div>
                <!-- ==== 개인정보 관련 끝! ==== -->

                
                 <!-- ==== 업체 정보 관련 ==== -->
                 <div class="col-lg-12">
                    <form id="" action="">
                    <div class="card">

                      <div class="card-header card-header-success">
                        <div class="ct-chart" id="dailySalesChart">
                            Business Info
                        </div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Type</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">RegNum</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">PW 재입력</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Name</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Email</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Phone</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>

                      <div class="card-body" style="width:100%">
                        <div style="width:30%">Phone</div>
                        <div style="width:60%">${dto.id}</div>
                      </div>
                      <div style="text-align: right; padding:10px">
                        <button class="btn" type="button">Edit</button>
                       </div>
                    </div>
                    </form>
                </div>
                <!-- ==== 업체 정보 관련 끝!! ==== -->
              </div>
              <!-- Info 관련 카드 2 섹션 끝!! -->  
            

              <!-- ==== 메뉴판 및 사진 업로드 관련 ==== -->
              <div class="row">
                <div class="col-lg-12">
                  <div class="card">

                    <div class="card-header card-header-info">
                      <div class="ct-chart" id="dailySalesChart">
                          Business Service
                      </div>
                    </div>
                    
                    <div class="card-body" style="width:100%">
                      <div style="width:30%">메뉴판 번역 서비스</div>
                      <div style="width:60%"><button class="btn" type="button">번역 서비스</button></div>
                    </div>

                    <div class="card-body" style="width:100%">
                      <div style="width:30%">업체 사진 등록 서비스</div>
                      <div style="width:60%"><input type=file><button class="btn" type="button">업로드</button></div>
                    </div>

                  </div>
              </div>
              </div>
               <!-- ==== 메뉴판 및 사진 업로드 관련  끝! ==== -->
    
    </div>
    </div>
  </div> 
</div>      
      
    

  
</body>

</html>