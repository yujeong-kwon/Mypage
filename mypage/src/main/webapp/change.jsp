<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%
	String id = request.getParameter("ID");
	String newName = request.getParameter("name");
	String newPass = request.getParameter("new-pass");

	//getMemberDAO
	memberDAO.modifyPass(id, newName, newPass);
	//Connection con = null;
	//Statement stmt = null;
	
// 	InitialContext ctx = new InitialContext();
// 	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
	
// 	String dbURL = "jdbc:mysql://localhost:3306/univdb";
	
// 	PreparedStatement pstmt = null;
	
// 	try{
// 		con = ds.getConnection();
		
// 		//stmt = con.createStatement();
// 		String sql="UPDATE test SET name=?, pass=? WHERE id=?";
// 		pstmt = con.prepareStatement(sql);
		
// 		pstmt.setString(1, newName);
// 		pstmt.setString(2, newPass);
// 		pstmt.setString(3, id);
// 		pstmt.executeUpdate();
		
	
		
// 		//stmt.executeUpdate("UPDATE test SET name='" + newName +"', pass='" + newPass + "' WHERE id='" + id + "'");
		
		
		
// 		} catch(Exception e){
// 			out.println("조회에 문제가 있음 <hr>");
// 			out.println(e.toString());
// 			e.printStackTrace();
// 		} finally{
// 			if(stmt!=null) stmt.close();
// 			if(con!=null) con.close();
// 		}
%>