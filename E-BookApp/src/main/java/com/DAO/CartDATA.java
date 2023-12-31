package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.Cart;

public class CartDATA implements CartDAO{

	private Connection conn;
	public CartDATA (Connection conn) {
		this.conn=conn;
	}
	@Override
	public boolean addCart(Cart c) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into cart(bid,userId,bookName,author,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, c.getBookId());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	@Override
	public List<Cart> getBookByUser(int userId) {
		// TODO Auto-generated method stub
		List<Cart> list = new ArrayList<>();
		Cart c = null;
		double totalPrice=0;
		try { 
			String sql = "select * from cart where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,userId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new Cart();
				c.setCartId(rs.getInt(1));
				c.setBookId(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice += rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean RemoveBook(int uid, int bid, int cid) {
		// TODO Auto-generated method stub
		
		boolean f=false;
		try {
			String sql = "delete from cart where bid=? and userId=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, bid);
			ps.setInt(3, cid);
			
			int i=ps.executeUpdate();
			if(i==1) f=true;
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
