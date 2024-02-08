<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li><a href="${path}/board/literature/essay/essayllistPageSearch?num=1">essay</a></li>
          <li>essay Update</li>
        </ol>
        <h2>essay</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	<c:if test="${member != null}">
      	<form method="POST" class="was-validated">
      	
      		<main>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">제목</span>
		    	<input type="text" class="form-control" id="essayTitle" value="${view.essayTitle}" name="essayTitle">
		    </div>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">인상 깊은 구절</span>
		    	<input type="text" class="form-control" id="essayShortTitle" value="${view.essayShortTitle}" name="essayShortTitle">
		    </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="essayWriter"  name="essayWriter" value="${view.essayWriter}" readonly="readonly"/> 
		      	<span class="input-group-text">작성일</span>
		    	<input type="text" class="regDate form-control" value="<fmt:formatDate value="${view.essayregDate}" pattern="yyyy-MM-dd"/>" readonly="readonly">
	      	  </div>
		      <textarea cols="" rows="20" class="content_textarea form-control" id="essayContent"  name="essayContent">${view.essayContent}</textarea>
	    </main>
	    	<div class="d-flex justify-content-end">
	    		<div class="btn-group mb-5">
	    			<input type="submit" class="btn btn-outline-success" value="수정" />
	    			<a class="btn btn-outline-danger" href="${path}/board/literature/essay/essayView?essayNo=${view.essayNo}" >취소</a>
	    		</div>
	    		
			</div>
		</form>
      	</c:if>
      		<c:if test="${member == null}">
		      	<div class="alert alert-danger" role="alert">
				  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;로그인 시 이용가능한 기능입니다.
				</div>
			</c:if>
      </div>
   </div>
</div>



<%@include file="../../../include/footer.jsp" %>