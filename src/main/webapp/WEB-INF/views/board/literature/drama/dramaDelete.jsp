<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li><a href="${path}/board/literature/drama/dramallistPageSearch?num=1">drama</a></li>
          <li>drama Delete</li>
        </ol>
        <h2>drama</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	<div class="mt-5 alert alert-light">
	      	<h2 class="alert-heading"><i class="fa-solid fa-square text-center">&nbsp;</i>희곡 게시판 삭제</h2>
	      	<p>이곳은 연극의 아름다움과 감동을 공유하며, 다양한 희곡 작품들을 즐길 수 있는 특별한 공간입니다.</p>
	      	<p class="m-0">각자의 연기력과 감성을 펼쳐, 연극의 세계에서 여러분만의 무대를 만들어 보세요.</p>
	    </div>
    	<c:if test="${member != null}">
      	<form role="form" method="POST" class="d-flex justify-content-center">
      	
      	<div class="mb-2" style="width:344px;">
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">번호</span>
		    	<input type="text" class="form-control" id="dramaNo" value="${delete}" name="dramaNo">
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
	     formObj.attr("action", "/jdh/board/literature/drama/dramaView?dramaNo=" + $("#dramaNo").val());
	     formObj.attr("method", "get");  
	     formObj.submit();     
	     
	    });
</script>

<%@include file="../../../include/footer.jsp" %>