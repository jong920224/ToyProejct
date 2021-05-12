/*****************************
* 아이디, 비밀번호 입력 체크
******************************/
function check()
{
	var id = $('#userId').val();
	var pwd = $('#userPwd').val();
	
	var rtn = false;
	
	if(id == "" || pwd == "") 
	{
		alert("아이디를 또는 패스워드를 입력하세요.");
		return false;
	} 
	else 
	{
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

