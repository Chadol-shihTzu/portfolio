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
          <li>announce Delete</li>
        </ol>
        <h2>announce</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">

      	<form role="form" method="POST" class="d-flex justify-content-center" >
      	
      	<div class="mb-2" style="width:344px;">
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">번호</span>
		    	<input type="text" class="form-control" id="annoNo" value="${delete}" name="annoNo">
		    </div>
		    <p class="text-center">정말로 삭제하시겠습니까?</p>
	    	<div class="btn-group">
	    		<button type="submit" class="btn btn-outline-danger text-nowrap">예, 삭제합니다.</button>
	    		<button id="cancel_btn" class="btn btn-outline-success text-nowrap">아니오, 삭제하지 않습니다.</button>
	    	</div>
	    </div>
	    	
	    	
	    	 <script>
		    
			    // 폼을 변수에 저장
			    var formObj = $("form[role='form']"); 
			    
			    // 취소 버튼 클릭
			    $("#cancel_btn").click(function(){   
			     formObj.attr("action", "/jdh/board/announce/announceView?annoNo=" + $("#annoNo").val());
			     formObj.attr("method", "get");  
			     formObj.submit();     
			     
			    });
			    </script>

		</form>
      	
      	
      </div>
   </div>
</div>

<%@include file="../../include/footer.jsp" %>