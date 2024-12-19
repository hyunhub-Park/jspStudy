<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="co.kh.dev.memberone.model.StudentDAO" />
<!-- 1. 사용자 정보 가져오기. -->
<!-- 2. CRUD. -->
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	StudentDAO sdao = new StudentDAO();
	StudentVO svo = new StudentVO();
	
	svo.setId(id);
	svo.setPass(pass);
	
	// int check = dao.loginCheck(id, pass);
	
	int check = sdao.selectLoginCheck(svo);
%>
<!-- 3. 화면 설계. -->
<%-- <%
	if (check == 1)
	{	// 로그인 성공시.
		// session.setAttribute("loginID", id);
		session.setAttribute("id", id);
		response.sendRedirect("login.jsp");
	} else if (check == 0)
	{	// 비밀번호 오기재시.
%> --%>

<%
	if (check == 1)
	{	// 로그인 성공시.
		// session.setAttribute("loginID", id);
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
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