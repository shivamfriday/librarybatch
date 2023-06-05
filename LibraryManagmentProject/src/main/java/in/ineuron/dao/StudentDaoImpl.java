package in.ineuron.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import in.ineuron.daofactory.StudentDaoFactory;
import in.ineuron.model.Books;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.IssuedBooks;
import in.ineuron.model.Student;
import in.ineuron.service.StudentServiceImpl;
import in.ineuron.util.JdbcUtil;

public class StudentDaoImpl implements IStudentDao {

	Connection connection = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	ResultSet resultSet = null;

	@Override
	public String addStudent(Student student) {
		String query1 = "insert into students(student_id,name,email,department,gender,password,mobile,address,dob) values (?,?,?,?,?,?,?,?,?)";
		String query2 = "select student_id  from students where student_id=?";
		Integer rowAffected = null;
		ResultSet res = null;
		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt = connection.prepareStatement(query2);
			}
			if (pstmt != null) {
				pstmt.setString(1, student.getStudentId());
				res = pstmt.executeQuery();
			}
			if (res.next()) {
				return "Record already there";
			} else {
				pstmt1 = connection.prepareStatement(query1);
				if (pstmt != null) {
					pstmt1.setString(1, student.getStudentId());
					pstmt1.setString(2, student.getName());
					pstmt1.setString(3, student.getEmail());
					pstmt1.setString(4, student.getDepartment());
					pstmt1.setString(5, student.getGender());
					pstmt1.setString(6, student.getPassword());
					pstmt1.setString(7, student.getMobile());
					pstmt1.setString(8, student.getAddress());

					java.sql.Date sqlDate = new java.sql.Date(student.getDob().getTime());

					pstmt1.setDate(9, sqlDate);

				}

				rowAffected = pstmt1.executeUpdate();

				if (rowAffected != null) {
					return "success";
				}
			}

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return "failure";
	}

	@Override
	public Student searchStudent(String sid) {
		String query = "select student_id,name,email,department,password,mobile,address,dob,gender from students where student_id=?";
		Integer rowAffected = null;
		Student stud = null;
		ResultSet res = null;
		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt = connection.prepareStatement(query);
			}
			if (pstmt != null) {
				pstmt.setString(1, sid);

			}
			res = pstmt.executeQuery();

			if (res.next()) {
				stud = new Student();
				System.out.println(res.getString(2));
				stud.setStudentId(res.getString(1));
				stud.setName(res.getString(2));
				stud.setEmail(res.getString(3));
				stud.setDepartment(res.getString(4));
				// stud.setSection(res.getString(5));
				stud.setPassword(res.getString(5));
				stud.setMobile(res.getString(6));
				stud.setAddress(res.getString(7));

				Date date = new Date(res.getDate(8).getTime());

				// stud.setDob(res.getDate(9).toLocalDate());
				stud.setDob(date);

				// System.out.println(res.getDate(9).toLocalDate());

				stud.setGender(res.getString(9));

			}

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return stud;
	}

	@Override
	public String updateStudent(Student student) {
		String query = "update students set name=?,email=?,department=?,gender=?,password=?,mobile=?,address=?,dob=?  where student_id=?";
		Integer rowAffected = null;

		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt = connection.prepareStatement(query);
			}
			if (pstmt != null) {

				pstmt.setString(1, student.getName());
				pstmt.setString(2, student.getEmail());
				pstmt.setString(3, student.getDepartment());
				// System.out.println(student.getDepartment());
				pstmt.setString(4, student.getGender());
				pstmt.setString(5, student.getPassword());
				pstmt.setString(6, student.getMobile());
				pstmt.setString(7, student.getAddress());

				java.sql.Date sqlDate = new java.sql.Date(student.getDob().getTime());

				pstmt.setDate(8, sqlDate);
				pstmt.setString(9, student.getStudentId());
			}
			rowAffected = pstmt.executeUpdate();
			if (rowAffected != null) {
				System.out.println("success");
				return "success";
			}

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return "failure";
	}

	@Override
	public String deleteStudent(String sid) {
		String query = "delete from students where student_id=?";
		Integer rowAffected = null;
		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt = connection.prepareStatement(query);
			}
			if (pstmt != null) {

				pstmt.setString(1, sid);
			}
			rowAffected = pstmt.executeUpdate();
			if (rowAffected != null) {
				return "success";
			}

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return "failure";

	}

	@Override
	public Object studentLogin(String id, String password) {
		String query = "select * from students where student_id=?";
		ResultSet res = null;
		Student obj = null;
		Student student = new Student();
		try {
			connection = JdbcUtil.getJdbcConnection();
			if (connection != null) {
				pstmt = connection.prepareStatement(query);
			}
			if (pstmt != null) {
				pstmt.setString(1, id);
			}
			res = pstmt.executeQuery();

			if (res.next()) {
				if (password.equals(res.getString(6))) {
					student.setStudentId(res.getString(1));
					student.setName(res.getString(2));
					student.setEmail(res.getString(3));
					student.setDepartment(res.getString(4));
					student.setSection(res.getString(5));
					student.setPassword(res.getString(6));

					return student;
				} else {
					return "not matches";
				}

			} else {
				return "not exists";
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return "not exists";

	}

}
