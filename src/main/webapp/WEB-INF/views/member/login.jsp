<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/miniheader.jsp" %>

<div class="container my-5">
   <div class="row">
   	<div class="col-3"></div>
      <div class="col-xl-6 p-5 border">
	      <div class="d-flex justify-content-between">
	      	<h5 class="md-5">로그인</h5>
		      	<div class="btn-group">
						<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
				</div>
			</div>
      
      	<form method="post" class="mt-5">
      		<div class="input-group mb-3">
      			<input type="text" class="form-control" placeholder="아이디 입력" id="userId" name="userId" required="required">
      		</div>
      		
      		<div class="input-group mb-3">
      			<input type="password" class="password-form form-control" placeholder="비밀번호 입력" id="userPassword" name="userPassword" required/>
			    <!-- 눈알 누르면 비밀번호 보이게/숨기게 -->
			    <i id="togglePassword" class="eyes fa-regular fa-eye-slash" onclick="togglePasswordVisibility()"></i>		
      		</div>
      		<c:if test="${msg == false}">
      			<p class="text-danger d-none d-md-block">로그인에 실패하였습니다. 아이디 또는 패스워드를 다시 입력해주세요.</p>
      			<p class="text-danger d-block d-md-none mb-1">로그인에 실패하였습니다.</p>
      			<p class="text-danger d-block d-md-none text-nowrap">아이디 또는 패스워드를 다시 입력해주세요.</p>
      		</c:if>
      				    
		        <input type="submit" class="form-control btn btn-outline-primary" value="로그인" />

    	</form>
   
    
    <div class="input-group">
    	<input type="checkbox">&nbsp;자동 로그인
    </div>
    
    <div class="mt-5 input-group d-flex justify-content-center flex-nowrap">
    	<a href="${path}/member/joinAgree" class="login_sub text-dark text-nowrap">회원가입</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    	<a href="${path}/member/findId" class="login_sub text-dark text-nowrap">아이디 찾기</a>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
    	<a href="${path}/member/findPassword" class="login_sub text-dark text-nowrap">비밀번호 찾기</a>
    </div>
    
    <div class="mt-5">
    	<div class="row">
    		<div class="col-12 col-sm-4">
    			<a class="btn btn-kakao btn-block p-3 text-nowrap w-100" href="#"><i class="fa-solid fa-comment">&nbsp;카카오 로그인</i></a>
    		</div>
    		<div class="col-12 col-sm-4">
    			<a class="btn btn-naver btn-block p-3 text-nowrap w-100" href="#"><i class="fa-solid fa-n">&nbsp;네이버 로그인</i></a>
    		</div>
    		<div class="col-12 col-sm-4">
    			<a class="btn btn-google btn-block p-3 text-nowrap w-100" href="#"><i class="fab fa-google fa-fw w-100">&nbsp;구글 로그인</i></a>
    		</div>   		
    	</div>
    </div>

      </div>
      <div class="col-3"></div>
   </div>
</div>

</body>
</html>

<%@ include file="../include/minifooter.jsp" %>