package controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.Student;
import model.StudentDBUtil;

@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StudentDBUtil studentDBUtil;
	
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create student dbutil ... and pass in the conn pool/datasource
		try {
			studentDBUtil = new StudentDBUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
    
	/**
	 * Do khi update va delete student ta su dung link <a> ma link <a>
	 * 		thi khong co POST ma luon truyen du lieu qua URL (GET)
	 *		nen neu gap TH nao su dung <a> de thay doi du lieu hoac
	 *		<form method="GET"> thi code o day
	 * Duoi day la viec UPDATE student hoan toan co the giong ADD student
	 * 		la su form POST va code trong doPost nhung toi da muon the
	 * 		hien rang form GET cung hoan toan nhu form POST chi khac
	 * 		la xu ly du lieu o ham doGet() thay vi doPost()
	 * 		Xem chi tiet o File update-student-form.jsp phan <form>		
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			// read the "command"
			String command = request.getParameter("command");
			// if command is missing, then default to listing students
			if(command == null) {
				command = "LIST";
			}
			
			// route to the appropriate method
			switch(command) {
			case "LIST":
				// list students ... in MVC fashion
				listStudents(request, response);
				break;
			case "LOAD":
				loadStudent(request, response);
				break;
			case "UPDATE":
				updateStudent(request, response);
				break;
			case "DELETE":
				deleteStudent(request, response);
				break;
			default:
				listStudents(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student id from form data
		String studentId = request.getParameter("studentId");
		
		// delete student from DB
		studentDBUtil.deleteStudent(studentId);
		
		// send them back to "list students" page
		listStudents(request, response);
	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info from form data
		int id = Integer.parseInt(request.getParameter("studentId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		// create a new student obj
		Student student = new Student(id, firstName, lastName, email);
		
		// perform update on DB
		studentDBUtil.updateStudent(student);
		
		// send them back to "list students" page
		listStudents(request, response);
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student id from form data
		String studentId = request.getParameter("studentId");
		
		// get student from DB
		Student student = studentDBUtil.getStudent(studentId);
		
		// place student in the request attribute
		request.setAttribute("THE_STUDENT", student);
		
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		List<Student> students;
		
		// get students from dbutil
		students = studentDBUtil.getStudents();
		
		// add students to the request
		request.setAttribute("STUDENT_LIST", students);
		
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
		dispatcher.forward(request, response);
	}
	
	/**
	 * Do JSP add-student-form.jsp su dung form POST de truyen du lieu
	 * 		ve cho Servlet StudentControllerServlet nen o day phai co ham
	 * 		doPost() de xu ly
	 * Neu JSP add-student-form.jsp su dung form GET de truyen du lieu
	 *		ve cho Servlet StudentControllerServlet thi ta khong can ham
	 *		doPost() ma chi can code cac phan nay trong ham doGet() la ok
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// read the "command"
			String command = request.getParameter("command");
			// if command is missing, then default to listing students
			if(command == null) {
				command = "LIST";
			}
			
			// route to the appropriate method
			switch(command) {
			case "LIST":
				listStudents(request, response);
				break;
			case "ADD":
				addStudent(request, response);
				break;
			default:
				listStudents(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");

		// add the student to the DB
		studentDBUtil.addStudent(new Student(firstName, lastName, email));
		
		// send back to main page (the students list)
		listStudents(request, response);
	}
}
