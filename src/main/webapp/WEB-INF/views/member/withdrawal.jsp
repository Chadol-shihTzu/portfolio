<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/miniheader.jsp" %>

<div class="container my-5">
   <div class="row">
   	<div class="col-3"></div>
   	
      <div class="col-xl-6 p-5 border">
	      <div class="d-flex justify-content-between">
	      	<h5 class="md-5">계정 탈퇴</h5>
		      	<div class="btn-group">
						<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
				</div>
			</div>
      <c:if test="${member != null}">
      	<form method="post" class="mt-5" autocomplete="off" onsubmit="deleteForm(event)">
      		<div class="input-group mb-3">
      			<input type="text" class="form-control" value="${member.userId}" id="userId" name="userId" readonly />
      		</div>
      		
      		<div class="input-group mb-3">
      			<input type="password" class="password-form form-control" placeholder="비밀번호 입력" id="userPassword" name="userPassword" required/>
			    <!-- 눈알 누르면 비밀번호 보이게/숨기게 -->
			    <i id="togglePassword" class="eyes fa-regular fa-eye-slash" onclick="togglePasswordVisibility()"></i>		
      		</div>
      		<c:if test="${msg == false}">
      			<p class="text-danger d-none d-md-block">로그인에 실패하였습니다. 패스워드를 다시 입력해주세요.</p>
      			<p class="text-danger d-block d-md-none mb-1">로그인에 실패하였습니다.</p>
      			<p class="text-danger d-block d-md-none text-nowrap">패스워드를 다시 입력해주세요.</p>
      		</c:if>
      			<div class="d-flex btn-group">
      				<a href="${path}/member/mypage" class="btn btn-outline-warning">이전</a>
      				<input type="submit" class="btn btn-outline-danger" value="회원탈퇴" >	
      			</div>	 
      			
		       

    	</form>
    	</c:if>   
   				<c:if test="${member == null}">
			      	<div class="mt-5 alert alert-danger" role="alert">
					  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;로그인 시 이용가능한 기능입니다.
					</div>
				</c:if> 

      </div>
      <div class="col-3"></div>
   </div>
</div>

<%@ include file="../include/minifooter.jsp" %>
