<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<head>
	<title>원데이 클래스 상세</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${path}/resources/pato/bootstrap/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
	<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
	
	<!-- datepicker -->
	<link type="text/css" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	
	<!-- 결제 라이브러리 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<script>
	//달력 배치 및 효과 스크립트
	$(function () {
		//로그인한 회원 아이디
		
		$("#search").on("click", function() {
				
			const reDate=$("#testDatepicker").val();
			const memberId=$('#memberId').val();
			console.log(memberId)
			if(memberId==''){
				alert('로그인 시 이용가능한 서비스 입니다');
				return window.location.assign("${path}/member/loginpage");
			}
			if(reDate==''){
				alert('날짜를 지정해주시요');
			}else{
				$("#searchbox").slideDown("fast"); // 2초에 걸쳐서 진행
			}
			
		});
		
		
		
		$(window).scroll(  
			function(){  
				console.log('test');
				//스크롤의 위치가 상단에서 450보다 크면  
				if($(window).scrollTop() > 500){  
					$('#calender').addClass("fix1");  
					//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
				}else{  
					$('#calender').removeClass("fix1");  
					//위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
				}
			}
		); 
			
		$(window).scroll(  
			function(){  
				if($(window).scrollTop() > 1500){
					console.log($(window).scrollTop());
					$('#datailmenubar').addClass("fix2");  
					//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
				}
			}
		);
	});
	
</script>

