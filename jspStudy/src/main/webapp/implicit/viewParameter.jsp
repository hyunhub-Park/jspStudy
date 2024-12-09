<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<!-- 사용자 정보 가져오기. -->
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String [] values = request.getParameterValues("pet");	// 체크박스 '다'가져와야하므로 파라미터밸류스로.(체크박스에서 체크 한 항목만 가져옴.)
	

	System.out.println("name = " + name);
	System.out.println("address = " + address);
	
	for (int i = 0; i < values.length; i++)
	{
		System.out.println("values[" + i + "] = " + values[i]); // ⚠체크박스에 체크한 값만 가져옴!
	}
	
	Enumeration enumData = request.getParameterNames();
	// enum데이터가 존재하는지 여부 확인.
	while (enumData.hasMoreElements())
	{
		String enumName = (String)enumData.nextElement();
		System.out.println("enumName = " + enumName);
	}
	
	
	Map parameterMap = request.getParameterMap();
	String [] nameParam = (String[])parameterMap.get("name");
	System.out.println("name = " + nameParam[0]);
%>

<!-- 2. CRUD -->
<!-- 3. 화면설계 -> jsp service함수에서 진행. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>