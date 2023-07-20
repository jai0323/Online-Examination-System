 

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.quiz.College;
import com.quiz.DBHandler;
import com.quiz.Question;
import com.quiz.Results;
import com.quiz.Review;
import com.quiz.Student;
import com.quiz.Test;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
   String name,email,pwd,city,state, to, from, text,message=null,subject,password,course,pno,gender,review,resp,ans;
   int semester,code,testId,rid,marks,rate;
   boolean b=false;
   int qid;
   String question,op1,op2,op3,op4,answer;
   DBHandler db=new DBHandler();
   HttpSession session;  //use to hold details of the login type
   RequestDispatcher dispatcher; 
   College clg=new College();
   Test test;
   Student student;
   ArrayList<Student> students;
   ArrayList<Test> tests;
   ArrayList<Review> reviews;
   ArrayList<Question> qlist;
   Question ques;
   Results results,result;
   ArrayList<Results> rlist;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String message=null;
		String task=request.getParameter("task");
		switch(task)
		{
		case "addCollege":
		name=request.getParameter("name");
		email=request.getParameter("email");
		code=Integer.parseInt(request.getParameter("code"));
		pwd=request.getParameter("pwd");
		city=request.getParameter("city");
		state=request.getParameter("state");
		
		College college=new College(email, name, city, state, pwd, code);
		b=db.addCollege(college);
		session=request.getSession();
		session.setMaxInactiveInterval(1800000);
		email=(String)session.getAttribute(task);
		ArrayList<College> clgList=db.getclgList();
		if(b==true)
		{	message="College add Successfully";
			dispatcher=request.getRequestDispatcher("WelcomeAdmin.jsp");
			request.setAttribute("message",message);
			request.setAttribute("email",email);
			request.setAttribute("clgList", clgList);
			dispatcher.forward(request, response);
		}
		else {
			message="Something went wrong. Please try again.";
			dispatcher=request.getRequestDispatcher("WelcomeAdmin.jsp");
			request.setAttribute("message",message);
			request.setAttribute("email",email);
			request.setAttribute("clgList", clgList);
			dispatcher.forward(request, response);
		}
		break;
		
		case "adminclgdetails":
			ArrayList<College> clgList1=db.getclgList();
			dispatcher=request.getRequestDispatcher("AdminClgDetails.jsp");
			request.setAttribute("message",message);
			request.setAttribute("clgList", clgList1);
			dispatcher.forward(request, response);
			break;
			
		case "dlt_clg":
			email=request.getParameter("email");
			b=db.dlt_clg(email);
			
			if(b==true) 
				message="College Deleted";
			else
				message="Something went wrong";
			
				clgList1=db.getclgList();
				dispatcher=request.getRequestDispatcher("AdminClgDetails.jsp");
				request.setAttribute("message",message);
				request.setAttribute("clgList", clgList1);
				dispatcher.forward(request, response);

			
			
			break;
		
		case "adminHome":
			clgList1=db.getclgList();
			dispatcher=request.getRequestDispatcher("WelcomeAdmin.jsp");
			request.setAttribute("message",message);
			request.setAttribute("clgList", clgList1);
			dispatcher.forward(request, response);
			break;
			
		case "testscreen":
			session=request.getSession();
	 		clg=(College)session.getAttribute("clg");
	 		session.setMaxInactiveInterval(1800000);
	 		tests=db.getTests(clg.getCode());
			dispatcher=request.getRequestDispatcher("testscreen.jsp");
			request.setAttribute("clg",clg);
			request.setAttribute("tests", tests);
			dispatcher.forward(request, response);
			break;
			
		case "newtest":
			session=request.getSession();
	 		clg=(College)session.getAttribute("clg");
	 		session.setMaxInactiveInterval(1800000);
			dispatcher=request.getRequestDispatcher("newTest.jsp");
			request.setAttribute("clg",clg);
			dispatcher.forward(request, response);
			break;
			
		case "createtest":
			course=request.getParameter("course");
			semester=Integer.parseInt(request.getParameter("semester"));
			code=Integer.parseInt(request.getParameter("code"));
			subject=request.getParameter("subject");
			name=course+" "+semester+" Semester";
			test=new Test(name, subject, code);
		    testId=db.addTest(test);
			if(testId>0) {
				session=request.getSession();
		 		clg=(College)session.getAttribute("clg");
		 		session.setAttribute("testId", testId);
		 		session.setMaxInactiveInterval(1800000);
				dispatcher=request.getRequestDispatcher("AddQuestion.jsp");
				dispatcher.forward(request, response);
			}
			else {
				session=request.getSession();
		 		clg=(College)session.getAttribute("clg");
		 		session.setMaxInactiveInterval(1800000);
				dispatcher=request.getRequestDispatcher("newTest.jsp");
				request.setAttribute("clg",clg);
				dispatcher.forward(request, response);
			
			}
			break;
			
			
		case "signupPage":
			Random random = new Random();
		    int randomNumber = random.nextInt(9000) + 1000;
			dispatcher=request.getRequestDispatcher("signup.jsp");
			request.setAttribute("randomNumber",randomNumber);
			dispatcher.forward(request, response);
			break;
			
			
		case "forgotpass":
			email=request.getParameter("email");
			student=db.getStudent(email);
			session=request.getSession();
	 		session.setAttribute("student", student);
	 		session.setMaxInactiveInterval(1800000);
			dispatcher=request.getRequestDispatcher("newPassword.jsp");
			dispatcher.forward(request, response);
			break;			
			
		case "updatePassword":
		    String	newpassword=request.getParameter("password");
		    String answer=request.getParameter("answer");
		    session=request.getSession();
	 		student=(Student)session.getAttribute("student");
		    if(student.getAns().equals(answer))
		    {
		    	 student=db.changepassword(student, newpassword);
		    	 if(student!=null)
		    	 {
		    		 message="Password Changed";
		    		 dispatcher=request.getRequestDispatcher("login.jsp");
				    	request.setAttribute("message", message);
						dispatcher.forward(request, response);
		    	 }
		    }
		    else {
		    	message="Wrong Answer";
		    	dispatcher=request.getRequestDispatcher("newPassword.jsp");
		    	request.setAttribute("message", message);
				dispatcher.forward(request, response);
		    }
			break;
			
		case "signup":
			String rn=request.getParameter("randomNumber");
			String captcha=request.getParameter("captcha");
			if(captcha.equals(rn)) {
			name=request.getParameter("name");
			email=request.getParameter("email");
			password=request.getParameter("password");
			pno=request.getParameter("pno");
			course=request.getParameter("course");
			semester=Integer.parseInt(request.getParameter("semester"));
			code=Integer.parseInt(request.getParameter("code"));
			gender=request.getParameter("gender");
			 String ques=request.getParameter("ques");
			String ans=request.getParameter("ans");
			student=new Student(  email, password, name, pno, gender, course,  ques, ans,  semester,  code);
			b=db.addStudent(student);
			if(b==true) message="Registration Successful.You may login now.";
			else message="Simething went wrong. Please try again";
			dispatcher=request.getRequestDispatcher("login.jsp");
			request.setAttribute("message", message);
			dispatcher.forward(request, response);
			}
			else {
				message="Captcha doesn't match";
				random = new Random();
				randomNumber = random.nextInt(9000) + 1000;

			dispatcher=request.getRequestDispatcher("signup.jsp");
			request.setAttribute("message", message);
			request.setAttribute("randomNumber",randomNumber);
			dispatcher.forward(request, response);}
			break;
			
		
		case "addQuestion":
			question=request.getParameter("question");
			op1=request.getParameter("op1");
			op2=request.getParameter("op2");
			op3=request.getParameter("op3");
			op4=request.getParameter("op4");
			answer=request.getParameter("answer");
			testId=Integer.parseInt(request.getParameter("testId"));
			Question q=new Question(question, op1, op2, op3, op4, answer, testId);
			b=db.addQuestion(q);
			if(b==true) {
				message="Question Added";
			}
			else
			message="Something went wrong";
			session=request.getSession();
	 		clg=(College)session.getAttribute("clg");
	 		session.setAttribute("testId", testId);
	 		session.setMaxInactiveInterval(1800000);
			dispatcher=request.getRequestDispatcher("AddQuestion.jsp");
			request.setAttribute("message", message);
			dispatcher.forward(request, response);
			break;
		
			
		case "addResponse":
			rid=Integer.parseInt(request.getParameter("rid"));
			resp=request.getParameter("resp");
			b=db.giveResponse(rid,resp);
			if(b==true)
				message="Response Send";
			else
				message="Something went wrong. Please try again.";
			session=request.getSession();
	 		clg=(College)session.getAttribute("clg");
	 		session.setMaxInactiveInterval(1800000);
	 	    reviews=db.getReviews(clg.getCode());
	 		tests=db.getTests(clg.getCode());
			dispatcher=request.getRequestDispatcher("WelcomeCollege.jsp");
			request.setAttribute("message", message);
			request.setAttribute("tests", tests);
	 		request.setAttribute("reviews", reviews); 
			dispatcher.forward(request, response);
			
			break;
			
		case "collegeHome":
			session=request.getSession();
	 		clg=(College)session.getAttribute("clg");
	 		session.setMaxInactiveInterval(1800000);
	 		reviews=db.getReviews(clg.getCode());
	 		tests=db.getTests(clg.getCode());
			dispatcher=request.getRequestDispatcher("WelcomeCollege.jsp");
			request.setAttribute("message", message);
			request.setAttribute("tests", tests);
	 		request.setAttribute("reviews", reviews); 
			dispatcher.forward(request, response);
			break;
			
		case "ViewUser":
			session=request.getSession();
	 		clg=(College)session.getAttribute("clg");
	 		session.setMaxInactiveInterval(1800000);
	 	    students=db.getStudents(clg.getCode());
	 	    dispatcher=request.getRequestDispatcher("ViewUser.jsp");
			request.setAttribute("message", message);
			request.setAttribute("students", students);
			dispatcher.forward(request, response);
	 	    
			break;
			
		case "testDetails":
          
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			session.setMaxInactiveInterval(1800000);
			testId=Integer.parseInt(request.getParameter("testId"));
			qlist=db.getQuestionList(testId);
			ArrayList<Integer>atmQues=new ArrayList<>();
			int score=0;
			if(qlist!=null) {
				session.setAttribute("qlist", qlist);
				session.setAttribute("testId", testId);
				session.setAttribute("score", score);
				session.setAttribute("atmQues",atmQues);
				dispatcher=request.getRequestDispatcher("beginTest.jsp");
				dispatcher.forward(request, response);
			}
			else {
				message="Something went Wrong.";
				tests=db.getStudentTests(student);
		 		dispatcher=request.getRequestDispatcher("WelcomeStudent.jsp");
		 		request.setAttribute("tests",tests);
		 		request.setAttribute("message", message);
		 		dispatcher.forward(request, response);
			}
			
			break;
			
		case "testOverViewClg":
			testId=Integer.parseInt(request.getParameter("testId"));
			qlist=db.getQuestionList(testId);
			test=db.getTestId(testId);
			dispatcher=request.getRequestDispatcher("TestOverViewClg.jsp");
	 		request.setAttribute("test",test);
	 		request.setAttribute("qlist", qlist);
	 		dispatcher.forward(request, response);
			break;
			
		case "nextQuestion":
			qid=Integer.parseInt(request.getParameter("qid"));
			ans=request.getParameter("op");
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			email=student.getEmail();
			qlist=(ArrayList<Question>)session.getAttribute("qlist");
			atmQues=(ArrayList<Integer>)session.getAttribute("atmQues");
			testId=(Integer)session.getAttribute("testId");
			score=(Integer)session.getAttribute("score");
			ques=qlist.get(atmQues.size());
			marks=qlist.size();
			System.out.println("dekhlo=-----"+score  + testId  );
			if(ques.getQid()==qid) {
				if(ques.getAnswer().equalsIgnoreCase(ans))
					{
					score++;
					
					System.out.println("line 2----"+ score+"---atm"+ atmQues.size()+"------qlist"+ qlist.size());
					}
				 atmQues.add(qid);
					}
			if(atmQues.size()<qlist.size()) {
				System.out.println("Line 3-----atm=="+atmQues.size()+"-------qlist-----"+qlist.size());
				session.setAttribute("qlist", qlist);
				session.setAttribute("score", score);
				session.setAttribute("atmQues",atmQues);
				dispatcher=request.getRequestDispatcher("beginTest.jsp");
				dispatcher.forward(request, response);
			}
			else if(atmQues.size()==qlist.size()) {
				test=db.getTestId(testId);
				subject=test.getSubject();
				result=new Results(testId, score,  marks,  email, subject);
				b=db.setResult(result);
				dispatcher=request.getRequestDispatcher("TestSubmitted.jsp");
				request.setAttribute("result", result);
				dispatcher.forward(request, response);
				
			}
			
			else {
				message="Something went Wrong.";
				tests=db.getStudentTests(student);
		 		dispatcher=request.getRequestDispatcher("WelcomeStudent.jsp");
		 		request.setAttribute("tests",tests);
		 		request.setAttribute("message", message);
		 		dispatcher.forward(request, response);
			}
			
		    
			break;
			
		case "review":
			review=request.getParameter("review");
			rate=Integer.parseInt(request.getParameter("rate"));
			testId=Integer.parseInt(request.getParameter("testId"));
			test=db.getTestId(testId);
			subject=test.getSubject();
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			code=student.getCode();
			email=student.getEmail();
			resp=" ";
			Review r=new Review(review,resp,email,subject,testId,rate,code);
			b=db.setReview(r);
			if(b==true) {
			ArrayList<Test> tests=db.getStudentTests(student);
	 		session=request.getSession();
	 		session.setAttribute("student", student);
	 		session.setMaxInactiveInterval(1800000);
	 		dispatcher=request.getRequestDispatcher("WelcomeStudent.jsp");
	 		request.setAttribute("tests",tests);
	 		dispatcher.forward(request, response);
			}
			break;
			
		case "clgResultView":
			email=request.getParameter("email");
			student=db.getStudent(email);
			rlist=db.getResults(student);
			dispatcher=request.getRequestDispatcher("ClgResultsOfStudent.jsp");
	 		request.setAttribute("rlist",rlist);
	 		request.setAttribute("student",student);
	 		dispatcher.forward(request, response);
			break;
			
		case "Results":
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			rlist=db.getResults(student);
			dispatcher=request.getRequestDispatcher("StudentResults.jsp");
	 		request.setAttribute("rlist",rlist);
	 		dispatcher.forward(request, response);
			break;
			
		case "studentHome":
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			tests=db.getStudentTests(student);
	 		session.setAttribute("student", student);
	 		session.setMaxInactiveInterval(1800000);
	 		dispatcher=request.getRequestDispatcher("WelcomeStudent.jsp");
	 		request.setAttribute("tests",tests);
	 		dispatcher.forward(request, response);
			break;
			
		case "Remarks":
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			ArrayList<Review> reviews=db.getStudentReviews(student);
			dispatcher=request.getRequestDispatcher("StudentReviews.jsp");
	 		request.setAttribute("reviews",reviews);
	 		dispatcher.forward(request, response);
			
			break;
			
		case "new_password":
			session=request.getSession();
			student=(Student)session.getAttribute("student");
			String new_pass1=request.getParameter("newpassword");
			password=request.getParameter("password");
			if(password.equals(student.getPassword()))
			{
				student=db.changepassword(student,new_pass1);
				session.setAttribute("student", student);
				session.setMaxInactiveInterval(1800000);
				response.sendRedirect("ChangePassword.jsp?message=Password Changed Successfully");
				 
			}
			else
			{
				response.sendRedirect("ChangePassword.jsp?message=Old password is wrong");
			}
			break;
	    
		case "logout_student":
			session=request.getSession();
			session.removeAttribute("student");
			response.sendRedirect("login.jsp");
			break;
			
		case "logout_college":
			session=request.getSession();
			session.removeAttribute("clg");
			session.removeAttribute("name");
			response.sendRedirect("login.jsp");
			break;
	
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
