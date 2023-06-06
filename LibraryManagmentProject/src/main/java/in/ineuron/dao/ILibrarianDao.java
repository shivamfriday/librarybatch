package in.ineuron.dao;

import in.ineuron.model.Librarian;

public interface ILibrarianDao {
	
	public String addLibrarian(Librarian libarian);

	public Librarian getLibrarian(String email,String password);

	public String updateLibarian(Librarian libarian);

	public String deleteLibarian(Integer sid);

	public String updatePassword(String email, String newPassword, String confPassword);
}
