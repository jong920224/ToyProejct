<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
	
	<!-- 다음 주소 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<title>회원가입</title>
</head>

<body>
	<div class="container">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1 style="text-align:center;"><strong></strong></h1>
			
		   	<form onsubmit="return befoSignCheck();" action="/signAction.do" method="post">
		   	
		   		<div class="form-group">
					<label for="exampleFormControlInput1">아이디</label>
		       		<input type="text" class="form-control" id="user_id" name="user_id" required>
		        </div>
				<div class="form-group">
					<label for="exampleFormControlInput1">비밀번호</label>
		       		<input type="password" class="form-control" id="user_pwd" name="user_pwd" required>
		        </div>
     			<div class="form-group">
					<label for="exampleFormControlInput1">비밀번호 재확인</label>
		       		<input type="password" class="form-control" id="user_pwd_re" name="user_pwd_re" onkeyup="pwdKeyDown()">
		       		<p id="pwdChk" style="color:red; display:none;">비밀번호가 틀립니다.</p>
		        </div>
		   		<div class="form-group">
					<label for="exampleFormControlInput1">이름</label>
		       		<input type="text" class="form-control" id="kname" name="kname" required>
		        </div>	
		        <div class="form-group">
		        	<label for="exampleFormControlInput1">성별</label>
		        	<select name="gender" class="form-control">
		        		<option value ="" selected>성별</option>
				  		<option value="1">남자</option>
					  	<option value="2">여자</option>
					</select>
		        </div>
		   		<div class="form-group">
					<label for="exampleFormControlInput1">주소</label>
		       		<input type="text" class="form-control" id="addr1" name="addr1">
		       		<input type="text" class="form-control" id="addr2" name="addr2" style="margin-top : 3px; margin-bottom : 3px;">
		       		<button type="button" onclick="daumAddrFunc();" class="btn btn-info" style="width:100%;">우편번호 찾기</button>
		        </div>			        
		   		<div class="form-group">
					<label for="exampleFormControlInput1">휴대전화</label>
		       		<input type="text" class="form-control" id="PHONE" name="PHONE">
		        </div>			        
		        <hr>
		        <div class="form-group">	        
		        	<button type="submit" class="btn btn-primary" style="width:100%;"><strong>가입하기</strong></button>
		        </div>
		    </form>
	    </div>
    </div>
</body>
	
<!-- JS-->
<script src="resources/js/userScript/user.js"></script>
	
</html>
