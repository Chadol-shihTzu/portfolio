<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>Band</li>
        </ol>
        <h2>Band</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">

      	<div class="tabs-container">
		    <ul class="tabs  d-flex justify-content-center">
		    	<li class="tab active" onclick="showTab('board1')">인기 모임</li>
		        <li class="tab" onclick="showTab('board2')">나의 모임</li>
		        <li class="tab text-nowrap" onclick="showTab('board3')">카테고리별 모임</li>
		    </ul>
		
		    <div class="tab-content active" id="board1">
		        <%@include file="popularClub.jsp" %>
		    </div>
		    
		    <div class="tab-content" id="board2">
		        <%@include file="myClub.jsp" %>
		    </div>
		    
		    <div class="tab-content" id="board3">
		        <%@include file="categoryClub.jsp" %>
		    </div>
		</div>
	</div>
      	<div class="d-flex justify-content-end">
		   <div class="btn-group my-3">
		   	<a href="${path}/board/club/clubCreate" class="btn btn-outline-primary">모임 만들기</a>
		   </div>
		</div>
      	
      </div>
</div>

<%@include file="../../include/footer.jsp" %>