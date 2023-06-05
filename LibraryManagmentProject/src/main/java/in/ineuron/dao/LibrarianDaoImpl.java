package in.ineuron.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import in.ineuron.model.Librarian;
import in.ineuron.util.JdbcUtil;
import in.ineuron.util.UUIDGenrator;

public class LibrarianDaoImpl implements ILibrarianDao {

	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	
	@Override
	public String addLibrarian(Librarian librarian) {
		// TODO Auto-generated method stub
		String sqlInserQuery = "insert into librarians(`id`,`name`,`email`,`password`,`mobile`,`gender`,`dob`)values(?,?,?,?,?,?,?)";
		try {
			connection = JdbcUtil.getJdbcConnection();
			if(connection!=null) {
				pstmt = connection.prepareStatement(sqlInserQuery);
				
			}
			if(pstmt!=null) {
				
				pstmt.setString(1,librarian.getId());
				pstmt.setString(2,librarian.getName());
				pstmt.setString(3,librarian.getEmail());
				pstmt.setString(4, librarian.getPassword());
				pstmt.setString(5, librarian.getMobile());
				pstmt.setString(6, librarian.getGender());
				
				java.sql.Date sqlDate = new java.sql.Date(librarian.getDob().getTime());
				
				pstmt.setDate(7, sqlDate);
				
				int rowAffected = pstmt.executeUpdate();
				
				if(rowAffected==1) {
					return "success";
				}
			}
		}catch(SQLException | IOException e){
			e.printStackTrace();
		}
		
		
		
		return "failure";
	}

	@Override
	public Librarian getLibrarian(String email,String password) {
		// TODO Auto-generated method stub
		
		
		Librarian lib = new Librarian();
		String sqlInserQuery = "select * from librarians where email = ? and password = ?";
		try {
			connection = JdbcUtil.getJdbcConnection();
			if(connection!=null) {
				pstmt = connection.prepareStatement(sqlInserQuery);
				
			}
			if(pstmt!=null) {
				
				pstmt.setString(1,email);
				pstmt.setString(2,password);
				
				
				ResultSet rs = pstmt.executeQuery();
				System.out.println("empty--------"+rs);
				if(rs!=null) {
					System.out.println("email--------");
					if(rs.next()) {
						System.out.println("data---------"+rs);
						lib.setId(rs.getString(1));
						lib.setName(rs.getString(2));
						lib.setEmail(rs.getString(3));
				
						return lib;
					}
				}
				
				
			}
		}catch(SQLException | IOException e){
			e.printStackTrace();
		}
		
		
		
		//return "failure";
		
		
		
		return null;
	}

	@Override
	public String updateLibarian(Librarian student) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteLibarian(Integer sid) {
		// TODO Auto-generated method stub
		return null;
	}

}
