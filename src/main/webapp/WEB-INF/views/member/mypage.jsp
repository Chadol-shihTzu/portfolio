<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div class="container" style="height:800px;">
   <div class="row">
   	  <c:if test="${member != null}">
   	  
      <div class="col-sm-5 col-12 col-lg-3 border-end p-0" style="height:800px !important;">
      <!-- 로그인 시 마이페이지 -->
      	<div class="d-flex justify-content-center py-2 border-bottom">
      		<p class="m-0">Today : <span class="text-danger">1</span> | Total : 123,456</p>
      	</div>
      	
      	<div class="d-flex justify-content-center align-items-center" style="height:274px;">
      		<div class="d-flex justify-content-center align-items-center border" style="border-radius:100%; width:240px; height:220px;">
      			<h1>이미지</h1>
      		</div>
      		
      	</div>
      	<div class="mb-3">
      		<div class="input-group d-flex justify-content-between">
      			<input class="form-control text-center" value="${member.userId}" readonly />
      			<input class="form-control text-center" value="${emoticons[0]}베테랑작가" style="font-size:12px;" readonly />
      		</div>
      		<div class="input-group mb-3">
		      	<span class="input-group-text">나의 포인트</span>
		    	<span class="form-control"><fmt:formatNumber value="${member.userPoint}" pattern="###,###,###"></fmt:formatNumber>pt</span> 
		      </div>
      	</div>
      	<div class="mb-3">
      		<a class="btn btn-outline-danger form-control" ><i class="fa-regular fa-heart"></i></a>
      	</div>
      	<!-- 세로 메뉴바 아코디언 -->
      	<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        프로필 관리
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      	<ul class="list-unstyled m-0">
		      		<li class="btn btn-light form-control"><a href="#" class="text-dark">프로필 수정</a></li>
		      		<li class="btn btn-light form-control mt-3"><a href="#" class="text-dark">프로필 이미지 변경</a></li>
		      		<li class="btn btn-light form-control mt-3 text-nowrap"><a href="#" class="text-dark">소셜 미디어 계정 연결</a></li>
		      	</ul>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        개인 정보 관리
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
			      
			        <a href="${path}/member/modify" class="btn btn-outline-warning form-control text-nowrap">회원정보수정</a>
			        <a href="${path}/member/withdrawal" class="btn btn-outline-danger form-control mt-3 text-nowrap">계정 탈퇴</a>
			       
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        게시물 관리
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <ul class="list-unstyled m-0">
		        	<li class="btn btn-light form-control"><a href="#" class="text-dark">내가 작성한 글</a></li>
		        	<li class="btn btn-light form-control mt-3"><a href="#" class="text-dark">내가 작성한 댓글</a></li>
		        	<li class="btn btn-light form-control mt-3"><a href="#" class="text-dark">내가 좋아요 글</a></li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 아코디언 끝 -->
	
	    </div><!-- col-2 끝 -->	
	    
	    
	    <div class="col-sm-7 col-lg-9">
      		<div class="row">
      		<!-- 자기소개에 오신 것을 환영합니다. -->
      			<div class="col-12 p-5" style="height:200px !important; background-image: url(${path}/resources/assets/img/slide/slide-3.jpg)">
      				<div class=" d-flex justify-content-center mt-3">
      					<h1 class="text-white">${member.userId}에 오신 것을 환영합니다.</h1>
      				</div>
      				
      				<div class="d-flex justify-content-end">
      					<div class="btn-group">
      						<a href="#" class="btn btn-outline-primary"><i class="fa-solid fa-pencil"></i>&nbsp;수정</a>
      					</div>
      				</div>
      			</div>
      			<!-- 방명록 -->
      			<div class="col-12 p-0" style="height:600px !important;">
      				<div class="table-responsive">
	      	<table class="table table-hover text-nowrap text-center" style="height:514px !important;">
	      		<colgroup>
			      <col style="width:80%"/>
			      <col style="width:10%"/>
			      <col style="width:10%"/>
	  			</colgroup>
		 
			   <tbody>
			   		<tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     <tr>
			   			<td>님 정말 짱인듯요</td>
				      	<td>유저1</td>
				       	<td>2024-02-06 13:12</td>
				     </tr>
				     
			   </tbody>
	      	</table>
	      	
			<div class="container-fluid bg-light py-3">
	            <div class="input-group">
	                <input type="text" name="keyword" class="form-control" value="${page.keyword}" autocomplete="off" placeholder="방명록을 작성해주세요." />
	                <button type="button" id="searchBtn" class="btn btn-outline-primary">작성</button>
	            </div>
			</div>
		
		
		
      	</div>
      			</div>
      		</div>
      	</div>

      	</c:if><!-- 로그인 시 마이페이지 끝 -->
		
      
      
      	
      	
<!-- 비로그인 시 마이페이지 -->
<c:if test="${member == null}">
	<div class="mt-5 alert alert-light">
	      	<h2 class="alert-heading"><i class="fa-solid fa-square text-center">&nbsp;내정보</i></h2>
      	</div>
	<div class="alert alert-danger" role="alert">
		<i class="fa-solid fa-triangle-exclamation"></i>&nbsp;로그인 시 이용가능한 기능입니다.
	</div>
</c:if>

   </div>
</div>

<%@include file="../include/footer.jsp" %>