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
                            <li>
                                <a class="dropdown-item" href="#">로그인</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">회원가입</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">로그아웃</a>
                            </li>

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
	<section class = "container">
		<form method="get" action="./index.jsp" class = "form-inline mt-3">
			<select name="lectureDivide" class = "form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공">전공</option>
				<option value="교양">교양</option>
				<option value="기타">기타</option>
				
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder ="내용을 입력하세요">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-bs-toggle="modal" href="#registerModal">등록하기</a>
			<a class= "btn btn-danger mx-1 mt-2 " data-bs-toggle="modal" href="#reportModal">신고</a>
		</form>
		
	</section>
	<div class="modal fade" id ="registerModal" tabindex="-1" role="dialog" aria-labelledby ="modal" aria-hidden ="true">
		<div class = "modal-dialog">
			<div class="modal-content">
				<div class = "modal-header">
					<h5 class = "modal-title" id="modal">평가등록</h5>
					<button type = "button" class = "close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class = "modal-body">
				
				</div>
			</div>
		</div>
	</div>
	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src = "./js/jquery.min.js"></script>
	<!-- 파퍼js 추가하기 -->
	<script src = "./js/pooper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src = "./js/bootstrap.min.js"></script>
</body>
</html>