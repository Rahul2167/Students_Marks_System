<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import = "java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Update User</h1>
<%
String id=request.getParameter("id");
  Connection con;
  Statement stmt;
  ResultSet rs;
  PreparedStatement psmt;
	try {
		
		 String url="jdbc:postgresql://localhost:5432/student";
          String user="postgres";
          String pwd="Rahul@2167";
          Class.forName("org.postgresql.Driver");
          con=DriverManager.getConnection(url,user,pwd);
          System.out.println("Before update Con OK"); 
         
         stmt=con.createStatement();
          rs=stmt.executeQuery("select * from  student where id="+id);
          while(rs.next()){
        	 int iid=rs.getInt("id");
        	 String nm=rs.getString("name");
        	 String gen=rs.getString("gender");
        	 String sub=rs.getString("subject");
        	 int m=rs.getInt("marks");
        	 
        	%> 
        	<div class="modal-body">
       <form action="updt.jsp" method="get">
       <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Student id</label>
  <input type="text" readonly class="form-control" value="<%=iid %>" name="sid"  placeholder="Enter Student Number">
</div>
       <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Student Name</label>
  <input type="text" class="form-control" value="<%=nm %>" name="snm"  placeholder="Enter Student Name" required>
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Student Gender</label>
<select name="gen" id="gender">
    <option>Male</option>
    <option>Female</option>
  </select></div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Subject</label>
 <select name="sub" id="subject">
    <option>English</option>
    <option>Marathi</option>
    <option>Science</option>
    <option>History</option>
    <option>Geography</option>
    <option>Math</option>
    <option>Sanskrit</option>
  </select></div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Subject Marks</label>
  <input type="number" class="form-control" value="<%=m %>" name="mark"  placeholder="Enter Student Marks" required>
</div>
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="confirmClose()">Close</button>      
        <button type="submit" name="updt" value="update" class="btn btn-primary">Update</button>
      </div>
      </form>
        	 
        	 <%
          }
       
	}
          catch(Exception e){
        	  
          }
          %>
          
</body>
</html>