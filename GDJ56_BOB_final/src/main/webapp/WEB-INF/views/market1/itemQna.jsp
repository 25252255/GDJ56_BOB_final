<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
	<div>
		<div style="display: flex;">
		    <div>
		        <h4 style="margin-right: 10px;font-weight: bold;">상품문의</h2>
		    </div>
		    <div>
		        <span> 총 <span style="color:orange; font-weight: bold;">14</span>개</span>
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
		<div style="display: flex;">
		    <div>
		        <textarea name="" id="" cols="100%" rows="3"></textarea>
		    </div>
		    <div>
		        <input class="primary-btn" type="button" value="등록하기" style="height: 80px; width: 130px; margin-left: 5%;background-color: #07d448; border: none;">
		    </div>
		</div>
		<hr/> 
		
		
		<div style="display: flex; height:40px;margin-bottom: 7px;">
		    <img src="./img/product/product-3.jpg" alt="" style="height:40px;width: 40px;border-radius: 50%;">
		    <div>
		        <h5 style="margin-left:10px; margin-top: 10px;">야채주스</h5>
		    </div>
		    <span style="margin-left:10px;color:rgb(207, 207, 207);margin-top: 8px;">2023-01-01</span>
		</div>
		<div style="margin-left:20px;">
		    <h5>최근일자로 보내주세요^^</h5>
		</div>
		<br>
		<div style="display: flex;">
		    <div class="col-2">
		        <span style="color:orange; font-weight: bold; font-size: 20px;">답글보기 0</span>
		    </div>
		    <div>
		        <button id="togglereply" class="primary-btn" type="button" name="reply" style="background-color:#07d448;border: none;color: white;">답글</button>
		    </div>
		</div>
		<hr/>
		
		<div id="recontainer" style="margin-left: 50px;display:none;">
		    <div style="display:flex;margin-bottom: 7px;">
		        <img src="./img/cart/cart-3.jpg" alt="" style="width:40px; height: 40px;border-radius: 50%;">
		        <h5 style="margin:10px;">오늘의 밥</h5>
		        <span style="margin-left:10px;color:rgb(207, 207, 207);margin-top: 8px;">2023-01-01</span>
		    </div>
		    <div style="display:flex">
		        <div >
		            <textarea name="" id="" cols="100" rows="2" placeholder="답글을 입력해주세요"></textarea>
		        </div>
		        <div>
		            <input class="primary-btn" type="button" value="답변하기" style="height: 55px;margin-left: 5%; background-color: #07d448;border: none;color: white;">
		        </div>
		    </div>
		    <hr/>
		</div>
	</div>
	<script>
	    $("#togglereply").click(e=>{
	        $("#recontainer").slideToggle(1000);
	    });
	</script>
	<!-- 페이징처리 -->
	<div class="product__pagination" style="text-align: center;">
	    <a href="#"><i class="fa fa-long-arrow-left"></i></a>
	    <a href="#">1</a>
	    <a href="#">2</a>
	    <a href="#">3</a>
	    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>