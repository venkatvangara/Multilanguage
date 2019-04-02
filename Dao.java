package fr.esigelec.jee;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Dao {

	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/";

	String db = "hellodb";
	String driver = "com.mysql.jdbc.Driver";

	public void connect() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url + db, "hellouser", "123");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<String> getLanguages() {

		ArrayList<String> list = new ArrayList<>();
		this.connect();
		String sql = "select * from message";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				list.add(rs.getString(2));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return list;

	}

	public String getMessage(String language) {
		String message = null;
		this.connect();
		String sql = "select * from message where lang=?";
		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, language);
			ResultSet rs = pt.executeQuery();

			while (rs.next()) {
				message = rs.getString(3);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return message;
	}

	public boolean validateUserCredentials(String usrName, String password) throws SQLException {
		this.connect();
		String usr = "";
		String pwd = "";
		String sql = "Select * from user where name=?";
		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, usrName);

			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				usr = rs.getString(2);
				pwd = rs.getString(3);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (usrName.equals(usr) && password.equals(pwd)) {
			return true;
		} else {
			return false;
		}

	}

	public String addUser(String userName, String password, String email) {
		this.connect();
		String result = "Failure";
		String sql = "INSERT INTO `user`( `name`, `password`, `email_id`) VALUES (?,?,?)";

		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, userName);
			pt.setString(2, password);
			pt.setString(3, email);

			int i = pt.executeUpdate();
			if (i > 0) {
				result = "Success";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public String checkExistingUserName(String userName) {
		this.connect();
		String result = "success";
		String sql = "Select * from user where name=?";

		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, userName);

			ResultSet rs = pt.executeQuery();
			while (rs.next()) {

				result = "failure";

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return result;
	}
	
	
	public boolean updateMessage(String lang,String message) {
		boolean flag=false;
		this.connect();
		String sql="Update message set message=? where lang=?";
		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, message);
			pt.setString(2, lang);

			int i = pt.executeUpdate();
			if(i>0) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
		return flag;
		
		
	}

	public boolean addMessage(String messageIndex, String message) {
		this.connect();
		String checkquery = "Select * from message where lang=?";

		String sql = "INSERT INTO `message`( `lang`, `message`) VALUES (?,?)";
		boolean flag = false;

		try {

			PreparedStatement pt = con.prepareStatement(checkquery);
			pt.setString(1, messageIndex);
			ResultSet checkData = pt.executeQuery();
			checkData.last();
			int count = checkData.getRow();
			checkData.beforeFirst();
			
			System.out.println(count);
            if(count==0) {
			pt = con.prepareStatement(sql);
			pt.setString(1, messageIndex);
			pt.setString(2, message);

			int i = pt.executeUpdate();
			if (i > 0) {
				flag = true;
			}
            }

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return flag;

	}

}
