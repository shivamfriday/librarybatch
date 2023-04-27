package in.ineuron.service;


import in.ineuron.dao.ILibrarianDao;
import in.ineuron.daofactory.LibrarianDaoFactory;
import in.ineuron.model.Librarian;

public class LibrarianServiceImpl implements ILibrarianService {

	private ILibrarianDao libDao;
	@Override
	public String addLibrarian(Librarian librarian) {
		// TODO Auto-generated method stub
		
		libDao = LibrarianDaoFactory.getLibrarianDao();
		return libDao.addLibrarian(librarian);
		
		//return null;
	}

	@Override
	public Librarian searchLibrarian(Integer id) {
		// TODO Auto-generated method stub
		return null;
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

}
