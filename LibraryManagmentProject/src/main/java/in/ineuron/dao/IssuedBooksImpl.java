package in.ineuron.dao;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import in.ineuron.model.Books;
import in.ineuron.model.IssuedBooks;
import in.ineuron.util.JdbcUtil;
import in.ineuron.util.UUIDGenrator;

public class IssuedBooksImpl implements IIssuedBooksDao {

	@Override
	public String assignBookToStudent(IssuedBooks issuedBook) {
		Connection connection = null;
		String result = "Oops! Something went wrong.Please try again";
		ResultSet res1 = null;
		ResultSet res2 = null;
		ResultSet res3 = null;
		ResultSet res4 = null;
		ResultSet res5 = null;
		String query1 = "select count(student_id) from issued_books where student_id=? and return_date is null";
		String query2 = "insert into issued_books(issued_id, book_id, student_id,librarian_id,status,issue_date,issue_end_date) values(?,?,?,?,?,?,?)";
		String query3 = "update books set qty=qty-1 where book_id=?";
		String query4 = "select qty from books where book_id=?";
		String query5 = "select count(student_id) from students where student_id=?";

		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		PreparedStatement pstmt5 = null;
		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt1 = connection.prepareStatement(query1);
				pstmt2 = connection.prepareStatement(query2);
				pstmt3 = connection.prepareStatement(query3);
				pstmt4 = connection.prepareStatement(query4);
				pstmt5 = connection.prepareStatement(query5);
			}
			if (pstmt1 != null) {
				pstmt1.setString(1, issuedBook.getStudentId());
			}
			if (pstmt2 != null) {

				String libId = "02cd9e11-e6c0-45f4-a5ff-595b7f602112";

				pstmt2.setString(1, UUIDGenrator.getUniqueId());
				pstmt2.setString(2, issuedBook.getBookId());
				pstmt2.setString(3, issuedBook.getStudentId());

				// pstmt2.setString(4, issuedBook.getLibrarianId());
				pstmt2.setString(4, libId);
				pstmt2.setString(5, issuedBook.getStatus());

				java.sql.Date sqlIssueDate = java.sql.Date.valueOf(issuedBook.getIssueDate().toLocalDate());
				java.sql.Date sqlIssueEndDate = java.sql.Date.valueOf(issuedBook.getIssueEndDate().toLocalDate());
				//java.sql.Date sqlReturnDate = java.sql.Date.valueOf(issuedBook.getReturnDate().toLocalDate());

				pstmt2.setDate(6, sqlIssueDate);
				pstmt2.setDate(7, sqlIssueEndDate);
				//pstmt2.setDate(8, sqlReturnDate);
			}
			if (pstmt3 != null) {
				pstmt3.setString(1, issuedBook.getBookId());
			}
			if (pstmt4 != null) {
				pstmt4.setString(1, issuedBook.getBookId());
			}
			if (pstmt5 != null) {
				pstmt5.setString(1, issuedBook.getStudentId());
			}

			/// Integer countOfBooks = 0;

			res4 = pstmt4.executeQuery();
			res1 = pstmt1.executeQuery();
			res5 = pstmt5.executeQuery();

			System.out.println(res1);

			Integer countBooksInBooks = 0;

			while (res4.next()) {
				countBooksInBooks = res4.getInt(1);
			}

			Integer studentCount = 0;

			while (res5.next()) {
				studentCount = res5.getInt(1);
			}

			System.out.println("countofbooks=" + countBooksInBooks);

			Integer countOfIssuedBooks = 0;

			while (res1.next()) {
				countOfIssuedBooks = res1.getInt(1);
				System.out.println(countOfIssuedBooks);
			}

			System.out.println("qty=" + countOfIssuedBooks);

			// Integer qty=res2.getInt(1);

			System.out.println("\n Transaction begins.....");
			connection.setAutoCommit(false);
			pstmt2.executeUpdate();
			pstmt3.executeUpdate();

			if (studentCount == 0) {
				result = "Oops! Student Id is wrong! Please Enter Correct Student Id";
			} else {
				if (countOfIssuedBooks < 3) {
					if (countBooksInBooks > 0) {
						connection.commit();
						System.out.println("Assigned book to the student");
						result = "Assigned book to the student";
					} else {
						connection.rollback();
						System.out.println("Oops sorry!Book is in out of stock");
						result = "Oops sorry!Book is in out of stock";
					}
				} else {
					connection.rollback();
					System.out.println("Oops! Student exceeded the books limit");
					result = "Oops! Student exceeded the books limit";
				}
			}

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return result;

