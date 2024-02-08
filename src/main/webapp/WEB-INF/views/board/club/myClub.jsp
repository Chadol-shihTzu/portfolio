<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>Band</li>
        </ol>
        <h2>My Band</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      <div class="table-responsive">
	      	<table class="table table-hover text-nowrap text-center">
	      		<colgroup>
			      <col style="width:10%"/>
			      <col style="width:10%"/>
			      <col style="width:50%"/>
			      <col style="width:10%"/>
			      <col style="width:10%"/>
			      <col style="width:10%"/>
	  			</colgroup>
				<thead class="table-bordered table-light">
				   <tr>
				      <th class="text-center">번호</th>
				      <th class="text-center">카테고리</th>
				      <th class="text-center">모임명</th>
				      <th class="text-center">가입일</th>
				      <th class="text-center">회원수</th>
				      <th class="text-center">관리</th>
				   </tr>
			   </thead>
		 
			   <tbody>
			   
			   		<tr>
			   			<td>1</td>
				      	<td>사진모임</td>
				       	<td><a href="${path}/board/announce/announceView?annoNo=${list.annoNo}" class="boardAtag">테스트</a></td>
				       	<td>2024-02-06</td>
				      	<td>15</td>
				      	<td>
				      		<div class="btn-group">
				      			<a href="#" class="btn btn-sm btn-outline-warning">수정</a>
				      			<a href="#" class="btn btn-sm btn-outline-danger">탈퇴</a>
				      		</div>
				      	</td>
				     </tr>
			   
			   </tbody>
	      	</table>
	      	
			<div class="container-fluid bg-light py-3">
			    <div class="row justify-content-between align-items-center">
			        <div class="col-md-4">
			            <div class="input-group">
			                <select name="searchType" class="form-select">
			                    <option value="category" <c:if test="${page.searchType eq 'category'}">selected</c:if>>카테고리</option>
			                    <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>모임명</option>
			                    <option value="member" <c:if test="${page.searchType eq 'member'}">selected</c:if>>가입일</option>
			                </select>
			                <input type="text" name="keyword" class="form-control" value="${page.keyword}">
			                <button type="button" id="searchBtn" class="btn btn-outline-success">검색</button>
			            </div>
			        </div>
			
			    
			    </div>
			</div>



		
		<nav class="Page navigation example">
			<ul class="pagination justify-content-center my-3">
				<c:if test="${page.prev}">
				 <li class="page-item"><a href="${path}/board/announce/annolistPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">이전</a></li>
				</c:if>
				
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				  <li class="page-item">
				  	<c:if test="${select != num}">
				   		<a href="${path}/board/announce/annolistPageSearch?num=${num}${page.searchTypeKeyword}" class="boardAtag page-link">${num}</a> 
				   </c:if>
				   <c:if test="${select == num }">
				   	<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
				   </c:if>
				  </li> 
				</c:forEach>
				
				<c:if test="${page.next}">
				 	<li class="page-item"><a href="${path}/board/announce/annolistPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">다음</a></li>
				</c:if>

			 </ul>
		</nav>
		
		
		
      	</div>
      
      	<div class="d-flex justify-content-end">
		   <div class="btn-group my-3">
		   	<a href="${path}/board/club/clubCreate" class="btn btn-outline-primary">모임 만들기</a>
		   </div>
		</div>
      </div>
   </div>
</div>
<%@include file="../../include/footer.jsp" %>