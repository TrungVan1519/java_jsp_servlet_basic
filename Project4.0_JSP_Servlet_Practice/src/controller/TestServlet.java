package controller; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource(name = "jdbc/web_student_tracker")
	private DataSource dataSource;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// Step 1:  Set up the printwriter
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");

		Connection conn = null;
		Statement statements = null;
		ResultSet result = null;
		
		try {
			// Step 2:  Get a connection to the database
			conn = dataSource.getConnection();

			// Step 3:  Create a SQL statements
			String sql = "SELECT * FROM student";
			statements = conn.createStatement();

			// Step 4:  Execute SQL query
			result = statements.executeQuery(sql);

			// Step 5:  Process the result set
			while(result.next()) {
				String email = result.getString("email");
				out.println(email);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
