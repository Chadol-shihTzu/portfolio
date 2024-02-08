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
      	
      	<!-- 관리자권한만 글쓰기 / 모바일 화면 -->
      	<c:if test="${member.verify == 9}">
      	<div class="d-flex justify-content-end my-3 d-md-none">
		    <a href="${path}/board/announce/announceWrite" class="btn btn-outline-primary text-nowrap">글쓰기</a>
		</div>
		</c:if>
		
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
			   			<td><c:out value="${list.annoNo}" /></td>
				      	<td><a href="${path}/board/announce/announceView?annoNo=${list.annoNo}" class="boardAtag"><c:out value="${list.annoTitle}"/></a></td>
				       	<td><c:out value="${list.annoWriter}" /></td>
				       	<td><fmt:formatDate value="${list.annoregDate}" pattern="yyyy-MM-dd"/></td>
				      	<td><c:out value="${list.annoViewCnt}" /></td>
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
			        <c:if test="${member.verify == 9}">
			            <div class="col-md-8 text-md-end mt-3 mt-md-0 d-none d-md-block">
			                <a href="${path}/board/announce/announceWrite" class="btn btn-outline-primary text-nowrap">글쓰기</a>
			            </div>
			       </c:if>
			    </div>
			</div>



		
		<nav class="Page navigation example">
			<ul class="pagination justify-content-center my-3">
				<c:if test="${page.prev}">
				 <li class="page-item"><a href="${path}/board/announce/annolistPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">이전</a></li>
				</c:if>
				
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				  <li class="page-item">
				  	<c:if test="${select != num}">
				   		<a href="${path}/board/announce/annolistPageSearch?num=${num}${page.searchTypeKeyword}" class="boardAtag page-link">${num}</a> 
				   </c:if>
				   <c:if test="${select == num }">
				   	<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
				   </c:if>
				  </li> 
				</c:forEach>
				
				<c:if test="${page.next}">
				 	<li class="page-item"><a href="${path}/board/announce/annolistPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">다음</a></li>
				</c:if>

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
 
  location.href="${path}/board/announce/annolistPageSearch?num=1"+"&searchType="+searchType+"&keyword="+keyword;
  //console.log(searchType)
  //console.log(keyword)
 };
 

<c:if test="${annoWriteSuccess}">
      alert("글 작성이 완료되었습니다.");
</c:if>
<c:if test="${annoDeleteSuccess}">
	alert("글 삭제가 완료되었습니다.");
</c:if>

</script>
<%@include file="../../include/footer.jsp" %>