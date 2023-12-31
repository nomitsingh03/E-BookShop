package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.entity.BookDetails;

public class BookDATA implements BookDAO {

private Connection conn;
	
	public BookDATA(Connection conn) {
		super();
		this.conn = conn;
	}
	@Override
	public List<BookDetails> getAllBooks() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) 
			{
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean AddBooks(BookDetails bdtl){
		// TODO Auto-generated constructor stub
		boolean f = false;
		try {
			String sql = "insert into book_details(bookName,author,price,bookCategory,status,photoName,userEmail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setString(1, bdtl.getBookName());
			ps.setString(2, bdtl.getAuthor());
			ps.setDouble(3, bdtl.getBookPrice());
			ps.setString(4, bdtl.getBookCategory());
			ps.setString(5, bdtl.getBookStatus());
			ps.setString(6, bdtl.getBookPhotoName());
			ps.setString(7, bdtl.getUserEmail());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public BookDetails getBookById(int id) {
		// TODO Auto-generated method stub
		BookDetails b = null;
		try{
		String sql = "select * from book_details where bookId=?";
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1,id);

		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			b=new BookDetails();
			b.setBookId(rs.getInt(1));
			b.setBookName(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setBookPrice(rs.getDouble(4));
			b.setBookCategory(rs.getString(5));
			b.setBookStatus(rs.getString(6));
			b.setBookPhotoName(rs.getString(7));
			b.setUserEmail(rs.getString(8));
		}
	} catch(Exception e){
		e.printStackTrace();
	}
		return b;
	}

	@Override
	public boolean bookEditSuccess(BookDetails b) {
		// TODO Auto-generated method stub
		boolean flag=false;
		try {
			String sql = "update book_details set bookName=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1 , b.getBookName());
			ps.setString(2 , b.getAuthor());
			ps.setDouble(3 , b.getBookPrice());
			ps.setString(4 , b.getBookStatus());
			ps.setInt(5 , b.getBookId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				flag=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql = "delete from book_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getNewBook() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by BookId DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<BookDetails> getRecentBook() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where status=? order by BookId DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by BookId DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where status=? order by BookId DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet  rs = ps.executeQuery();
			while(rs.next()) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by BookId DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			while(rs.next() ) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by BookId DESC";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			while(rs.next()) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<BookDetails> getBookByOld(String email, String category) {
		// TODO Auto-generated method stub
		List<BookDetails> list = new ArrayList<>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details where bookCategory=? and userEmail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setBookPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setBookStatus(rs.getString(6));
				b.setBookPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public boolean deleteOldBook(String email, String category, int bid) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql = "delete from book_details where bookCategory=? and userEmail=? and bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, email);
			ps.setInt(3, bid);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	

}
