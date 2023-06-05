package in.ineuron.servicefactory;

import in.ineuron.service.BooksServiceImpl;
import in.ineuron.service.IBooksService;


public class BooksServiceFactory {
	private BooksServiceFactory() {

	}

	private static IBooksService bookService = null;

	public static IBooksService getBookService() {
		
		//singleton pattern code
		if (bookService == null) {
			bookService = new BooksServiceImpl();
		}
		return bookService;
	}
}
