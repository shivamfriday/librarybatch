package in.ineuron.service;

import java.util.ArrayList;

import in.ineuron.dao.BooksDaoImpl;
import in.ineuron.dao.IBooksDao;
import in.ineuron.dao.IIssuedBooksDao;
import in.ineuron.dao.ILibrarianDao;
import in.ineuron.dao.IssuedBooksImpl;
import in.ineuron.daofactory.LibrarianDaoFactory;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Librarian;

public class LibrarianServiceImpl implements ILibrarianService {

	private ILibrarianDao libDao;

	@Override
	public String addLibrarian(Librarian librarian) {
		// TODO Auto-generated method stub

		libDao = LibrarianDaoFactory.getLibrarianDao();

		return libDao.addLibrarian(librarian);

		// return null;
	}

	@Override
	public Librarian getLibrarian(String email, String password) {
		// TODO Auto-generated method stub
		libDao = LibrarianDaoFactory.getLibrarianDao();

		Librarian lib = libDao.getLibrarian(email, password);
		System.out.println(lib);
		return lib;

		// return null;
	}

	@Override
	public String updateLibrarian(Librarian librarian) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteLibrarian(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String AssignBookToStudent(IssuedBooks issueBook) {
		// TODO Auto-generated method stub
		IIssuedBooksDao booksDao = new IssuedBooksImpl();

		return booksDao.assignBookToStudent(issueBook);

	}

	@Override
	public String  removeIssuedBooks(String studentId,String bookId) {
		// TODO Auto-generated method stub
		IIssuedBooksDao booksDao = new IssuedBooksImpl();

		return booksDao.removeIssuedBooks(studentId,bookId);

		
	}

	@Override
	public String updatePassword(String email, String newPassword, String confPassword) {
		// TODO Auto-generated method stub
		
		libDao = LibrarianDaoFactory.getLibrarianDao();

		String msg = libDao.updatePassword(email, newPassword,confPassword);
		//System.out.println(lib);
		
		
		return msg;
	}

}
