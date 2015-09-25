package co.et15.quizOMania;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Result
 */
@WebServlet("/Result")
public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Result() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
    Exam e = new Exam();
    
	String username=(String) request.getAttribute("username");
	int result= (int) request.getAttribute("result");
	String started=(String) request.getAttribute("started");
	String time=(String) request.getAttribute("time");
	//int v = Integer.parseInt(r);
	HttpSession session=request.getSession();
	session=request.getSession(); 	 
	request.setAttribute("started",started);
	
	Connection con=DatabaseConnectionFactory.createConnection();
	
	try
	{
	 Statement st=con.createStatement();
	 String sql = "INSERT INTO result values ('"+username+"','"+result+"','"+started+"','"+time+"')";
	 System.out.println(sql);
	 st.executeUpdate(sql);
	}catch(SQLException sqe){System.out.println("Error : While Inserting record in database");}
	try
	{
	 con.close();	
	}catch(SQLException se){System.out.println("Error : While Closing Connection");}
	//request.setAttribute("result", Result);
	RequestDispatcher dispatcher=request.getRequestDispatcher("/result.jsp");
	dispatcher.forward(request, response);
}

}
