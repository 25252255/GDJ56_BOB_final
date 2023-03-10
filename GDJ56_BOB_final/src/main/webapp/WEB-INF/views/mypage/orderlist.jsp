<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
    <meta charset="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>오늘의 밥 마이페이지</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${path}/resources/assets/css/tailwind.output.css" />
    <script
      src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
      defer
    ></script>
    <script src="${path}/resources/assets/js/init-alpine.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
      defer
    ></script>
    <script src="${path}/resources/assets/js/jquery-3.6.1.min.js"></script>
  </head>
  <body>
    
    <div 
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen }"
    >
      <!-- Desktop sidebar -->
      <aside
        class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0"
      >
        <div class="py-4 text-gray-500 dark:text-gray-400">
          <a
            class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
            href="${path}/mypage/orderlist.do"
          >
            Bob MyPage
          </a>
          <ul class="mt-6">
            <li class="relative px-6 py-3">
              <span
                class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"
              ></span>
              <a
                class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                href="${path}/mypage/orderlist.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                  ></path>
                </svg>
                <span class="ml-4">주문내역</span>
              </a>
            </li>
          </ul>
          <ul>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/myinfoPassword.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <path
                d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
              ></path>
                </svg>
                <span class="ml-4" >회원정보</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/basket.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                  ></path>
                </svg>
                <span class="ml-4">장바구니</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/point.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"
                  ></path>
                  <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
                </svg>
                <span class="ml-4">적립금</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/onedayclass.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"
                  ></path>
                </svg>
                <span class="ml-4">원데이클래스</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/writelist.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg>
                <span class="ml-4">1:1 문의글</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/onedayItemWrite.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg>
                <span class="ml-4">원데이클래스/상품 문의글</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/subscription.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <path
                d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"
              ></path>
                </svg>
                <span class="ml-4">정기구독</span>
              </a>
            </li>
          </ul>
          <div class="px-6 my-6">
          </div>
        </div>
      </aside>
      <div class="flex flex-col flex-1 w-full">
        <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
          <div
            class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
          >
              <!-- main menu -->
              <div style="display: contents;" class="relative ">
                &nbsp;
                <button style="font-weight: bolder;" onclick="location.assign('${path}/market1/matketmain.do');">
                  MARKET
                </button>
                
                <button style="font-weight: bolder;" onclick="location.assign('${path}/class/main.do');">
                  ONEDAY-CLASS
                </button>

                <button style="font-weight: bolder;" onclick="location.assign('${path}/subscription/subMain');">
                  SUBCRIPTE
                </button>

                <button style="font-weight: bolder;" onclick="location.assign('${path}/center/noticeList');">
                  CUSTOMER-CENTER
                </button>
                &nbsp;
              </div>
            </ul>
          </div>
        </header>
        <main  class="h-full overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <!-- 회원공통부분 -->
	 			<jsp:include page="/WEB-INF/views/mypage/mypageCommon.jsp">
	 				<jsp:param name="memberId" value="${memberInfoBar[0]}"/>
	 				<jsp:param name="level" value="${memberInfoBar[1]}"/>
	 				<jsp:param name="basket" value="${memberInfoBar[2]}"/>
	 				<jsp:param name="write" value="${memberInfoBar[3]}"/>
	 				<jsp:param name="point" value="${memberInfoBar[4]}"/>
	 			</jsp:include>  

            <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">구매내역</th>
                      <th class="px-4 py-3">주문번호</th>
                      <th class="px-4 py-3">주문상태</th>
                      <th class="px-4 py-3">결제일자</th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                     <%-- ${orderlist} --%>
                     
                     <c:if test="${empty orderlist}">
                     	<tr class="px-4 py-3">
							<td class="px-4 py-3" colspan="4">
								<p>주문내역이없습니다.</p>
							</td>
						</tr>
                     </c:if>
                    <c:if test="${not empty orderlist}">
                    	<c:forEach var="order" items="${orderlist}">
                    		<tr class="text-gray-700 dark:text-gray-400">
		                      <td class="px-4 py-3">
		                        <div class="flex items-center text-sm">
		                          </div>
		                          <div style="width:200px;">
			                            <p class="font-semibold">
			                            <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
			                            <a href="${path}/mypage/orderdetail?orderNo=${order.orderNo}">
				                            <c:forEach var="i"  items="${itemlist}" varStatus="status">
				                            	<c:if test="${i.orderNo eq order.orderNo}">
				                            	 ${i.orderitem.itemName}
				                            	</c:if>
				                            </c:forEach>
			                            </a>
			                            </div>
			                            </p>
		                            <p class="text-xs text-gray-600 dark:text-gray-400">
		                              ${order.price }원
		                            </p>
		                          </div>
		                        </div>	
		                      </td>
		                      <td class="px-4 py-3 text-sm">
		                        ${order.orderNo }
		                      </td>
		                      <td class="px-4 py-3 text-xs">		
				                      <c:if test="${order.delivery eq 'Y'}">	
				                      		<c:if test="${order.refund eq 'N' }">
				                      			<span
						                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
						                        >
						                          주문완료 
						                        </span>
						                        &nbsp;
				                      			<button id="orderCancel" value="${order.orderNo }"
						                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
						                        >
						                          주문취소신청
						                        </button>
				                      		</c:if>
				                      		<c:if test="${order.refund eq 'Y' }">
				                      			<c:if test="${order.refundFix eq 'N' }">
					                      			<span  value="${order.orderNo }"
							                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
							                        >
							                          주문취소대기중
							                        </span>
							                     </c:if>   
				                      		</c:if>
				                      </c:if>
				                      <c:if test="${order.delivery eq 'N' }">
					                      <span  value="${order.orderNo }"
							               class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700"
							               >
							               		취소완료
							               </span>
							           </c:if> 
				                      <c:if test="${order.delivery eq '배송중'}">
				                      	<span
				                          class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600"
				                        >
				                          배송중 
				                        </span>
				                      </c:if>
				                      <c:if test="${order.delivery eq '배송완료'}">
				                      		<c:if test="${order.refund eq 'N' }">
					                      			<span
							                          class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700"
							                        >
							                        배송완료 
							                      </span>
							                      &nbsp;
							                        <button id="orderConfirm" value="${order.orderNo }"
							                          class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700"
							                        >
							                          구매확정
							                        </button>
							                        <button id="orderCancel" value="${order.orderNo }"
									                      class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700"
									                 >
									                     환불신청
									                 </button>
							                     </c:if> 
							                     <c:if test="${order.refund eq 'Y' }">
					                      			<span  value="${order.orderNo }"
							                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
							                        >
							                          환불대기중
							                        </span>
							                     </c:if> 
				                      	
				                      </c:if>
				                      <c:if test="${order.delivery eq '구매확정'}">
				                      	<span
				                          class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700"
				                        >
				                        구매확정완료
				                        </span>
				                        &nbsp; 
				                        <button onclick="location.assign('${path}/mypage/orderdetail?orderNo=${order.orderNo}');"
				                          class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700"
				                        >
				                        리뷰쓰러가기
				                        </button>
				                      </c:if>
				                      <c:if test="${order.delivery eq '리뷰끝'}">
				                      	<span
				                          class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700"
				                        >
				                        구매확정완료
				                        </span>
				                      </c:if>
		                      </td>
		                      <td class="px-4 py-3 text-sm">
		                      	<span id="orderDate">
		                     	 	<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${order.sellDate}"/>
		                      	</span>
		                      </td>
		                    </tr>
                    	</c:forEach>	
                    </c:if>
                    
                  </tbody>
                </table>
              </div>
              <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
              >
                <span class="col-span-1"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                  	${pageBar }
                  </nav>
                </span>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
