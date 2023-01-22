<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script>console.log("${path }");</script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>베스트</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="${path }/resources/pato/images/icons/favicon.png" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<!--===============================================================================================-->
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/slick/slick.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/lightbox2/css/lightbox.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/css/util.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/css/main.css">
</head>

<body class="animsition">
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-color: #E2DDD3;">
	<h2 class="tit6 t-center" style="font-family: ChosunSm;">
		오 늘 의 밥&nbsp B&nbsp&nbsp&nbspE&nbsp&nbsp&nbspS&nbsp&nbsp&nbspT
		<br><br><p>오늘의 밥 누적판매 TOP100</p>
	</h2>
</section>
<!-- best_item -->
<section id="best_item">
<div class="section-gallery p-t-118 p-b-100 section-best-item">
	<div class="wrap-label-gallery filter-tope-group size27 flex-w flex-sb-m m-l-r-auto flex-col-c-sm p-l-15 p-r-15 m-b-60">
		<div class="tab">
			<ul>
				<li style="font-family: ChosunSm;">가격대별 베스트</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light">~3만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light">~5만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light">~7만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light">~10만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light">10만원~</button>
				</li>
			</ul>
		</div>
	</div>



	<section class="recipe-section spad section-best-item">
		<div class="container">
			<p>총 20건</p>
			<div class="row">
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="wrap-pic-delicious size2 bo-rad-10 hov-img-zoom m-l-r-auto">
							<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="330" height="280"></a>
						</div>
						<div class="ri-text">
							<div class="cat-name">과일</div>
							<a href="#">
								<h4>사과</h4>
								<p>달달 꿀사과</p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5>8,800</h5><h5>원</h5>
								</div>
								<div>
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="pagination flex-l-m flex-w m-l--6 p-t-25">
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">prev</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">1</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">2</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">3</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">next</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>


<div class="floating">
	<div>챗봇위치</div>
	<div>최근본상품위치</div>
	<div><button type="button" onclick="toHTMLTop()">위로가기위치</button></div>
</div>
</section>
<script>
	const fn_pageBtn = (e)=>{
		$(".item-pagination").removeClass("active-pagination");
		$(e.target).addClass("active-pagination");
	}
	function toHTMLTop() {
        $('html').scrollTop(0);
    }
</script>
<style>
	/* .마켓헤더 */
    .marketHeader {
        position: sticky;
        z-index: 100;
        top: 100px;
        background: rgba(137, 43, 226, 0.167);
    }

    /* 마켓헤더./ */
    /* /.챗봇최근본상품위로가기 */
    .floating {
        background-color: #f9f9f9;
        border: 2px solid #dddddd;
        position: fixed;
        right: 36%;
        top: 380px;
        margin-right: -500px;
        text-align: center;
        height: 350px;
        width: 70px;
        border-radius: 30px;
        /* -webkit-border-radius: 8px;
    position: absolute;
        width: 70px;
        height: 350px;
        right: 50px;
        border-radius: 70px;
        top: 250px;
        border: 1px solid #dddddd; */
    }

    .floating div:nth-child(1) {
        border: 1px solid blueviolet;
        border-radius: 100%;
        height: 70px;
    }

    .floating div:nth-child(2) {
        border: 1px solid blueviolet;
        border-radius: 8px;
        height: 278px;
    }

    .floating div:nth-child(3) button {
        border: 1px solid blueviolet;
        border-radius: 100%;
        height: 70px;
    }
    /* 챗봇최근본상품위로가기./ */

	a:hover {
			color: yellowgreen;
		}
	button[type=submit] {
		background: rgb(187, 219, 124);
	}
	button[type=submit]:hover {
		background: rgb(92, 121, 34);
	}
	
	.cat-name {
		color: #fff;
		background: #cfe1b9;
		display: inline-block;
		font-size: 12px;
		font-weight: 700;
		text-transform: uppercase;
		padding: 4px 25px 4px 25px;

	}

	.ri-text>* {
		font-family: "경기천년제목";
	}

	@font-face {
		font-family: 'ChosunSm';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.1/ChosunSm.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	.section-best-item {
		/* 오늘의밥BEST */
		width: 90%;
		display: flex;
		list-style-type: none;
		flex-direction: row;
		align-items: center;
	}


	/* tab 시작 */
	#best_item .tab {
		/* background: #9f2525; */
		/* background: url(./images/b1.PNG)no-repeat 10%; */
		/* opacity: 0.5; */
		border-bottom: 0;
		float: left;
		width: 320px;
		padding: 30px;
		margin: 20px;
		height: 1300px
	}

	#best_item .tab li {
		padding: 10px 5px;
		margin: 20px;
		text-align: center;
		font-size: 30px;
	}

	#best_item .tab li button {

		font-size: 18px;
	}


	#best_item_div {

		width: 100px;
		margin-left: auto;
		margin-right: auto;

	}

	.best_item_img {
		display: flex;
		align-items: center;
		justify-content: space-evenly;

	}
</style>



<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${path }/resources/pato/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="${path }/resources/pato/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="${path }/resources/pato/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/parallax100/parallax100.js"></script>
<script type="text/javascript">
	$('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="${path }/resources/pato/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/pato/js/main.js"></script>

</body>

</html>