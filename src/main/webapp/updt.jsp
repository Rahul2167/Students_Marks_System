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
 Connection con;
 PreparedStatement psmt;
	try {
		
		 String url="jdbc:postgresql://localhost:5432/student";
         String user="postgres";
         String pwd="Rahul@2167";
         Class.forName("org.postgresql.Driver");
         con=DriverManager.getConnection(url,user,pwd);
         System.out.println("Update Con OK"); 
        
 
 int sid=Integer.parseInt(request.getParameter("sid"));
String snm=request.getParameter("snm");
String g=request.getParameter("gen");
String s=request.getParameter("sub");
int mk=Integer.parseInt(request.getParameter("mark"));
out.print(sid+" "+snm+" "+g+" "+s+" "+mk);

psmt=con.prepareStatement("update student set name=?,gender=?,subject=?,marks=? where id="+sid);
psmt.setString(1, snm);
psmt.setString(2, g);
psmt.setString(3, s);
psmt.setInt(4, mk);
int r= psmt.executeUpdate();
if (r < 1) {
%>

<script>
   alert("Error");
   window.location.href = "home.jsp";
</script>
<%
} else {
%>
<script>
   alert("Upadte Successful");
   window.location.href = "home.jsp";
</script>
<%
}
	}catch(Exception e) {
		System.out.println(e);
	}       
  
 %>
</body>
</html>