<body>
<input>
	<!-- 배너 -->
	<div class="bg-title-page flex-c-m" style="background-image: url(${path}/resources/pato/images/class/class3.gif);">
		<h2 class="tit6 t-center" >
			One-Day Class
		</h2>
	</div>

	<!-- 루트분류 -->
	<section>
		<div class="bo5-b p-t-17 p-b-17">
			<div class="container" >
				<a href="${path }/class/main.do" class="txt27">
					one-day class
				</a>

				<span class="txt29 m-l-10 m-r-10">/</span>

				<a href="${path}/class/menu.do?type=${odc.odcCategoty }" class="txt27">
					${odc.odcCategoty }
				</a>

				<span class="txt29 m-l-10 m-r-10">/</span>

				<span class="txt29">
					${odc.odcClassName }
				</span>
			</div>
		</div>

		<div class="container">
			<div class="row ">
				<div class="col-md-8 col-lg-9">
					<div class=" bo5-r">
						<div class="blo4 p-b-63">
							<div class="zoom" style="margin: 3%;margin-left:10%">
								<img class="bo-rad-10" src="${path}/resources/images/onedayclass/${odc.odcMainPic }" height="550">
							</div>

							<div class="t-center">
									<h3>${odc.odcClassName }</h3>
									<c:set var="odcmasterId" value="${odc.memberId }"/> 
									<c:set var="m" value="${loginMember.memberId }"/> 
										<div style="margin-left:70%">
									<c:if test="${m eq odcmasterId}">
											<a href="${path}/class/editClass.do?no=${odc.odcNo }">
												<img src="${path }/resources/images/onedayclass/edit.png" width=30 height=30>
												<b style="color:black">글 수정하기</b>
											</a>
									</c:if>
									<c:if test="${m eq odcmasterId or m eq 'admin'}">
											<a href='javascript:void(0);' onclick='deleteClass();'>
												<img src="${path }/resources/images/onedayclass/delete.png" width=30 height=30>
												<b style="color:black">글 삭제하기</b>
											</a>
									</c:if>
										</div>
									
									<script type="text/javascript">
										function deleteClass() {
											const odcNo= $('#odcNo').val();
											 if(confirm("정말 삭제하시겠습니까?") == true){
												
												  $.ajax({
													type:'get',
													   url : "<c:url value='/class/deleteClass.do'/>",
													   data: {
														"odcNo" : odcNo
														},
													   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
													   success : function(data){
													  		alert('삭제되었습니다');
													  		return window.location.assign("${path}/class/main.do");
													   }
												}) 
												 
											 }else{
											      return;
											 }
										};
									</script>
									
									<br>
								<span id="classinfo" style="color:white;">───────────────────────────────────────────────────</span>
								<div style="display: flex;width: 100%; margin-bottom: 4%;align-items: center;justify-content: center;">
									<div style="border-bottom:solid gray 1px;height:33px" class="flex-c-m">
									<span>
										<img src="${path}/resources/images/onedayclass/chef.png" width="30" height="30">
										${odc.masterName}
										<input type="hidden" name="masterId" value="${odc.memberId }" id="masterId">
										<input type="hidden" name="masterName" value="${odc.masterName}" id="masterName">
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border-bottom:solid gray 1px;padding:0.3%;height:33px" class="flex-c-m">
										<span>
											<img src="${path}/resources/images/onedayclass/timer.png" width="30" height="30">
											수업 소요 : 약 ${odc.odcTime }분
										</span>
									</div>
									&nbsp;&nbsp;
									<div style="border-bottom:solid gray 1px;padding:0.3%;;height:33px" class="flex-c-m">
									<span>
										<img src="${path}/resources/images/onedayclass/time.gif" width="30" height="30">
										수업시작 : ${odc.odcStartTime }
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border-bottom:solid gray 1px; ;height:33px; padding:0.3%" class="flex-c-m">
									<span>
										<img src="${path}/resources/images/onedayclass/map.png" width="30" height="30">
										${odc.odcCity }
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border-bottom:solid gray 1px; ;height:33px;padding:0.3%" class="flex-c-m">
									<span>
										<img src="${path}/resources/images/onedayclass/team.png" width="33" height="33">
										1~${odc.odcPeople }명
									</span>
									</div>
								</div>

								<!-- 상세페이지 메뉴바 -->
								<div class="multab" style="align-items: center;justify-content: center;display: flex;padding:3%;text-align: center;box-shadow: 8px 6px 9px -6px grey; height:50px" id="datailmenubar">
									<a href="#classinfo">
										<h4>클래스 소개</h4>
									</a>
									<h3>│</h3>
									<a href="#masterinfo"><h4>강사 소개</h4></a>
									<h3>│</h3>
									<a href="#reviewlist"><h4>수강 후기</h4></a>
									<h3>│</h3>
									<a href="#qna"><h4>문의글</h4></a>
								</div>
								
								
								<br>
								<!-- 상세페이지 내용 -->
								<div width="100" height="100">
								${odc.odcContent}
								</div>
								
								<br><br>

								<div style="margin-bottom: 5%;">
									<span id="masterinfo">───────────────────────────────────────────────────</span>
								</div>
								
								<img src="${path}/resources/images/onedayclass/chef.png" width="30" height="30">
								<h4 class="txt33 p-b-14">${odc.masterName} 강사님 소개</h4><br>
								
								 <c:choose>
		              				 <c:when test="${empty h}">
		              				 	<strong>강사님은 아직 경력이 없지만 열심히 수업을 준비하셨습니다👨‍🍳💪</strong>
		              				 </c:when>
		              				 <c:otherwise>
			              				 <c:forEach var="h" items="${h}">
			              				 	<div style='border-radius: 10px; border: solid #898585 1px; margin: 1%;box-shadow: 0px 5px 5px -5px gray;'>
												<h5>${h}</h5>
											</div>
			              				 </c:forEach>
		              				 </c:otherwise>
	              				 </c:choose>
	
				
								<div style="margin-bottom: 3%; margin-top: 3%;">
									<span>───────────────────────────────────────────────────</span>
								</div>
								
								<img src="${path}/resources/images/onedayclass/map.png" width="30" height="30">
								<h4 class="txt33 p-b-14" style="padding : 2%">
									수업은 어디서 듣나요?
								</h4>
								
								<h5 class="txt33 p-b-14" style="padding : 2%">
									${odc.odcAdd }
								</h5>
								<input type="hidden" value="${odc.odcAdd }" id="classPlace">
								<!-- 다음 지도api-->
								<div id="all" style="align-items: center;">
									<div id="map" style="width:800px;height:300px;align-items: center;"></div>
								</div>
								
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0ca5ca19fc5b73909077a7b94b21bd4&libraries=services"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };  

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption); 

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								const palce=$('#classPlace').val();
								console.log(palce)

								// 주소로 좌표를 검색합니다
								geocoder.addressSearch(palce, function(result, status) {

								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {

								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new kakao.maps.Marker({
								            map: map,
								            position: coords
								        });

								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new kakao.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">원데이클래스 위치</div>'
								        });
								        infowindow.open(map, marker);

								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
								</script>
								 
							

							<div style="margin-bottom: 7%; margin-top: 3%;">
								<span id="reviewlist" style="color:white">───────────────────────────────────────────────────</span>
							</div>
	
							<!-- 후기영역-->
							<div>
									<div style="text-align: left;">
									<h2 style="font-style: italic;">Review</h2>
									<h4 class="txt33">
									<mark>수강후기</mark>
									</h4>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="hidden" name="odcNo" value="${odc.odcNo}" id="odcNo">
									<input type="hidden" name="memberId" value="${loginMember.memberId}" id="memberId">
									<button type="button" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin-right:30%"
									onclick="goPopup(event);">
											리뷰작성하기
									</button>
									
									<br>
									
									<c:if test="${loginMember.memberId ne null}">
										<label>
											<input type="checkbox" id="myReview" onclick="getMyReview();">
											내가 쓴 글
										</label>
									</c:if>
									<p style="color: rgb(195, 195, 195);">
										* 클래스를 수강한 회원님들의 후기입니다.
									</p>
									</div>
									<div class="reviewList"></div>
							</div>

							<div style="margin-bottom: 7%; margin-top: 3%;">
								<span id="qna" style="color:white">───────────────────────────────────────────────────</span>
							</div>
		
							<div style="text-align: left;">
							<h2 style="font-style: italic;">Q&N</h2>
								<h4 class="txt33 p-b-14">
									<mark>문의하기</mark>
								</h4>
								<c:if test="${loginMember.memberId ne null}">
									<label>
										<input type="checkbox" id="myQna" onclick="getMyQna();">
										내가 쓴 글
									</label>
								</c:if>
								<c:if test="${loginMember.memberId eq 'admin' || loginMember.memberId eq odcmasterId}">
									<label>
										<input type="checkbox" id="noQna" onclick="getNoQna();">
										답변 안 된 글
									</label>
								</c:if>
								<div class="col-md-12" id="">
									<div class=" size12 bo2 bo-rad-10 m-t-3 m-b-23">
										<input type="hidden" name="memberId" value="${loginMember.memberId }" id="memberId">
										<input type="hidden" name="odcNo" value="${odc.odcNo}" id="odcNo">
										<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="oqContent" id="oqContent" placeholder="강사님에게 궁금한 점을 남겨주세요">
									</div>
								<!-- 	<ul style="border: solid 1px; margin-bottom: 1%;"></ul> -->
									<div style="display: flex; align-items:center">
										<button type="button" id="Comment_regist" class="btn3 flex-c-m size36 txt11 trans-0-4">
											등록
										</button>
										&nbsp;&nbsp;
										<div style="margin-bottom: -1%;">
											<label>
												<input type="checkbox" value="secret" name="secret" id="secret">
												비밀글
											</label>
										</div>
									</div>
								</div>
								
								<!-- 댓글리스트 -->
								<div id="commentList" style="margin-top:10%"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

<script type="text/javascript">

	//페이지 실행시 댓글리스트, 리뷰리스트 가져오기
	$(function(){
	    getCommentList();
	    getReviewList();
	    
	});
	
	$(function(){
		if($('#myReview').is(":checked")){
	    	console.log("체크")
	    	//getMyReview();
		}
	})
	
	//내가 쓴 후기 글 보기
	function getMyReview(){
		if($('#myReview').is(":checked")){
			console.log("후기이이");
			const odcNo= $('#odcNo').val();
			const memberId=$("#memberId").val();
	
			console.log(memberId);
			$.ajax({
				type:'post',
				url : "<c:url value='/class/selectReviewById.do'/>",
				contentType: 'application/json',
				data:JSON.stringify({
					"odcNo" : odcNo,
					"memberId" : memberId
				}), 
				success : function(data){
					var html = "";
					if(data.length > 0){
						for(i=0; i<data.length; i++){
							html+="<div style='border-bottom:solid #898585 1px;'>";
							html+="<br>";
							html+="<div class='col-md-12' style='display: flex;'>";
							html+="<span>";
							html+="<span>"+data[i].nickname+"("+data[i].memberId+")</span>";
							html+="<span>│"+data[i].oreDate+"</span>";
							html+="<span style='cursor: pointer;'>│수정</span>";
							html+="<input type='hidden' value='"+data[i].oqno+"'>";
			                html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
							html+="</span>";
							html+="</div>";
							html+="<div class='col-md-12'style='display:flex; margin-left: -1.5%;'>";
							if(data[i].oreGood=='Y'){
								html+="<div style='border-radius: 10px; border: solid #898585 1px; margin: 1%;'> &nbsp;추천해요👍&nbsp; </div>";
							}
							if(data[i].oreSame=='Y'){
								html+="<div style='border-radius: 10px; border: solid #898585 1px;margin: 1%'> &nbsp;실제 수업은 클래스 소개와 동일한 방식으로 진행됐어요😊 </div>";
							}
							html+="</div>";
							html+="<div class='col-md-12' style='display: flex;'>";
							html+="<img src='${path}/resources/images/onedayclass/"+data[i].orePic+"' width='100' height='100' class='rimg' style='margin: 1%; transition: all 0.3s linear;'>";
							html+="<span>"+data[i].oreContent+"</span>";
							html+="</div>";
							html+="</div>";
						}
					}else{
						html += '<h6><strong>회원님께서 작성한 후기가 없습니다</strong></h6>';
					}
					$(".reviewList").html(html);
				}	
			});
		}else{
			getReviewList();
		}
	};
	
	//답변 안된 문의글 불러오기
	function getNoQna(){
		if($('#noQna').is(":checked")){
			console.log("체크크")
			const odcNo= $('#odcNo').val();
			const memberId= $('#memberId').val();
			console.log(memberId);
			$.ajax({
				type:'get',
				url : "<c:url value='/class/selectNoQna.do'/>",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				data:{
					"odcNo" : odcNo
				},
				success : function(data){
		            var html = "";
		            
		            if(data.length > 0){
		                
		                for(i=0; i<data.length; i++){
		                 
		                   html+="<div style='border-bottom: solid 1px gray;margin:2%; width:90%; text-align: left'  class='col-md-12'>";
		                   html+="<ul style='margin:1%;'>";
		                   html+="<li>";
		                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
		                   html+="<span>";
		                   if(data[i].oqSecretYn=='Y'){
			                	html+="<img src='${path}/resources/images/onedayclass/secret.png' width='27' height='27'>";
			                   }
		                   html+="<span>"+data[i].nickname+"("+data[i].memberId+")</span>";
		                   html+="<span>│"+data[i].oqEnrollDate+"</span>";
		                   html+="<input type='hidden' value='"+data[i].oqno+"'>";
		                   if(memberId=='admin'){
		                   html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
		                   }
		                   html+="</span>";
		                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
		                   html+="<p style='padding:auto;'>"+data[i].oqContent+"</p>";
		                   html+="</div>";
		                   html+="<div class='commentView'>";
		                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
		                   html+="<span class='vieCommentList' style='cursor: pointer;' onclick='goView(event);'>댓글보기</span>";
		                   if(memberId!=''){
		                   html+="<span class='enrollCommentInput' style='cursor: pointer;' onclick='goInput(event);'>│댓글쓰기</span>";
		                   }
		                   html+="</div>";
		                   html+="</div>";
		                   html+="<div class='commentInput' style='display:none;'>";
		                   html+="<ul style='margin:1%;'>";
		                   html+="<li>";
		                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
		                   html+="<div class='replyInfo'>";
		                   html+="</div>";
		                   html+="<div style='display: flex;'>";
		                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
		                   if(memberId=='admin'){
		                   	html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='관리자님! 해당 문의에 대한 답글을 남겨 주세요'>";
		                   }else{
		                	html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='강사님! 해당 문의에 대한 답글을 남겨 주세요'>";
		                   }
		                   html+="&nbsp;&nbsp;";
		                   html+="<button style='width: 100px;cursor: pointer;' onclick='reCommentBtn(event);'>등록</button>";
		                   html+="</div>";
		                   html+="</div>";
		                   html+="</li>";
		                   html+="</ul>";
		                   html+="</div>";
		                   html+="<div class='reCommentList"+data[i].oqno+"'style='display: none;'>";
		                   html+="</div>";
		                   html+="</li>";
		                   html+="</ul>";
		                   html+="</div>";
		                }
		            }else{
		            	html += '<h6><strong>답변 안 된 문의 글이 없습니다</strong></h6>';
		            }
		            $("#commentList").html(html);
				}
			});
		}else{
			getCommentList();
		}
	} 
	
	//내가 쓴 문의글 불러오기
	function getMyQna(){
		if($('#myQna').is(":checked")){
			console.log("체크크")
			const odcNo= $('#odcNo').val();
			const memberId= $('#memberId').val();
			
			$.ajax({
				type:'post',
				url : "<c:url value='/class/selectQnaById.do'/>",
				contentType: 'application/json',
				data:JSON.stringify({
					"odcNo" : odcNo,
					"memberId" : memberId
				}),
				success : function(data){
		            var html = "";
		            
		            if(data.length > 0){
		                
		                for(i=0; i<data.length; i++){
		                 
		                   html+="<div style='border-bottom: solid 1px gray;margin:2%; width:90%; text-align: left'  class='col-md-12'>";
		                   html+="<ul style='margin:1%;'>";
		                   html+="<li>";
		                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
		                   html+="<span>";
		                   if(data[i].oqSecretYn=='Y'){
		                	html+="<img src='${path}/resources/images/onedayclass/secret.png' width='27' height='27'>";
		                   }
		                   html+="<span>"+data[i].nickname+"("+data[i].memberId+")</span>";
		                   html+="<span>│"+data[i].oqEnrollDate+"</span>";
		                   html+="<span style='cursor: pointer;' onclick='goCommentEdit(event);'>│수정</span>";
		                   html+="<input type='hidden' value='"+data[i].oqno+"'>";
		                   html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
		                   html+="</span>";
		                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
		                   html+="<span style='padding:auto;'>"+data[i].oqContent+"</span>";
		                   html+="</div>";
		                   //댓글수정
		                   html+="<div style='display:none' id='commentEdit'>";
		                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
		                   html+="<input class='bo-rad-10 sizefull txt10 p-l-20' type='text' value='"+data[i].oqContent+"'>";
		                   html+="<input type='hidden' value='"+data[i].oqno+"'>"
		                   html+="</div>";
		                   html+="<button type='button' class='btn3 flex-c-m' style='margin-bottom:1%;' onclick='endCommentEdit(event)'>수정완료</button>";
		                   html+="</div>";
		                   //
		                   html+="<div class='commentView'>";
		                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
		                   html+="<span class='vieCommentList' style='cursor: pointer;' onclick='goView(event);'>댓글보기</span>";
		                   html+="</div>";
		                   html+="</div>";
		                   html+="<div class='commentInput' style='display:none;'>";
		                   html+="<ul style='margin:1%;'>";
		                   html+="<li>";
		                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
		                   html+="<div class='replyInfo'>";
		                   html+="</div>";
		                   html+="<div style='display: flex;'>";
		                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
		                   html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='강사님! 해당 문의에 대한 답글을 남겨 주세요'>";
		                   html+="&nbsp;&nbsp;";
		                   html+="<button style='width: 100px;cursor: pointer;' onclick='reCommentBtn(event);'>등록</button>";
		                   html+="</div>";
		                   html+="</div>";
		                   html+="</li>";
		                   html+="</ul>";
		                   html+="</div>";
		                   html+="<div class='reCommentList"+data[i].oqno+"'style='display: none;'>";
		                   html+="</div>";
		                   html+="</li>";
		                   html+="</ul>";
		                   html+="</div>";
		                }
		            }else{
		            	html += '<h6><strong>회원님께서 작성한 문의 글이 없습니다</strong></h6>';
		            }
		            $("#commentList").html(html);
				}
			});
		}else{
			getCommentList();
		}
	} 
	
	//후기작성 팝업창 열기
	function goPopup(e){
		var memberId=$(e.target).prev("input").val();
		var odcNo=$(e.target).prev().prev("input").val();
		var gsWin=window.open("${path}/class/pop.do?id="+memberId+"&&no="+odcNo,"winName","width=520,height=730"); //open("주소",띄우는방식,크기)
		console.log(memberId);
		console.log(odcNo);
	}

	//답댓글 보기 창 열어주기
	function goView(e){
		const oqno=$(e.target).prev().val();
		const masterId= $('#masterId').val();
		const memberId= $('#memberId').val();
		$(e.target).parent().parent().next().next("div").slideToggle("fast");
		console.log(oqno);
		$.ajax({
	        type:'get',
	        url : "<c:url value='/class/selectReOdcQaAll.do'/>",
	        data:{
	        	"oqno" : oqno
			}, 
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
				var html = "";
				         
				if(data.length > 0) {
					
					for(i=0; i<data.length; i++){
				      	  
						html+="<ul style='margin:1%;'>";
						html+="<li>";
						html+="<div id='reply_area' class='bo-rad-10 sizefull txt10 p-l-20'>";
						html+="<div id='replyInfo'>";
						if(data[i].memberId=='admin'){
			                   	html+="<span>운영자</span>";
		                   	if(data[i].memberId==memberId){
								html+="<input type='hidden' value='"+data[i].oqrNo+"'>";
				                html+="<span style='cursor: pointer;' onclick='goDeleteReComment(event);'>│삭제</span>";
								}
			            }else{
			                	html+="<span>강사님</span>";
			                	if(data[i].memberId==memberId){
									html+="<input type='hidden' value='"+data[i].oqrNo+"'>";
					                html+="<span style='cursor: pointer;' onclick='goDeleteReComment(event);'>│삭제</span>";
								}else if(memberId=='admin'){
									html+="<input type='hidden' value='"+data[i].oqrNo+"'>";
					                html+="<span style='cursor: pointer;' onclick='goDeleteReComment(event);'>│삭제</span>";
								}
			            }
						html+="<span>│"+data[i].oqrEnrollDate+"</span>";
						html+="</div>";
						html+="<div id='txt_area' class='wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23' style='border: solid gray 1px;'>";
						html+="<p>"+data[i].oqrContetnt+"</p>";
						html+="</div>";
						html+="</div>";
						html+="</li>";
						html+="</ul>";
					}
					
				}else{
					html += '<h6><strong>등록된 댓글이 없습니다</strong></h6>';
				}
					$(".reCommentList"+oqno).html(html);
			}
		});
		
	};
	
	//댓글 입력 창 열어주기
	function goInput(e){
		$(e.target).parent().parent().next("div").slideToggle("fast");
			//$("#commentInput") // 2초에 걸쳐서 진행
	};
	
	//댓글 수정 창 열어주기
	function goCommentEdit(e){
		$(e.target).parent().next().next("div").slideToggle("fast");
	}
	

	//답댓글 데이터 넣어주기
	function reCommentBtn(e){
		//로그인한 회원 아이디
		const memberId= $('#memberId').val();
		const oqno=$(e.target).prev().prev().val();
		//입력값
		const oqrContetnt=$(e.target).prev("input").val();
		const masterId= $('#masterId').val();
		const admin="admin";
		
		console.log(oqrContetnt);
		console.log(memberId);
		console.log(oqno);
		console.log(masterId);
		
		if(memberId == ''){
			alert('로그인 후 이용해주세요');
			return window.location.assign("${path}/member/loginpage");
			return;
		}else if(oqContent == '') {
			alert('내용을 입력하세요');
		}else if(masterId!=memberId&&memberId!=admin){
			alert('해당 클래스 강사님또는 관리자만 답변이 가능합니다');
			return;
		} 
		
		$.ajax({
			type:'post',
			url:'<c:url value="/class/inputReplayOdcQa.do"/>',
			contentType: 'application/json',
			data:JSON.stringify({
					"oqno":oqno,
					"oqrContetnt":oqrContetnt,
					"memberId":memberId
			}), 
			success : function(data){
	          
				alert('댓글을 입력하셨습니다!');
				goView();
	            
	    	},
			error:function(){
				alert('통신실패');
			}
		
		});
	
	};

	
	

	//댓글데이터넣어주기
	$('#Comment_regist').click(function(){
		
		const oqContent=$('#oqContent').val();
		//const oqSecretYn =$('#oqContent').is(":checked");
		const secret=$('#secret').is(":checked");
		var oqSecretYn = (secret == true) ? "Y" : "N";
		const odcNo= $('#odcNo').val();
		const memberId= $('#memberId').val();
		
		console.log(secret);
		console.log(oqContent);
		console.log(oqSecretYn);
		console.log(odcNo);
		console.log(memberId);
		
		
		
		if(memberId == ''){
			alert('로그인 후 이용해주세요');
			return window.location.assign("${path}/member/loginpage");
			return;
		}else if(oqContent == '') {
			alert('내용을 입력하세요');
		}
		
		$.ajax({
			type:'post',
			url:'<c:url value="/class/inputOdcQa.do"/>',
			contentType: 'application/json',
			data:JSON.stringify({
					"odcNo":odcNo,
					"memberId":memberId,
					"oqContent":oqContent,
					"oqSecretYn":oqSecretYn
			}), 
			success : function(data){
	          
	            
				getCommentList();
	               $("#oqContent").val("");
	            
	    	},
			error:function(){
				alert('통신실패');
			}
		
		})
	});


	//리뷰가져오기
	function getReviewList(){
		const odcNo= $('#odcNo').val();
		const memberId=$('#memberId').val();
		$.ajax({
			type:'get',
			url : "<c:url value='/class/selectReview.do'/>",
			data:{
			"odcNo" : odcNo
			}, 
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				
				var html = "";
				if(data.length > 0){
					for(i=0; i<data.length; i++){
						html+="<div style='border-bottom:solid #D3D3D3 1px;'>";
						html+="<br>";
						html+="<div class='col-md-12' style='display: flex;'>";
						html+="<span>";
						html+="<span>"+data[i].nickname+"("+data[i].memberId+")</span>";
						html+="<span>│"+data[i].oreDate+"</span>";
						html+="<input type='hidden' value="+data[i].odcreNo+" id='odcreNo'>"
						if(memberId==data[i].memberId||memberId=='admin'){
							html+="<span style='cursor: pointer;' onclick='goModifyReview(event);'>│수정</span>";
						}
						html+="</div>";
						html+="<div class='col-md-12'style='display:flex; margin-left: -1.5%;'>";
						if(data[i].oreGood=='Y'){
							html+="<div style='border-radius: 10px; border: solid #898585 1px; margin: 1%;'> &nbsp;추천해요👍&nbsp; </div>";
						}
						if(data[i].oreSame=='Y'){
							html+="<div style='border-radius: 10px; border: solid #898585 1px;margin: 1%'> &nbsp;실제 수업은 클래스 소개와 동일한 방식으로 진행됐어요😊 </div>";
						}
						html+="</div>";
						html+="<div class='col-md-12' style='display: flex;'>";
						html+="<img src='${path}/resources/images/onedayclass/"+data[i].orePic+"' width='100' height='100' class='rimg' style='margin: 1%; transition: all 0.3s linear;'>";
						html+="<span>"+data[i].oreContent+"</span>";
						html+="</div>";
						html+="</div>";
					}
				}else{
					html += '<h6><strong>등록된 후기가 없습니다</strong></h6>';
				}
				$(".reviewList").html(html);
			}	
		});
	}

	//리뷰수정하기
