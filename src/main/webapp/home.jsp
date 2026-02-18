<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function  del(id) {
	window.location.href = "delete.jsp?id="+id; 
}
function  updt(id) {
	window.location.href = "nupdate.jsp?id="+id; 
}
</script>
<style>
.top-bar {
    display: flex;
    justify-content: flex-end;
    align-items: right;
    padding: 00px 00px;
    background-color: #f8f9fa;
    border-bottom: 1px solid #ddd;
}

.logout-btn {
    background-color: #dc3545;
    color: white;
    border: none;
    padding: 6px 14px;
    border-radius: 10px;
    cursor: pointer;
}

.logout-btn:hover {
    background-color: #c82333;
}
</style>

</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<body>
<h2>Welcome, <%= session.getAttribute("unm") %></h2>
<div class="top-bar">
    <form action="logout.jsp" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>
 <h1 class="mb-4 text-center">Student Marks Records</h1>
 <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Add Student Marks
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="home.jsp" method="get">
       <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Student Name</label>
  <input type="text" class="form-control" name="snm"  placeholder="Enter Student Name" required>
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Select Gender</label>
  <select name="gen" id="gender">
    <option>Male</option>
    <option>Female</option>
  </select>
  
</div>
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
  </select>
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Subject Marks</label>
  <input type="number" class="form-control" name="mark"  placeholder="Enter Student Marks" required>
</div>
    
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>
    <table class="table table-bordered table-hover shadow">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Subject</th>
                <th>Marks</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>

  <%
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
          System.out.println("Home Con OK");
          
          stmt=con.createStatement();
          rs=stmt.executeQuery("select * from  student");
          while(rs.next()){
        	 int id=rs.getInt("id");
        	 String nm=rs.getString("name");
        	 String gen=rs.getString("gender");
        	 String sub=rs.getString("subject");
        	 int m=rs.getInt("marks");
          %>
          <tr>
          <td><%= id %></td>
          <td><%= nm %></td>
          <td><%= gen %></td>
          <td><%= sub %></td>
          <td><%= m %></td>
          <td> <button type="button" onclick="del(<%= id %>)" class="btn btn-danger">Delete</button>
          <button type="button" onclick="updt(<%= id %>)" class="btn btn-warning">Update</button>
          </td>
          </tr>
        <% 
          }
          String snm=request.getParameter("snm");
          String g=request.getParameter("gen");
          String s=request.getParameter("sub");
          int mk=Integer.parseInt(request.getParameter("mark"));
          //out.print(snm+" "+g+" "+s+" "+mk);
                 
          psmt=con.prepareStatement("insert into student(name,gender,subject,marks)values(?,?,?,?)");
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
             alert("Insert Successful");
             window.location.href = "home.jsp";
         </script>
     <%
     }
        /*  if(r<1) {
        	 String msg = "Error";
      	   System.err.println("Error");
         }else {
        	 String msg = "Login Successful";
      	   System.out.println("Insert Success..!");
      	   response.sendRedirect("home.jsp");
         } */
      
          
	}catch(Exception e) {
		System.out.println(e);
	}       
  %>  

   </table>
   </tbody>
</body>
</html>