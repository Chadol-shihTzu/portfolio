<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>essay</li>
        </ol>
        <h2>essay</h2>
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
	      				<col style="width:80%" />
	      			</colgroup>
	      			
	      			<tr>
	      				<th>제목</th>
	      				<td>
	      					<input type="text" class="form-control" name="essayTitle" placeholder="제목을 입력해주세요." maxlength="50" required/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th class="text-nowrap">인상 깊은 구절</th>
	      				<td>
	      					<input type="text" class="form-control" name="essayShortTitle" placeholder="한문장으로 입력해주세요." maxlength="50" required/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>작성자</th>
	      				<td>
	      					<input type="text" class="form-control" name="essayWriter" value="${member.userId}" readonly="readonly"/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>내용</th>
	      				<td>
	      					<textarea rows="20" cols="" class="content_textarea form-control" name="essayContent" placeholder="내용을 입력해주세요." required></textarea>
	      				</td>
	      			</tr>
	      		</table>      		
	
		      	<div class="d-flex justify-content-end">
				   <div class="btn-group mb-5">
				   	<input type="submit" value="등록" class="btn btn-outline-primary" />
				   	<a href="${path}/board/literature/essay/essaylistPageSearch?num=1" class="btn btn-outline-danger">취소</a>
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

<script>

</script>

<%@include file="../../../include/footer.jsp" %>