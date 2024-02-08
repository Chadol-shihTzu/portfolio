<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="mainSlide.jsp" %>
<main id="main">

    <!-- ======= Featured Section ======= -->
    <section id="featured" class="featured">
      <div class="container">

        <div class="row">
        <!-- 모바일 버전 게시글 순위 게시판 -->
        <div class="icon-box d-md-none">
        	<div class="table-responsive">
		      	<table class="table section-table">
		      		<colgroup>
				      <col style="width:10%"/>
				      <col style="width:72%"/>
				      <col style="width:18%"/>
		  			</colgroup>
					<thead>
					   <tr>
					      <th class="fs-3 text-start text-nowrap" colspan="3">종합 최신 인기글</th>
					   </tr>
				   </thead>
				   <tbody>
				   	<c:forEach items="${list}" var="item" varStatus="loop">
					    <c:if test="${loop.index < 10}">
					        <tr>
					            <td><c:out value="${loop.index + 1}" />.</td>
					            <td><a class="a_under_hov section_top_a_tag_gray" href="${path}/board/announce/announceView?annoNo=${item.annoNo}"><c:out value="${item.annoTitle}" /></a></td>
					            <td class="text-center"><c:out value="${item.annoViewCnt}" /></td>
					        </tr>
					    </c:if>
					</c:forEach>
				   </tbody>
		      	</table>
        	</div>
        	</div><!-- 모바일 버전 게시글 순위게시판 끝 -->
        	
        	<!-- pc버전 순위 게시판 -->
          <div class="col-md-4 col-md-6 col-lg-4">
            <div class="icon-box p-1 d-none d-md-table">
             	<div class="table-responsive-sm">
						<table class="table section-table d-none d-md-table">
							<tr class="standard-line">
								<th class="fs-4 text-start text-nowrap" colspan="2">사진 최신 인기글</th><th class="align_bottom"><a class="text-nowrap text-dark a_under_hov" href="${path}/board/photo/photoList">더보기</a></th>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >1.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >2.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-up pt-3" style="color:#4285F4;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >3.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-down pt-3" style="color:#F08080;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >4.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2">-</td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >5.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >6.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >7.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >8.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >9.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >10.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트1</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
						</table>
					</div>
              
            </div>
          </div>
          <div class="col-md-4 col-md-6 col-lg-4">
            <div class="icon-box p-1 d-none d-md-table">
            <div class="table-responsive-sm">
				<table class="table section-table d-none d-md-table">
							<tr class="standard-line">
								<th class="fs-4 text-start text-nowrap" colspan="2">그림 최신 인기글</th><th class="align_bottom"><a class="text-nowrap text-dark a_under_hov" href="${path}/board/paint/paintList">더보기</a></th>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >1.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >2.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-up pt-3" style="color:#4285F4;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >3.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-down pt-3" style="color:#F08080;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >4.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2">-</td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >5.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >6.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >7.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >8.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >9.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >10.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트2</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
						</table>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-md-6 mt-md-3 col-lg-4 mt-lg-0">
            <div class="icon-box p-1 d-none d-md-table">
            <div class="table-responsive-sm">
						<table class="table section-table d-none d-md-table">
							<tr class="standard-line">
								<th class="fs-4 text-start text-nowrap" colspan="2">문학 최신 인기글</th><th class="align_bottom"><a class="text-nowrap text-dark a_under_hov" href="${path}/board/literature/literatureMain">더보기</a></th>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >1.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >2.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-up pt-3" style="color:#4285F4;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >3.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-down pt-3" style="color:#F08080;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >4.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2">-</td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >5.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >6.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >7.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >8.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >9.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >10.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
						</table>     
						</div>         
            </div>
          </div>
          <div class="col-md-4 col-md-6 mt-md-3">
            <div class="icon-box p-1 d-none d-md-table d-lg-none">
            <div class="table-responsive-sm">
						<table class="table section-table d-none d-md-table">
							<tr class="standard-line">
								<th class="fs-4 text-start text-nowrap" colspan="2">핫딜 최신 인기글</th><th class="align_bottom"><a class="text-nowrap text-dark a_under_hov" href="${path}/board/literature/literatureMain">더보기</a></th>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >1.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >2.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-up pt-3" style="color:#4285F4;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >3.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><i class="ms-auto fa-solid fa-caret-down pt-3" style="color:#F08080;">&nbsp;1</i></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >4.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2">-</td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >5.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >6.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >7.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >8.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >9.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
							<tr>
								<td class="text-start col-1 pe-0" >10.</td><td class="text-start col-9"><a class="a_under_hov section_top_a_tag_gray" href="#">테스트3</a></td><td class="text-end col-2"><span class="rank-new">new</span></td>
							</tr>
						</table>     
						</div>         
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Featured Section -->



<!-- 간단글귀슬라이드 
<br><br><br>
<div class="container">
	<div class="row">
				
				<div class="container">
					
			      	</div>
				</div>

	
				<div class="col-md-4 col-sm-12">
					
				</div>
				

				<div class="col-md-4 col-sm-12">
					<div class="container">
						
					</div>
				</div>
				
	
				<div class="col-md-4 col-sm-12">
					
				</div>
				
			</div>
		</div>-->