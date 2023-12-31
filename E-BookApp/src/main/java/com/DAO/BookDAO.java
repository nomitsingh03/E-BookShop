package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {

	public boolean AddBooks(BookDetails bdtl);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean bookEditSuccess(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBook();
	
	public List<BookDetails> getOldBook();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllNewBooks();
	
	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getBookByOld(String email, String category);	

	public boolean deleteOldBook(String email, String category, int bid);
}
