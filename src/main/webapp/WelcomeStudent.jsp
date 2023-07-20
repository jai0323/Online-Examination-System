<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Welcome</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 	<ul class="navbar-nav">
 		<li class="nav-item navbar-brand">
 			DigiEdu ERA
	 	</li>
	</ul> 
	<%
    
	Student student=(Student)session.getAttribute("student");
 %>
  <a class="navbar-brand float-right" style="float: right;margin-left:auto;margin-right:0" href="#"><%=student.getName()%></a>
	
</nav>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="StudentProfile.jsp">Profile</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=Remarks">Remarks</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="MainController?task=Results">Results</a>
    </li>
   <li class="nav-item">
      <a class="nav-link" href="ChangePassword.jsp">Change password</a>
    </li>
  </ul>
  <a href="MainController?task=logout_student" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
</nav>
<br>

<%
 String message=(String)request.getAttribute("message");
 if(message!=null)
 {
 %>
	    <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>	 
<% } %>


 
<div class="container-fluid">
  <div class="row" style=margin:'20px '>
  	<div class="col-sm-12">
  		<div class="container shadow-lg p-4 mb-4 bg-white rounded" style="height:670px" >
  			 <h3>List of Tests</h3>
  			  <div style="height:600px;overflow-y:auto;width: 100%;">
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Test Id</th>
				        <th>Test name</th>
				        <th>Subject</th>
				        <th></th>
				      </tr>
				    </thead>
				    
				    
				   
				    <tbody> 
				    <%ArrayList<Test> tests=(ArrayList<Test>)request.getAttribute("tests");
				      for(Test t:tests)
				      {
				    %>
				      <tr>
				        <td><%=t.getTestId() %></td>
				        <td><%=t.getName() %></td>
				        <td><%=t.getSubject() %></td>
				        <td>
				        <form action="MainController">
						        <input type="hidden" name="testId" value="<%=t.getTestId()%>">
						        <button type="submit" class="btn btn-warning" name="task" value="testDetails">Begin Test</button>
				               </form>
						      
				        </td>
				        
				      </tr>
				      
				   
				    
				    <%} %>
				     </tbody>
				  </table>
				  </div>
  		</div>
  	</div>
  	
  </div>
</div>


</body>
</html>