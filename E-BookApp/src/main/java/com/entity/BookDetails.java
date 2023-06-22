package com.entity;

public class BookDetails {
	private int bookId;
	private String bookName;
	private String author;
	private Double bookPrice;
	private String bookCategory;
	private String bookStatus;
	private String bookPhotoName;
	private String userEmail;
	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDetails(String bookName, String author, Double bookPrice, String bookCategory,
			String bookStatus, String bookPhotoName, String userEmail) {
		super();
		
		this.bookName = bookName;
		this.author = author;
		this.bookPrice = bookPrice;
		this.bookCategory = bookCategory;
		this.bookStatus = bookStatus;
		this.bookPhotoName = bookPhotoName;
		this.userEmail = userEmail;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	public String getBookPhotoName() {
		return bookPhotoName;
	}
	public void setBookPhotoName(String bookPhotoName) {
		this.bookPhotoName = bookPhotoName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", bookPrice="
				+ bookPrice + ", bookCategory=" + bookCategory + ", bookStatus=" + bookStatus + ", bookPhotoName="
				+ bookPhotoName + ", userEmail=" + userEmail + "]";
	}
	
}
