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

      
      <c:if test="${member != null}">
      	<form method="post" class="was-validated" autocomplete="off">
	      		<table class="table">
	      			<colgroup>
	      				<col style="width:20%" />
	      				<col style="width:40%" />
	      				<col style="width:40%" />
	      			</colgroup>
	      			<tr>
	      				<th>사진</th>
	      				<td colspan="2">
	      					<input type="file" class="form-control" name="clubFile" required/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th class="text-nowrap">모임 이름</th>
	      				<td colspan="2">
	      					<input type="text" class="form-control" name="clubTitle" placeholder="모임 이름" required/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th class="text-nowrap">카테고리</th>
	      				<td colspan="2">
	      					<input type="text" class="form-control" name="clubWriter" placeholder="예) #abc #123 #언어" required/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>소개글</th>
	      				<td colspan="2">
	      					<textarea rows="10" cols="" class="form-control" name="clubContent" placeholder="소개를을 작성해주세요." required></textarea>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th class="text-nowrap">모임 유형</th>
	      				<td>
      						<div class="btn-group" role="group">
				                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				                <label class="btn btn-outline-primary" for="btnradio1">Private</label>
				                <div class="border px-3" style="display: flex; align-items: center; border-radius: 0 0.25rem 0.25rem 0;">
							    	<span class="d-none d-lg-block">초대된 회원만 가입이 가능합니다.</span>
								</div>
				            </div>     	
				        </td>
				        <td>
				            <div class="btn-group" role="group">
				                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked>
				                <label class="btn btn-outline-primary" for="btnradio2">Public</label>
				                <div class="border px-3" style="display: flex; align-items: center; border-radius: 0 0.25rem 0.25rem 0;">
							    	<span class="text-nowrap d-none d-lg-block">모든 회원이 볼 수 있지만 가입된 회원만 활동이 가능합니다.</span>
								</div>
				            </div>  
				        </td>
	      			</tr>
	      		</table>      		
	
		      	<div class="d-flex justify-content-end">
				   <div class="btn-group my-3">
				   	<input type="submit" value="등록" class="btn btn-outline-primary" />
				   	<a href="${path}/board/club/clubMain" class="btn btn-outline-danger">취소</a>
				   </div>
				</div>	
	      	</form>
      	</c:if>
      	
      	<c:if test="${member == null}">
		      	<div class="alert alert-danger" role="alert">
				  <i class="fa-solid fa-triangle-exclamation"></i>&nbsp;로그인 시 이용가능한 기능입니다.
				</div>
			</c:if>
      	
      </div>
   </div>
</div>

<%@include file="../../include/footer.jsp" %>