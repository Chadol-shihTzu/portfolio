<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/miniheader.jsp" %>
<div class="container my-5">
   <div class="row">
   <div class="col-3">
   </div>
   <div class="col-xl-6 p-5 border">
   		<div class="d-flex justify-content-between">
	      	<p class="md-1 text-nowrap d-block d-md-none">언어의예술 <br> 서비스 약관에 동의해 주세요.</p>
            <h5 class="md-5 text-nowrap d-none d-md-block">언어의예술 <br> 서비스 약관에 동의해 주세요.</h5>
	      	<div class="btn-group">
				<a class="btn btn-outline-warning" href="${path}" style="height:38px">Home</a>
			</div>
		</div>
		      	<!-- 만약 모두 동의 누르면 다 체크되게 / 필수항목이 다 체크되면 동의버튼 활성화. 
		      	
		      	-->
		      	
		      		<div class="form-group mt-3 mt-md-5">
		      			<div>
		      				<input type="checkbox" name="agree_All" onclick="checkAll(this)" /> 
		      				<span>모두 동의합니다.</span>
		      				<p class="agreeAll ps-3">
		      					전체 동의는 필수 및 선택정보에 대한 동의도 포함되어 있으며, 
		      					<br>개별적으로도 동의를 선택하실 수 있습니다. 
		      					<br>선택항목에 대한 동의를 거부하시는 경우에도 서비스는 이용이 가능합니다.
		      				</p>
		    			</div>
		    			<hr>
		    			<div class="d-flex my-3">
			    			<input type="checkbox" class="optioned_Agr" name="age_Agr" />
			    			&nbsp;<span class="w-100">만 14세 이상입니다.</span>
		    			</div>
		    			<!-- 언어의예술 약관 -->
		    			<div class="d-flex my-3">
			    			<input type="checkbox" class="required_Agr" name="yak_Agr" />
			    			&nbsp; <span class="w-100">[필수] 언어의예술 약관</span>
			    			<!-- Button trigger modal -->
			    			<button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						  		<i class="fa-solid fa-angle-right"></i>
							</button>
		    			</div>
		    			
						<!-- Modal1 -->
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="staticBackdropLabel">언어의 예술 약관</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <h4>제 1 장 환영합니다!</h4>
									<ul>
										<li>제 1조 (목적)</li>
										<li>제 2조 (약관의 효력 및 변경)</li>
										<li>제 3조 (약관 외 준칙)</li>
										<li>제 4조 (용어의 정의)</li>
									</ul>
									
									<h4>제 2장 언어의예술 계정 이용계약</h4>
									<ul>
										<li>제 5조 (계약의 성립)</li>
										<li>제 6조 (언어의예술 계정 이용의 제한)</li>
									</ul>
									
									<h4>제 3장 언어의예술 계정 이용</h4>
									<ul>
										<li>제 7조 (언어의예술 계정 제공)</li>
										<li>제 8조 (언어의예술 계정 서비스의 변경 및 종료)</li>
										<li>제 9조 (언어의예술 계정 관리)</li>
										<li>제 10조 (인증서비스)</li>
									</ul>
				
									<h4>제 4장 계약당사자의 의무</h4>
									<ul>
										<li>제 11조 (회원의 의무)</li>
										<li>제 12조 (개인정보의 보호)</li>
										<li>제 13조 (회원에 대한 통지 및 공지)</li>
									</ul>
									
									<h4>제 5장 이용계약 해지</h4>
									<ul>
										<li>제 14조 (이용계약 해지)</li>
									</ul>
						      </div>
						      
						    </div>
						  </div>
						</div>
		    			<!-- 개인정보 수집 및 이용 동의 -->
		    			<div class="d-flex my-3">
			    			<input type="checkbox" class="required_Agr" name="info_Agr" />
			    			&nbsp; <span class="w-100">[필수] 개인정보 수집 및 이용 동의</span>
			    			<button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
						  		<i class="fa-solid fa-angle-right"></i>
							</button>
		    			</div>
		    			<!-- Modal2 -->
						<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="staticBackdropLabel">개인정보 수집 및 이용 동의</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <ul>
						        	<li>개인정보 수집 목적: 어떤 목적으로 개인정보를 수집하는지 명시합니다. 예를 들어, 서비스 제공, 연락, 정보 제공 등이 될 수 있습니다.</li>
						        	<li>수집하는 개인정보 항목: 어떤 종류의 개인정보를 수집하는지 명시합니다. 예를 들어, 이름, 이메일 주소, 전화번호 등이 될 수 있습니다.</li>
									<li>개인정보의 이용목적: 수집한 개인정보를 어떤 목적으로 사용하는지 명시합니다. 예를 들어, 서비스 제공, 연락 및 안내, 통계 분석 등이 될 수 있습니다.</li>
									<li>보유 기간: 개인정보를 얼마 동안 보유할 것인지 명시합니다.</li>
									<li>동의 철회 방법: 사용자가 언제든지 동의를 철회할 수 있는 방법을 제공합니다.</li>
									<li>보안 조치: 개인정보의 보안을 위해 어떠한 조치를 취하는지 명시합니다.</li>
									<li>관련 법적 근거: 개인정보 처리의 법적 근거에 대해 설명합니다.</li>
						        </ul>
						      </div>
						    </div>
						  </div>
						</div>
		      		</div>
		      		
		      		<!-- submit btn -->
		      			<div class="d-flex btn-group mt-5">
		      				<a class="btn btn-outline-success" id="agreeButton" onclick="onAgreeButtonClick()" >동의</a>
		      			</div>
		
	      </div>
      <div class="col-3">
	  </div>
   </div>
</div>

<%@ include file="../include/minifooter.jsp" %>