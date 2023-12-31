package com.entity;

public class BookOrder {

	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String mobile;
	private String fullAddress;
	private String payment;
	private String bookName;
	private Double price;
	private String author;
	
	public BookOrder() {
		// TODO Auto-generated constructor stub
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "BookOrder [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", mobile=" + mobile + ", fullAddress=" + fullAddress + ", payment=" + payment + ", bookName="
				+ bookName + ", price=" + price + ", author=" + author + "]";
	}

}
