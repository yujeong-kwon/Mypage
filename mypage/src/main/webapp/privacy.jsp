<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");	
	String login_id = (String) session.getAttribute("login_id");
	String login_name = (String) session.getAttribute("login_name");
	String login_pass = (String) session.getAttribute("login_pass");
	
	
	//데베연동
	Connection con = null;
	Statement stmt = null;
	
	InitialContext ctx = new InitialContext();
	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
	
	String dbURL = "jdbc:mysql://localhost:3306/univdb";
	


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 변경</title>
</head>
<style>
    .content-wrap{position: absolute; left:50%; top: 45%; transform: translate(-50%, -50%); text-align:center;}
    #lbl-privacy{font-size:30px; text-align: center;}
    .fieldset-privacy{width: 350px; height: 350px;  }
    .lbl-input{float:left;}
    #change-btn{width: 100%; height: 40px;}
    .input{float:left; width: 100%; margin-top: 10px; border-left-width:0; 
        border-right-width:0;border-top-width:0; border-bottom-width:1;}
    #ID{text-align:left; float: left;}
    .class{text-align: right;}
</style>
<script>
	window.onload = start;
	
	
	
	var state = 0;
	
	function start(){
		var name = document.getElementById("name");
		name.value = "<%= login_name %>";
	}
	
	var request = null;
	function createRequest(){
		try{
			request = new XMLHttpRequest();
		} catch(failed){
			request = null;
		}
		if (request == null)
			alert("Error creating request object!");
	}

	function getResult(){
		if(state==1){
			createRequest();
			
			var id = document.getElementById("ID");
			var name = document.getElementById("name");
			var newPass = document.getElementById("new-pass");
			
			var url = "change.jsp?id=" + id.innerText + "&name=" + name.value + "&pass=" + newPass.value;
			alert(url);
			request.open("GET", url, true);
			
			
			request.send(null);
			alert("변경완료");
		}
	}
	
	//function change() {
	//	var oldPass = document.getElementById("old-pass");
// 		var newPass = document.getElementById("new-pass");
// 		var confirmPass = document.getElementById("confirm-pass");
		
<%-- 		var string = "<%= login_pass %>"; --%>
// 		if(string == oldPass.value){
// 			if(newPass.value == confirmPass.value){
// 				state = 1;
// 			}else{
// 				alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
// 				newPass.focus();
// 			}
// 		}else{
// 			alert("비밀번호를 정확히 입력해주세요.");
// 			oldPass.focus();
// 		}
		
// 	}
	
	function passCheck(form){
		var oldPass = document.getElementById("old-pass");
		var newPass = document.getElementById("new-pass");
		var confirmPass = document.getElementById("confirm-pass");
		var string = "<%= login_pass %>";
		if(oldPass.value != string){
			alert("비밀번호를 정확히 입력해주세요.");
			oldPass.focus();
			return;
		}
		
		if(newPass.value != confirmPass.value){
			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			newPass.focus;
			return;
		}
		form.method="POST";
		form.action="change.jsp";
		form.submit();
	}
</script>
<body>
    <main class="main">
        <h2 id="lbl-privacy">가입자 정보 변경</h2>
        <hr>
        <section class="content-wrap">
        <form name="passForm">
            <fieldset class="fieldset-privacy">
                <legend>가입자 정보</legend>
                <label class="lbl-input">아이디 </label><br>
                <span id="ID" name="ID"><%= login_id %></span><br><br>
                <label class="lbl-input">이름 </label><br>
                <input type="text" class="input" id="name" name="name"><br><br>
                <label class="lbl-input">기존 비밀번호 </label><br>
                <input type="password" class="input" id="old-pass" name="old-pass"><br><br>
                <label class="lbl-input">새 비밀번호 </label><br>
                <input type="password" class="input" id="new-pass" name="new-pass"><br><br>
                <label class="lbl-input">비밀번호 확인 </label><br>
                <input type="password" class="input" id="confirm-pass" name="confirm-pass">
            </fieldset><br>
            <button type="button" value="변경" onclick="passCheck(passForm)">변경</button>  
        </form>
        </section>  
    </main>
</body>
</html>