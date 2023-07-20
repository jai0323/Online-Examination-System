

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.quiz.College;
import com.quiz.DBHandler;
import com.quiz.Review;
import com.quiz.Student;
import com.quiz.Test;


/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Authenticate")
public class Authenticate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		RequestDispatcher dispatcher;
		DBHandler db=new DBHandler();
		String email,password,category,errormessage;
        email=request.getParameter("email");		
        password=request.getParameter("password");
        category=request.getParameter("category");
		try {  errormessage="";
			 	Class.forName("com.mysql.cj.jdbc.Driver");
			 	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/quizsystem?user=root&password=root");
				if(category.equals("Administrator"))
				{
			 	String query="select * from adminlogin where email=? and password=?";
			 	PreparedStatement statement=cn.prepareStatement(query);
			 	statement.setString(1, email);
			 	statement.setString(2, password);
			 	ResultSet rs=statement.executeQuery();
			 	
			 	if(rs.next())
			 	{
			 		HttpSession session;
			 		session=request.getSession();
			 		String name=rs.getNString(4);
					session.setMaxInactiveInterval(900000000);
			 		cn.close();
			 		ArrayList<College> clgList=db.getclgList();
			 		dispatcher=request.getRequestDispatcher("WelcomeAdmin.jsp");
					session.setAttribute("name",name);
					request.setAttribute("clgList", clgList);
					dispatcher.forward(request, response);
			 	}
			 	else
			 	{
			 		cn.close();
			 		response.sendRedirect("SiteController?action=login");
			 	}
				}
				else if(category.equals("Student"))
					{
					String query="select * from studentlogin where email=? and password=?";
				 	PreparedStatement statement=cn.prepareStatement(query);
				 	statement.setString(1, email);
				 	statement.setString(2, password);
				 	ResultSet rs=statement.executeQuery();
				 	
				 	if(rs.next())
				 	{   Student student=db.getStudent(email);
				 	    ArrayList<Test> tests=db.getStudentTests(student);
				 		HttpSession session=request.getSession();
				 		session.setAttribute("student", student);
				 		session.setMaxInactiveInterval(1800000);
				 		cn.close();
				 		dispatcher=request.getRequestDispatcher("WelcomeStudent.jsp");
				 		request.setAttribute("tests",tests);
				 		dispatcher.forward(request, response);
				 	}
				 	else
				 	{
				 		cn.close();
				 		response.sendRedirect("SiteController?action=login");
				 	}
					
				}
				else if(category.equals("College"))
				{
				String query="select * from college where email=? and pwd=?";
			 	PreparedStatement statement=cn.prepareStatement(query);
			 	statement.setString(1, email);
			 	statement.setString(2, password);
			 	ResultSet rs=statement.executeQuery();
			 	
			 	if(rs.next())
			 	{   SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(College.class).addAnnotatedClass(Review.class).addAnnotatedClass(Test.class).buildSessionFactory();
				Session session=sf.getCurrentSession();
				session.beginTransaction();
				College clg=session.get(College.class, email);
				ArrayList<Test> tests=(ArrayList<Test>)session.createQuery("from test where code="+clg.getCode()+"").getResultList();
				ArrayList<Review> reviews=(ArrayList<Review>)session.createQuery("from reviews where code="+clg.getCode()+"").getResultList();
				session.close();
			 		HttpSession session1=request.getSession();
			 		session1.setAttribute("clg",clg);
			 		session1.setMaxInactiveInterval(900000000);
			 		cn.close();
			 		dispatcher=request.getRequestDispatcher("WelcomeCollege.jsp");
			 		request.setAttribute("tests", tests);
			 		request.setAttribute("reviews", reviews);
					dispatcher.forward(request, response);
			 	}
			 	else
			 	{
			 		cn.close();
			 		response.sendRedirect("SiteController?action=login");
			 	}
				}
			 }
			   catch(Exception e)
			 {
				   
				 errormessage=e.getMessage(); 
				 out.println(errormessage);
			 }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
