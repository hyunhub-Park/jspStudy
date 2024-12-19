<%@page contentType="text/html; charset=UTF-8"%>
<%

	boolean flag = (Boolean)request.getAttribute("flag");

 if (flag == true)
 {
 	response.sendRedirect("list.do"); 
 } else
 {
%>
	<script>
		alert("게시판 등록 실패.");
		history.go(-1);
	</script>
<%
 }
%>