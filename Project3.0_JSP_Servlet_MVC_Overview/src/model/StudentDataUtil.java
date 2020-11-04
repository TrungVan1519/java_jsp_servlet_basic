package model; 

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
	public static List<Student> getStudents(){
		List<Student> studentList = new ArrayList<Student>();
		studentList.add(new Student("Putin", "motherrussia@gmail.com"));
		studentList.add(new Student("Trump", "americagreateagain@gmail.com"));
		studentList.add(new Student("Agela Merkel", "thisisparadise@gmail.com"));
		
		return studentList;
	}
}
