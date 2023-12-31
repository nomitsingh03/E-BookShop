package com.DAO;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDATA implements UserDAO {

	private Connection conn;
	
	public UserDATA(Connection conn) {
		super();
		this.conn=conn;
	}

	public boolean userRegister(User u) {
		// TODO Auto-generated method stub
		boolean flg= false;
		try {
			String sql="insert into user(name, email, mobile, password, confirmPassword) values(?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getMobileNo());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getConfirmPassword());
			int i=ps.executeUpdate();
			if(i==1)
			{
				flg=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flg;
	}

	@Override
	public User login(String email, String password) {
		User u =null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u =new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setMobileNo(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setConfirmPassword(rs.getString(6));
				u.setAddress(rs.getString(7));
				u.setLandmark(rs.getString(8));
				u.setCity(rs.getString(9));
				u.setDistrict(rs.getString(10));
				u.setState(rs.getString(11));
				u.setPincode(rs.getString(12));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public boolean checkPassword(int id, String pwd) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "select * from user where id=? and  password=?";
			PreparedStatement ps =  conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, pwd);
			 
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User u) {
		// TODO Auto-generated method stub
		boolean flg= false;
		try {
			String sql="update user set name=?, email=?, mobile=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getMobileNo());
			ps.setInt(4, u.getId());
			int i=ps.executeUpdate();
			if(i==1)
			{
				flg=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flg;
	}
	
	
	
}
