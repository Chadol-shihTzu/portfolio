<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>

<!-- section -->
<%@ include file="board/section/sectionTop.jsp" %>
<%@ include file="board/section/sectionMid.jsp" %>
<%@ include file="board/section/sectionBottom.jsp" %>

<%@ include file="./include/footer.jsp" %> 
<script>
    <c:if test="${loginSuccess}">
        alert("로그인에 성공하였습니다.");
    </c:if>
    <c:if test="${logoutSuccess}">
    alert("로그아웃되었습니다.");
	</c:if>
	<c:if test="${joinSuccess}">
    alert("회원가입이 완료되었습니다.");
	</c:if>
	<c:if test="${withdrawalSuccess}">
    alert("회원탈퇴가 완료되었습니다.");
	</c:if>
</script>
</body>
</html>