/* 	function goModifyReview(e){
		var gsWin=window.open("","winName","width=520,height=730"); //open("주소",띄우는방식,크기)
		var frm=$(e.target).prev()[0];
		var no = $("#odcreNo").val();
		console.log(no);
		frm.action="${path}/class/goModifyReview.do?no="+no;
		frm.target="winName";
        frm.submit();
	} */
	//리뷰 수정하는 팝업창 만들기
	function goModifyReview(e){
		var no = $(e.target).prev().val();
		console.log(no);
		var gsWin=window.open("${path}/class/goModifyReview.do?no="+no,"winName","width=520,height=730"); //open("주소",띄우는방식,크기)
	}
	
	//댓글 삭제
	function goDeleteComment(e){
		var oqno = $(e.target).prev().val();
		console.log(oqno);
		$.ajax({
	        type:'get',
	        url : "<c:url value='/class/deleteOdcQa.do'/>",
	        data:{
	        	"oqno" : oqno
			}, 
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	alert('삭제됐습니다');
	        	getCommentList();
	        }
		});
	}
	//답댓글 삭제
	function goDeleteReComment(e){
		var oqrNo = $(e.target).prev().val();
		console.log(oqrNo);
		$.ajax({
	        type:'get',
	        url : "<c:url value='/class/deleteReOdcQa.do'/>",
	        data:{
	        	"oqrNo" : oqrNo
			}, 
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	        	alert('삭제됐습니다');
	        	getCommentList();
	        }
		});
	}
	
	//댓글가져오기
	function getCommentList(){
		const memberId= $('#memberId').val();
		const odcNo= $('#odcNo').val();
		const masterId= $('#masterId').val();
	    $.ajax({
	        type:'get',
	        url : "<c:url value='/class/selectOdcQaAll.do'/>",
	        data:{
	        	"odcNo" : odcNo
			}, 
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
	            var html = "";
	            
	            if(data.length > 0){
	                
	                for(i=0; i<data.length; i++){
	                    // 댓글 div
	                   html+="<div style='border-bottom: solid 1px gray;margin:2%; width:90%; text-align: left'  class='col-md-12'>";
	                   html+="<ul style='margin:1%;'>";
	                   
	                   //비밀글 일때
	                   if(data[i].oqSecretYn=='Y'){
	                	 if(memberId=='admin'||memberId==masterId||memberId==data[i].memberId){
		                	   html+="<li>";
			                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
			                   html+="<span>";
			                   html+="<img src='${path}/resources/images/onedayclass/secret.png' width='27' height='27'>";
			                   html+="<span>│</span>";
			                   html+="<span>"+data[i].nickname+"("+data[i].memberId+")</span>";
			                   html+="<span>│"+data[i].oqEnrollDate+"</span>";
			                   if(memberId==data[i].memberId){
			                   html+="<span style='cursor: pointer;' onclick='goCommentEdit(event);'>│수정</span>";
			                   html+="<input type='hidden' value='"+data[i].oqno+"'>";
			                   html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
			                   }
			                   if(memberId=='admin'){
			                	   html+="<input type='hidden' value='"+data[i].oqno+"'>";
				                   html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
			                   }
			                   html+="</span>";
			                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
			                   html+="<span style='padding:auto;'>"+data[i].oqContent+"</span>";
			                   html+="</div>";
			                   //댓글수정
			                   html+="<div style='display:none' id='commentEdit'>";
			                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
			                   html+="<input class='bo-rad-10 sizefull txt10 p-l-20' type='text' value='"+data[i].oqContent+"'>";
			                   html+="<input type='hidden' value='"+data[i].oqno+"'>"
			                   html+="</div>";
			                   html+="<button type='button' class='btn3 flex-c-m' style='margin-bottom:1%;' onclick='endCommentEdit(event)'>수정완료</button>";
			                   html+="</div>";
			                   //
			                   html+="<div class='commentView'>";
			                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
			                   html+="<span class='vieCommentList' style='cursor: pointer;' onclick='goView(event);'>댓글보기</span>";
			                   if(memberId!=''){
			                   html+="<span class='enrollCommentInput' style='cursor: pointer;' onclick='goInput(event);'>│댓글쓰기</span>";
			                   }
			                   html+="</div>";
			                   html+="</div>";
			                   html+="<div class='commentInput' style='display:none;'>";
			                   html+="<ul style='margin:1%;'>";
			                   html+="<li>";
			                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
			                   html+="<div class='replyInfo'>";
			                   html+="</div>";
			                   html+="<div style='display: flex;'>";
			                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
			                   if(memberId=='admin'){
				                   	html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='관리자님! 해당 문의에 대한 답글을 남겨 주세요'>";
				                   }else{
				                	html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='강사님! 해당 문의에 대한 답글을 남겨 주세요'>";
				                   }
			                   html+="&nbsp;&nbsp;";
			                   html+="<button style='width: 100px;cursor: pointer;' onclick='reCommentBtn(event);'>등록</button>";
			                   html+="</div>";
			                   html+="</div>";
			                   html+="</li>";
			                   html+="</ul>";
			                   html+="</div>";
			                   html+="<div class='reCommentList"+data[i].oqno+"'style='display: none;'>";
			                   html+="</div>";
			                   html+="</li>";
			           
	                	 }else{
			                	   html+="<li>";
				                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
				                   html+="<b>비밀글입니다</b>"
				                   html+="</div>";
				                   html+="</li>";
			              }
			                   html+="</ul>";
			                   html+="</div>";
			            //비밀글이 아닐때
	                   }else{
	                   html+="<li>";
	                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
	                   html+="<span>";
	                   html+="<span>"+data[i].nickname+"("+data[i].memberId+")</span>";
	                   html+="<span>│"+data[i].oqEnrollDate+"</span>";
	                   if(memberId==data[i].memberId){
		                   html+="<span style='cursor: pointer;' onclick='goCommentEdit(event);'>│수정</span>";
		                   html+="<input type='hidden' value='"+data[i].oqno+"'>"
		                   html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
	                   }
	                   if(memberId=='admin'){
	                	   html+="<input type='hidden' value='"+data[i].oqno+"'>"
		                   html+="<span style='cursor: pointer;' onclick='goDeleteComment(event);'>│삭제</span>";
	                   }
	                   html+="</span>";
	                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
	                   html+="<span style='padding:auto;'>"+data[i].oqContent+"</span>";
	                   html+="</div>";
	                   //댓글수정
	                   html+="<div style='display:none' id='commentEdit'>";
	                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
	                   html+="<input class='bo-rad-10 sizefull txt10 p-l-20' type='text' value='"+data[i].oqContent+"'>";
	                   html+="<input type='hidden' value='"+data[i].oqno+"'>"
	                   html+="</div>";
	                   html+="<button type='button' class='btn3 flex-c-m' style='margin-bottom:1%;' onclick='endCommentEdit(event)'>수정완료</button>";
	                   html+="</div>";
	                   //
	                   html+="<div class='commentView'>";
	                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
	                   html+="<span class='vieCommentList' style='cursor: pointer;' onclick='goView(event);'>댓글보기</span>";
	                   if(memberId!=''){
	                   html+="<span class='enrollCommentInput' style='cursor: pointer;' onclick='goInput(event);'>│댓글쓰기</span>";
	                   }
	                   html+="</div>";
	                   html+="</div>";
	                   html+="<div class='commentInput' style='display:none;'>";
	                   html+="<ul style='margin:1%;'>";
	                   html+="<li>";
	                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
	                   html+="<div class='replyInfo'>";
	                   html+="</div>";
	                   html+="<div style='display: flex;'>";
	                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
	                   if(memberId=='admin'){
		                   	html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='관리자님! 해당 문의에 대한 답글을 남겨 주세요'>";
		                   }else{
		                	html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='강사님! 해당 문의에 대한 답글을 남겨 주세요'>";
		                   }
	                   html+="&nbsp;&nbsp;";
	                   html+="<button style='width: 100px;cursor: pointer;' onclick='reCommentBtn(event);'>등록</button>";
	                   html+="</div>";
	                   html+="</div>";
	                   html+="</li>";
	                   html+="</ul>";
	                   html+="</div>";
	                   //답댑글
	                   html+="<div class='reCommentList"+data[i].oqno+"'style='display: none;'>";
	                   
	                   html+="</div>";
	                   html+="</li>";
	                   }
	                   html+="</ul>";
	                   html+="</div>";
	                }
	             // 댓글이 없을때
	            }else {
	            
	                html += '<h6><strong>등록된 댓글이 없습니다</strong></h6>';
	               
	            }
	            
	            $("#commentList").html(html);
	            
	        },
	        
	        error:function(){
	        	alert('통신실패');
	       }
	        
	    });
	}
	
	function endCommentEdit(e){
		const oqContent=$(e.target).prev().children().first().val();
		console.log(oqContent);
		const oqno=$(e.target).prev().children().last().val();
		console.log(oqno);
		$.ajax({
			type:'post',
			url:'<c:url value="/class/inputOdcQa.do"/>',
			contentType: 'application/json',
			data:JSON.stringify({
					"oqno":oqno,
					"oqContent":oqContent
			}), 
			success : function(data){
				getCommentList();
	               $("#oqContent").val("");
	    	},
			error:function(){
				alert('통신실패');
			}
		});

	}
