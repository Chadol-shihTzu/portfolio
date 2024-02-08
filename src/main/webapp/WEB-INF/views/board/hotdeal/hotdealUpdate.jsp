<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li><a href="${path}/board/hotdeal/hotdeallistPageSearch?num=1">Hotdeal</a></li>
          <li>Hotdeal Update</li>
        </ol>
        <h2>Hotdeal</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">

      	<c:if test="${member != null}">
      	<form method="POST" class="was-validated" enctype="multipart/form-data">
      	
      		<main>
		    <div class="input-group mb-3">
		    	 <span class="input-group-text">제목</span>
		    	<input type="text" class="form-control" id="hotTitle" value="${view.hotTitle}" name="hotTitle" maxlength="50" />
		    	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="hotWriter"  name="hotWriter" value="${view.hotWriter}" readonly="readonly"/> 
		    </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">카테고리</span>
		      	<input type="text" class="form-control" id="hotCategory"  name="hotCategory" value="${view.hotCategory}" maxlength="50" /> 
		      	<span class="input-group-text">URL주소</span>
		    	<input type="url" class="form-control" id="hotUrl"  name="hotUrl" value="${view.hotUrl}" maxlength="100" />
		      	<span class="input-group-text">작성일</span>
		    	<input type="text" class="regDate form-control" value="<fmt:formatDate value="${view.hotregDate}" pattern="yyyy-MM-dd"/>" readonly="readonly">
	      	  </div>
	      	  <div class="input-group mb-3">
	      	  	<span class="input-group-text">가격</span>
		      	<input type="number" class="form-control" id="hotPrice"  name="hotPrice" value="${view.hotPrice}" /> 
		      	<span class="input-group-text">쇼핑몰</span>
		      	<input type="text" class="form-control" id="hotShop"  name="hotShop" value="${view.hotShop}" maxlength="50" /> 
		      	<span class="input-group-text">배송</span>
		    	<input type="text" class="form-control" id="hotDelivery"  name="hotDelivery" value="${view.hotDelivery}" maxlength="50" />
	      	  </div>
	      	  
		      <textarea cols="" rows="20" class="content_textarea form-control" id="hotContent"  name="hotContent">${view.hotContent}</textarea>
		      <div class="input-group mb-3">
		    	 <span class="input-group-text">사진</span>
		    	<input type="file" class="form-control" id="hotImg" name="file" />
		    	<div class="select_img"><img src="${path}/${view.hotImg}" /></div>
		    	<input type="hidden" name="hotImg" value="${view.hotImg}" />
		    </div>
		    
		    <script>
					$('#gdsImg').change(function(){
						if(this.files && this.files[0]){
							var reader = new FileReader;
							reader.onload = function(data){
								$(".select_img img").attr("src", data.target.result).width(500);
							}
							reader.readAsDataURL(this.file[0]);
						} 
					 });
				</script>
					
					<%= request.getRealPath("/") %><!-- 실제경로 추가 -->    		
	
	    </main>
	    	<div class="d-flex justify-content-end">
	    		<div class="btn-group mb-5">
	    			<input type="submit" class="btn btn-outline-success" value="수정" />
	    			<a class="btn btn-outline-danger" href="${path}/board/hotdeal/hotdealView?hotNo=${view.hotNo}" >취소</a>
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