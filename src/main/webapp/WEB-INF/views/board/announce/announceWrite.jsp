<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>announce</li>
        </ol>
        <h2>announce</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">

      	<c:if test="${member.verify == 9}">
	      	<form method="post" class="was-validated" autocomplete="off">
	      		<table class="table">
	      			<colgroup>
	      				<col style="width:20%" />
	      				<col style="width:80%" />
	      			</colgroup>
	      			<tr>
	      				<th>제목</th>
	      				<td>
	      					<input class="form-control" name="annoTitle" required/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>작성자</th>
	      				<td>
	      					<input class="form-control" name="annoWriter" value="${member.userId}" readonly="readonly"/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>내용</th>
	      				<td>
	      					<textarea rows="20" cols="" class="content_textarea form-control" name="annoContent" required></textarea>
	      				</td>
	      			</tr>
	      		</table>      		
	
	      		
		      	<div class="d-flex justify-content-end">
				   <div class="btn-group mb-5">
				   	<input type="submit" value="등록" class="btn btn-outline-primary" />
				   	<a href="${path}/board/announce/annolistPageSearch?num=1" class="btn btn-outline-danger">취소</a>
				   </div>
				</div>
				
	      	</form>
      	</c:if>
      	
      	
      		<c:if test="${member.verify != 9}">
		      	<div class="alert alert-danger" role="alert">
				  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;관리자만 이용가능한 기능입니다.
				</div>
			</c:if>
      	
      	
      </div>
   </div>
</div>


<%@include file="../../include/footer.jsp" %>