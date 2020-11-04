package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Student;
import model.StudentDataUtil;

/**
 * Servlet implementation class DemoController 
 */
@WebServlet("/DemoController")
public class DemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemoController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// Step 0: Get data from Model (it's up to you)
		List<Student> studentList = StudentDataUtil.getStudents();
		request.setAttribute("student_list", studentList);
		
		// Step 1: Get request dispatcher
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/view_student.jsp");
		
		// Step 2: Forward the request to the JSP page
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// doGet(request, response);
	}
}
