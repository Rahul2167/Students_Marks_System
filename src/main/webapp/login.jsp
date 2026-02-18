
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
<% 
    try{
    	
    	 String um=request.getParameter("unm");
    	    String pp=request.getParameter("pwd");
    	    Connection con;
    	    Statement stmt;
    	    ResultSet rs;
    	String url="jdbc:postgresql://localhost:5432/students_new";
        String user="postgres";
        String pwd="Rahul@2167";
        Class.forName("org.postgresql.Driver");
        con=DriverManager.getConnection(url,user,pwd);
        System.out.println("Update Con OK"); 
     stmt=con.createStatement();
    rs= stmt.executeQuery("select * from students_new where username='"+um+"' and password='"+pp+"'");
      int cnt=0;  
    while(rs.next()){
    	   cnt++;
    	  String unm=rs.getString("username");
    	  session.setAttribute("unm", unm);
    	  response.sendRedirect("home.jsp");
      }
         %>
         <%
        if(cnt==0){
        	 %>
        	 <script>
             alert("Invalid Credentials...");
             window.location.href = "index.html";
         </script>
        	<% 
        }
    }catch(Exception e){
    	System.out.print(e);
    }
    
%>

</body>
</html>