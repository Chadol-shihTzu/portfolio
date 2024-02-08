<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../include/header.jsp" %>

<div class="container">
   <div class="row">
      <div class="col-md-12">
      	<div class="mt-5 alert alert-light">
	      	<h2 class="alert-heading"><i class="fa-solid fa-square text-center">&nbsp;</i>이벤트 게시판</h2>
	      	<p>이곳은 다양한 이벤트에 참여하고 즐거운 경험을 공유하는 공간입니다. 여러분의 참여로 더욱 풍성한 이벤트가 이루어질 것입니다.</p>
	      	<p class="m-0">게시판에 올라온 이벤트 목록을 확인하세요. 각 이벤트에는 참여 방법과 기간이 명시되어 있습니다.</p>
      	</div>
      	
      	<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        출시기념 이벤트 <span class="badge bg-danger rounded-pill mx-3">진행중 </span>
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <div class="row">
		        	<div class="col">
		        		<h5>환영합니다! <span class="text-danger">[언어의 예술]</span> 출시기념 이벤트 참여 안내</h5>
		        		<p>안녕하세요, <span class="text-danger">[언어의 예술]</span> 커뮤니티 멤버 여러분!<br>
		        		우리는 흥미로운 이야기, 유익한 정보, 그리고 즐거운 교류를 위해 [언어의 예술]을 출시했습니다! <br> 
		        		여러분들과 함께 새로운 경험을 만들어가기 위해 이곳에서 다양한 주제에 대한 이야기를 나누고자 합니다.</p>
		        		<strong>출시기념 이벤트로 여러분을 초대합니다!</strong>
		        		<p class="text-muted">이제 <span class="text-danger">[언어의 예술]</span>에 참여하시면 특별한 혜택과 상품을 받아보실 수 있습니다. <br>
		        		이벤트에 참여하는 방법은 매우 간단합니다. 자세한 내용은 아래를 확인해 주세요.</p>
		        		<strong>이벤트 참여 안내:</strong>
		        		<ol class="list-group list-group-numbered">
		        			<li class="list-group-item">
		        				<strong>커뮤니티 가입 및 소개글 작성: </strong><a href="${path}/member/joinAgree">[로그인 링크]</a>에서 가입하고, 본인을 소개하는 글을 작성해주세요. 다른 회원들과 소통의 시작을 만들어보세요!
		        			</li>
		        			<li class="list-group-item">
		        				<strong>주제별 게시글 참여: </strong>[언어의 예술]에 관심 있는 주제에 대한 게시글에 참여해 주세요. 다양한 의견과 경험을 나누면서 새로운 친구들을 만날 수 있습니다.
		        			</li>
		        			<li class="list-group-item">
		        				<strong>이벤트 기간 동안 활동: </strong>이벤트 기간 동안 적극적으로 활동하면 놀라운 혜택과 경품을 받을 수 있습니다. 매주의 특별한 주제에 참여하여 기회를 놓치지 마세요!
		        			</li>
		        		</ol>
		        		<br>
		        		<strong>이벤트 기간 및 상세내용:</strong>
		        		<ul class="list-group">
		        			<li class="list-group-item">기간: [이벤트 시작일]부터 [이벤트 종료일]까지</li>
		        			<li class="list-group-item">상세내용 및 혜택: <a href="${path}/board/event/mainEvent">[이벤트 페이지 링크]</a>에서 확인해주세요.</li>
		        		</ul>
		        		<br>
		        		<p>우리 모두 [언어의 예술]에서 즐거운 시간을 보내며, 다양한 사람들과 소통하며 성장하는 공간이 되기를 기대합니다!
		        			<br>
		        			함께해주셔서 감사합니다.
							더 많은 정보와 소식은 <a href="#">[커뮤니티 링크]</a>에서 확인해주세요. 언제든지 궁금한 점이나 제안이 있으면 언제든지 말씀해주세요!
							<br>
							감사합니다.
							<br><br>
							[언어의 예술] 운영자 드림.
						</p>
		        	</div>
		        	
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        문학 퀴즈 대회 <span class="badge bg-danger rounded-pill mx-3">진행중 </span>
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        게시글 좋아요 이벤트 <span class="badge bg-danger rounded-pill mx-3">진행중 </span>
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingfour">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
		        이벤트 테스트 <span class="badge bg-secondary rounded-pill mx-3">종료 </span>
		      </button>
		    </h2>
		    <div id="collapsefour" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
		      </div>
		    </div>
		  </div>
		</div>
		
      </div>
   </div>
</div>

<%@include file="../../include/footer.jsp" %>