<%@page import="com.quiz.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.quiz.Results"%>
<%@page import="com.quiz.Student"%>
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
      <a class="nav-link" href="MainController?task=studentHome">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="MainController?task=Results">Results</a>
    </li>
   <li class="nav-item">
      <a class="nav-link" href="MainController?task=Remarks">Remarks</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="ChangePassword.jsp">Change password</a>
    </li>
  </ul>
  <a href="MainController?task=logout_student" class="btn btn-success bg-warning border border-danger float-right " style="float: right;margin-left:auto;margin-right:0"> Logout </a>
  
</nav>
<br>

<%
 String message=(String)request.getParameter("message");
 if(message!=null)
 {
 %>
	    <div class="col-sm-12">
	   	<div class="alert alert-info alert-dismissible fade show" style="width:50%;margin-left: 25%; " >
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=message %></strong>
		</div>
		</div>	 
<% }%>
<br>
<div class="col-sm-12">
      <div class="border border-light rounded-lg shadow-lg p-4 mb-4 bg-white" style="width:90%;margin-left:5%">
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

</body>
</html>