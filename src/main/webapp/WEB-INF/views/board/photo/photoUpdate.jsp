<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li><a href="${path}/board/photo/photolistPageSearch?num=1">Picture</a></li>
          <li>Picture Update</li>   
        </ol>
        <h2>Picture</h2>
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
		    	<input type="text" class="form-control" id="photoTitle" value="${view.photoTitle}" name="photoTitle">
		    	 <span class="input-group-text">카테고리</span>
		    	<input type="text" class="form-control" id="photoCategory" value="${view.photoCategory}" name="photoCategory">
		    </div>
		      <div class="input-group mb-3">
		      	<span class="input-group-text">작성자</span>
		      	<input type="text" class="form-control" id="photoWriter"  name="photoWriter" value="${view.photoWriter}" readonly="readonly"/> 
		      	<span class="input-group-text">작성일</span>
		    	<input type="text" class="regDate form-control" value="<fmt:formatDate value="${view.photoregDate}" pattern="yyyy-MM-dd"/>" readonly="readonly">
	      	  </div>
		      <textarea cols="" rows="20" class="content_textarea form-control" id="photoDes"  name="photoDes">${view.photoDes}</textarea>
		      <div class="input-group mb-3">
		    	 <span class="input-group-text">사진</span>
		    	<input type="file" class="form-control" id="photoImg" name="file" />
		    	<div class="select_img"><img src="${path}/${view.photoImg}" /></div>
		    	<input type="hidden" name="photoImg" value="${view.photoImg}" />
		    	<input type="hidden" name="photoThumbImg" value="${view.photoThumbImg}" />
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
	    			<a class="btn btn-outline-danger" href="${path}/board/photo/photoView?photoNo=${view.photoNo}" >취소</a>
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