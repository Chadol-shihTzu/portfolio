<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>novel</li>
        </ol>
        <h2>novel</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">

      	
      	
		<main>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">제목</span>
		    	<input type="text" class="form-control" id="novelTitle" value="${view.novelTitle}" name="novelTitle" readonly>
		    </div>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">인상 깊은 구절</span>
		    	<input type="text" class="form-control" id="novelShortTitle" value="${view.novelShortTitle}" name="novelShortTitle" readonly>
		    </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="novelWriter"  name="novelWriter" value="${view.novelWriter}" readonly="readonly"/> 
		      	<span class="input-group-text">작성일</span>
		    	<input type="text" class="regDate form-control" value="<fmt:formatDate value="${view.novelregDate}" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly="readonly">
	      	  </div>
		      <textarea cols="" rows="20" class="content_textarea form-control" id="novelContent"  name="novelContent" readonly="readonly">${view.novelContent}</textarea>
	    </main>
	    
		</div>
	</div>

      		<!-- submit btn 글 작성자와 같을 때만 수정/삭제-->
			<c:if test="${member.userId == view.novelWriter}">
      		<div class="d-flex justify-content-end">
      			<div class="btn-group mb-5">
      				<a href="${path}/board/literature/novel/novelUpdate?novelNo=${view.novelNo}" class="btn btn-outline-success">수정</a>
					<a href="${path}/board/literature/novel/novelDelete?novelNo=${view.novelNo}" class="btn btn-outline-danger">삭제</a>
      				<a class="btn btn-outline-primary" href="${path}/board/literature/novel/novellistPageSearch?num=1" >목록보기</a>
      			</div>
      		</div>
      		</c:if>
      		
      		<c:if test="${member.userId != view.novelWriter}">
      		<div class="d-flex justify-content-end">
      			<div class="btn-group mb-5">
      				<a class="btn btn-outline-primary" href="${path}/board/literature/novel/novellistPageSearch?num=1" >목록보기</a>
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
							<a href="${path}/board/literature/novel/replyModify?novelNo=${view.novelNo}&novelRno=${reply.novelRno}" class="text-nowrap border btn reply_modify_btn" style="height:36px;">수정</a><!-- btn-outline-secondary  -->
							<a href="${path}/board/literature/novel/replyDelete?novelNo=${view.novelNo}&novelRno=${reply.novelRno}" class="text-nowrap border btn reply_delete_btn" style="height:36px;">삭제</a><!-- btn-outline-danger -->
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
<form method="post" action="${path}/board/literature/novel/write">
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
	<input type="hidden" name="novelNo" value="${view.novelNo}"/>
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
	<!-- 
	댓글이 작성되는 현재페이지는 게시물을 순번으로 조회하고 있는 상태 루트/view?bno=? 여러개의 순번중에 인지할수 있도록
	히드 필드를 써줌
	 -->
	<input type="hidden" name="novelNo" value="${view.novelNo}"/>
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


<c:if test="${novelUpdateSuccess}">
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
<%@include file="../../../include/footer.jsp" %>