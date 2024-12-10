<%@page contentType="text/html; charset=UTF-8"%>
<%
String pageTitle = (String) request.getAttribute("PAGETITLE");
// String contentPage = request.getParameter("CONTENTPAGE");	// parameter로 보냈으니, param으로 받는 것.
String contentPage = (String) request.getAttribute("CONTENTPAGE"); // DisPatcher로 했기 때문에.
%>
<html>
<head>
<title><%=pageTitle%></title>
</head>
<body>
	<table width="400" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2">
			<jsp:include page="/temp/module/top.jsp" flush="false"/>
			</td>
		</tr>
		<tr>
			<td width="100" valign="top"><jsp:include page="/temp/module/left.jsp" flush="false"/>
			</td>
			<td width="300" valign="top">
				<!-- 내용 부분: 시작 -->
				<jsp:include page="<%= contentPage %>" flush="false" />
				<!-- 내용 부분: 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<jsp:include page="/temp/module/bottom.jsp" flush="false"/>
			</td>
		</tr>
	</table>
</body>
</html>