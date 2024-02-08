<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DecimalFormat" %>
    
<%@include file="../include/miniheader.jsp" %>

<div class="container my-5">
   <div class="row">
   	<div class="col-3"></div>
      <div class="col-xl-6 p-5 border">
      	<div class="d-flex justify-content-between">
	      	<h5 class="md-5">회원정보 삭제 (관리자)</h5>
		      	<div class="btn-group">
						<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
				</div>
				
			</div>
			<c:if test="${member != null}">
      	<form role="form" class="mt-5" method="POST" autocomplete="off" >
      	
      		<main>
      		
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">아이디</span>
		    	<input type="text" class="form-control" id="userId" value="${view.userId}" name="userId" disabled>
		    	<span class="input-group-text">이름</span>
		      	<input type="text" class="form-control" id="userName"  name="userName" value="${view.userName}" disabled/> 
		    </div>
	      	  
	      	  
	      	  
	      	  <!-- pc버전 가입일 -->
	      	  <div class="input-group mb-3">
		      	<span class="input-group-text d-none d-md-block">가입일</span>
		    	<input type="text" class="regDate form-control d-none d-md-block" value="<fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/>" disabled>
	      	  </div>
	      	  <!-- 모바일버전 가입일 -->
		      <div class="input-group mb-3 d-md-none">
		      	<span class="input-group-text d-md-none">가입일</span>
		    	<input type="text" class="regDate form-control d-md-none" value="<fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/>" disabled>
	      	  </div>
	      	  
	      	  <p class="text-center">정말로 삭제하시겠습니까?</p>
	    	<div class="btn-group d-flex justify-content-center">
	    		<button type="submit" class="btn btn-outline-danger text-nowrap">예, 삭제합니다.</button>
	    		<a href="${path}/admin/adminmenu?num=1" class="btn btn-outline-success text-nowrap">아니오, 삭제하지 않습니다.</a>
	    	</div>
	    </main>
	  
			
		</form>
		</c:if>
      			<c:if test="${member == null}">
			      	<div class="mt-5 alert alert-danger" role="alert">
					  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;관리자만 이용가능한 기능입니다.
					</div>
				</c:if> 
      	
      </div>
   </div>
</div>


<%@include file="../include/footer.jsp" %>

<script>

</script>