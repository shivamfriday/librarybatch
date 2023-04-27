package in.ineuron.dao;

import in.ineuron.model.Librarian;

public interface ILibrarianDao {
	
	public String addLibrarian(Librarian libarian);

	public Librarian searchLibarian(Integer sid);

	public String updateLibarian(Librarian libarian);

	public String deleteLibarian(Integer sid);
}
