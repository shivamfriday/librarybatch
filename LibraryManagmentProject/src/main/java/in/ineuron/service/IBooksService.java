package in.ineuron.service;

import java.util.List;

import in.ineuron.model.Books;

public interface IBooksService {
	public String addBook(Books book);

	public String deleteBook(String bookId);

	public String updateBook(Books book);

	public List<Books> searchBook(String authorName);
	
	public List<Books> searchBook();

	public List<Books> getAllBooks();

	Books searchBookById(String bookId);
	List<Books> searchBookByAuthor(String author);
	List<Books> searchBookByCat(String category);

	public List<Books> searchBookByValue(String valueForSearch,String valueForType);

	//public List<Books> searchBookByValue(String valueForSearch, String valueForType);
}
