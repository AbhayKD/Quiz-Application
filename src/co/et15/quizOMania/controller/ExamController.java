package co.et15.quizOMania.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.et15.quizOMania.DatabaseConnectionFactory;
import co.et15.quizOMania.Exam;
import co.et15.quizOMania.QuizQuestion;

/**
 * Servlet implementation class ExamController
 */
@WebServlet("/exam")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String username, email, password;
	String finished = null;

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		boolean finish=false;
		
		DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		Date time1 = new Date();
		final String started=timeFormat.format(time1);
		
			
		try
		{
			if(session.getAttribute("currentExam")==null)
		  {  session=request.getSession(); 	
		     String selectedExam=(String)request.getSession().getAttribute("exam"); 
		     System.out.println("Setting Exam "+selectedExam);
			 Exam newExam=new Exam(selectedExam);
			 session.setAttribute("currentExam",newExam);
			 session.setAttribute("started",started);
			 request.setAttribute("started",started);
		  }
		
		}catch(Exception e){e.printStackTrace();}
		
        Exam exam=(Exam)request.getSession().getAttribute("currentExam");		
        
        if(exam.currentQuestion==0){	
			exam.setQuestion(exam.currentQuestion);
		    QuizQuestion q=exam.questionList.get(exam.currentQuestion);	
			session.setAttribute("quest",q);
        }
			
			String action=request.getParameter("action");
			
			System.out.println("Value of Action "+action+"  "+request.getParameter("minute" + "second"));
			int minute=-1;
			int second=-1;
			if(request.getParameter("minute")!=null)
			{			
			minute=Integer.parseInt(request.getParameter("minute"));
			second=Integer.parseInt(request.getParameter("second"));
			request.getSession().setAttribute("min",request.getParameter("minute") );
			request.getSession().setAttribute("sec",request.getParameter("second") );
			}
			
			String radio=request.getParameter("answer");
			int selectedRadio=-1;
			exam.selections.put(exam.currentQuestion, selectedRadio);
			if("1".equals(radio))
			{
				selectedRadio=1;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			else if("2".equals(radio))
			{
				selectedRadio=2;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			else if("3".equals(radio))
			{
				selectedRadio=3;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			else if("4".equals(radio))
			{
				selectedRadio=4;
				exam.selections.put(exam.currentQuestion, selectedRadio);
				System.out.println("You selected "+selectedRadio);
			}
			
						
			if("Next".equals(action)){
				exam.currentQuestion++;
				exam.setQuestion(exam.currentQuestion);
			    QuizQuestion q=exam.questionList.get(exam.currentQuestion);	
			  	session.setAttribute("quest",q);
			}
			else if("Previous".equals(action))
			{   System.out.println("You clicked Previous Button");
				exam.currentQuestion--;
				exam.setQuestion(exam.currentQuestion);
			    QuizQuestion q=exam.questionList.get(exam.currentQuestion);	
				session.setAttribute("quest",q);
				
			}
			else if("Finish Exam".equals(action)||( minute==0 && second==0))
			{   
				
				finish=true;
				int result=exam.calculateResult(exam);
				username=(String) session.getAttribute("user");
				//ResultLoad();
				Date time2 = new Date();    
				finished=timeFormat.format(time2);
				
				session.setAttribute("time",finished); 
				session.setAttribute("finished",finished);
				session.setAttribute("username",username);
				request.setAttribute("username",username);
				//request.setAttribute("started", started);
				request.setAttribute("result",result);
				request.setAttribute("time",finished);
				request.getSession().setAttribute("currentExam",null);
				request.getRequestDispatcher("/Result").forward(request,response);
				
			}
						
		if(finish!=true){
		request.getRequestDispatcher("/exam.jsp").forward(request,response);
		}
		
		
	}
	
}
