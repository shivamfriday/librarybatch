package in.ineuron.daofactory;

import in.ineuron.dao.ILibrarianDao;
import in.ineuron.dao.LibrarianDaoImpl;

public class LibrarianDaoFactory {
	private LibrarianDaoFactory() {}

	private static ILibrarianDao studentDao = null;

	public static ILibrarianDao getLibrarianDao() {
		if (studentDao == null) {
			studentDao = new LibrarianDaoImpl();
		}
		return studentDao;
	}
}
