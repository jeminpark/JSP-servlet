<%@page import="util.SHA256"%>
<%@page import="util.Gmail" %>
<%@page import="java.util.Properties" %>
<%@page import="user.UserDAO"%>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Address" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.Authenticator" %>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	UserDAO userDAO = new UserDAO();
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
		
	
	String host = "http://localhost:8080/Lecture_Evaluation/";
	String from = "onlykeepilgi@gmail.com";
	String to = userDAO.getUserEmail(userID);
	String subject = "강의평가를 위한 이메일 인증입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요."+
					"<a href= '"+ host+"emailCheckAction.jsp?code="+ new SHA256().getSHA256(to)+"'>이메일 인증하기</a>";
					
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.gmail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.starttls.required", "true");
	p.put("mail.smtp.ssl.protocols","TLSv1.2");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	p.put("mail.smtp.ssl.enable", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	
	try{
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html; charset=UTF8");
		Transport.send(msg);
	}
	catch(Exception e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}	

 %> 
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
        <div class = "alert alert-success mt-4" role= "alert">
        	이메일 주소 인증 메일이 전송되었습니다. 회원가입시 입력했던 이메일에 들어가셔서 인증해주세요.
        </div>		
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