package in.ineuron.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtil {
	private JdbcUtil() {
		
	}
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		}catch(ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
	
	
	public static Connection getJdbcConnection() throws SQLException,IOException{
		return physicalConnection();
	}


	private static Connection physicalConnection()throws FileNotFoundException, SQLException,IOException {
		// TODO Auto-generated method stub
		String fileLoc = "D:\\Eclipse Java Work\\LibraryManagmentProject\\src\\main\\java\\in\\ineuron\\properties\\application.properties";
		FileInputStream fis = new FileInputStream(fileLoc);
		Properties properties = new Properties();
		properties.load(fis);
		
		String url = properties.getProperty("jdbcUrl");
		String username = properties.getProperty("user");
		String password = properties.getProperty("password");
		System.out.println(url);
		return DriverManager.getConnection(url, username, password);
	}
	
	public static void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
