<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
	<section style="text-align: center;">
		<div class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15 banner">
			<div class="tit6">
				<p>S U B S C R I P T I O N</p>
			</div>
		</div>
		<style>
			.banner{
				background-image: url(${path}/resources/images/banner-sub.jpg);
				height: 545px;
				width: 100%;
			}
			.tit6{
				padding: 250px;
			}
			.tit6>p{
				margin: 0 auto; 
				width: fit-content;
				font-family: 'Secular One';
				font-weight: bolder;
				color: black;
				font-size: 50px;
				cursor: pointer;
			}
		</style>
		
		<div class="sub-contents">
			<h2><b>정기 구독</b></h2><br>
			<p>
				정기 구독 서비스를 신청하시면 한 달에 2번씩 배송을 해드립니다.
				<br>현재 구독 서비스는 우유, 샐러드, 도시락을 대상으로 운영되고 있습니다.
				<br>배송일은 <b>매월 첫째주와 셋째주 월요일</b>이며, 결제일은 <b>매월 25일</b>입니다.
			</p>
			<div id="adList">
				<p><b><sub>✓</sub> 최근 생산 상품을 바로 받을 수 있는 기회</b></p>
				<p><b><sub>✓</sub> 배송비 없이 저렴하게 얻을 수 있는 기회</b></p>
				<p><b><sub>✓</sub> 취향에 맞는 상품을 쉽게 받을 수 있는 기회</b></p>
			</div>
			<p id="red"><b><u><i>이 기회를 얻고 싶다면 지금 바로 신청하세요!</i></u></b></p>
			<br>
			<div class="items">
				<img src="${path}/resources/images/subscription/우유.png">
				<img src="${path}/resources/images/subscription/계란.png">
				<img src="${path}/resources/images/subscription/사과.png">
			</div>
			<br>
			<div class="items names">
			    <p>우유</p>
			    <p>계란</p>
			    <p>과일</p>
			</div>
			<div class="items price">
				<div><p>월 5000원</p></div>
				<div><p>월 15000원</p></div>
				<div><p>월 12000원</p></div>
			</div>
			<br>
			<div class="items goods">
				<div>
					<ul>
						<li>ㆍ일반 우유</li>
						<li>ㆍ저지방 우유</li>
						<li>ㆍ무유당 우유</li>
						<li>&nbsp&nbsp중 택 1</li>
					</ul>
				</div>
				<div>
					<ul>
						<li>ㆍ특란</li>
						<li>ㆍ유정란</li>
						<li>ㆍ흰색 계란</li>
						<li>&nbsp&nbsp중 택 1</li>
					</ul>
				</div>
				<div>
					<ul>
						<li>ㆍ사과</li>
						<li>ㆍ포도</li>
						<li>ㆍ바나나</li>
						<li>&nbsp&nbsp중 택 1</li>
					</ul>
				</div>
			</div>
			<br>
			<button id="apply" class="customBtn btnStyle" onclick="openApply();">신청하기</button>
		</div>
	</section>
	<style>
		.sub-contents{
			margin-top:50px;
		}
		.sub-contents *{
			font-family: 'Gowun Dodum';
			color:black;
		}
		#red *{
			color : #2E8B57 !important;
		}
		#adList{
			text-align: center;
		}
		#adList sub{
			font-size:30px;
		}
		.items{
			justify-content: center;
			display: flex;
		}
		.items>*{
			margin-left: 20px;
			margin-right: 20px;
			border-radius: 10px;
		}
		.items>img{
			width: 200px;
			height: 256px;
		}
		.names>*{
			padding-left: 80px;
			padding-right: 80px;
		}
		.items p{
			font-weight: bold;
			font-size: 20px;
		}
		.items ul{
			margin-top: 10px;
		}
		.price>div{
			border: 1px solid;
			width: 200px;
			height: 60px;
		}
		.price p{
			margin-top: 15px;
		}
		.goods>div{
			border: 1px solid;
			width: 200px;
			height: 115px;
		}
		.goods li{
			list-style: none;
		}
		#apply{
			border-radius: 10px;
		}
		
		.customBtn {
			color: #fff;
			border-radius: 5px;
			padding: 10px 25px;
			font-weight: 500;
			background: transparent;
			cursor: pointer;
			transition: all 0.3s ease;
			position: relative;
			display: inline-block;
			box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
			7px 7px 20px 0px rgba(0,0,0,.1),
			4px 4px 5px 0px rgba(0,0,0,.1);
			outline: none;
			width: 130px;
		}
		.btnStyle {
			line-height: 40px;
			padding: 0;
			border: none;
			background: #2E8B57;
			background: linear-gradient(0deg, #B1DD9e 0%, #B1DD9e 100%);
		}
		.btnStyle:hover {
			color: #2E8B57;
			background: transparent;
			box-shadow:none;
		}
		.btnStyle:before,.btnStyle:after{
			content:'';
			position:absolute;
			top:0;
			right:0;
			height:2px;
			width:0;
			background: #B1DD9e;
			box-shadow:
			-1px -1px 5px 0px #fff,
			7px 7px 20px 0px #0003,
			4px 4px 5px 0px #0002;
			transition:400ms ease all;
		}
		.btnStyle:after{
			right:inherit;
			top:inherit;
			left:0;
			bottom:0;
		}
		.btnStyle:hover:before,.btnStyle:hover:after{
			width:100%;
			transition:800ms ease all;
		}
	</style>
	<script>
		const openApply=()=>{
			if("${loginMember}"!=""){
				//팝업창을 화면 가운데에 위치시키기 위해 화면의 크기로 위치 구함
				let popupX=(window.screen.width/2)-250;
				let popupY=(window.screen.height/2)-350;
				open("${path}/subscription/subApply", "_blank", "width=500px, height=600px, left="+popupX+", top="+popupY);
			}else{
				alert("로그인을 해야만 이용할 수 있는 서비스입니다.");
			}
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>