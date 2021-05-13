/*****************************
* 아이디, 비밀번호 입력 체크
******************************/
function check()
{
	var id = $('#userId').val();
	var pwd = $('#userPwd').val();
	
	var rtn = false;
	
	if(id == "" || pwd == "") {
		alert("아이디를 또는 패스워드를 입력하세요.");
		return false;
	} else {
		
		// Ajax 호출.
		$.ajax({
			url : "/loginCheck.do",
			data : { userId:$('#userId').val(), userPwd:$('#userPwd').val() },
			type : "POST",
			async : false,							// 동기식 처리
			dataType : "TEXT",
			success : function(data)
			{
				if(data == "success") {
					rtn = true;
				} else {
					alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');
					rtn = false;
				}
			},
			error : function() {
			}
		});
		
		return rtn;
	}
}

/**
 * 서버에 폼을 던지기 전에 체크사항
 */
function befoSignCheck(){
		
	if(!pwdChk) {
		alert("비밀번호를 확인해주세요.");
		return false;
	} else {
		
		// ajax를 이용하여 현재 입력한 아이디가 존재하는지 체크
		// 동기식 처리를 하는 이유
		// 비동기식으로 처리하게 되면 서버에 전달한 아이디 중복확인 체크 결과를
		// 기다리지 않기 때문에 boolChk 변수에 값을 넣을 수 없음.
		// 따라서 동기식으로 처리를 하여 결과값을 받을 수 있도록 처리.
		$.ajax({
			url : "/signCheck.do",
			data : { userId:$('#user_id').val() },
			type : "POST",
			async : false,							// 동기식 처리
			dataType : "TEXT",
			success : function(data)
			{
				if(data == "success") {
					// 가입가능
					boolChk = true;
				} else {
					// 가입불가능
					alert('중복된 아이입니다.');
					boolChk = false;
				}
			},
			error : function() {
			}
		});
		
		return boolChk;
	}
}


var pwdChk = false;	
var boolChk = false;

/**
 * 비밀번호 재확인 함수
 */
function pwdKeyDown() {
	
	// 비밀번호가 같으면
	if($("#user_pwd").val() == $("#user_pwd_re").val()) {
		pwdChk = true;
		$("#pwdChk").hide();
	} else {
		pwdChk = false;
		$("#pwdChk").show();
	}
}

// 다음 주소 API
function daumAddrFunc() {
	
	new daum.Postcode({
	    oncomplete: function(data) 
	    {
    	   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
           
           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if (data.bname !== ''
                   && /[동|로|가]$/g.test(data.bname)) {
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if (data.buildingName !== ''
                   && data.apartment === 'Y') {
               extraRoadAddr += (extraRoadAddr !== '' ? ', '
                       + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if (extraRoadAddr !== '') {
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if (fullRoadAddr !== '') {
               fullRoadAddr += extraRoadAddr;
           }
    	   
           document.getElementById('addr1').value = fullRoadAddr;
           document.getElementById('addr2').value = data.jibunAddress;
	    }
	}).open();
}
