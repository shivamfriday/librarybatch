package in.ineuron.service;

import java.util.List;

import in.ineuron.dao.BooksDaoImpl;
import in.ineuron.dao.IBooksDao;
import in.ineuron.daofactory.BooksDaoFactory;
import in.ineuron.model.Books;

public class BooksServiceImpl implements IBooksService{

	IBooksDao booksDao = new BooksDaoImpl();
	@Override
	public String addBook(Books book) {
		return booksDao.addBook(book);
	}

	@Override
	public String deleteBook(String bookId) {
		// TODO Auto-generated method stub
		return booksDao.deleteBook(bookId);
	}

	@Override
	public String updateBook(Books book) {
		// TODO Auto-generated method stub
		return booksDao.updateBook(book);
	}

	@Override
	public List<Books> searchBook(String authorName) {
		// TODO Auto-generated method stub
		return booksDao.searchBook(authorName);
	}
	
	@Override
	public List<Books> searchBook() {
		// TODO Auto-generated method stub
		return booksDao.searchBook();
	}


	@Override
	public List<Books> getAllBooks() {
		// TODO Auto-generated method stub
		return booksDao.getAllBooks();
	}
	
	@Override
	public Books searchBookById(String bookId) {
		// TODO Auto-generated method stub
		System.out.println("service for serach book by id");
		return booksDao.searchBookById(bookId);
	}

	@Override
	public List<Books> searchBookByAuthor(String author) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Books> searchBookByCat(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Books> searchBookByValue(String valueForSearch,String valueForType) {
		// TODO Auto-generated method stub
		return booksDao.searchBookByValue(valueForSearch,valueForType);
		//return null;
	}

}


	