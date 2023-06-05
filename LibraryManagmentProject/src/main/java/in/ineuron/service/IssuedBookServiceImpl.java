package in.ineuron.service;

import in.ineuron.dao.IIssuedBooksDao;
import in.ineuron.dao.IssuedBooksImpl;

public class IssuedBookServiceImpl implements IIssuedBookService {

	IIssuedBooksDao issuedDao = new IssuedBooksImpl() ;
	@Override
	public int assignedBookCount(String bookId) {
		// TODO Auto-generated method stub
		return issuedDao.assignedBookCount(bookId);
		
		//return 0;
	}

}
