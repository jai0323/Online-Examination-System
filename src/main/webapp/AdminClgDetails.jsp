<%@page import="com.quiz.College"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.DBHandler"%>
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
    String name=session.getAttribute("name").toString();
  %>
	<a class="navbar-brand float-right" style="float: right;margin-left:auto;margin-right:0" href="#"><%=name%></a>
	
</nav>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
 
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=adminHome">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=adminclgdetails">View College</a>
    </li>
   
  </ul>
  <a href="MainController?task=logout_college" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
  
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
	 
	 <%
		            ArrayList<College> clgList=(ArrayList<College>)request.getAttribute("clgList");
		            if(clgList!=null){
		            %>
	 <div class="container-fluid">
	  <div class="container shadow-lg p-4 mb-4 bg-white rounded" style="height:670px; width:auto" >
      <h3>List of Colleges</h3>       
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>College Code</th>
		        <th>College Name</th>
		        <th>Email</th>
		        <th>City</th>
		        <th>State</th>
		        <th>Password</th>
		      </tr>
		    </thead>
		     <%
		     for(College clg:clgList)
	            {
		     %>
		    <tbody>
		      <tr>
		        <td><%=clg.getCode()%></td>
		        <td><%=clg.getName() %></td>
		        <td><%=clg.getEmail() %></td>
		        <td><%=clg.getCity() %></td>
		        <td><%=clg.getState() %>  </td>
		        <td><%=clg.getPwd() %></td>
		        <td><a class="btn btn-danger" href="MainController?task=dlt_clg&email=<%=clg.getEmail()%>">Delete</a></td>
		      </tr>
		    </tbody>
		     <%
		       }
		     %>
		  </table>
      </div>
	 </div>
	 <%
	 }
	 %>

</body>
</html>