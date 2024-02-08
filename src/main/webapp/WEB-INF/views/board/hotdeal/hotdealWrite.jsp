<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>Hotdeal</li>
        </ol>
        <h2>Hotdeal</h2>
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
	      				<col style="width:15%" />
	      				<col style="width:85%" />
	      			</colgroup>
	      			
	      			<tr>
	      				<th>제목</th>
	      				<td colspan="3">
	      					<input type="text" class="form-control" name="hotTitle" placeholder="제목을 입력해주세요." maxlength="50" required/>
	      				</td>
	      			</tr>
	      			
	      			<tr>
	      				<th>작성자</th>
	      				<td colspan="3">
	      					<input type="text" class="form-control" name="hotWriter" value="${member.userId}" readonly="readonly"/>
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>카테고리</th>
	      				<td>
	      					<input type="text" class="form-control" name="hotCategory" placeholder="카레고리를 입력해주세요." maxlength="50" required />
	      				</td>
	      			</tr>
	      			<tr>
	      				<th class="text-nowrap">URL 주소</th>
	      				<td>
	      					<input type="url" class="form-control" name="hotUrl" maxlength="50" placeholder="URL 주소를 입력해주세요." required />
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>가격</th>
	      				<td>
	      					<input type="number" class="form-control" name="hotPrice" maxlength="20" placeholder="가격을 입력해주세요." required />
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>판매처</th>
	      				<td>
	      					<input type="text" class="form-control" name="hotShop" maxlength="50" placeholder="판매처를 입력해주세요." required />
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>배송</th>
	      				<td>
	      					<input type="text" class="form-control" name="hotDelivery" maxlength="50" placeholder="배송관련 항목을 입력해주세요." required />
	      				</td>
	      			</tr>
	      			<tr>
	      				<th>내용</th>
	      				<td colspan="3">
	      					<textarea class="content_textarea" id="hotContent" name="hotContent" placeholder="내용을 입력해주세요."></textarea>
	      					<script>
	      					
	      					ClassicEditor
	      					.create(document.querySelector('#hotContent'),{
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
	      					<input type="file" class="form-control" id="hotImg" name="file" placeholder="사진을 입력해주세요." />
	      					<div class="select_img mt-3"><img src="" /></div>
	      				</td>
	      			</tr>
	      		</table>  
	      		<script>
					$('#hotImg').change(function(){
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
				   	<a href="${path}/board/hotdeal/hotdeallistPageSearch?num=1" class="btn btn-outline-danger">취소</a>
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