</script>

				<!-- 사이드 달력 -->
				<div class="col-md-4 col-lg-3" style="width: 30%; height: 100%;">
					<div>
						<div style="text-align: center;" id="calender">
							<h3>클래스일정</h3>
							<p>원하는 날짜를 선택해주세요</p>
							<input type="text" id="testDatepicker" style="border: #111111 solid 2px;" placeholder="클릭해서 가능한 날짜 보기" onchange="onchanged();">
							<input type="hidden" id="ddd" value="<fmt:formatDate value='${odc.odcEndDate }' pattern='yyyy-MM-dd'/>">
							<button type="submit" class="btn3" id="search">
								날짜확정
							</button>	
							
						<!-- datepicker 스크립트  -->
							<script>
								$(function(){
									const endDate=$("#ddd").val();
									$("#testDatepicker").datepicker({
										  dateFormat: 'yy-mm-dd',
										  minDate: 0,
										  maxDate: endDate
										});	
								})
								
								function onchanged(){
									const odcNo= $('#odcNo').val();
									const reDate=$("#testDatepicker").val();
									const odcPerson=${odc.odcPeople};
									console.log(odcPerson);
									$.ajax({
								        type:'get',
								        url : "<c:url value='/class/countPerson.do'/>",
								        data:{
								        	"reDate" : reDate,
								        	"odcNo" : odcNo
										}, 
								        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
								        success : function(data){
								        	if(odcPerson==data){
								        		$("#testDatepicker").val('');
								        		alert('선택하신 날짜는 예약 가능한 인원수를 모두 채워져 예약 마감됐습니다')
								        		$("#searchbox").slideUp("fast");
								        		return;
								        	}else{
								        		const cPerson=data;
									        	$("#person").text(cPerson);
									        	$("#datepic").text(reDate);
									        	$("input[name=odcDate]").val(reDate);
								        	};
								        },
										error:function(){
						        		alert('통신실패');
						      			}
									});
								}
							</script> 
							
							
							<div style=" width: 310px; height: 350px; display: none; text-align: left;color:black; background-image: url('${path}/resources/images/onedayclass/bk2.jpg')" id="searchbox">
									<br>
									<br>
									<br>
									<br>
									<h4 id="datepic"></h4>
									<input type="hidden" name="odcDate" id="odcDate" value="">
									<input type="hidden" name="memberId" value="${loginMember.memberId }">
									<input type="hidden" name="odcNo" value="${odc.odcNo} ">
									
									<b style="color:black">하루에 ${odc.odcPeople }명까지 신청이 가능한 수업입니다.</b><br>
									<b>현재 <b id="person" style="color:purple"></b> 명이 신청했습니다 </b><br><br>
									<b>수업 시작 시간 : ${odc.odcStartTime }</b><br>
									<b>예약 금액(1인) : ${odc.odcPrice} 원</b><br>
									<br>
									<b>예약 후 재료준비로 인해 취소 및 환불이 불가능 합니다.</p><br>
									<label>
									<input type="checkbox" id="agree">
									동의
									</label>
									
									<br>
									<button type="button" class="btn3" onclick="requestPay();">
										결제하기
									</button>
								<script type="text/javascript">
								function requestPay() {
									const cnk=$("#agree");
									if($('#agree').is(":checked")){
										IMP.init("imp47717061"); //가맹점 식별코드
										IMP.request_pay({
											 	pg : 'tosspay',
											    pay_method : 'card',
											    merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 생성한 고유 주문번호
											    name : '주문명:결제테스트',   //필수 파라미터 입니다.
											    amount : 1004,
											    buyer_email : "${loginMember.email}",
											    buyer_name : "${loginMember.mname}",
											    buyer_tel : "${loginMember.phone}",
											    buyer_addr : "${loginMember.address}",
										}, function (rsp) { // callback
											if (rsp.success) {
												// 결제 성공 시 로직
												const odcNo= $('#odcNo').val();
												const odcDate1= $('#odcDate').val();
												const memberId= $('#memberId').val();
												
													$.ajax({
														type:'get',
														url:"${path}/class/inputReservation.do",
														data:{
													        	"odcDate1" : odcDate1,
													        	"memberId" : memberId,
													        	"odcNo":odcNo
															}, 
													    contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
														success:data=>{
																alert('결제되었습니다.');
														}
													})
												} 
											});
										
									}else{
										alert('동의에 체크해야 결제가 진행됩니다');
										return;
									}
								};
								
								</script>
								
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<style>
	mark{
	  display: inline-block;
	  line-height: 0em;
	  padding-bottom: 0.5em;
	  background-color:#B1DD9e;
	}
	/* 전체 배치 */
	* {
		margin: 0px; 
		padding: 0px; 
		box-sizing: border-box;
	}
	/* 전체 글씨체 */
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	div>*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	/* 버튼 속 글씨 정중앙 정렬 */
	.flex-c-m {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	/* 효과 천천히 */
	.trans-0-4 {
		-webkit-transition: all 0.4s;
		-o-transition: all 0.4s;
		-moz-transition: all 0.4s;
		transition: all 0.4s;
	}
	
	/* input 효과 */
	.bo2 {border: 2px solid #d9d9d9;}
	.bo-rad-10 {border-radius: 10px;} 
	input {
		outline: none;
		border: none
	}

	.sizefull {
		width: 100%;
		height: 100%;
	}

	/* input 크기 및 정렬 */
	.size22 {
		max-width: 870px;
	}
	
	.size12 {
		width: 100%;
		height: 50px;
	}
	.m-b-23 {
			margin-bottom: 23px;
		}
	.m-t-3 {
		margin-top: 3px;
	}
	.p-l-20 {padding-left: 20px;}
	.m-l-r-auto {margin-left: auto;	margin-right: auto;}

	/* (사진)확대 효과 */
	.zoom {
		display: block;
		
	}

	.zoom img{
		width: 90%;
		-webkit-transition: all 0.6s;
		-o-transition: all 0.6s;
		-moz-transition: all 0.6s;
		transition: all 0.6s;
	}

	.zoom:hover img {
		-webkit-transform: scale(1.1);
		-moz-transform: scale(1.1);
		-ms-transform: scale(1.1);
		-o-transform: scale(1.1);
		transform: scale(1.1);
	}
	

	/* 버튼 효과 */
	.btn3 {
		background: #111111;
		border-radius: 10px;
		color: white;
		width: 120px;
		height: 40px;
	}
	.btn3:hover {
		background-color: #2E8B57;
		color: white;
		width: 120px;
		height: 40px;
		border: none;
	}
	textarea:focus, input:focus {
		border-color: transparent !important;
		box-shadow: 0 0 0px 2px #2E8B57;
		-moz-box-shadow: 0 0 0px 2px #2E8B57;
		-webkit-box-shadow: 0 0 0px 2px #2E8B57;
		-o-box-shadow: 0 0 0px 2px #2E8B57;
		-ms-box-shadow: 0 0 0px 2px #2E8B57;
	}
	.bg-title-page {
		width: 100%;
		min-height: 545px;
		padding-left: 15px;
		padding-right: 15px;
		background-repeat: no-repeat;
		background-position: center 0;
		background-size: cover;
	}

	@media (max-width: 576px) {
	.bg-title-page .tit6 {font-size: 30px;}
	}
	.tit6 {
		font-family: Poppins;
		font-weight: 700;
		font-size: 50px;
		line-height: 1.2;
		color: white;
		text-transform: uppercase;
		letter-spacing: 6px;
		word-spacing: 6px;
	}

	.t-center{
		text-align: center;
	}
	/* 배치 */
	*, ::after, ::before {
    box-sizing: inherit;
	}
	.bo5-b {
    border-bottom: 1px solid #e6e6e6;
	}
	.p-b-17 {
		padding-bottom: 17px;
	}
	.p-t-17 {
		padding-top: 17px;
	}
	.container {
    margin-right: auto;
    margin-left: auto;
    padding-right: 15px;
    padding-left: 15px;
    width: 100%;
	}
	/* 달력 */
	.fix1{
		position: fixed;	
		z-index: 0;
		right: -1;
		-webkit-transform: translateY(0%);
		transform: translateY(-165%);
	}
	.fix2{		
			position: sticky !important;
			top:80px !important;
			height: 80px !important; 
			width: 100% !important;
			background-color: white !important;
			z-index: 400 !important;
			box-shadow: 0px 5px 5px -5px gray;
	}
	li {
        list-style-image: url(${path}/resources/images/send-comment.png) weith:10px height:10px;
    }
    .rimg:hover{
		transform: scale(2.5);
	}
	a{
		text-decoration: none !important;
		color : #2E8B57;
	}
</style>
</html>