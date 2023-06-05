package in.ineuron.service;

import java.util.List;

import in.ineuron.model.Books;

public interface IIssuedBookService {
	public int assignedBookCount(String bookId);
}
