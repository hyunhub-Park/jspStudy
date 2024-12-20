<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	// Cookie cookie = new Cookie("name", "psh");
 Cookie cookie = new Cookie("name", URLEncoder.encode("쿠키값을 한글로 작성 시", "UTF-8"));

	// 클라이언트가 서버에게 makeCookie페이지를 요청하면, 서버에서 클라이언트(WebBrowser)로 보냄.
	response.addCookie(cookie);
%>

<!DOCTYPE html>
<html>
<head><title>쿠키생성</title></head>
<body>
<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"
</body>
</html>