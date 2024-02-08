<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>announce</li>
        </ol>
        <h2>announce</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	
		<main>
			<div class="input-group mb-3">
		    	 <span class="input-group-text">번호</span>
		    	<input type="text" class="form-control" id="annoNo" value="${view.annoNo}" name="annoNo" readonly>
		    </div>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">제목</span>
		    	<input type="text" class="form-control" id="annoTitle" value="${view.annoTitle}" name="annotitle" readonly>
		    </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="annoWriter"  name="annoWriter" value="${view.annoWriter}" readonly="readonly"/> 
		      	<span class="input-group-text d-none d-md-block">작성일</span>
		    	<input type="text" class="regDate form-control d-none d-md-block" value="<fmt:formatDate value="${view.annoregDate}" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly="readonly">
	      	  </div>
	      	  <div class="input-group mb-3">
	      	  	<span class="input-group-text d-block d-md-none">작성일</span>
		    	<input type="text" class="regDate form-control d-block d-md-none" value="<fmt:formatDate value="${view.annoregDate}" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly="readonly">
	      	  </div>
		      <textarea cols="" rows="20" class="content_textarea form-control" id="annoContent"  name="annoContent" readonly="readonly">${view.annoContent}</textarea>
	    </main>
	    
		</div>
	</div>

      		<!-- submit btn 글 작성자와 같을 때만 수정/삭제-->
			<c:if test="${member.userId == view.annoWriter}">
      		<div class="d-flex justify-content-end">
      			<div class="btn-group mb-5">
      				<a id="modify_btn" href="${path}/board/announce/announceUpdate?annoNo=${view.annoNo}" class="btn btn-outline-success">수정</a>
					<a id="delete_btn" href="${path}/board/announce/announceDelete?annoNo=${view.annoNo}" class="btn btn-outline-danger">삭제</a>
      				<a class="btn btn-outline-primary" href="${path}/board/announce/annolistPageSearch?num=1" >목록보기</a>
      			</div>
      		</div>
			</c:if>
			<c:if test="${member.userId != view.annoWriter}">
      		<div class="d-flex justify-content-end">
      			<div class="btn-group mb-5">
      				<a class="btn btn-outline-primary" href="${path}/board/announce/annolistPageSearch?num=1" >목록보기</a>
      			</div>
      		</div>
			</c:if>
</div>
      
         <script>
   
   // 폼을 변수에 저장
   var formObj = $("form[role='form']");
   
   // 수정 버튼 클릭
   $("#modity_btn").click(function(){
    
    formObj.attr("action", "/board/announce/announceUpdate");
    formObj.attr("method", "get");    
    formObj.submit();       
    
   });
   
   
   // 삭제 버튼 클릭
   $("#delete_btn").click(function(){
    
    formObj.attr("action", "/board/announce/announceDelete");
    formObj.attr("method", "get");    
    formObj.submit();
    
   });
   
   <c:if test="${annoUpdateSuccess}">
   alert("글 수정이 완료되었습니다.");
</c:if>
   </script>

<%@include file="../../include/footer.jsp" %>