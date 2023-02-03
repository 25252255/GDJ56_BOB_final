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
            <table class="outline">
                <tr id="fix-title-tr">
                    <td class="line-title">제목</td>
                    <td class="line-content headline">${n.noticeTitle}</td>
                </tr>
                <tr id="input-title-tr">
                    <td class="line-title">제목</td>
                    <td class="line-content headline"><input type="text" id="input-title" value="${n.noticeTitle}"></td>
                </tr>
                <tr>
                    <td class="line-title">작성일</td>
                    <td class="line-content">${n.noticeDate}</td>
                </tr>
            </table>
            <div class="btns">
            	<c:if test="${loginMember.memberId eq 'admin'}">
	                <button type="button" id="update-btn" class="customBtn btnStyle" onclick="updateNt();">수정하기</button>
	                <button type="button" id="delete-btn" class="customBtn btnStyle" onclick="deleteNt();">삭제하기</button>
	                <button type="button" id="updateEnd-btn" class="customBtn btnStyle" onclick="updateNtEnd();">수정완료</button>
	                <button type="button" id="cancel-btn" class="customBtn btnStyle" onclick="cancelNt();">취소</button>
                </c:if>
            </div>
            <textarea id="input-content" rows="10" cols="130" readonly>${n.noticeContent}</textarea>
            <%-- <div id="text">
                ${n.noticeContent}
            </div> --%>
            <button type="button" id="list-btn" class="customBtn btnStyle" onclick="goList();">목록으로</button>
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
            font-size: 20px;
            font-weight: bold;
            line-height: 70px;
            margin: 10px;
            cursor: pointer;
            background-color: lavender;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
        }
        .board{
            width: 75%;
            height: fit-content;
            border: 1px solid black;
            border-radius: 10px;
        }
        .board td{
        	height: 53px;
        }
        #main-title{
            text-align: center;
            margin-top: 30px;
            font-size: 35px;
        }
        .outline{
            /* width: 1000px; */
            height: 100px;
            border-collapse: collapse;
            margin: 0 auto !important;
            margin-top: 20px !important;
            margin-bottom: 20px !important;
        }
        .outline *{
            border: 1px solid black;
        }
        .line-title{
            width: 200px;
            text-align: center;
            font-weight: bold;
        }
        .line-content{
            width: 700px;
            padding-left: 20px;
        }
        #input-title-tr{
        	display: none;
        }
        .headline{
            font-weight: bold;
        }
        #input-content{
        	margin-left: 70px;
            margin-right: 70px;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 20px;
            resize: none;
        }
        .btns{
            margin-left: 70%;
        }
        #updateEnd-btn, #cancel-btn{
        	display: none;
        }
/*         #text{
            border: 1px solid black;
            margin-left: 70px;
            margin-right: 70px;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 20px;
            min-height: 250px;
        } */
        #list-btn{
            margin-left: 6%;
            margin-bottom: 30px;
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
			background: royalblue;
			background: linear-gradient(0deg, royalblue 0%, royalblue 100%);
		}
		.btnStyle:hover {
			color: royalblue;
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
			background: royalblue;
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
	 	//사이드 메뉴 누르면 페이지 이동
		$(".side-menu>div:eq(0)").click(e=>{
			location.assign("${path}/center/noticeList");
		})
		$(".side-menu>div:eq(1)").click(e=>{
			location.assign("${path}/center/clientQnaList");
		})
		
		//수정하기 버튼 눌렀을 때
		const updateNt=()=>{
			//수정완료, 취소 버튼 보임
			$("#updateEnd-btn").css("display", "inline-block");
			$("#cancel-btn").css("display", "inline-block");
			
			//수정하기, 삭제하기 버튼 사라짐
			$("#update-btn").css("display", "none");
			$("#delete-btn").css("display", "none");
			
			//기존 제목 줄이 사라지고 수정할 수 있는 제목 줄이 보임
			$("#fix-title-tr").hide();
			$("#input-title-tr").show();
			
			//내용 입력창이 수정할 수 있게 바뀌고 포커스가 맞춰짐
			$("#input-content").attr("readonly", false);
			$("#input-content").focus();
		}
			
		//수정하기
		const updateNtEnd=()=>{
			let title=$("#input-title").val();
			let content=$("#input-content").val();
			let no=${n.noticeNo};
			let input=[title, content, no];
			//등록 성공 여부를 boolean 값으로 받음
			$.ajax({
				url:"${path}/center/noticeUpdate",
				data:{input:input},
				success:data=>{
					if(data){
						alert("수정되었습니다.");
						//수정 성공했으면 새로고침
						location.reload();
					}else{
						alert("수정이 실패하였습니다.");
					}
				}
			})
		}
		
		//삭제하기
		const deleteNt=()=>{
			let check=confirm("정말로 삭제하시겠습니까?");
			if(check){
				$.ajax({
					url:"${path}/center/noticeDelete",
					data:{no:${n.noticeNo}},
					success:data=>{
						if(data){
							alert("삭제되었습니다.");
							//삭제 성공했으면 목록으로
							location.assign("${path}/center/noticeList");
						}else{
							alert("삭제에 실패하였습니다.");
						}
					}
				})
			}
		}
		
		//목록으로
    	const goList=()=>{
    		location.assign("${path}/center/noticeList");
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>