<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>QnA</li>
        </ol>
        <h2>QnA</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	
    	<c:if test="${member != null}">
		<main>
		    <form method="post" action="${path}/board/qna/replyModify">
				<p class="input-group">
					<label class="form-label">댓글 작성자</label>&nbsp;
					<input type="text" class="form-control" name="writer" readonly="readonly" value="${reply.writer}">
				</p>
				<p><label class="form-label">내용</label></p>
				<textarea class="form-control" rows="5" name="content" style="resize:none;">${reply.content}</textarea>
				<div class="d-flex justify-content-end my-3 ">
					<div class="btn-group">
						<a href="${path}/board/qna/qnaView?qnaNo=${reply.qnaNo}" class="btn btn-outline-danger" >취소</a>
						<input type="hidden" name="qnaNo" value="${reply.qnaNo}"/>
						<input type="hidden" name="qnaRno" value="${reply.qnaRno}"/>
						<input type="submit" class="btn btn-outline-success" value="수정"/>
					</div>
				</div>
			</form>
	    </main> 
	    </c:if>
	    	<c:if test="${member == null}">
		      	<div class="alert alert-danger" role="alert">
				  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;로그인 시 이용가능한 기능입니다.
				</div>
			</c:if>
		</div>
	</div>
</div>


<%@ include file="../../include/footer.jsp" %>