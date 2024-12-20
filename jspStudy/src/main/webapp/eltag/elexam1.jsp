<%@page import="java.util.HashMap"%>
<%@page import="co.kh.dev.actiontag.model.Customer"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	// 2. CRUD
	Customer customer = new Customer();
	customer.setName("test");
	customer.setEmail("test@naver.com");
	customer.setPhone("010-0000-0000");
	
	request.setAttribute("customer", customer);

	// 3. request 받아서 진행.
	/* Customer ct = (Customer)request.getAttribute("customer");
	ct.getName(); -> 이렇게 해도 됨. */
	
	HashMap <String, String> map = new HashMap <String, String>();
	map.put("name", "test");
	map.put("email", "test@naver.com");
	map.put("phone", "010-0000-0000");
	
															// map이라는 객체를 넣어주면 됨.
	request.setAttribute("map", map);
															
	HashMap <String, String> map2 = (HashMap <String, String>)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Example</title>
</head>
<body>
	<ul>
		<li><%= ((Customer)request.getAttribute("customer")).getName() %></li>
		<li><%= ((Customer)request.getAttribute("customer")).getEmail() %></li>
		<li><%= ((Customer)request.getAttribute("customer")).getPhone() %></li>
	</ul>
	<ul>
		<li> ${customer.name} </li>
		<li> ${customer.email} </li>
		<li> ${customer.phone} </li>
	</ul>
	<ul>
		<li> <%= map2.get("name") %> </li>
		<li> <%= map2.get("email") %> </li>
		<li> <%= map2.get("phone") %> </li>
	</ul>
	<ul>
		<li> ${map.name} </li>
		<li> ${map.email} </li>
		<li> ${map.phone} </li>
	</ul>
	<ul>
		<li> ${map["name"]} </li>
		<li> ${map["email"]} </li>
		<li> ${map["phone"]} </li>
	</ul>
</body>
</html>