<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Delete Page</h1>
<%
    String id=request.getParameter("id");
    out.print(id);
    Connection con;
   
    PreparedStatement psmt;
  	try {
  		 String url="jdbc:postgresql://localhost:5432/student";
            String user="postgres";
            String pwd="Rahul@2167";
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection(url,user,pwd);
            System.out.println("Con OK");
            psmt=con.prepareStatement("delete from student where id="+id);
            int r= psmt.executeUpdate(); 
            if(r<1) {
           	 String msg = "Error";
         	   System.err.println("Error");
         	   response.sendRedirect("home.jsp");
            }else {
           	 String msg = "Login Successful";
         	   System.out.println("Insert Success..!");
         	  response.sendRedirect("home.jsp");
            }
  	}catch(Exception e){
  		
  	}
    
    
    
%>
</body>
</html>