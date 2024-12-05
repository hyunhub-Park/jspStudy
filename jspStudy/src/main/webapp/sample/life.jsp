<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 오버라이딩 해야 함. -->
<%!
	// 멤버변수, 멤버함수, 오버라이딩
	private int globalNumber = 0;
	
	// 멤버함수	
	public int getGlobalNumber()
	{
		return this.globalNumber;
	}
	
	// 오버라이딩함수
	public void jspInit()
	{
		System.out.println("jspInit() 오버라이딩 함수가 호출됨.");
	}
	
	public void jspDestroy()
	{
		System.out.println("jspDestroy() 오버라이딩 함수가 호출됨.");
	}
	// service는 오버라이딩 하면 안됨.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 자바코드 실행문(제어/반복 등) : service함수에서 작동됨.
	// 지역변수 선언.
	int localNumber = 0;
	// 서비스를 실행할 때 마다(매 번 클라이언트가 요청 할 때 마다.)
	localNumber++;
	this.globalNumber++;	// 멤버변수를 부르는 것이니 this.
	%>
<ul>
	<li>globalNumber = <%= this.globalNumber %></li>	<!-- service가 계속 호출 되니까 F5실행 시 숫자가 계속 올라감. -->
	<li>localNumber = <%= localNumber %></li>	<!-- 0되고 증가되니까 1, 다시부르면 또 0되고 증가되니까 1 -->
</ul>
</body>
</html>