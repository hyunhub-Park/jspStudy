<%@page contentType="text/html; charset=UTF-8"%>
<% session.invalidate(); %>	<!-- 사용자 정보를 가져오면서 session 해제. -->
<script>
 alert("로그아웃 되었습니다.");
location.href="sessionMemberLogIn.jsp";
</script>