<script>
  
  /* 
 //현재: 
  var now = new Date();
  
  var orderStatuss = document.querySelectorAll("#orderStatuss");    
  var date=document.querySelectorAll("#orderDate");
  
  for(let i=0;i<date.length;i++){
	  //console.log(date[i].innerText);
	  var date1=date[i].innerText.substring(10, 0);
	  //console.log(date1);
	  var date_arr = date1.split("-");    
	   
	  var year = now.getFullYear();   // 연도
	  var month = now.getMonth()+1;   // 월    
	  var day = now.getDate();        // 일
	   
	  var stDate = new Date(date_arr[0], date_arr[1], date_arr[2]);
	  var endDate = new Date(year, month, day);
	   
	  var btMs = endDate.getTime() - stDate.getTime() ;
	  var btDay = btMs / (1000*60*60*24) ;
	   
	  console.log("일수 차이는?? " + btDay);
	  
	  if(btDay<2){
		  //date[i].innerText="주문완료";
		  const span = document.createElement("span");
		  span.innerHTML="주문완료";
		  span.className="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100";
		  orderStatuss[i].appendChild(span);
		  
		  const btn = document.createElement("button");
		  btn.innerHTML="주문취소";
		  btn.className="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100";
		  btn.id ="orderCancel";
		  orderStatuss[i].appendChild(btn);
		  
	  }else if(btDay<5){
		  //date[i].innerText="배송중";
		  const span = document.createElement("span");
		  span.innerHTML="배송중";
		  span.className="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600";
		  orderStatuss[i].appendChild(span);
		  
	  }else if(btDay<7){
		  //date[i].innerText="배송완료";
		  const span = document.createElement("span");
		  span.innerHTML="배송완료";
		  span.className="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700";
		  orderStatuss[i].appendChild(span);
		  
		  const btn = document.createElement("button");
		  btn.innerHTML="구매확정";
		  btn.id ="orderConfirm";
		  btn.className="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700";
		  orderStatuss[i].appendChild(btn);
		  
	  }else if(btDay<20){
		  //date[i].innerText="구매확정";
		  const span = document.createElement("span");
		  span.innerHTML="구매확정완료";
		  span.className="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700";
		  orderStatuss[i].appendChild(span);
		  
		  const btn = document.createElement("button");
		  btn.innerHTML="리뷰쓰러가기";
		  btn.className="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700";
		  orderStatuss[i].appendChild(btn);
	  }else{
		  const span = document.createElement("span");
		  span.innerHTML="구매확정완료";
		  span.className="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700";
		  orderStatuss[i].appendChild(span);
	  }
  }*/
  
	  const ordercancel = document.querySelectorAll("#orderCancel");
	  const orderConfirm = document.querySelectorAll("#orderConfirm");
	
	  for (let i=0; i<ordercancel.length; i++) {
	    ordercancel[i].addEventListener("click", click);
	  }
	
	  for (let j = 0; j < orderConfirm.length; j++) {
	    orderConfirm[j].addEventListener("click", click);
	  }
	
	  function click(e) {
	
	    if(e.target.id=="orderCancel"){
	      let result=window.prompt("주문을 취소하겠습니까? *환불사유입력");
	      //console.log(result);
	      if(result!=null){
	        //console.log(e.target.value); //-> value가 주문번호
		        $.ajax({
					url : "${path}/mypage/ordercancel",
					type : "post",
					data : {
							comment : result,
							orderNo : e.target.value
							},
					success:data=>{
						if(data>0){
							console.log(data);
							alert("신청이 완료되었습니다.");
							location.reload();
						}else{
							console.log(data);
							alert("신청이 실패하였습니다.");
						}	
					},error : function(request, status, error) {
					   	 alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				    }
				});
	      }
	    }else if(e.target.id=="orderConfirm"){
	      let confirmresult=window.confirm("구매을 확정하겠습니까?");
	      
	      if(confirmresult){
	        console.log(e.target.value);
	         $.ajax({
				url : "${path}/mypage/orderconfirm",
				type : "post",
				data : {
						orderNo : e.target.value
						},
				success:data=>{
					if(data>0){
						console.log(data);
						alert("구매확정이 완료되었습니다.");
						location.reload();
					}else{
						console.log(data);
						alert("구매확정이 실패하였습니다.");
					}	
				},error : function(request, status, error) {
				   	 alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			    }
			}); 
	        
	      }
	    }
	    
	  } 
</script>