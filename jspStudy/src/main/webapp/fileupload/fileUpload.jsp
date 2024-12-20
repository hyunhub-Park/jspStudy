<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	// 1. [서버 업로드시 진행 순서.] 업로드 경로 작성.
	String uploadPath = request.getRealPath("upload");

	// 2. 업로드 최대 사이즈 설정.
	int size = 10 * 1024 * 1024;	// 10MB허가.
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String origfilename1 = "";
	String origfilename2 = "";
	
	try
	{
		// 3. MultipartRequest 객체를 생성, 매개변수(request, 업로드 위치, 최대 사이즈, encoding, 이름 재정의 정책.)
		MultipartRequest multiRequest = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());
		
		name = multiRequest.getParameter("name");
		
		subject = multiRequest.getParameter("subject");
		
		// 4. multiRequest.getFileNames()로 Enumeration을 구함. -> 정책임.
		Enumeration files = multiRequest.getFileNames();
		
		String file1 = (String) files.nextElement();	// String file1 = fileName2

		// 가져올 때는 Enumeration, next 사용.
		// 5. 업로드 후, 서버에 저장된 이름을 가져옴.(테이블에 저장되는 이름임.)
		filename1 = multiRequest.getFilesystemName(file1);
		// 6. '사용자가 지정한' 파일 이름(original)을 가져옴.(테이블에 저장되는 이름.)
		origfilename1 = multiRequest.getOriginalFileName(file1);
		
		String file2 = (String) files.nextElement();	// String file2 = fileName1
		filename2 = multiRequest.getFilesystemName(file2);	// 서버에 저장된 이름.(DefaultFileRenamePolicy()에 의해서 이름이 변경됨. 뒤에 숫자가 붙는 형식으로.)
		origfilename2 = multiRequest.getOriginalFileName(file2);	// coffee_ice.png (사용자가 직접 지정한 이미지의 이름.)
		
		System.out.println(file1);
		System.out.println(file2);
		System.out.println(uploadPath);
	} catch (Exception e)
	{
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html lang="ko">
    <meta charset="UTF-8">
<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"> <input type="hidden" name="subject" value="<%=subject%>">
		<input type="hidden" name="filename1" value="<%=filename1%>">
		<input type="hidden" name="filename2" value="<%=filename2%>">
		<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드
		페이지 이동</a>
</body>
</html>