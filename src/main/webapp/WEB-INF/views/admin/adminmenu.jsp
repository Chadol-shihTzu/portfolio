<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./adminheader.jsp" %>

<div class="container-fluid">
   <div class="row">
   	  <div class="col-12">
   	  <c:if test="${member.verify == 9}">
   	  	<div class="mt-5 alert alert-light">
	      	<h2 class="alert-heading"><i class="fa-solid fa-square text-center">&nbsp;</i>관리자 메뉴</h2>
      	</div>
   	  	
   	  	<div class="table-responsive">
			<table class="table table-hover" style="font-size:12px;">
				<colgroup>
					<col style="width:3%"/>	<!-- 번호 -->
					<col style="width:4%"/>	<!-- 아이디 -->
				    <col style="width:5%"/> <!-- 비밀번호 -->	
					<col style="width:5%"/>	<!-- 비밀번호 확인 -->
					<col style="width:5%"/>	<!-- 이름 -->
					<col style="width:5%"/>	<!-- 생년월일 -->
					<col style="width:5%"/> <!-- 성별 -->
					<col style="width:9%"/> <!-- 우편번호 -->
				    <col style="width:9%"/> <!-- 도로명주소 -->
					<col style="width:9%"/> <!-- 상세주소 -->
					<col style="width:9%"/> <!-- 이메일 -->
					<col style="width:9%"/> <!-- 연락처 -->
					<col style="width:5%"/> <!-- 포인트 -->
				    <col style="width:5%"/> <!-- 가입일 -->
					<col style="width:5%"/> <!-- 관리자여부 -->
					<col style="width:8%"/> <!-- 관리 -->
				</colgroup>
				
				<thead class="table-bordered table-light">
				    <tr>
					<th class="text-center">번호</th>
					<th class="text-center">아이디</th>				
					<th class="text-center">비밀번호</th>
					<th class="text-center">비밀번호확인</th>
					<th class="text-center">이름</th>
					<th class="text-center">생년월일</th>
					<th class="text-center">성별</th>
					<th class="text-center">우편번호</th>
					<th class="text-center">도로명주소</th>
					<th class="text-center">주소(이하주소)</th>
					<th class="text-center">이메일</th>
					<th class="text-center">연락처</th>
					<th class="text-center">포인트</th>
					<th class="text-center">가입일</th>
					<th class="text-center">관리자여부</th>
					<th class="text-center">관리</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="list"> 
						<tr>
						  <td class="text-center">${list.userNum}</td>
						  <td class="text-center">${list.userId}</td>
						  <td class="text-center password_eli">${list.userPassword}</td>
						  <td class="text-center password_eli">${list.userRePassword}</td>
						  <td class="text-center">${list.userName}</td>
						  <td class="text-center">${list.userBirth}</td>
						  <td class="text-center">${list.userGender}</td>
						  <td class="text-center">${list.userAddr1}</td>
						  <td class="text-center">${list.userAddr2}</td>
						  <td class="text-center">${list.userAddr3}</td>
						  <td class="text-center">${list.userEmail}</td>
						  <td class="text-center">${list.userPhone}</td>
						  <td class="text-center"><fmt:formatNumber value="${list.userPoint}" pattern="###,###,###"></fmt:formatNumber></td>
						  <td class="text-center"><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
						  <td class="text-center">${list.verify}</td>
						  <td class="text-center">
							<div class="btn-group">
								<a href="${path}/admin/adminmodify?userId=${list.userId}" class="btn btn-sm btn-outline-warning text-nowrap">수정</a>
					   	  		<a href="${path}/admin/admindelete?userId=${list.userId}" class="btn btn-sm btn-outline-danger text-nowrap">삭제</a>
					   	  	</div>
						  </td>
						</tr>
					</c:forEach>
				</tbody>
	
			</table>
			
			<div class="container-fluid bg-light py-3">
			    <div class="row justify-content-between align-items-center">
			        <div class="col-md-4">
			            <div class="input-group">
			                <select name="searchType" class="form-select">
			                	<option value="id" <c:if test="${page.searchType eq 'id'}">selected</c:if>>아이디</option>
			                    <option value="name" <c:if test="${page.searchType eq 'name'}">selected</c:if>>이름</option>
			                    <option value="gender" <c:if test="${page.searchType eq 'gender'}">selected</c:if>>성별</option>
			                    <option value="birth" <c:if test="${page.searchType eq 'birth'}">selected</c:if>>생년월일</option>
			                    <option value="addr1" <c:if test="${page.searchType eq 'addr1'}">selected</c:if>>우편번호</option>
			                    <option value="addr2" <c:if test="${page.searchType eq 'addr2'}">selected</c:if>>도로명주소</option>
			                    <option value="addr3" <c:if test="${page.searchType eq 'addr3'}">selected</c:if>>이하주소</option>
			                    <option value="email" <c:if test="${page.searchType eq 'email'}">selected</c:if>>이메일</option>
			                    <option value="phone" <c:if test="${page.searchType eq 'phone'}">selected</c:if>>연락처</option>
			                </select>
			                <input type="text" name="keyword" class="form-control" value="${page.keyword}">
			                <button type="button" id="searchBtn" class="btn btn-outline-success">검색</button>
			            </div>
			        </div>
			
			        
			            <div class="d-flex justify-content-end">
							<div class="btn-group">
								<a class="btn btn-outline-primary" href="${path}/member/join">회원생성</a>
							</div>
						</div>

			    </div>
			</div>



		
		<nav class="Page navigation example">
			<ul class="pagination justify-content-center my-3">
				<c:if test="${page.prev}">
				 <li class="page-item"><a href="${path}/admin/adminmenu?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">이전</a></li>
				</c:if>
				
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				  <li class="page-item">
				  	<c:if test="${select != num}">
				   		<a href="${path}/admin/adminmenu?num=${num}${page.searchTypeKeyword}" class="boardAtag page-link">${num}</a> 
				   </c:if>
				   <c:if test="${select == num }">
				   	<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
				   </c:if>
				  </li> 
				</c:forEach>
				
				<c:if test="${page.next}">
				 	<li class="page-item"><a href="${path}/admin/adminmenu?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">다음</a></li>
				</c:if>

			 </ul>
		</nav>
			
		</div><!-- table-reponsive 끝 -->
		
		
		</c:if>
		
			<c:if test="${member.verify != 9}">
		      	<div class="alert alert-danger" role="alert">
				  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;관리자만 이용가능한 기능입니다.
				</div>
			</c:if>
   	  </div>
   </div>
</div>

<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
 
  location.href="${path}/admin/adminmenu?num=1"+"&searchType="+searchType+"&keyword="+keyword;
  //console.log(searchType)
  //console.log(keyword)
 };
 
 <c:if test="${adminmodifySuccess}">
	alert("회원 정보 수정이 완료되었습니다.");
</c:if>

<c:if test="${admindeleteSuccess}">
alert("회원 삭제가 완료되었습니다.");
</c:if>
 </script>

<%@include file="./adminfooter.jsp" %>