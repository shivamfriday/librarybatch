package in.ineuron.service;

import java.util.ArrayList;
import java.util.List;

import in.ineuron.dao.IIssuedBooksDao;
import in.ineuron.dao.IStudentDao;
import in.ineuron.dao.IssuedBooksImpl;
import in.ineuron.daofactory.LibrarianDaoFactory;
import in.ineuron.daofactory.StudentDaoFactory;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Student;

public class StudentServiceImpl implements IStudentService {

	private IStudentDao studentDao = null;

	@Override
	public String addStudent(Student student) {
		IStudentDao studentDao = StudentDaoFactory.getStudentDao();
		return studentDao.addStudent(student);

	}

	@Override
	public Student searchStudent(String id) {

		IStudentDao studentDao = StudentDaoFactory.getStudentDao();
		return studentDao.searchStudent(id);
	}

	@Override
	public String updateStudent(Student student) {

		IStudentDao studentDao = StudentDaoFactory.getStudentDao();
		return studentDao.updateStudent(student);
	}

	@Override
	public String deleteStudent(String id) {

		IStudentDao studentDao = StudentDaoFactory.getStudentDao();
		return studentDao.deleteStudent(id);
	}

	@Override
	public Object studentLogin(String id, String password) {
		IStudentDao studentDao = StudentDaoFactory.getStudentDao();
		return studentDao.studentLogin(id, password);
	}

	@Override
	public ArrayList<IssuedBooks> BooksTakenByStudent(String id) {

		IIssuedBooksDao issuedBookDao = new IssuedBooksImpl();
		return issuedBookDao.BooksTakenByStudent(id);
	}

	@Override
	public ArrayList<IssuedBooks> booksTakenByStudentForReturn(String studentId) {
		// TODO Auto-generated method stub
		IIssuedBooksDao issuedBookDao = new IssuedBooksImpl();
		return issuedBookDao.booksTakenByStudentForReturn(studentId);

	}

}
