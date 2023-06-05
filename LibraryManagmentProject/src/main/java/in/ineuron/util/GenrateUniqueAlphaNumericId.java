package in.ineuron.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import in.ineuron.model.Books;

public class GenrateUniqueAlphaNumericId {
	private Connection connection = null;
	private PreparedStatement prepareStatement = null;
	private ResultSet resultSet = null;
	
	public  String genrateUniqueId(Integer id) {
		
		System.out.println("in the dao="+id);
		
		String selectQuery = null;
			
			 selectQuery = "select * from unique_genrator where id=? ";
			 
		
		//Connection connection;
		//String selectBookSearchQuery = "select * from books where book_id=? ";
		try {
			try {
				connection = JdbcUtil.getJdbcConnection();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (connection != null) {
				prepareStatement = connection.prepareStatement(selectQuery);
			}
			if (prepareStatement != null) {
				prepareStatement.setInt(1, id);

				resultSet = prepareStatement.executeQuery();
			}
			if (resultSet != null) {
				LocalDateTime currentDate = LocalDateTime.now(); 
				
				 String day = String.valueOf(currentDate.getDayOfMonth());
				 String year = String.valueOf(currentDate.getYear());
				 String month = String.valueOf(currentDate.getMonth());
				 String hour = String.valueOf(currentDate.getHour());
				 String dayOfYear = String.valueOf(currentDate.getDayOfYear());
				// currentDate.get
				 String shortId = GenerateShortUUID.next();
				 System.out.println("short id="+shortId);
				
				if(id==1) {
					String bookID = "Book"+year+month+hour+day;
					
					int count = 0;
					
					while (resultSet.next()) {
					  count = Integer.parseInt(resultSet.getString(2));
					}
					count++;
					
					bookID = bookID+count;
					
					System.out.println("book id=="+bookID);
					updateUniqueId(1,String.valueOf(count));
					
					return bookID;
					
				}else if(id==2) {
					String studID = "Stud"+year+"Y"+dayOfYear+day+"D"+"M"+month;
					
					int count = 0;
					
					while (resultSet.next()) {
					  count = Integer.parseInt(resultSet.getString(2));
					}
					count++;
					
					studID = studID+count;
					
					System.out.println("studID id=="+studID);
					updateUniqueId(2,String.valueOf(count));
					return studID;
					
				}else if(id==3) {
					String libId = "Lib"+shortId;
					
					int count = 0;
					
					while (resultSet.next()) {
					  count = Integer.parseInt(resultSet.getString(2));
					}
					count++;
					
					libId = libId+count;
					
					System.out.println("book id=="+libId);
					updateUniqueId(3,String.valueOf(count));
					
					return libId;
					
				}else if(id==4) {
					String issueId = "Issue_"+shortId;
					
					int count = 0;
					
					while (resultSet.next()) {
					  count = Integer.parseInt(resultSet.getString(2));
					}
					count++;
					
					issueId = issueId+count;
					
					System.out.println("issueId id=="+issueId);
					updateUniqueId(4,String.valueOf(count));
					
					return issueId;
					
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return null;
		//return null;
	}
	
	public String updateUniqueId(int id,String count) {

		String status = "failure";
		try {
			connection = JdbcUtil.getJdbcConnection();
		} catch (FileNotFoundException e1) {

			e1.printStackTrace();
		} catch (SQLException e1) {

			e1.printStackTrace();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
		try {

			if (connection != null) {
				String sqlUpdateQuery = "update unique_genrator set value=? where id=?";
				prepareStatement = connection.prepareStatement(sqlUpdateQuery);
			}
			if (prepareStatement != null) {
				prepareStatement.setString(1, count);
				prepareStatement.setInt(2, id);
				

				int rowAffected = prepareStatement.executeUpdate();

				if (rowAffected == 1) {
					status = "success";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConnection(connection);
		}

		return status;
	}


}
