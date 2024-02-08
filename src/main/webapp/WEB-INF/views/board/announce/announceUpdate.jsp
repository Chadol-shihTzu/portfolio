<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
           <li><a href="${path}/board/announce/annolistPageSearch?num=1">announce</a></li>
          <li>announce Update</li>
        </ol>
        <h2>announce</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	<form method="POST" class="was-validated">
      	
      		<main>
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">번호</span>
		    	<input type="text" class="form-control" id="annoNo" value="${view.annoNo}" name="annoNo" readonly>
		    </div>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">제목</span>
		    	<input type="text" class="form-control" id="annoTitle" value="${view.annoTitle}" name="annoTitle">
		    </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="annoWriter"  name="annoWriter" value="${view.annoWriter}" readonly="readonly"/> 
		      	<span class="input-group-text d-none d-md-block">작성일</span>
		    	<input type="text" class="regDate form-control d-none d-md-block" value="<fmt:formatDate value="${view.annoregDate}" pattern="yyyy-MM-dd"/>" readonly="readonly">
	      	  </div>
	      	  <div class="input-group mb-3">
	      	  	<span class="input-group-text d-block d-md-none">작성일</span>
		    	<input type="text" class="regDate form-control d-block d-md-none" value="<fmt:formatDate value="${view.annoregDate}" pattern="yyyy-MM-dd hh:mm:ss"/>" readonly="readonly">
	      	  </div>
		      <textarea cols="" rows="20" class="content_textarea form-control" id="annoContent"  name="annoContent">${view.annoContent}</textarea>
	    </main>
	    	<div class="d-flex justify-content-end">
	    		<div class="btn-group mb-5">
	    			<input type="submit" class="btn btn-outline-success" value="수정" />
	    			<a id="cancel_btn" class="btn btn-outline-danger" href="${path}/board/announce/announceView?annoNo=${view.annoNo}" >취소</a>
	    		</div>
	    		<script>
				    // 폼을 변수에 저장
				    var formObj = $("form[role='form']"); 
				    
				    // 취소 버튼 클릭
				    $("#cancel_btn").click(function(){   
				     formObj.attr("action", "/board/announce/announceView?annoNo=" + $("#annoNo").val());
				     formObj.attr("method", "get");  
				     formObj.submit();
				    });
				    </script>
			</div>
		</form>
      	
      	
      </div>
   </div>
</div>

<%@include file="../../include/footer.jsp" %>