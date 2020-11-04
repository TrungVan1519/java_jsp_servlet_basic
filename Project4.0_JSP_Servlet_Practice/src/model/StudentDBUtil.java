package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class StudentDBUtil {
	private DataSource dataSource;

	public StudentDBUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public List<Student> getStudents() throws Exception {
		List<Student> students = new ArrayList<>();
		
		Connection conn = null;
		Statement statement = null;
		ResultSet result = null;
		
		try {
			// get a connection
			conn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from student order by last_name";
			statement = conn.createStatement();
			
			// execute query
			result = statement.executeQuery(sql);

			// process result set
			while(result.next()) {
				// retrieve data from result set row
				int id = result.getInt("id");
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String email = result.getString("email");
				
				// add new student to list of students
				students.add(new Student(id, firstName, lastName, email));
			}
		} finally {
			// close JDBC objs
			close(conn, statement, result);
		}
		return students;
	}

	private void close(Connection conn, Statement statement, ResultSet result) {
		try {
			if(result != null) {
				result.close();
			}
			if(statement != null) {
				statement.close();
			}
			if(conn != null) {
				conn.close();
				// > this doesn't really close connection to server
				// > It just puts back in connection pool
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addStudent(Student student) throws Exception {
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			// get DB connection 
			conn = dataSource.getConnection();
			
			// create sql for insert
			String sql = "insert into student "
					+ "(first_name, last_name, email) values (?, ?, ?)";
			statement = conn.prepareStatement(sql);
			
			// set param values for prepare statment
			statement.setString(1, student.getFirstName());
			statement.setString(2, student.getLastName());
			statement.setString(3, student.getEmail());
			
			// execute sql insert
			statement.execute();
			
		} finally{
			// close JDBC objs
			close(conn, statement, null);
		}
	}

	public Student getStudent(String studentId) throws Exception{
		Student student = null;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet result = null;
		
		try {
			// convert studentId to int
			int id = Integer.parseInt(studentId);
			
			// get connection to DB
			conn = dataSource.getConnection();
			
			// create sql to get releted student
			String sql = "select * from student where id = ?";
			
			// create prepared statement
			statement = conn.prepareStatement(sql);
			
			// set params
			statement.setInt(1, id);
			
			// execute statement
			result = statement.executeQuery();
			
			// retrieve data from result set row
			if(result.next()) {
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String email = result.getString("email");
				
				student = new Student(id, firstName, lastName, email);
			} else {
				throw new Exception("Could not find student with id: " + id);
			}
			return student;
		} finally {
			// close JDBC objs
			close(conn, statement, result);
		}
	}

	public void updateStudent(Student student) throws Exception {
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			// get Db connection
			conn = dataSource.getConnection();
			
			// create sql update statement
			String sql = "update student "
					+ "set first_name = ?, last_name = ?, email = ? "
					+ "where id = ?";
			
			// prepare statement
			statement = conn.prepareStatement(sql);
			
			// set params
			statement.setString(1, student.getFirstName());
			statement.setString(2, student.getLastName());
			statement.setString(3, student.getEmail());
			statement.setInt(4, student.getId());
			
			// execute sql statement
			statement.execute();
		} finally {
			// close JDBC objs
			close(conn, statement, null); 
		}
	}

	public void deleteStudent(String studentId) throws Exception {
		Connection conn = null;
		PreparedStatement statement = null;
		
		try {
			// convert student id to int
			int id = Integer.parseInt(studentId);
			
			// get connection to DB
			conn = dataSource.getConnection();
			
			// create sql to delete student
			String sql = "delete from student where id = ?";
			
			// prepare statement
			statement = conn.prepareStatement(sql);
			
			// set params
			statement.setInt(1, id);
			
			// execute sql statement
			statement.execute();
		} finally {
			// close JDBC objs
			close(conn, statement, null);
		}
	}
}
