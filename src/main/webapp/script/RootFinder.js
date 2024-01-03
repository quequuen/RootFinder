/**
 * 
 */

 function loginCheck(){
	 if(document.frm.id.value==""){
		 alert("아이디를 입력하세요");
		 return false;
	 }
	 if(document.frm.pwd.value==""){
		 alert("암호는 필수 사항입니다");
		 return false;
	 }
}



 function joinCheck(){
	
	 if(document.frm.userid.value.length == 0){
		 alert("아이디를 입력하세요");
		 frm.userid.focus();
		 return false;
	 }
	 if(document.frm.userid.value.length < 4){
		 alert("아이디는 4글자 이상이어야 합니다");
		 frm.userid.focus();
		 return false;
	 }
	 if(document.frm.name.value==""){
		 alert("사용자명을 입력하세요");
		 frm.name.focus();
		 return false;
	 }
	  if(document.frm.pwd.value==""){
		 alert("비밀번호를 입력하세요");
		 frm.pwd.focus();
		 return false;
	 }
	 if(document.frm.pwd.value!=document.frm.pwd_check.value){
		 alert("비밀번호가 일치하지 않습니다");
		 frm.pwd.focus();
		 return false;
	 }
	 if(document.frm.reid.value==""){
		 alert("중복체크를 하지 않았습니다");
		 frm.userid.focus();
		 return false;
	 }
	
	 if(document.frm.userNum_front.value.length != 6 || document.frm.userNum_front.value.length == 0 )
	 {
		 alert("주민번호 앞자리는 6자리 입니다.");
		 frm.userNum_front.focus();
		 return false;
	 }
	 
	 if(document.frm.userNum_back.value.length != 1 || document.frm.userNum_back.value.length == 0)
	 {
		 alert("주민번호 뒷자리의 첫번째 숫자만 입력해주세요.");
		 frm.userNum_back.focus();
		 return false;
	 }
	 
 }
 
 
  function idCheck(){
	 if(document.frm.userid.value==""){

		 alert("아이디를 입력해주세요");
		 document.frm.userid.focus();
		 return;
	 }
	 
	 var url="RootFinderServlet?command=idcheck_do&userid="+document.frm.userid.value;
	 window.open(url,"_blank_1","toolbar=no , menubar=no, scrollbars=yes,resizeble=no, width=450,height=200");
	 
 }
 
 function idok(userid){
	 opener.frm.userid.value = document.frm.userid.value;  //오프너가 부모 창(여기서 도큐먼트가 윈도우로 띄운 창)
	 opener.frm.reid.value = document.frm.userid.value;
	 self.close();
 }
 
 function nicknameCheck() {
	if (document.frm.name.value == "") {
		alert("사용자명을 입력해 주세요");
		document.frm.name.focus();
		return;
	}
	var url = "RootFinderServlet?command=nicknamecheck_do&name=" + document.frm.name.value;
	window.open(url, "_blank_1", "toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=450,height=200");
}

function nicknameok() {
	opener.frm.name.value = document.frm.name.value;
	opener.frm.reid2.value = document.frm.name.value;
	self.close();
}

//MBTI
function mbtiCheck() {
    window.open("mbtiTest.jsp","mbtiTest","width=1000, height=900");
  }

function submitMbti(mbti)
{
	opener.frm.mbtiresult.value=mbti;
	window.close();
}

function selectMBTIBox(value){
	document.frm.mbtiresult.value = value;
}

//메인 페이지에서 지도로 보기 클릭시 띄우는 창
function MapOpen() {
    window.open("koreaMap.jsp","koreaMap","width=1000, height=900");
}

function LocalClick(local)
{
	opener.location.href='RootFinderServlet?command=local_cose_view&local='+local; 
	window.close();
}

// 회원정보 수정 유효성 검사
function updateCheck() {
	
	if(document.frm.oldPwd.value == "") {
		alert("기존 비밀번호를 입력해 주세요.");
		frm.oldPwd.focus();
		return false;
	}
	
	if (document.frm.oldPwd.value != document.frm.pwd.value) {
		alert("기존 비밀번호가 일치하지 않습니다.");
		frm.oldPwd.focus();
		return false;
	}

	// 새 비밀번호1 X, 새 비밀번호2 O
	if (document.frm.newPwd1.value == "" && document.frm.newPwd2.value != "") {
		alert("변경할 패스워드를 입력해 주세요.");
		frm.newPwd1.focus();
		return false;
	
	// 새 비밀번호1 O, 새 비밀번호2 X
	} else if (document.frm.newPwd1.value != "" && document.frm.newPwd2.value == "") {
		alert("변경할 패스워드 확인을 위해 재입력해 주세요.");
		frm.newPwd2.focus();
		return false;
	}

	// 새 비밀번호1, 2 비교
	if (document.frm.newPwd1.value != document.frm.newPwd2.value) {
		alert("새 비밀번호 값이 일치하지 않습니다.");
		frm.newPwd2.focus();
		return false;
	}

}
    