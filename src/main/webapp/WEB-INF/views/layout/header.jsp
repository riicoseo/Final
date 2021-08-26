<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="main-header">
	<nav>
		<a href="/"> <img src="/resources/images/logoTxt.png" alt="Logo"
			id="logo" /></a>
		<link rel="stylesheet" href="/resources/css/header.css" />

		<c:choose>
			<c:when test="${loginID!=null }">
				<ul>

					<li><c:choose>
							<c:when test="${binfo.member_role eq 'B'}">

								<a href="${pageContext.request.contextPath}/bMember/myPage">MyPage</a>
								<li><a
									href="${pageContext.request.contextPath}/member/logout"><i
										class="fas fa-sign-out-alt"></i></a></li>
								<li><a href="/noti/detail?userId=${loginID}&page=1"
									class="button" style="position: relative"><i
										class="fas fa-bell fa-2x"></i><span class="nav-counter"></span></a></li>
								<li><i class="fas fa-user-alt userIcon" id="popBtn"
									data-placement="bottom" class="btn btn-lg btn-danger"
									data-toggle="popover lightbox" title="Popover title"
									data-content="And here's some amazing content. It's very engaging. Right?"></i></li>
							</c:when>
							<c:when test="${info.member_role eq 'C'}">

								<a href="${pageContext.request.contextPath}/cMember/mypage">MyPage</a>
								<li><a
									href="${pageContext.request.contextPath}/member/logout"><i
										class="fas fa-sign-out-alt"></i></a></li>
								<li><i class="fas fa-user-alt userIcon" id="popBtn"
									data-placement="bottom" class="btn btn-lg btn-danger"
									data-toggle="popover lightbox" title="Popover title"
									data-content="And here's some amazing content. It's very engaging. Right?"></i></li>
							</c:when>
							<c:otherwise>
							<a href="${pageContext.request.contextPath}/admin/dashForm">AdminPage</a>
								<li><a
									href="${pageContext.request.contextPath}/member/logout"><i
										class="fas fa-sign-out-alt"></i></a></li>


							</c:otherwise>
						</c:choose></li>



				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/member/whichMember">Login</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>

</header>

</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="/resources/js/header.js"></script>
<script>

  $(function(){
	  $.ajax({
		  url:"/noti/alarmCounts",
		  data:{userId:'${loginID}'}
	  }).done(function(res){
		  console.log(res)
		  $('.nav-counter').append(res)
	  })
	 
  })
  
  /* 팝오버입니다. */
  $("#popBtn").popover({
	     animation: true,

	     delay: { show: 50, hide: 10 },
	     // template 사용한다.
	     html: true,
	     // 팝오버 template 제목은 popover-title, 내용은 popover-content에 들어간다.
	     template:
	       '<div class="popover" role="tooltip" style="width:500px;"><div class="arrow"></div><div class="popover-body"></div></div>',
	     // 팝오버 제목
	     title: "팝 오버",
	     // 팝오버 내용
	     content: "내용",
	     // 팝오버 이벤트는 수동.
	     trigger: "manual",
	   });
	   $("#popBtn").on("click", function () {
	     $("#popBtn").popover("toggle");
	     setTimeout(function() {
	    	 document.getElementById("menu1").click();
	    	}, 100); 
	     //$("#popBtn").ekkoLightbox();
	     // $(".wrap").css("background-color", "rgba(0,0,0,0.6)");
	     //$(".wrap").css("opacity", "0.3");
	   });

	   $("#popBtn").attr(
	     "data-content",
	     '<li id="menu1">예약정보</li><li id="menu2">찜</li><div id="myp"><i id="getout" class="fas fa-window-close fa-2x"></i></div><br><div class="section"></div>'
	   );
	 
	   //동적 생성된거는 이거 쓴다.
	  $(document).on("click", "#menu1", function () {
		  let contentSection = $(".section");
		   $.ajax({
			   url:"/res/resInfoList",
			   data:{userId:'${loginID}'}
		   }).done(function(resp){
			  
			  // $(".section *").remove();
			   
			     let first ='<table class="table"><thead><tr><th scope="col">식당이름</th><th scope="col">날짜</th><th scope="col">시간</th></tr></thead><tbody>'
			     
			      resp.map((list)=>{	
			    first += "<tr><th scope='row'><a href='/Business/view?biz_seq="+list.biz_seq+"&userId="+list.userId+"'>"+list.res_name+"</a></th><td>"+ list.res_date+"</td><td>"+list.res_time+"</td></tr>";	
			     }) 
			     first+='  </tbody></table>'
			     contentSection.html(first);
		   })
	  
	   });
	 // <div id='aaa' data-res='"+list.res_no+"'>"+list.res_name+"</div><br><div>"+list.res_date+"</div><br><div>"+list.res_time+"</div><br>
	   $(document).on("click", "#menu2", function () {
	     $(".section *").remove();
	     let contentSection = $(".section");
	     $.ajax({
	    	 url:"/like/getLikes",
	    	 data:{'userId':'${loginID}'}
	     }).done(function(resp){
	    	 console.log(resp[0].like_status)
	    	
	    	 let second=''
	    	 
	    		
	    	 resp.map((list)=>{
	    		 if(list.like_status === 'Y'){
	    		 second +="<div id='aaa' data-lkno='"+list.like_no+"'><span>식당 이름: </span>"+list.businessName+"</div><div><a href='/Business/view?biz_seq="+list.biz_seq+"&userId="+list.userId+"'>상세보기: <i class='fas fa-sign-in-alt'></i></a></div><br>"
	    		 }
	    	 })
	    	 
	    	    contentSection.append(second);
	    	 
	     })
	  
	 
	   });
	   
	   $(document).on('click','#getout',function(){
		   $("#popBtn").click();
	   })
	   
	   
  </script>

