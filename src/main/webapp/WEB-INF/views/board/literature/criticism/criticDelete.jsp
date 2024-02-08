<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li><a href="${path}/board/literature/criticism/criticllistPageSearch?num=1">critic</a></li>
          <li>criticism Delete</li>
        </ol>
        <h2>criticism</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	<div class="mt-5 alert alert-light">
	      	<h2 class="alert-heading"><i class="fa-solid fa-square text-center">&nbsp;</i>비평 게시판 삭제</h2>
	      	<p>문학, 영화, 미술, 음악, 드라마 등 다양한 예술 형태에 대한 비평을 다룹니다. 여러분의 관심 있는 주제에 대한 의견을 자유롭게 나누어주세요.</p>
	      	<p class="m-0">우리는 공존과 배움을 중시합니다. 따라서 비평글은 서로에게 새로운 시각을 제공하고 예술을 더 깊게 이해할 수 있는 기회로 삼을 것을 권장합니다.</p>
    	</div>
    	<c:if test="${member != null}">
      	<form role="form" method="POST" class="d-flex justify-content-center">
      	
      	<div class="mb-2" style="width:344px;">
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">번호</span>
		    	<input type="text" class="form-control" id="criticNo" value="${delete}" name="criticNo">
		    </div>
		    <p class="text-center">정말로 삭제하시겠습니까?</p>
	    	<div class="btn-group">
	    		<button type="submit" class="btn btn-outline-danger text-nowrap">예, 삭제합니다.</button>
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
     <c:if test="${deleteSuccess}">
         alert("삭제가 완료되었습니다.");
     </c:if>
     
  // 폼을 변수에 저장
	    var formObj = $("form[role='form']"); 
	    
	    // 취소 버튼 클릭
	    $("#cancel_btn").click(function(){   
	     formObj.attr("action", "/jdh/board/literature/criticism/criticView?criticNo=" + $("#criticNo").val());
	     formObj.attr("method", "get");  
	     formObj.submit();     
	     
	    });
</script>

<%@include file="../../../include/footer.jsp" %>