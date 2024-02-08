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
	      	<h5 class="md-5">회원정보 변경 (관리자)</h5>
		      	<div class="btn-group">
						<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
				</div>
				
			</div>
			<c:if test="${member != null}">
      	<form role="form" class="mt-5" method="POST" autocomplete="off" >
      	
      		<main>
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">관리자 여부</span>
		    	<input type="text" class="form-control" id="verify" value="${view.verify}" name="verify" required> 
		    </div>
      		
      		<div class="input-group mb-3">
		    	 <span class="input-group-text">아이디</span>
		    	<input type="text" class="form-control" id="userId" value="${view.userId}" name="userId" disabled>
		    	<span class="input-group-text">이름</span>
		      	<input type="text" class="form-control" id="userName"  name="userName" value="${view.userName}" required/> 
		    </div>
		    
				<div class="input-group mb-3 ">
		    	 <span class="input-group-text ">비밀번호</span>
		    	<input type="password" class="form-control" id="userPassword" name="userPassword" value="${view.userPassword}" required>
		    	<i id="togglePassword" class="eyes fa-regular fa-eye-slash" onclick="togglePasswordVisibility()"></i>
			    </div>
			    <div class="input-group mb-3 ">	
			    	 <span class="input-group-text ">비밀번호 확인</span>
			    	<input type="password" class="form-control" id="userRePassword" name="userRePassword" value="${view.userRePassword}" required>
			    	<i id="toggleRePassword" class="eyes fa-regular fa-eye-slash" onclick="toggleRePasswordVisibility()"></i>
			    </div>
			    <p id="passwordMismatch" style="color: red;"></p>
				
				
	      	  <div class="input-group mb-3">
		      	<span class="input-group-text">생년월일</span>
		      	<input type="text" class="form-control" id="userBirth"  name="userBirth" value="${view.userBirth}" required/>
		      </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">연락처</span>
		      	<input type="text" class="form-control" id="userPhone"  name="userPhone" value="${view.userPhone}" required/> 
	      	  </div>
		      <div class="input-group mb-3">
    			<span class="input-group-text">성별</span>
		      	<input type="text" class="form-control" id="userGender"  name="userGender" value="${view.userGender}" required />
	      	  </div>
	      	  
	      	  <div class="input-group mb-3">
		      	<span class="input-group-text">우편번호</span>
		      	<input type="text" class="form-control address_input_1" id="userAddr1"  name="userAddr1" value="${view.userAddr1}" required/>
		      	<a class="btn btn-outline-secondary addr_Check_Btn" onclick="go_daum_address()">주소 검색</a>
		      </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">도로명주소</span>
		      	<input type="text" class="form-control address_input_2" id="userAddr2"  name="userAddr2" value="${view.userAddr2}" required/> 
		      </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">상세주소</span>
		      	<input type="text" class="form-control address_input_3" id="userAddr3"  name="userAddr3" value="${view.userAddr3}" required/> 
	      	  </div>
	      	  <div class="input-group mb-3">
		      	<span class="input-group-text">이메일</span>
		      	<input type="email" class="form-control" id="userEmail"  name="userEmail" value="${view.userEmail}" required/> 
		      	<a class="btn btn-outline-secondary phone_Check_Btn" id="userPhone">인증요청</a>
	      	  </div>
	      	  <div class="input-group mb-3">
      			<input type="text" class="form-control" placeholder="인증번호를 입력해주세요." id="" name="" readonly="readonly">
      			<a class="btn btn-outline-secondary email_Check_Btn" id="userPhone">확인</a>
      		  </div>
	      	  
	      	  <!-- pc버전 포인트/가입일 -->
	      	  <div class="input-group mb-3">
		      	<span class="input-group-text d-none d-md-block">나의 포인트</span>
		      	<input type="number" class="form-control d-none d-md-block" name="userPoint" value="<fmt:formatNumber value="${view.userPoint}" pattern="###,###,###"></fmt:formatNumber>"> 
		      	<span class="input-group-text d-none d-md-block">가입일</span>
		    	<input type="text" class="regDate form-control d-none d-md-block" value="<fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd"/>" disabled>
	      	  </div>
	      	  <!-- 모바일버전 포인트/가입일 -->
	      	  <div class="input-group mb-3 d-md-none">
		      	<span class="input-group-text d-md-none">나의 포인트</span>
		      	<input type="number" class="form-control d-md-none" name="userPoint" value="<fmt:formatNumber value="${view.userPoint}" pattern="###,###,###"></fmt:formatNumber> " />
		      </div>
		      <div class="input-group mb-3 d-md-none">
		      	<span class="input-group-text d-md-none">가입일</span>
		    	<input type="text" class="regDate form-control d-md-none" value="<fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd"/>" disabled>
	      	  </div>
	    </main>
	    	
	    		<div class="d-flex btn-group">
	    			<a id="cancel_btn" class="btn btn-outline-danger" href="${path}/admin/adminmenu?num=1" >취소</a>
					<input type="submit" class="btn btn-outline-success" value="수정" />
	    		</div>
	    		
	  			
			
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