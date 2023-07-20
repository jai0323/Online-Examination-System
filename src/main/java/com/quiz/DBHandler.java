 package com.quiz;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DBHandler {
	String errormessage="";

 public String getAdminName(String email)
 {
	 String name="";
	 try {
		 	Class.forName("com.mysql.cj.jdbc.Driver");
		 	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/quizsystem?user=root&password=root");
			
		 	String query="select name from adminlogin where email=? ";
		 	PreparedStatement statement=cn.prepareStatement(query);
		 	statement.setString(1, email);
		 
		 	ResultSet rs=statement.executeQuery();
		 	if(rs.next())
		 	{
		 		name=rs.getString(1);
		 	}
			
		 }
		   catch(Exception e)
		 {
			   
			   
		 }
	 
	 
	 return name;
 }

 
 public Student getStudent(String email)
 {
	 try {  errormessage="";
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Student student=session.get(Student.class,email);
		session.close();
		return student;
	    
	 }
	   catch(Exception e)
	 {
		   
		 errormessage=e.getMessage(); 
		 return null;
	 }


 }

 
 public boolean addStudent(Student student)
 {
		try {  errormessage="";
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(student);
		session.getTransaction().commit();
		session.close();
		return true;
	    
	 }
	   catch(Exception e)
	 {
		   
		 errormessage=e.getMessage(); 
		 return false;
	 }


 }
 
 public boolean addQuestion(Question q)
 {
		try {  
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Question.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(q);
		session.getTransaction().commit();
		session.close();
		return true;
	    
	 }
	   catch(Exception e)
	 {
		   return false; 
	 }


 }
 public String errormessage()
 {
	 return errormessage;
 }


public boolean addCollege(College college) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(College.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(college);
		session.getTransaction().commit();
		session.close();
		return true;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return false;
	}

}

public ArrayList<College> getclgList(){
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(College.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<College> clgList=(ArrayList<College>)session.createQuery("from college").getResultList();
		System.out.println("Error:---"+ clgList.size());
		session.close();
		return clgList;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
}


public int addTest(Test test) {
	try {
		
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Test.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(test);
		session.getTransaction().commit();
		session.close();
		return getTestId(test);
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return 0;
	}
}

public int getTestId(Test test) {

 try{errormessage="";
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/quizsystem?user=root&password=root");
 	String query="select * from test order by testId desc";
 	PreparedStatement statement=cn.prepareStatement(query);
 	ResultSet rs=statement.executeQuery();
 	
 	System.out.println("line 1");
 	if(rs.next()) {
        System.out.println(rs.getInt(1));
 		return rs.getInt(1);
	}
 	cn.close();
 	return 0;
 }
 catch(Exception e) {
	 System.out.println("ERROR----"+e.getMessage());
	 return 0;
 }
}


public ArrayList<Test> getTests(int code) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Test.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Test> tests=(ArrayList<Test>)session.createQuery("from test where code="+code+"").getResultList();
		session.close();
		return tests;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
	
}


public boolean giveResponse(int rid, String resp) {
	
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Review.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Review r=session.get(Review.class, rid);
		r.setResp(resp);
		session.getTransaction().commit();
		session.close();
		return true;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return false;
	}
}


public ArrayList<Review> getReviews(int code) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Review.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Review> r=(ArrayList<Review>)session.createQuery("from reviews where code="+code+"").getResultList();
		session.close();
		return r;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
	
}


public ArrayList<Test> getStudentTests(Student s) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Test.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Test> tests=(ArrayList<Test>)session.createQuery("from test where code="+s.getCode()+"").getResultList();
		session.close();
		return tests;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
}


public ArrayList<Question> getQuestionList(int testId) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Question.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Question> qlist=(ArrayList<Question>)session.createQuery("from questions where testId="+testId+"").getResultList();
		session.close();
		return qlist;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
	
}


public boolean setResult(Results result) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Results.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(result);
		session.getTransaction().commit();
		session.close();
		return true;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return false;
	}
}


public boolean setReview(Review r) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Review.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.save(r);
		session.getTransaction().commit();
		session.close();
		return true;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return  false;
	}
}


public ArrayList<Results> getResults(Student student) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Results.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Results> rlist=(ArrayList<Results>)session.createQuery("from results where email='"+student.getEmail()+"'").getResultList();
		session.close();
		return rlist;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
}


public Test getTestId(int testId) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Test.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		Test test=session.get(Test.class, testId);
		session.close();
		return test;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
}


public ArrayList<Review> getStudentReviews(Student student) {
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Review.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Review> rlist=(ArrayList<Review>)session.createQuery("from reviews where email='"+student.getEmail()+"'").getResultList();
		session.close();
		return rlist;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return null;
	}
}


public Student changepassword(Student student, String new_pass1) {
	try {  
	SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
	Session session=sf.getCurrentSession();
	session.beginTransaction();
	Student s=session.get(Student.class,student.getEmail());
	s.setPassword(new_pass1);
	session.getTransaction().commit();
	session.close();
	return s;
    
 }
   catch(Exception e)
 {
	   
	 errormessage=e.getMessage(); 
	 return null;
 }

}


public ArrayList<Student> getStudents(int code) {
	try {  
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		ArrayList<Student> s=(ArrayList<Student>)session.createQuery("from studentlogin where code="+code+"").getResultList();
		session.close();
		return s;
	    
	 }
	   catch(Exception e)
	 {
		   
		 errormessage=e.getMessage(); 
		 return null;
	 }
}


public boolean dlt_clg(String email) {
	
	try {
		SessionFactory sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(College.class).buildSessionFactory();
		Session session=sf.getCurrentSession();
		session.beginTransaction();
		session.delete(session.get(College.class, email));
		session.getTransaction().commit();
		session.close();
		return true;
		
	}
	catch(Exception e)
	{
		System.out.println("Error:---"+e.getMessage());
		return false;
	} 
}


 
 
}
