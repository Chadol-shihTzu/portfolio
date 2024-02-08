<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/miniheader.jsp" %>
<div class="container my-5">
   <div class="row">
   	<div class="col-3"></div>
      <div class="col-xl-6 p-5 border">
	      <div class="d-flex justify-content-between">
	      	<h5 class="md-5">비밀번호 찾기</h5>
		      	<div class="btn-group">
						<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
				</div>
			</div>
      	
      	<form method="post" class="mt-5" autocomplete="off" id="idForm">
      		<div class="input-group mb-3">
      			<input type="text" class="form-control" placeholder="아이디 입력" id="userId" name="userId" required="required">
      		</div>

      		<div class="input-group mb-3">
      			<input type="email" class="form-control" placeholder="이메일 입력" id="userEmail" name="userEmail" required="required">
      		</div>


	    <div class="input-group">
	        <input type="submit" class="form-control btn btn-outline-primary" value="인증메일 발송" />
	    </div>
    </form>
    
    <div class="mt-5 input-group d-flex justify-content-center flex-nowrap">
    	<a href="${path}/member/joinAgree" class="login_sub text-dark text-nowrap">회원가입</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    	<a href="${path}/member/login" class="login_sub text-dark text-nowrap">로그인</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    	<a href="${path}/member/findId" class="login_sub text-dark text-nowrap">아이디 찾기</a>
    </div>
      </div>
      <div class="col-3"></div>
   </div>
</div>

</body>
</html>

<%@ include file="../include/minifooter.jsp" %>