package in.ineuron.service;

import in.ineuron.model.Librarian;

public interface ILibrarianService {
	public String addLibrarian(Librarian student);

	public Librarian searchLibrarian(Integer id);

	public String updateLibrarian(Librarian librarian);

	public String deleteLibrarian(Integer id);

}
