<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta name="description" content="">
  	<meta name="author" content="">

  	<title>SB Admin 2 - Login</title>
	
	<!-- ## 공통 적용 -->
	<jsp:include page="/WEB-INF/views/common.jsp"/>
	
</head>
<body class="bg-gradient-primary">

	<div class="container">
    	<!-- Outer Row -->
    	<div class="row justify-content-center">
      		<div class="col-xl-10 col-lg-12 col-md-9">
        		<div class="card o-hidden border-0 shadow-lg my-5">
          			<div class="card-body p-0">
            			<!-- Nested Row within Card Body -->
            			<div class="row">
              				<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
             				<div class="col-lg-6">
               					<div class="p-5">
               					
               						<div class="text-center">
                 						<h1 class="h4 text-gray-900 mb-4"></h1>
               						</div>
             					 	
               					 	<form onsubmit="return check();" action="/loginAction.do" method="post" class="user">
               					 		
               					 		<!-- 아이디 -->
                   						<div class="form-group">
                   							<input type="text" class="form-control form-control-user" id="userId" name="userId">
               		 					</div>
                  		 					
                  		 					<!-- 패스워드 -->
                   						<div class="form-group">
                     							<input type="password" class="form-control form-control-user" id="userPwd" name="userPwd">
                   						</div>
                   						
                   						<div class="form-group">
                   							<div class="custom-control custom-checkbox small">
                     							<input type="checkbox" class="custom-control-input" id="customCheck">
                     							<label class="custom-control-label" for="customCheck">Remember Me</label>
                   							</div>
                   						</div>
                   
                  							<button type="submit" class="btn btn-primary btn-user btn-block"><strong>로그인</strong></button>
                   						<hr>
                   						
                   						<a href="index.html" class="btn btn-google btn-user btn-block">
                     							<i class="fab fa-google fa-fw"></i> 구글 로그인
                   						</a>
                   						<a href="index.html" class="btn btn-facebook btn-user btn-block">
                     							<i class="fab fa-facebook-f fa-fw"></i> 페이스북 로그인
                   						</a>
                 						</form>
                 						
                 						<hr>
                 					<div class="text-center">
                   						<a class="small" href="forgot-password.html">비밀번호 찾기</a>
                 					</div>
                 					<div class="text-center">
                  						 <a class="small" href="/userSign.do">회원가입</a>
                 					</div>
               					</div>
             				</div>
            			</div>
          			</div>
       			</div>
    		</div>
   		</div>
	</div>
  		
<!-- JS-->
<script src="resources/js/userScript/user.js"></script>

</body>
</html>
