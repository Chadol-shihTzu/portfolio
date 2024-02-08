<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>Picture</li>   
        </ol>
        <h2>Picture</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	
      	<c:if test="${member != null}">
	      	<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
	      	
	      		<table class="table">
	      			<colgroup>
	      				<col style="width:20%" />
	      				<col style="width:80%" />
	      			</colgroup>
	      			<tr>
	      				<th class="text-nowrap">카테고리</th>
	      				<td>
	      					<input type="text" class="form-control" name="photoCategory" placeholder="카테고리를 입력해주세요." maxlength="50" required />
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>제목</th>
	      				<td>
	      					<input type="text" class="form-control" name="photoTitle" placeholder="제목을 입력해주세요." maxlength="50" required/>
	      				</td>
	      			</tr>
	      			
	      			<tr>
	      				<th>작성자</th>
	      				<td>
	      					<input type="text" class="form-control" name="photoWriter" value="${member.userId}" readonly="readonly"/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>내용</th>
	      				<td>
	      					<textarea class="content_textarea" id="photoDes" name="photoDes" placeholder="내용을 입력해주세요."></textarea>
	      					<script>
	      					
	      					ClassicEditor
	      					.create(document.querySelector('#photoDes'),{
	      						language:'ko',
	      						extraPlugins: [MyCustomUploadAdapterPlugin]
	      						
	      					}).then(editor => {
	      						window.editor = editor;
	      					}).catch(error => {
	      						console.error(error);
	      					});
	      					
	      					
	      					</script>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>사진</th>
	      				<td>
	      					<input type="file" class="form-control" id="photoImg" name="file" placeholder="사진을 입력해주세요." />
	      					<div class="select_img mt-3"><img src="" /></div>
	      				</td>
	      			</tr>
	      		</table>  
	      		<script>
					$('#photoImg').change(function(){
						if(this.files && this.files[0]){
							var reader = new FileReader;
							reader.onload = function(data){
								$(".select_img img").attr("src", data.target.result).width(400);
							}
							reader.readAsDataURL(this.files[0]);
						} 
					 });
				</script>
					
					<%= request.getRealPath("/") %><!-- 실제경로 추가 -->    	
	      	
	      			
	
		      	<div class="d-flex justify-content-end">
				   <div class="btn-group mb-5">
				   	<input type="submit" value="등록" class="btn btn-outline-primary" />
				   	<a href="${path}/board/photo/photolistPageSearch?num=1" class="btn btn-outline-danger">취소</a>
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

<%@include file="../../include/footer.jsp" %>