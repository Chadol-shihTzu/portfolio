<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
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
    	<c:if test="${member != null}">
      	<form role="form" method="post" class="d-flex justify-content-center">
      	<div class="mb-2" style="width:344px;">
      		<div class="input-group mb-3">
		    	<span class="input-group-text">작성자</span>
		    	<input type="text" class="form-control" id="writer" value="${reply.writer}" name="writer">
		    </div>
		    <div class="input-group mb-3">
		    	<span class="input-group-text">내용</span>
		    	<textarea class="form-control" rows="12" cols="" id="content" name="content">${reply.content}</textarea>
		    </div>
		    <p class="text-center">정말로 삭제하시겠습니까?</p>
	    	<div class="btn-group">
	    		<button type="submit" class="btn btn-outline-danger text-nowrap">예, 삭제합니다.</button>
	    		<input type="hidden" name="hotNo" value="${reply.hotNo}"/>
		   		<input type="hidden" name="hotRno" value="${reply.hotRno}"/>
	    		<button id="cancel_btn" class="btn btn-outline-success text-nowrap">아니오, 삭제하지 않습니다.</button>
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

<script>
// 폼을 변수에 저장
var formObj = $("form[role='form']"); 

// 취소 버튼 클릭
$("#cancel_btn").click(function(){   
 formObj.attr("action", "/jdh/board/hotdeal/hotdealView?hotNo=" + $("#hotNo").val());
 formObj.attr("method", "get");    
 
});
</script>

<%@ include file="../../include/footer.jsp" %>