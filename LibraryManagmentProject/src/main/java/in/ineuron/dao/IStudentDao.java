package in.ineuron.dao;

import java.util.ArrayList;
import java.util.List;

import in.ineuron.model.IssuedBooks;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Student;

public interface IStudentDao {
	public String addStudent(Student student);

	public Student searchStudent(String sid);

	public String updateStudent(Student student);

	public String deleteStudent(String id);
	
	public Object studentLogin(String id, String password);
	
	

	
}
