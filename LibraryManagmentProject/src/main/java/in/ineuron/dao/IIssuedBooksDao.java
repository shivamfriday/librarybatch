package in.ineuron.dao;

import java.util.ArrayList;

import in.ineuron.model.IssuedBooks;

public interface IIssuedBooksDao {
	public String assignBookToStudent(IssuedBooks issueBook);
	public int assignedBookCount(String bookId);
	ArrayList<IssuedBooks> booksTakenByStudentForReturn(String studentId);
	public ArrayList<IssuedBooks> BooksTakenByStudent(String id);
	public String assignBookToStudent(String studentId, String bookId);
	public String removeIssuedBooks(String studentId, String bookId);
}
