package in.ineuron.model;

import java.time.LocalDateTime;
import java.util.Date;

public class IssuedBooks {
	String issuedId;
	String bookId;
	String studentId;
	String librarianId;
	String status;
	LocalDateTime issueDate;
	LocalDateTime issueEndDate;
	LocalDateTime returnDate;
	Books book;
	
	
	
	public Books getBook() {
		return book;
	}
	public void setBook(Books book) {
		this.book = book;
	}
	public String getIssuedId() {
		return issuedId;
	}
	public void setIssuedId(String issuedId) {
		this.issuedId = issuedId;
	}
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getLibrarianId() {
		return librarianId;
	}
	public void setLibrarianId(String librarianId) {
		this.librarianId = librarianId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setIssueDate(LocalDateTime issueDate2) {
		this.issueDate = issueDate2;
	}
	
	public LocalDateTime getIssueDate() {
		return issueDate;
	}
	public LocalDateTime getIssueEndDate() {
		return issueEndDate;
	}
	public void setIssueEndDate(LocalDateTime issueEndDate) {
		this.issueEndDate = issueEndDate;
	}
	public LocalDateTime getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(LocalDateTime returnDate) {
		this.returnDate = returnDate;
	}

	
	
	
	

}
