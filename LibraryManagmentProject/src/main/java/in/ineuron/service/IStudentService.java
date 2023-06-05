package in.ineuron.service;

import java.util.ArrayList;
import java.util.List;

import in.ineuron.model.IssuedBooks;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Librarian;
import in.ineuron.model.Student;

public interface IStudentService {
	
	
	public String addStudent(Student student);

	public Student searchStudent(String id);

	public String updateStudent(Student student);

	public String deleteStudent(String studentId);
	
	public Object studentLogin(String studentId, String password) ;
	
	//public ArrayList<Issued_books> BooksTakenByStudent(Integer id);

	ArrayList<IssuedBooks> BooksTakenByStudent(String id);

	public ArrayList<IssuedBooks> booksTakenByStudentForReturn(String studentId);
}
