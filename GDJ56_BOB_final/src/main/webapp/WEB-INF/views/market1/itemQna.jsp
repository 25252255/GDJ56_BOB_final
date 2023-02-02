<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
	<div>
		<div style="display: flex;">
		    <div>
		        <h4 style="margin-right: 10px;font-weight: bold;">상품문의</h2>
		    </div>
		    <div>
		        <span> 총 <span style="color:orange; font-weight: bold;"><c:out value="${qna.size()}"/></span>개</span>
		    </div>
		    <div style="margin-left: 60%;">
		        <!-- 관리자만 -->
		        <label><input type="checkbox" name="">답변안한 글</label>  
		        <!-- 고객만 -->
		        <label><input type="checkbox" name="">내가 쓴 글</label>
		    </div>
		</div>
		
		<hr/> 
		<div>
		    <span style="color:rgb(197, 195, 195)"> · 상품과 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 삭제됩니다.</span>
		</div>
		
		<br>
		
		
		<form class="wrap-form-reservation size22 m-l-r-auto" method="post"
			action="${path }/itemQna/insertQna.do">
		    <input type="hidden" name="itemNo" value="${itemNo }"/>
			<label><input type="checkbox" name="iqSecret" value="Y">비밀글</label>
				<input type="hidden" name="iqSecret1" value="N"/>
		    <input type="hidden" name="memberId" value="${loginMember.memberId }"/>
			<div style="display: flex;">
			    <div>
			        <textarea name="iqContent" id="" cols="100%" rows="3" required></textarea>
			    </div>
			    <div>
			        <input class="primary-btn" type="submit" value="등록하기"
			        style="height: 80px; width: 130px; margin-left: 5%;background-color: #07d448; border: none;">
			    </div>

			</div>
		</form>
		<hr/> 
		<c:forEach var="q" items="${qna }">
				<div style="display: flex; height:40px;margin-bottom: 7px;">
				    <img src="${path }/resources/images/logo-icon.png" alt="" style="height:40px;width: 40px;border-radius: 50%;">
				    <div>
				    	<h5 style="margin-left:10px; margin-top: 10px;">${q.memberId }</h5>
				    </div>
				    <span style="margin-left:10px;color:rgb(207, 207, 207);margin-top: 8px;"><fmt:formatDate type="date" value="${q.iqDate }"/></span>
				</div>
				<c:if test="${q.iqSecret eq 'N' }">
				<div style="margin-left:20px;">
				    <h5>${q.iqContent }</h5>
				</div>
				</c:if>
				<c:if test="${q.iqSecret eq 'Y' }">
				<div style="margin-left:20px;">
				    <h5 style="color:gray;">비밀글입니다.</h5>
				</div>
				</c:if>
				<br>
				<div style="display: flex;">
				    <div class="col-2">
				        <span style="color:orange; font-weight: bold; font-size: 20px;">답글 ${q.answer_count }</span>
				    </div>
				    <div>
				        <button id="togglereply" class="primary-btn" type="button" name="reply" style="background-color:#07d448;border: none;color: white;"
				        onclick="togglererere(event)">답글</button>
						
				    </div>
				    <div>
				    	<c:if test="${q.memberId eq loginMember.memberId }">
					        <button id="" class="primary-btn" type="button" style="background-color:magenta;border: none;color: white;margin-left:10px;"
					         onclick="deleteQna(${q.iqNo},${itemNo });">삭제</button>
				    	</c:if>
				    </div>
				</div>
				<hr/>
				
				<!-- 답변 -->
				<div class="toggleadmin">
					<div class="ttt" style="margin-left: 50px;display:none;">
					
					
					<!-- <form method="post"> -->
					<c:if test="${loginMember eq 'admin' }">
					<form method="post" action="${path }/itemQna/qnaAnswerAdmin.do">
					    <div style="display:flex;margin-bottom: 7px;">
					        <img src="${path }/resources/images/logo-icon.png" alt="" style="width:40px; height: 40px;border-radius: 50%;">
					        <h5 style="margin:10px;">오늘의 밥</h5>
					    </div>
					    <div style="display:flex">
					        <div id="answerAdnim">
					            <textarea name="iqaContent" id="iqaContent" cols="100" rows="2" placeholder="답글을 입력해주세요" required></textarea>
					        	<input type="hidden" name="itemNo" value="${itemNo }"/>
					        	<input type="hidden" name="iqNo" value="${q.iqNo }"/>
					        </div>
					        <div>
					            <input class="primary-btn" type="submit" value="답변하기" style="height: 55px;margin-left: 5%; background-color: #07d448;border: none;color: white;"
					            onclick="">
					        </div>
					    </div>
			        <hr/>
				    </form>
				  	</c:if>
				    
				    
			        <!-- 답글 리스트 출력 -->
			        <c:if test="${an!=null }">
				        <c:forEach var="aa" items="${an }">
					        <c:if test="${q.iqNo == aa.iqNo }">
					        <div style="display:flex;margin-bottom: 7px;">
					        	<img src="${path }/resources/images/logo-icon.png" alt="" style="width:40px; height: 40px;border-radius: 50%;">
					        	<h5 style="margin:10px;">오늘의 밥</h5>
								<span style="margin-left:10px;color:rgb(207, 207, 207);margin-top: 8px;"><fmt:formatDate type="date" value="${aa.iqaDate }"/></span>
					        </div>
					    	<div style="display:flex;">
						        <div style="margin-left:20px;">
									${aa.iqaContent }
						        </div>
						        <div>
						        <c:if test="${loginMember eq 'admin' }">
					       			<button id="" class="primary-btn" type="button" 
					       			style="background-color:magenta;border: none;color: white;margin-left:50px;"
					       			 onclick="deleteAnswer(${aa.iqaNo },${itemNo });">삭제</button>
					       		</c:if>
					    		</div>
					    	</div>
							<hr/>
					        </c:if>
						</c:forEach>
					</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
			
		<!-- 페이징처리 -->
		<div class="product__pagination" style="text-align: center;">
		    <a href="#"><i class="fa fa-long-arrow-left"></i></a>
		    <a href="#">1</a>
		    <a href="#">2</a>
		    <a href="#">3</a>
		    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
		</div>
	</div>
	
		<script>
			//문의 답변css
		 	function togglererere(e){
		 		$(e.target).parent().parent().next().next().find("div.ttt").slideToggle(1000);
		 	} 
		     
		    //문의글 삭제
		    const deleteQna=(no,itemNo)=>{
		    	location.assign('${path}/itemQna/delectQna.do?itemNo='+itemNo+'&iqNo='+no);
		    }
		    
		    //질문 답변 삭제하기
		    const deleteAnswer=(iqaNo,itemNo)=>{
		    	location.assign('${path}/itemQna/deleteAnswer.do?itemNo='+itemNo+'&iqaNo='+iqaNo);
		    }
		    
		    //관리자 문의 답변 수정중....
		    /* function iqanswer(no){
 		    	const content=$("IqaContent").val();
		    	 $.ajax({
		    		type:'get',
		    		url:'${path}/itemQna/qnaAnswerAdmin.do',
		    		data:{"iqNo":no,
		    				"itemNo":${itemNo},
				    		"IqaContent":content},
		    		success:data=>{
		    			var html="";
		    			if(data.lenght>0){
		    				for(let i=0;i<data.length;i++){
		    					html+="<div id='answerAdnim'>";
					            html+="<textarea name='IqaContent' id='IqaContent' cols='100' rows='2'>"+data[i].IqaContent+"</textarea>";
						        html+="</div>";
		    				}
		    			}
		    			$("#answerAdnim").html(html);
		    		}
		    	}) ; 
		    }   */ 
		    
		</script>
