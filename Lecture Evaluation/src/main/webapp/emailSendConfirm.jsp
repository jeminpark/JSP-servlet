<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" >
<title>강의평가 웹사이트</title>
<!--  부트스트랩 css 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!--  커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		
	}	
	
%>
    <nav class = "navbar navbar-expand-lg navbar-light bg-light" aria-label="First navbar example">

        <div class = "container-fluid">
            <a class ="navbar-brand" href="index.jsp">강의평가 웹사이트</a>
            <button class ="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls=""navbarsExample01
            aria-expanded="false" aria-label="Toggle navigation">
                <span class = "navbar-toggler-icon"></span>
            </button>
            <div class ="navbar-collapse collapse" id ="navbarsExample01" style>
                <ul class ="navbar-nav me-auto mb-2">
                    <li class ="nav-item">
                        <a class = "nav-link active" aria-current="page" href="index.jsp">메인</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class = "nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">회원관리</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                        
                        <%
                        	if(userID == null){
                        		
                        	
                        %>
                            <li>
                                <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
                            </li>
                            
                         <%
                        	}else{
                         %>
                            <li>
                                <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
                            </li>
						<% 
							} 
						
						%>
                        </ul>
                    </li>

                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="text" placeholder="내용을 입력하세요." aria-label="Search">
                    <button class ="btn btn-outline-success" style="white-space:nowrap;" type="submit">검색</button>
                </form>

            </div>
        </div>		
	</nav>
	<section class = "container mt-3" style = "max-width: 560px;">
        <div class = "alert alert-warning mt-4" role = "alert">
        	이메일 주소 인증을 하셔야 이용 가능합니다. 인증메일을 받지 못하셨나요?
        </div>
        <a href = "emailSendAction.jsp" class = "btn btn-primary">메일 인증 다시 받기</a>
		
	</section>    
	
    <footer class = "bg-dark mt-4 p-5 text-center" style = "color: #ffffff;">
        Copyright &copy; 2021 박제민 All Rights Reserved.
    </footer>

	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src = "./js/jquery.min.js"></script>
	<!-- 파퍼js 추가하기 -->
	<script src = "./js/pooper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src = "./js/bootstrap.min.js"></script>
</body>
</html>