<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../../include/header.jsp" %>
<!-- ======= Breadcrumbs ======= -->    
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container d-flex justify-content-between">
      	<div>
      	<ol>
          <li><a href="${path}">Home</a></li>
          <li>drama</li>
        </ol>
        <h2>drama</h2>
      	</div>        
      </div>
    </section><!-- End Breadcrumbs -->
<div class="container">
   <div class="row">
      <div class="col-md-12">
      	
      	<div class="d-flex justify-content-end my-3 d-md-none">
		    <a href="${path}/board/literature/drama/dramaWrite" class="btn btn-outline-primary text-nowrap">글쓰기</a>
		</div>

		
      	<div class="table-responsive">
	      	<table class="table table-hover text-nowrap text-center">
	      		<colgroup>
			      <col style="width:10%"/>
			      <col style="width:60%"/>
			      <col style="width:10%"/>
			      <col style="width:10%"/>
			      <col style="width:10%"/>
	  			</colgroup>
				<thead class="table-bordered table-light">
				   <tr>
				      <th class="text-center">번호</th>
				      <th class="text-center">제목</th>
				      <th class="text-center">글쓴이</th>
				      <th class="text-center">작성일</th>
				      <th class="text-center">조회</th>
				   </tr>
			   </thead>
		 
			   <tbody>
			   	<c:forEach items="${list}" var="list"> 
			   		<tr>
			   			<td><c:out value="${list.dramaNo}" /></td>
				      	<td><a href="${path}/board/literature/drama/dramaView?dramaNo=${list.dramaNo}" class="boardAtag"><c:out value="${list.dramaTitle}"/></a></td>
				       	<td><c:out value="${list.dramaWriter}" /></td>
				       	<td><fmt:formatDate value="${list.dramaregDate}" pattern="yyyy-MM-dd"/></td>
				      	<td><c:out value="${list.dramaViewCnt}" /></td>
				     </tr>
			   	</c:forEach>
			   </tbody>
	      	</table>
	      	
			<div class="container-fluid bg-light py-3">
			    <div class="row justify-content-between align-items-center">
			        <div class="col-md-4">
			            <div class="input-group">
			                <select name="searchType" class="form-select">
			                    <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
			                    <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
			                    <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
			                    <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
			                </select>
			                <input type="text" name="keyword" class="form-control" value="${page.keyword}">
			                <button type="button" id="searchBtn" class="btn btn-outline-success">검색</button>
			            </div>
			        </div>
			
			        <!-- 관리자 권한이 있는 경우에만 글쓰기 버튼 표시 / pc화면 글쓰기 -->
			            <div class="col-md-8 text-md-end mt-3 mt-md-0 d-none d-md-block">
			                <a href="${path}/board/literature/drama/dramaWrite" class="btn btn-outline-primary text-nowrap">글쓰기</a>
			            </div>
			    </div>
			</div>



		<!-- 페이지네이션 -->
		<nav class="Page navigation example">
			<ul class="pagination justify-content-center my-3">
				<c:if test="${page.prev}">
				 <li class="page-item"><a href="${path}/board/literature/drama/dramalistPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">이전</a></li>
				</c:if>
				
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				  <li class="page-item">
				  	<c:if test="${select != num}">
				   		<a href="${path}/board/literature/drama/dramalistPageSearch?num=${num}${page.searchTypeKeyword}" class="boardAtag page-link">${num}</a> 
				   </c:if>
				   <c:if test="${select == num }">
				   	<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
				   </c:if>
				  </li> 
				</c:forEach>
				
				<c:if test="${page.next}">
				 	<li class="page-item"><a href="${path}/board/literature/drama/dramalistPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">다음</a></li>
				</c:if>
				<!-- 
				<c:forEach begin="1" end="${pageNum}" var="num">
					<span>
						<a href="${path}/board/dramaunce/dramalistPage?num=${num}">${num}</a>
					</span>
				</c:forEach>
				 -->
			 </ul>
		</nav>
		
		
		
      	</div>
      	
      </div>
   </div>
</div>

<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
 
  location.href="${path}/board/literature/drama/dramalistPageSearch?num=1"+"&searchType="+searchType+"&keyword="+keyword;
  //console.log(searchType)
  //console.log(keyword)
 };

<c:if test="${dramaDeleteSuccess}">
	alert("글 삭제가 완료되었습니다.");
</c:if>
<c:if test="${dramaWriteSuccess}">
	alert("글 작성이 완료되었습니다.");
</c:if>





</script>

<%@include file="../../../include/footer.jsp" %>
