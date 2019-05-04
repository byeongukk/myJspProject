<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.Member"%>
<%
Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
body {
	background: url("/jsp/image/bgsample.png");
}

.wrap {
	background: black;
	width: 100%;
	height: 50px;
}

.menu {
	background: black;
	color: white;
	text-align: center;
	width: 150px;
	height: 50px;
	display: table-cell;
	vertical-align: middle;
}

.nav {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
}

.menu:hover {
	background: darkgray;
	color: orangered;
	font-weight: bold;
	curosor: pointer;
}

.btns {
	align: center;
}

#loginBtn, #memberJoinBtn, #logoutBtn, #changeInfo {
	display: inline-block;
	text-align: center;
	background-color: orangered;
	color: white;
	height: 25px;
	width: 100px;
	border-radius: 5px;
}

#memberJoinBtn, #chageInfo {
	background: yellowgreen;
}

#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover
	{
	cursor: pointer;
}

.loginArea>form, #userInfo {
	float: right;
}

#logoutBtn, #changeInfo {
	background: orangered;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}
</style>
</head>
<body>
<body>
	<h1 align="center" onclick="goHome()">Welcome</h1>

	<div class="loginArea">
		<form id="loginForm" action="<%=request.getContextPath()%>/login.me" method="post">
			<table>
				<tr>
					<td><label class="text">ID : </label></td>
					<td><input type="text" name="userId"></td>
				</tr>
				<tr>
					<td><label class="text">PWD :</label></td>
					<td><input type="password" name="userPwd"></td>
				</tr>
			</table>
			<div class="btns" align="center">
				<div id="memberJoinBtn" onclick="memberJoin()">회원가입</div>
				<div id="loginBtn" onclick="login()">로그인</div>
			</div>
		</form>
	</div>
	<script>
		function login(){
			$("#loginForm").submit();
		}
		function logout(){
			if(confirm("로그아웃 하시겠습니까?")){
				location.href="<%=request.getContextPath()%>/logout.me";
			}
		}
		function memberJoin(){
			location.href="/jsp/views/member/memberJoinForm.jsp";
		}
		
	</script>
	
	
<br clear="both">

	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="goHome()">HOME</div>
			<div class="menu" onclick="goNotice()">공지사항</div>
			<div class="menu" onclick="goBoard()">게시판</div>
			<div class="menu" onclick="goThumbnail()">사진게시판</div>
		</div>
	</div>
	<script>
		function goHome(){
			location.href="/jsp/index.jsp";
		}
		
		function goNotice(){
			//서블릿 요청
			location.href="/jsp/selectList.no";
			
		}
		
		function goBoard(){
			location.href="/jsp/selectList.bo";
			
		}
		
		function goThumbnail(){
		}
	</script>


</body>
</html>