<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import = "java.io.PrintWriter" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String userID = "";
	String userPassword = "";
	if(request.getParameter("userID") != null && request.getParameter("userID") != "" ){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null && request.getParameter("userPassword") != ""){
		userPassword = (String) request.getParameter("userPassword");
	}
	if(userID == "" || userPassword == ""){
		PrintWriter script = response.getWriter();
		//System.out.println("userId: "+userID+"userPassword: "+userPassword);
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userID, userPassword);
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		System.out.println("userId: "+userID+"userPassword: "+userPassword);
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.');");
		script.println("location.href = 'index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>