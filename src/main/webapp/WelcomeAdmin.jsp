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
<div class="container-fluid">
  <div class="row" style=margin:20px>
    <div class="col-sm-6">
      <div class="container shadow-lg p-4 mb-4 bg-white rounded" >
      	<h3>Provide College Details</h3>
      	<hr>
      	<form action="MainController" method="post">
		  <div class="form-group">
		    <label for="collogeCode">College Code:</label>
		    <input type="text" class="form-control" placeholder="Enter college code" name="code" id="clgCode">
		  </div>
		  <div class="form-group">
		    <label for="name">Name:</label>
		    <input type="text" class="form-control" placeholder="Enter name" name="name" id="name">
		  </div>
		  <div class="form-group">
		    <label for="email">Email address:</label>
		    <input type="email" class="form-control" placeholder="Enter college's email" name="email" id="email">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" placeholder="Enter password" name="pwd" id="pwd">
		  </div>
		  <div class="form-group">
		    <label for="city">City:</label>
		    <input type="text" class="form-control" placeholder="Enter City" name="city" id="city">
		  </div>
		  <div class="form-group">
		    <label for="state">State:</label>
		    <input type="text" class="form-control" placeholder="Enter state" name="state" id="pwd">
		  </div>
		  <button type="submit" class="btn btn-primary" name="task" value="addCollege">Submit</button>
		</form>
      </div>
    </div>
    <div class="col-sm-6">
      <div class="container shadow-lg p-4 mb-4 bg-white rounded" style="height:670px; width:auto" >
      <h3>List of Colleges</h3>
           
  <table class="table table-striped">
    <thead>
      <tr>
        <th>College Code</th>
        <th>College Name</th>
        <th>Location</th>
        <th></th>
      </tr>
    </thead>
     <%
            ArrayList<College> clgList=(ArrayList<College>)request.getAttribute("clgList");
            for(College clg:clgList)
            {
            %>
    <tbody>
      <tr>
        <td><%=clg.getCode()%></td>
        <td><%=clg.getName()%></td>
        <td><%=clg.getCity()%>,<%=clg.getState() %></td>
        <td> </td>
        
      </tr>
    </tbody>
     <%
       }
     %>
  </table>
      </div>
    </div>
  </div>
</div>

</body>
</html>