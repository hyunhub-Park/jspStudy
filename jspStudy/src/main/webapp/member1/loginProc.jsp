<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="co.kh.dev.memberone.model.StudentDAO" />
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int check = dao.loginCheck(id, pass);
%>
<%
	if (check == 1)
	{	// 로그인 성공시.
		session.setAttribute("loginID", id);
		response.sendRedirect("login.jsp");
	} else if (check == 0)
	{	// 비밀번호 오기재시.
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%
	} else
	{	// 아이디 오기재시.
%>
	<script>
		alert("없는 아이디 입니다.");
		history.go(-1);
	</script>
<%
	}
%>