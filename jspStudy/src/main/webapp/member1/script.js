function idCheck() {	// 회원가입 폼 '아이디'체크.
	let value = document.regForm.id.value;
	if (value === "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();	// regForm.jsp의 name명. id를 찾을 때는 selectQuery로.
	} else {
		alert("아이디를 이미 입력하였습니다.");
		url = "idCheck.jsp?id=" + value;
		window.open(url, "post", "width=500, height=300");
	}
}

function zipCheck() {	// 회원가입 폼 '주소'체크.
	url = "zipCheck.jsp?check=y";
	// url="idCheck.jsp?id=" + value;
	window.open(url, "post", "width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");
}

function dongCheck() {	// 회원가입 폼 '동'체크.
	let value = document.zipForm.dong.value;
	if (value === "") {
		alert("동이름를 입력해 주세요.");
		document.zipForm.dong.focus();	// regForm.jsp의 name명. id를 찾을 때는 selectQuery로.
		return;
	}

	document.zipForm.submit();
}

function sendAddress(zipcode, sido, gugun, dong, bunji) {	// 주소내용을 윈도우창 각 요소에 저장.
	var address = sido + " " + gugun + " " + dong + " " + bunji;
	opener.document.regForm.zipcode.value = zipcode;
	opener.document.regForm.address1.value = address;
	self.close();
}

function inputCheck() {	// 회원가입 폼 패턴검색.
	if (document.regForm.id.value == "")
		{
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
		return;
		}
	if (document.regForm.pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regForm.pass.focus();
		return;
	}
	if (document.regForm.repass.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regForm.repass.focus();
		return;
	}
	if (document.regForm.pass.value !=
		document.regForm.repass.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repass.focus();
		return;
	}
	if (document.regForm.name.value == "") {
		alert("이름을 입력해 주세요.");
		document.regForm.name.focus();
		return;
	}
	if (document.regForm.phone1.value == "") {
		alert("통신사를 입력해 주세요.");
		document.regForm.phone1.focus();
		return;
	}
	if (document.regForm.phone2.value == "") {
		alert("전화번호을 입력해 주세요.");
		document.regForm.phone2.focus();
		return;
	}
	if (document.regForm.phone3.value == "") {
		alert("전화번호을 입력해 주세요.");
		document.regForm.phone3.focus();
		return;
	}
	if (document.regForm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.regForm.email.focus();
		return;
	}
	const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	var email = document.regForm.email.value;
	if (pattern.test(email) === false) {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
		document.regForm.email.focus();
		return;
	}
	//var str=document.regForm.email.value;	   
	//var atPos = str.indexOf('@');
	//var atLastPos = str.lastIndexOf('@');
	//var dotPos = str.indexOf('.'); 
	//var spacePos = str.indexOf(' ');
	//var commaPos = str.indexOf(',');
	//var eMailSize = str.length;
	//if (atPos > 1 && atPos == atLastPos && 
	// dotPos > 3 && spacePos == -1 && commaPos == -1
	//	&& atPos + 1 < dotPos && dotPos + 1 < eMailSize);
	//}else {
	//   alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	//	      document.regForm.email.focus();
	//		  return;
	//}
	if (document.regForm.zipcode.value == "") {
		alert("우편번호를 입력해 주세요.");
		document.regForm.zipcode.focus();
		return;
	}
	if (document.regForm.address1.value == "") {
		alert("주소를 입력해 주세요.");
		document.regForm.address1.focus();
		return;
	}
	if (document.regForm.address2.value == "") {
		alert("세부주소를 입력해 주세요.");
		document.regForm.address2.focus();
		return;
	}
	document.regForm.submit();
}