		// return null;
	}

	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	@Override
	public int assignedBookCount(String bookId) {
		Connection connection = null;

		String result = "Oops! Something went wrong.Please try again";
		ResultSet res1 = null;

		String query1 = "select count(book_id) from issued_books where book_id=?";

		PreparedStatement pstmt1 = null;
		Integer countOfIssuedBooks = 0;
		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt1 = connection.prepareStatement(query1);

			}
			if (pstmt1 != null) {
				pstmt1.setString(1, bookId);
			}

			res1 = pstmt1.executeQuery();

			System.out.println(res1);

			while (res1.next()) {
				countOfIssuedBooks = res1.getInt(1);
				System.out.println("NBook is available" + countOfIssuedBooks);

			}

			// Integer qty=res2.getInt(1);

			System.out.println("\n Transaction begins.....");
			connection.setAutoCommit(false);

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return countOfIssuedBooks;

		// return null;
	}

	@SuppressWarnings("unused")
	@Override
	public ArrayList<IssuedBooks> booksTakenByStudentForReturn(String studentId) {
		// TODO Auto-generated method stub

		// Connection connection = null;
		PreparedStatement pstmt = null;
		String result = "Oops! Something went wrong.Please try again";
		ResultSet res1 = null;

		String query1 = "select count(book_id) from issued_books where book_id=?";

		String query = "select * from issued_books where student_id=? and return_date is null";
		ResultSet res = null;

		System.out.println("the value is " + studentId);
		ArrayList<IssuedBooks> issuedBooks = new ArrayList<IssuedBooks>();
		List<Books> issuedBooksdata = new ArrayList<Books>();
		try {
			Connection con = JdbcUtil.getJdbcConnection();
			if (con != null) {
				pstmt = con.prepareStatement(query);
			}
			if (pstmt != null) {
				pstmt.setString(1, studentId);

			}
			res = pstmt.executeQuery();
			while (res.next()) {

				IssuedBooks ib = new IssuedBooks();
				ib.setIssuedId(res.getString(1));
				ib.setBookId(res.getString(2));

				IBooksDao bookDao = new BooksDaoImpl();
				// issuedBooksdata = bookDao.searchBookById(ib.getBookId());
				Books book = bookDao.searchBookById(ib.getBookId());
				ib.setBook(book);
				ib.setStudentId(res.getString(3));
				ib.setLibrarianId(res.getString(4));
				ib.setStatus(res.getString(5));
				ib.setIssueDate(res.getDate(6).toLocalDate().atStartOfDay());
				ib.setIssueEndDate(res.getDate(7).toLocalDate().atStartOfDay());
				
				if(res.getDate(8) == null) {
					
				}else {
					ib.setReturnDate(res.getDate(8).toLocalDate().atStartOfDay());
				}
				
				

				issuedBooks.add(ib);

			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}

		return issuedBooks;

	}

	@Override
	public ArrayList<IssuedBooks> BooksTakenByStudent(String id) {
		// TODO Auto-generated method stub

		Connection connection = null;
		PreparedStatement pstmt = null;

		// String query="select ib.issued_id, ib.book_id, books.title, ib.librarian_id,
		// ib.issue_date, ib.issue_end_date from issued_books as ib inner join books on
		// ib.book_id=books.book_id where student_id=?";
		String query = "select * from issued_books where student_id=?";
		ResultSet res = null;

		System.out.println("the value is " + id);
		ArrayList<IssuedBooks> issuedBooks = new ArrayList<IssuedBooks>();
		List<Books> issuedBooksdata = new ArrayList<Books>();
		try {
			Connection con = JdbcUtil.getJdbcConnection();
			if (con != null) {
				pstmt = con.prepareStatement(query);
			}
			if (pstmt != null) {
				pstmt.setString(1, id);
			}
			res = pstmt.executeQuery();
			while (res.next()) {

				IssuedBooks ib = new IssuedBooks();
				ib.setIssuedId(res.getString(1));
				ib.setBookId(res.getString(2));

				IBooksDao bookDao = new BooksDaoImpl();
				// issuedBooksdata = bookDao.searchBookById(ib.getBookId());
				Books book = bookDao.searchBookById(ib.getBookId());
				ib.setBook(book);
				ib.setStudentId(res.getString(3));
				ib.setLibrarianId(res.getString(4));
				ib.setStatus(res.getString(5));
				ib.setIssueDate(res.getDate(6).toLocalDate().atStartOfDay());
				ib.setIssueEndDate(res.getDate(7).toLocalDate().atStartOfDay());
				
				if(res.getDate(8)==null) {
					
				}else {
					ib.setReturnDate(res.getDate(8).toLocalDate().atStartOfDay());
				}
				
				

				issuedBooks.add(ib);

			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}

		return issuedBooks;

	}

	@Override
	public String assignBookToStudent(String studentId, String bookId) {
		// TODO Auto-generated method stub

		return null;
	}

	@Override
	public String removeIssuedBooks(String studentId, String bookId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement prepareStatement = null;

		String status = "failure";
		try {
			connection = JdbcUtil.getJdbcConnection();
		}catch (FileNotFoundException e1) {

			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {

			if (connection != null) {
				String sqlUpdateQuery = "update issued_books set return_date=? where student_id=? and book_id=?";
				prepareStatement = connection.prepareStatement(sqlUpdateQuery);
			}
			if (prepareStatement != null) {
				
				LocalDate date = LocalDate.now();
				
				
				
				prepareStatement.setDate(1, Date.valueOf(date));
				prepareStatement.setString(2, studentId);
				prepareStatement.setString(3, bookId);
				
			

				int rowAffected = prepareStatement.executeUpdate();
				System.out.println(rowAffected);
				if (rowAffected != 0) {
					status = "success";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return status;

	}

}
