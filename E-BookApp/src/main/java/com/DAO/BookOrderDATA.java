package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderDATA implements BookOrderDao {

	private Connection conn;
	
	public BookOrderDATA(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		// TODO Auto-generated method stub
		int i=1;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<BookOrder> list) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into book_order(order_id,user_name,email,address,mobile,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for(BookOrder b:list) {
				
				ps.setString(1,b.getOrderId());
				ps.setString(2,b.getUserName());
				ps.setString(3,b.getEmail());
				ps.setString(4,b.getFullAddress());
				ps.setString(5,b.getMobile());
				ps.setString(6,b.getBookName());
				ps.setString(7,b.getAuthor());
				ps.setDouble(8,b.getPrice());
				ps.setString(9,b.getPayment());
				ps.addBatch();
			}
			
			int count[] = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		// TODO Auto-generated method stub
		List<BookOrder> list = new ArrayList<>();
		BookOrder ord = null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from book_order where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ord=new BookOrder();
				ord.setId(rs.getInt(1));
				ord.setOrderId(rs.getString(2));
				ord.setUserName(rs.getString(3));
				ord.setEmail(rs.getString(4));
				ord.setFullAddress(rs.getString(5));
				ord.setMobile(rs.getString(6));
				ord.setBookName(rs.getString(7));
				ord.setAuthor(rs.getString(8));
				ord.setPrice(rs.getDouble(9));
				ord.setPayment(rs.getString(10));
				list.add(ord);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrder> getBook() {
		// TODO Auto-generated method stub
		List<BookOrder> list = new ArrayList<>();
		BookOrder ord = null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from book_order where email=?");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ord=new BookOrder();
				ord.setId(rs.getInt(1));
				ord.setOrderId(rs.getString(2));
				ord.setUserName(rs.getString(3));
				ord.setEmail(rs.getString(4));
				ord.setFullAddress(rs.getString(5));
				ord.setMobile(rs.getString(6));
				ord.setBookName(rs.getString(7));
				ord.setAuthor(rs.getString(8));
				ord.setPrice(rs.getDouble(9));
				ord.setPayment(rs.getString(10));
				list.add(ord);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}

}
