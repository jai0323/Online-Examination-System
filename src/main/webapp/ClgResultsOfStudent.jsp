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
      <a class="nav-link" href="MainController?task=testscreen">Add Test</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=ViewUser">View Users</a>
    </li>
 
  </ul>
  <a href="MainController?task=logout_college" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
  
</nav>
<br>
<%
Student student=(Student)request.getAttribute("student");
%>
<div class="col-sm-12">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:77%;margin:auto;">
      <h4>Students Details</h4>
            <table class="table">
            <tr class="form-group">
		    <td >Name : </td>
		    <td ><%=student.getName()%></td>
		    </tr>
		    <tr class="form-group">
		    <td >Eamil : </td>
		    <td ><%=student.getEmail()%></td>
		    </tr>
		    <tr class="form-group">
		    <td >college Code : </td>
		    <td ><%=student.getCode()%></td>
		    </tr>
		    <tr class="form-group">
		    <td >Course : </td>
		    <td ><%=student.getCourse()%></td>
		    </tr>
		    <tr class="form-group">
		    <td >Semester : </td>
		    <td ><%=student.getSemester()%></td>
		    </tr>
		    <tr class="form-group">
		    <td >Gender : </td>
		    <td ><%=student.getGender()%></td>
		    </tr>
		    <tr class="form-group">
		    <td >Mobile : </td>
		    <td ><%=student.getPno()%></td>
		    </tr>
		   </table>
		   
		</div>        	  
      </div>
<div class="container-fluid">
  <div class="row" >
  	<div class="col-sm-12">
  		<div class="container shadow-lg p-4 mb-4 bg-white rounded" style="height:670px" >
  			 <h3>Results</h3>
  			 <%
  			 ArrayList<Results> rlist=(ArrayList<Results>)request.getAttribute("rlist");
  			 %>
  			  <div style="height:600px;overflow-y:auto;width: 100%;">
				  <table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Test Id</th>
				         <th>Subject</th>
				        <th>Marks Obtained</th>
				        <th>Total Marks</th>
				      </tr>
				    </thead>
				    <tbody>
				    <%if(rlist!=null){
				    for(Results r:rlist){ %>
				    <tr>
				     <td><%=r.getTestId()%></td>
				     <td><%=r.getSubject()%></td>
				     <td><%=r.getScore()%></td>
				     <td><%=r.getMarks()%></td>
				    </tr>
				    <%}}%>
				    </tbody>
				    </table>
			</div>
		</div>
	</div>
	</div>
	</div>		    
 
</body>
</html>