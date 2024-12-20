<%@page import="java.io.FileReader"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 실행문 http://localhost:8080/jspStudy3/jstl/outExam.jsp?path=/jstl/setExam.jsp -->


<%
	// file을 2byte씩 가져올 것.
	FileReader reader = null;
	String path = request.getParameter("path");	// http://~outExam.jsp?path=/jstl/setExam.jsp
	try
	{
			reader = new FileReader(getServletContext().getRealPath(path));
%>
	<p>소스코드 보여주기</p>

<%-- <c:out value="<%= reader %>" escapeXml="true" /> -> '<'표식의 오류방지를 위해. &lt;, &gt;로 표기. --%>
	
	<pre>
		<c:out value="<%=reader%>" />
	</pre>

<%
	} catch(Exception e)
	{
		e.printStackTrace();
	} finally
	{
		if (reader != null)
		{
			reader.close();
		}
	}
	
	
/* } catch(Exception e)
{
	e.printStackTrace();
} finally
{
	if (reader != null)
	{
	try {} catch (Exception e)
	{
		reader.close();
	}
	}
		
} */
%>