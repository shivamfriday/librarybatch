package in.ineuron.service;

import java.util.ArrayList;

import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Librarian;

public interface ILibrarianService {
	public String addLibrarian(Librarian student);

	public Librarian getLibrarian(String email,String password);

	public String updateLibrarian(Librarian librarian);

	public String deleteLibrarian(Integer id);
	
	public String AssignBookToStudent(IssuedBooks issueBook);

	public String removeIssuedBooks(String studentId,String bookId);

	public String updatePassword(String email, String newPassword, String confPassword);
		
	

}
