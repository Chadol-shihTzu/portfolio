<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>Hotdeal</li>
        </ol>
        <h2>Hotdeal</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">

      	
      	
		<main>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">제목</span>
		    	<input type="text" class="form-control" id="hotTitle" value="${view.hotTitle}" name="hotTitle" readonly>
		    	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="hotWriter"  name="hotWriter" value="${view.hotWriter}" readonly="readonly"/>
		    </div>
     	  	   
		      	<div class="table-reponsive">
		      		<table class="table table-sm text-nowrap text-center">
		      			<tbody>
		      				<tr>
					      		<th class="table-secondary">카테고리</th>
					    		<td>${view.hotCategory}</td>
					    		<th class="table-secondary">URL 주소</th>
					    		<td><a href="${view.hotUrl}">${view.hotUrl}</a></td>
					    		<th class="table-secondary">작성일</th>
					    		<td><fmt:formatDate value="${view.hotregDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
				    		</tr>
				    		<tr>
					      		<th class="table-secondary">가격</th>
					    		<td><fmt:formatNumber value="${view.hotPrice}" pattern="###,###,###"></fmt:formatNumber>원</td>
					    		<th class="table-secondary">쇼핑몰</th>
					    		<td>${view.hotShop}</td>
					    		<th class="table-secondary">배송</th>
					    		<td>${view.hotDelivery}</td>
				    		</tr>
		      			</tbody>
				      	
		    		</table> 
		      	</div>

		      <textarea cols="" rows="20" class="content_textarea form-control" id="hotContent"  name="hotContent" readonly="readonly">${view.hotContent}</textarea>
		      <div class="input-group mb-3">
		    	 <span class="input-group-text">원본이미지</span>
		    	 <img src="${path}/${view.hotImg}" class="rounded" style="width:500px !important; height:500px !important;"/>
		    </div>
	    </main>
	    
		</div>
	</div>

      		<!-- submit btn 글 작성자와 같을 때만 수정/삭제-->
			<c:if test="${member.userId == view.hotWriter}">
      		<div class="d-flex justify-content-end">
      			<div class="btn-group mb-5">
      				<a href="${path}/board/hotdeal/hotdealUpdate?hotNo=${view.hotNo}" class="btn btn-outline-success">수정</a>
					<a href="${path}/board/hotdeal/hotdealDelete?hotNo=${view.hotNo}" class="btn btn-outline-danger">삭제</a>
      				<a href="${path}/board/hotdeal/hotdeallistPageSearch?num=1" class="btn btn-outline-primary"  >목록보기</a>
      			</div>
      		</div>
      		</c:if>
      		
      		<c:if test="${member.userId != view.hotWriter}">
      		<div class="d-flex justify-content-end">
      			<div class="btn-group mb-5">
      				<a class="btn btn-outline-primary" href="${path}/board/hotdeal/hotdeallistPageSearch?num=1" >목록보기</a>
      			</div>
      		</div>
      		</c:if>
      		<hr>
      		
      		<!-- 댓글 조회 아코디언 -->
    		<div class="accordion" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        댓글
			      </button>
			    </h2>
			    
			    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <ul>
				<c:forEach items="${reply}" var="reply">
					<div class="d-flex justify-content-between my-3">
						<div class="d-none d-sm-block">
							<strong>${reply.writer}</strong>&nbsp;/ 
							<span class="text-muted"><fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/></span>
							<p>${reply.content}</p>
						</div>
						<div class="d-sm-none">
							<strong>${reply.writer}</strong> 
							<p>${reply.content}</p>
						</div>
						<div class="row-2 text-center">
						<c:if test="${member.userId == reply.writer}">
						<div class="btn-group" style="height:40px;">
							<a href="${path}/board/hotdeal/replyModify?hotNo=${view.hotNo}&hotRno=${reply.hotRno}" class="text-nowrap border btn reply_modify_btn" style="height:36px;">수정</a><!-- btn-outline-secondary  -->
							<a href="${path}/board/hotdeal/replyDelete?hotNo=${view.hotNo}&hotRno=${reply.hotRno}" class="text-nowrap border btn reply_delete_btn" style="height:36px;">삭제</a><!-- btn-outline-danger -->
						</div>
						</c:if>
						<p class="d-sm-none text-muted"><fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
				</c:forEach>
			</ul>
			<!-- 댓글 조회 끝 -->
			
<!-- 로그인시 댓글작성 가능 -->
<c:if test="${member != null}">
<form method="post" action="${path}/board/hotdeal/write">
	<div class="row g-2">
		<div class="col-auto">
			<label for="writer" class="col-form-label">댓글 작성자</label>&nbsp;
		</div>
		<div class="col-auto">
			<input id="writer" type="text" class="form-control" name="writer" value="${member.userId}" readonly>
		</div>
	</div>
	<p><label class="form-label">내용</label></p>
	<textarea class="form-control" rows="5" name="content" style="resize:none;" placeholder="내용을 입력해주세요." ></textarea>
	<div class="d-flex justify-content-end my-3">
	<!-- 
	댓글이 작성되는 현재페이지는 게시물을 순번으로 조회하고 있는 상태 루트/view?bno=? 여러개의 순번중에 인지할수 있도록 히든 필드를 써줌
	 -->
	<input type="hidden" name="hotNo" value="${view.hotNo}"/>
	<div class="btn-group">
		<input type="submit" class="btn btn-outline-success" value="작성"/>
	</div>
	
	</div>
</form>
</c:if>

<!-- 비로그인시 댓글 작성 불가 -->
<c:if test="${member == null}">
<form method="post" action="${path}/board/reply/write">
	<div class="row g-2">
		<div class="col-auto">
			<label for="writer" class="col-form-label">댓글 작성자</label>&nbsp;
		</div>
		<div class="col-auto">
			<input id="writer" type="text" class="form-control" name="writer" value="${member.userId}" placeholder="로그인을 해주세요." disabled>
		</div>
	</div>
	<p><label class="form-label">내용</label></p>
	<textarea class="form-control" rows="5" name="content" style="resize:none;" placeholder="로그인을 해주세요." disabled></textarea>
	<div class="d-flex justify-content-end my-3">
	<input type="hidden" name="hotNo" value="${view.hotNo}"/>
	<div class="btn-group">
		<input type="submit" class="btn btn-outline-success" value="작성" disabled/>
	</div>
	
	</div>
</form>
</c:if>

			      </div>
			    </div>
			  </div>
			
</div>
</div>

<script>

<c:if test="${hotdealUpdateSuccess}">
	alert("글 수정이 완료되었습니다.");
</c:if>
<c:if test="${replyWriteSuccess}">
	alert("댓글 작성이 완료되었습니다.");
</c:if>
<c:if test="${replyDeleteSuccess}">
	alert("댓글 삭제가 완료되었습니다.");
</c:if>
<c:if test="${replyModifySuccess}">
	alert("댓글 수정이 완료되었습니다.");
</c:if>
</script>

<%@include file="../../include/footer.jsp" %>

