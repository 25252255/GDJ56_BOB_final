<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
    <section>
        <div class="side-menu">
            <div>공지사항</div>
            <div>1:1 문의</div>
        </div>
        <div class="board">
            <h1 id="main-title">공지사항</h1>
            <form action="${path}/center/noticeListSearch" class="search-form">
                <select name="option" class="form-select">
                    <option value="notice_title">제목</option>
                    <option value="notice_content">내용</option>
                </select>
                <input class="search" name="optionVal" type="text" placeholder="search">
                <button id="search-btn" class="customBtn btnStyle" type="submit">검색</button>
            </form>
            <table class="list-table" style="text-align: center;margin: 20px;">
                <thead>
                    <tr>
                        <th class="nos">번호</th>
                        <th class="titles">제목</th>
                        <th class="dates">작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${empty list}">
	                	<tr class="tr">
	                		<td colspan="3">등록된 글이 없습니다.</td>
	                	</tr>
	                </c:if>
                	<c:if test="${not empty list}">
		                <c:forEach var="nl" items="${list}">
		                    <tr class="tr">
		                        <td class="nos">${nl.noticeNo}</td>
		                        <td class="titles"><a href="${path}/center/noticeView?noticeNo=${nl.noticeNo}">${nl.noticeTitle}</a></td>
		                        <td class="dates">${nl.noticeDate}</td>
		                    </tr>
		                </c:forEach>
		            </c:if>
                </tbody>
            </table>
            <c:if test="${loginMember.memberId eq 'admin'}">
            	<button type="button" id="write-btn" class="customBtn btnStyle" onclick="writeBoard();">글쓰기</button>
            </c:if>
            <div class="page-bar">
	        	${pageBar}
            </div>
        </div>
    </section>
    <style>
        section{
            display: flex;
            margin-top: 50px;
        }
        section>*{
            margin: 0 auto;
        }
        section *{
            font-family: 'Gowun Dodum';
        }
        .side-menu{
            margin-top: 20px;
            width: 18%;
        }
        .side-menu>div{
            border: 0px solid black;
            border-radius: 20px;
            height: 70px;
            text-align: center;
            color: white;
            font-size: 20px;
            line-height: 70px;
            margin: 10px;
            cursor: pointer;
            background-color: #C290DE;
			box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
			7px 7px 20px 0px rgba(0,0,0,.1),
			4px 4px 5px 0px rgba(0,0,0,.1);
        }
        .board{
            width: 75%;
            height: 600px;
            border: 1px solid black;
            border-radius: 10px;
        }
        #main-title{
            text-align: center;
            margin-top: 30px;
            font-size: 35px;
        }
        .list-table{
            border-collapse: collapse;
            margin: 0 auto !important;
            margin-top: 20px !important;
            margin-bottom: 20px !important;
        }
        .list-table th, td{
            border-bottom: 1px solid gray;
            height: 50px;
        }
        .search-form{
            text-align: right;
            margin-right: 30px;
        }
        .search-form select{
            height: 35px;
        }
        .search-form>.search{
            height: 35px;
        }
        #search-btn{
            width: 70px;
            height: auto;
        }
        .nos{
            width: 120px;
        }
        .titles{
            width: 750px;
        }
        .dates{
            width: 200px;
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            color: gray;
        }
        #write-btn{
            margin-left: 30px;
            width: 100px;
            height: auto;
        }
        .page-bar{
            text-align: center;
        }
        .product__pagination>a{
        	cursor: pointer;
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
			background: #7B52AE;
			background: linear-gradient(0deg, #7B52AE 0%, #7B52AE 100%);
		}
		.btnStyle:hover {
			color: #7B52AE;
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
			background: #7B52AE;
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
		.product__pagination a:hover {
		   background: #7B52AE;
		   border-color: #7B52AE;
		   color: #ffffff;
		}
    </style>
   	<script>
		//사이드 메뉴 누르면 페이지 이동
		$(".side-menu>div:eq(0)").click(e=>{
			location.assign("${path}/center/noticeList");
		})
		$(".side-menu>div:eq(1)").click(e=>{
			location.assign("${path}/center/clientQnaList");
		})
		
		//처음에는 1페이지 버튼 색이 칠해져 있음
		$(".product__pagination>*:nth-child(2)").css("background", "#7B52AE").css("color", "#ffffff");
   		
		//ajax를 이용한 페이징 처리
		//$(".product__pagination>*").click(e=>{
		//위의 방식을 쓰면 동적 페이지로 바뀐 후에 안 먹히므로 아래의 방식을 써야 함
		$(document).on("click", ".product__pagination>*", function(e){ //페이지 버튼을 누르면
			let cPage=0; //페이지 번호
			if(e.target.textContent.trim()=='<'){
				cPage=Number(document.querySelector(".product__pagination>*:nth-child(2)").textContent)-1;
				if(cPage==0) return false; //0페이지면 아무것도 실행되지 않음
				numChange(cPage, 1);
			}else if(e.target.textContent.trim()=='>'){
				cPage=Number(document.querySelector(".product__pagination>*:nth-last-child(2)").textContent)+1;
				if(cPage>${totalPage}) return false; //총 페이지 수보다 큰 수의 페이지는 넘어갈 수 없음
				numChange(cPage, 2);
			}else{
				cPage=e.target.textContent; //클릭한 버튼의 숫자
			}
			console.log(cPage);
			
			//버튼의 숫자가 현재 페이지면 색깔 칠해짐
			$(".product__pagination>*").css("background", "initial").css("color", "#b2b2b2"); //버튼 색깔 초기화
			$(e.target).css("background", "#7B52AE").css("color", "#ffffff"); //클릭한 버튼만 색칠함
			
			let option='N'; //검색 항목
			let optionVal='N'; //검색 내용
			if("${option}"!="") option="${option}";
			if("${optionVal}"!="") optionVal="${optionVal}";
			
			let args=[cPage, option, optionVal];
			$.ajax({
				url:"${path}/center/noticeListPage",
				data:{args:args},
				success:data=>{
					//테이블을 새로 생성
					let content="<thead>";
					content+="<tr>";
					content+="<th class='nos'>번호</th>";
					content+="<th class='titles'>제목</th>";
					content+="<th class='dates'>작성일</th>";
					content+="</tr>";
					content+="</thead>";
					content+="<tbody>";
					//출력할 내용
					data.forEach(function(nt){
						content+="<tr class='tr'>";
						content+="<td class='nos' style='width: 120px !important;'>"+nt.noticeNo+"</td>";
						content+="<td class='titles' style='width: 750px !important;'><a href='${path}/center/noticeView?noticeNo="+nt.noticeNo+"'>"+nt.noticeTitle+"</a></td>";
						content+="<td class='dates' style='width: 200px !important;'>"+nt.noticeDate+"</td>";
						content+="</tr>";
					})
					content+="</tbody>";
					//생성한 테이블로 교체함
					$(".list-table").html(content);
				}
			})
		})
		
		//'<' 또는 '>'를 누르면 페이지바가 바뀌게 함
		const numChange=(cPage, arrow)=>{
			$.ajax({
				url:"${path}/center/numChange",
				data:{cPage:cPage},
				success:data=>{
					$(".page-bar").html(data);
					if(arrow==1){ //'<' 버튼이면 맨 뒷 번호 버튼이 색칠됨
						$(".product__pagination>*:nth-child(4)").css("background", "#7B52AE").css("color", "#ffffff");
					}else if(arrow==2){ //'>' 버튼이면 맨 앞 번호 버튼이 색칠됨
						$(".product__pagination>*:nth-child(2)").css("background", "#7B52AE").css("color", "#ffffff");
					}
				}
			})
		}
		
		//글쓰기
		const writeBoard=()=>{
			location.assign("${path}/center/noticeWrite");	
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>