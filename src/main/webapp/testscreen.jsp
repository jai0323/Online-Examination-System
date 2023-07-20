<%@page import="com.quiz.Test"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.College"%>
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
    
   College clg=(College)session.getAttribute("clg");
  %>
  <a class="navbar-brand float-right" style="float: right;margin-left:auto;margin-right:0" href="#"><%=clg.getName() %></a>
	
</nav>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=collegeHome">Home</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="MainController?task=ViewUser">View Users</a>
    </li>
    
    
  </ul>
  <a href="MainController?task=logout_college" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
 
</nav>
<br>
<div class="container-fluid ">
		
		<div class="mx-auto " style="width:200px">
		<a href="MainController?task=newtest" class="mx-auto btn-lg btn-warning">Create New Quiz</a>
		</div>
		
		<div class="container shadow-lg p-4 mb-4 bg-white mx-auto rounded" style="height:670px;margin:20px 20px;" >
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
				    
				    <%ArrayList<Test> tests=(ArrayList<Test>)request.getAttribute("tests");
				      for(Test t:tests)
				      {
				    %>
				   
				    <tbody> 
				      <tr>
				        <td><%=t.getTestId() %></td>
				        <td><%=t.getName() %></td>
				        <td><%=t.getSubject() %></td>
				        <td><a href="MainController?task=testOverViewClg&testId=<%=t.getTestId()%>" class="btn btn-success">Show</a></td>
				        
				      </tr>
				      
				    </tbody>
				    
				    <%} %>
				    
				  </table>
				  </div>
  		</div>
</div>

</body>
</html>