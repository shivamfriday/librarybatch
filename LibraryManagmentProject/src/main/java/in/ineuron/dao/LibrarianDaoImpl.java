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
		String sqlInserQuery = "insert into librarians(`id`,`name`,`email`,`password`,`mobile`)values(?,?,?,?,?)";
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
	public Librarian searchLibarian(Integer sid) {
		// TODO Auto-generated method stub
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
