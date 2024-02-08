<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container">
   <div class="row">
      <div class="col-12">
     	<h1 class="mt-5 text-center">이벤트</h1>
     	<hr>
     	<div class="row row-cols-1 row-cols-md-3 g-4">
			  <div class="col">
			    <div class="card card_bottom  shadow o-hidden" onclick="redirectToEvent1()">
			      <img src="resources/img/peaceful.jpg" width="250" height="350" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="text-nowrap card-title">언어의 예술 홈페이지 출시 기념 이벤트!</h5>
			        <p class="card-text text-muted">출시 기념 이벤트 내용을 작성하는 곳입니다.</p>
			      </div>
			      <div class="card-footer">
			        <a href="${path}/board/event/mainEvent" class="a-under text-muted">자세히보기&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
			      </div>
			    </div>
			  </div>
			  
			   <div class="col">
			    <div class="card card_bottom  shadow o-hidden" onclick="redirectToEvent2()">
			      <img src="resources/img/writing.jpg" width="250" height="350" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="text-nowrap card-title">언어의 예술 홈페이지 출시 기념 이벤트!</h5>
			        <p class="card-text text-muted">출시 기념 이벤트 내용을 작성하는 곳입니다.</p>
			      </div>
			      <div class="card-footer">
			        <a href="${path}/board/event/mainEvent" class="a-under text-muted">자세히보기&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
			      </div>
			    </div>
			  </div>
			  
			   <div class="col">
			    <div class="card card_bottom shadow o-hidden" onclick="redirectToEvent3()">
			      <img src="resources/img/like.jpg" width="250" height="350" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="text-nowrap card-title">게시글 좋아요 이벤트!</h5>
			        <p class="card-text text-muted">게시글 좋아요 이벤트 내용을 작성하는 곳입니다.</p>
			      </div>
			      <div class="card-footer">
			        <a href="${path}/board/event/mainEvent" class="a-under text-muted">자세히보기&nbsp;<i class="fa-solid fa-arrow-right"></i></a>
			      </div>
			    </div>
			  </div>
			  
			  
			</div>
			<div class="d-grid col-6 mx-auto mb-3">
				<a class="mt-3 btn btn-outline-secondary" href="${path}/board/event/mainEvent">전체보기</a>
			</div>
      </div>
	</div>
</div>
</main>