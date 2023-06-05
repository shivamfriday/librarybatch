package in.ineuron.dao;

import java.io.ByteArrayInputStream;

import java.io.FileNotFoundException;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.Blob;

import in.ineuron.model.Books;
import in.ineuron.util.JdbcUtil;
import in.ineuron.util.GenerateShortUUID;
import in.ineuron.util.GenrateUniqueAlphaNumericId;

public class BooksDaoImpl implements IBooksDao {
	private Connection connection = null;
	private PreparedStatement prepareStatement = null;
	private ResultSet resultSet = null;

	@Override
	public String addBook(Books book) {
		String status = "failure";
		String insertBookQuery = "insert into books (book_id,author_name,title,cat_name,book_price,qty,edition,description,front_image,back_image)values(?,?,?,?,?,?,?,?,?,?)";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(insertBookQuery);
			}
			if (prepareStatement != null) {
				
				
				
				prepareStatement.setString(1, book.getBookId());
				prepareStatement.setString(2, book.getAuthorName());
				prepareStatement.setString(3, book.getTitle());
				prepareStatement.setString(4, book.getCatName());
				prepareStatement.setInt(5, book.getBookPrice());
				prepareStatement.setInt(6, book.getQty());
				prepareStatement.setString(7, book.getEdition());
				prepareStatement.setString(8, book.getDescription());

				InputStream frontIs = new ByteArrayInputStream(book.getFrontImage());
				InputStream backIs = new ByteArrayInputStream(book.getBackImage());

				prepareStatement.setBlob(9, frontIs);
				prepareStatement.setBlob(10, backIs);

				int rowAffected = prepareStatement.executeUpdate();

				if (rowAffected == 1) {
					System.out.println("data is saved");
					return "success";
				} else {
					return "failure";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return status;
	}

	@Override
	public String deleteBook(String bookId) {
		String status = "failure";
		String deleteBookQuery = "delete from books where book_id=?";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(deleteBookQuery);
			}
			if (prepareStatement != null) {
				prepareStatement.setString(1, bookId);
				int rowAffected = prepareStatement.executeUpdate();

				if (rowAffected == 1) {
					return "success";
				} else {
					return "failure";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return status;
	}

	@Override
	public String updateBook(Books book) {

		String status = "failure";
		try {
			connection = JdbcUtil.getJdbcConnection();
		} catch (FileNotFoundException e1) {

			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
		try {

			if (connection != null) {
				String sqlUpdateQuery = "update books set author_name=?,title=?,cat_name=?,book_price=?,qty=?,edition=?,description=?,front_image=?,back_image=? where book_id=?";
				prepareStatement = connection.prepareStatement(sqlUpdateQuery);
			}
			if (prepareStatement != null) {
				prepareStatement.setString(1, book.getAuthorName());
				prepareStatement.setString(2, book.getTitle());
				prepareStatement.setString(3, book.getCatName());
				// prepareStatement.setString(4, book.getBookNo());
				prepareStatement.setInt(4, book.getBookPrice());
				prepareStatement.setInt(5, book.getQty());
				prepareStatement.setString(6, book.getEdition());
				prepareStatement.setString(7, book.getDescription());


				InputStream frontIs = new ByteArrayInputStream(book.getFrontImage());
				InputStream backIs = new ByteArrayInputStream(book.getBackImage());

				prepareStatement.setBlob(8, frontIs);
				prepareStatement.setBlob(9, backIs);
				
				
				prepareStatement.setString(10, book.getBookId());

				int rowAffected = prepareStatement.executeUpdate();
				System.out.println(rowAffected);
				if (rowAffected == 1) {
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

	@Override
	public List<Books> searchBook() {
		List<Books> list = null;
		String selectBookSearchQuery = "select * from books";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(selectBookSearchQuery);
			}
			if (prepareStatement != null) {
				// prepareStatement.setString(1, bookId);
				// prepareStatement.setString(1, authorName);

				resultSet = prepareStatement.executeQuery();
			}
			if (resultSet != null) {
				Books books = null;
				list = new ArrayList<>();
				while (resultSet.next()) {
					books = new Books();

					books.setBookId(resultSet.getString(1));
					books.setAuthorName(resultSet.getString(2));
					books.setTitle(resultSet.getString(3));
					books.setCatName(resultSet.getString(4));
					books.setEdition(resultSet.getString(7));
					books.setBookPrice(resultSet.getInt(5));
					books.setDescription(resultSet.getString(8));
					books.setQty(resultSet.getInt(6));

					java.sql.Blob frontImageBlob = resultSet.getBlob(9);
					byte[] frontImageByteArr = frontImageBlob.getBytes(1, (int) frontImageBlob.length());

					books.setFrontImage(frontImageByteArr);

					java.sql.Blob backImageBlob = resultSet.getBlob(10);
					//System.out.println("blob length--------------" + backImageBlob.length());
					byte[] backImageByteArr = backImageBlob.getBytes(1, (int) backImageBlob.length());

					books.setBackImage(backImageByteArr);
					//System.out.println("setting the all data");
					list.add(books);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return list;
	}

	@Override
	public Books searchBookById(String bookId) {
		Books books = null;
		System.out.println("serach by id in book dao 11");
		String selectBookSearchQuery = "select * from books where book_id=? ";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(selectBookSearchQuery);
			}
			if (prepareStatement != null) {
				prepareStatement.setString(1, bookId);

				resultSet = prepareStatement.executeQuery();
			}
			if (resultSet != null) {
				//Books books = null;
				
				while (resultSet.next()) {
					books = new Books();
					System.out.println("serach by id in book dao");
					books.setBookId(resultSet.getString(1));
					books.setAuthorName(resultSet.getString(2));
					books.setTitle(resultSet.getString(3));
					books.setCatName(resultSet.getString(4));
					books.setEdition(resultSet.getString(7));
					books.setBookPrice(resultSet.getInt(5));
					books.setDescription(resultSet.getString(8));
					books.setQty(resultSet.getInt(6));

					java.sql.Blob frontImageBlob = resultSet.getBlob(9);
					byte[] frontImageByteArr = frontImageBlob.getBytes(1, (int) frontImageBlob.length());

					books.setFrontImage(frontImageByteArr);

					java.sql.Blob backImageBlob = resultSet.getBlob(10);
					System.out.println("blob length--------------" + backImageBlob.length());
					byte[] backImageByteArr = backImageBlob.getBytes(1, (int) backImageBlob.length());

					books.setBackImage(backImageByteArr);
					System.out.println("setting the all data");
					//list.add(books);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return books;
	}

	@Override
	public List<Books> getAllBooks() {
		List<Books> list = new ArrayList<>();
		String selectBookSearchQuery = "select book_id,author_name,title,cat_name,book_no,book_price,qty from books";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(selectBookSearchQuery);
			}
			if (prepareStatement != null) {

				resultSet = prepareStatement.executeQuery();
			}
			if (resultSet != null) {
				Books books = null;
				while (resultSet.next()) {
					books = new Books();
					books.setBookId(resultSet.getString(1));
					books.setAuthorName(resultSet.getString(2));
					books.setTitle(resultSet.getString(3));
					books.setCatName(resultSet.getString(4));
					// books.setBookNo(resultSet.getString(5));
					int price = Integer.parseInt(resultSet.getString(6));
					int qty = Integer.parseInt(resultSet.getString(7));

					books.setBookPrice(price);
					books.setQty(qty);
					list.add(books);

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return list;
	}

	@Override
	public List<Books> searchBook(String authorName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Books> searchBookByValue(String valueForSearch,String valueForType) {
		List<Books> list = null;
		System.out.println("in the dao="+valueForType);
		
		String selectBookSearchQuery = null;
		if(valueForType.equals("bookId")) {
			
			 selectBookSearchQuery = "select * from books where book_id=? ";
			 System.out.println("serach for different in one");
		}else if(valueForType.equals("category")){
			 selectBookSearchQuery = "select * from books where cat_name=? ";
		}else if(valueForType.equals("title")) {
			 selectBookSearchQuery = "select * from books where title=? ";
		}else if(valueForType.equals("author")) {
			 selectBookSearchQuery = "select * from books where author_name=? ";
		}
		
		System.out.println("serch query="+selectBookSearchQuery);
		
		//String selectBookSearchQuery = "select * from books where book_id=? ";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(selectBookSearchQuery);
			}
			if (prepareStatement != null) {
				prepareStatement.setString(1, valueForSearch);

				resultSet = prepareStatement.executeQuery();
			}
			if (resultSet != null) {
				Books books = null;
				list = new ArrayList<>();
				while (resultSet.next()) {
					books = new Books();
					System.out.println("serach by id in book dao");
					books.setBookId(resultSet.getString(1));
					books.setAuthorName(resultSet.getString(2));
					books.setTitle(resultSet.getString(3));
					books.setCatName(resultSet.getString(4));
					books.setEdition(resultSet.getString(7));
					books.setBookPrice(resultSet.getInt(5));
					books.setDescription(resultSet.getString(8));
					books.setQty(resultSet.getInt(6));

					java.sql.Blob frontImageBlob = resultSet.getBlob(9);
					byte[] frontImageByteArr = frontImageBlob.getBytes(1, (int) frontImageBlob.length());

					books.setFrontImage(frontImageByteArr);

					java.sql.Blob backImageBlob = resultSet.getBlob(10);
					System.out.println("blob length--------------" + backImageBlob.length());
					byte[] backImageByteArr = backImageBlob.getBytes(1, (int) backImageBlob.length());

					books.setBackImage(backImageByteArr);
					System.out.println("setting the all data");
					list.add(books);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return list;
		//return null;
	}

}
