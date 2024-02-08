<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
      	
      	<div class="d-flex justify-content-end my-3 d-md-none">
		    <a href="${path}/board/hotdeal/hotdealWrite" class="btn btn-outline-primary text-nowrap">글쓰기</a>
		</div>
		
		<!-- PC버전 -->
      	<div class="table-responsive d-none d-md-block">
	      	<table class="table table-hover text-nowrap text-center">
	      	
			   <tbody>
			   	<c:forEach items="${list}" var="list"> 
			   		<tr>
			   			<td class="p-0"><img src="${path}/${list.hotImg}" class="img-thumbnail" style="width: 100px !important; height:100px !important;" /></td>
				      	<td class="p-0 text-start"><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}" class="fs-5"><c:out value="${list.hotTitle}"/></a><br>
				      		<span class="text-muted">쇼핑몰 : </span><a href="${list.hotUrl}"><c:out value="${list.hotShop}" /></a> /
				     		<span class="text-muted">가격 : </span><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><fmt:formatNumber value="${list.hotPrice}" pattern="###,###,###"></fmt:formatNumber>원</a> /
				     		<span class="text-muted">배송 :</span><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><c:out value="${list.hotDelivery}" /></a> <br>
				     		<a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><c:out value="${list.hotCategory}" /></a> /
				     		<fmt:formatDate value="${list.hotregDate}" pattern="yyyy-MM-dd hh:mm:ss"/> /
				     		<c:out value="${list.hotWriter}" /><br>
				     		<span class="text-muted">조회수 : <c:out value="${list.hotViewCnt}" /></span>
				      	</td>
				      	
				     </tr>
			   	</c:forEach>
			   </tbody>
	      	</table>			
				</div>
				
				
				<!-- md 767px 버전 -->
				<div class="table-responsive d-none d-sm-block d-md-none">
	      	<table class="table table-hover text-nowrap text-center">
	      	
			   <tbody>
			   	<c:forEach items="${list}" var="list"> 
			   		<tr>
			   			<td class="p-0"><img src="${path}/${list.hotImg}" class="img-thumbnail" style="width: 100px !important; height:100px !important;" /></td>
				      	<td class="p-0 text-start"><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}" class="fs-5"><c:out value="${list.hotTitle}"/></a><br>
				      		<span class="text-muted">쇼핑몰 : </span><a href="${list.hotUrl}"><c:out value="${list.hotShop}" /></a> /
				     		<span class="text-muted">가격 : </span><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><fmt:formatNumber value="${list.hotPrice}" pattern="###,###,###"></fmt:formatNumber>원</a> /
				     		<span class="text-muted">배송 :</span><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><c:out value="${list.hotDelivery}" /></a> <br>
				     		<a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><c:out value="${list.hotCategory}" /></a> /
				     		<fmt:formatDate value="${list.hotregDate}" pattern="yyyy-MM-dd hh:mm:ss"/> /
				     		<c:out value="${list.hotWriter}" /><br>
				     		<span class="text-muted">조회수 : <c:out value="${list.hotViewCnt}" /></span> /
				      	</td>
				     </tr>
			   	</c:forEach>
			   </tbody>
	      	</table>			
				
				</div>
				
				<!-- 모바일버전 -->
				<div class="table-responsive d-sm-none">
	      	<table class="table table-hover text-nowrap text-center">
	      	
			   <tbody>
			   	<c:forEach items="${list}" var="list"> 
			   		<tr style="font-size:12px;">
			   			<td class="p-0"><img src="${path}/${list.hotImg}" class="img-thumbnail" style="min-width: 100px !important; height:100px !important;" /></td>
				      	<td class="p-0 text-start"><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}" class="fs-6"><c:out value="${list.hotTitle}"/></a><br>
				      		<p class="mt-1 mb-0">
				      			<span class="text-muted">쇼핑몰 : </span><a href="${list.hotUrl}"><c:out value="${list.hotShop}" /></a> /
				     			<span class="text-muted">가격 : </span><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><fmt:formatNumber value="${list.hotPrice}" pattern="###,###,###"></fmt:formatNumber>원</a> /
				     			<span class="text-muted">배송 :</span><a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><c:out value="${list.hotDelivery}" /></a> <br>
				     		</p>
				     		<p class="mt-1 mb-0">
				     			<a href="${path}/board/hotdeal/hotdealView?hotNo=${list.hotNo}"><c:out value="${list.hotCategory}" /></a> /
				     			<fmt:formatDate value="${list.hotregDate}" pattern="yyyy-MM-dd hh:mm:ss"/> /
				     			<c:out value="${list.hotWriter}" /><br>
				     		</p>
				     		<p class="mt-1 mb-0">
					     		<span class="text-muted">조회수 : <c:out value="${list.hotViewCnt}" /></span> /
				     		</p>
				      	</td>
				     </tr>
			   	</c:forEach>
			   </tbody>
	      	</table>			
				
				</div>
				
				
				<div class="container-fluid bg-light py-3">
				    <div class="row justify-content-between align-items-center">
				        <div class="col-md-4">
				            <div class="input-group">
				                <select name="searchType" class="form-select">
				                    <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
				                    <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
				                    <option value="shop" <c:if test="${page.searchType eq 'shop'}">selected</c:if>>쇼핑몰</option>
				                    <option value="price" <c:if test="${page.searchType eq 'price'}">selected</c:if>>가격</option>
				                    <option value="delivery" <c:if test="${page.searchType eq 'delivery'}">selected</c:if>>배송</option>
				                    <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
				                </select>
				                <input type="text" name="keyword" class="form-control" value="${page.keyword}">
				                <button type="button" id="searchBtn" class="btn btn-outline-success">검색</button>
				            </div>
				        </div>
				
				        <!-- 관리자 권한이 있는 경우에만 글쓰기 버튼 표시 / pc화면 글쓰기 -->
				            <div class="col-md-8 text-md-end mt-3 mt-md-0 d-none d-md-block">
				                <a href="${path}/board/hotdeal/hotdealWrite" class="btn btn-outline-primary text-nowrap">글쓰기</a>
				            </div>
				    </div>
				</div>
		



		<!-- 페이지네이션 -->
		<nav class="Page navigation example">
			<ul class="pagination justify-content-center my-3">
				<c:if test="${page.prev}">
				 <li class="page-item"><a href="${path}/board/hotdeal/hotdeallistPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">이전</a></li>
				</c:if>
				
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				  <li class="page-item">
				  	<c:if test="${select != num}">
				   		<a href="${path}/board/hotdeal/hotdeallistPageSearch?num=${num}${page.searchTypeKeyword}" class="boardAtag page-link">${num}</a> 
				   </c:if>
				   <c:if test="${select == num }">
				   	<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
				   </c:if>
				  </li> 
				</c:forEach>
				
				<c:if test="${page.next}">
				 	<li class="page-item"><a href="${path}/board/hotdeal/hotdeallistPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="boardAtag page-link text-nowrap">다음</a></li>
				</c:if>
				<!-- 
				<c:forEach begin="1" end="${pageNum}" var="num">
					<span>
						<a href="${path}/board/hotdealunce/hotdeallistPage?num=${num}">${num}</a>
					</span>
				</c:forEach>
				 -->
			 </ul>
		</nav>
		
		
		
      	</div>
      	
      </div>
   </div>


<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
 
  location.href="${path}/board/hotdeal/hotdeallistPageSearch?num=1"+"&searchType="+searchType+"&keyword="+keyword;
  //console.log(searchType)
  //console.log(keyword)
 };

<c:if test="${hotdealDeleteSuccess}">
	alert("글 삭제가 완료되었습니다.");
</c:if>
<c:if test="${hotdealWriteSuccess}">
	alert("글 작성이 완료되었습니다.");
</c:if>





</script>

<%@include file="../../include/footer.jsp" %>
