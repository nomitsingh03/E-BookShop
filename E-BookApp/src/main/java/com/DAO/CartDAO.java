package com.DAO;

import java.util.List;
import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
//	public Cart getBookByUser(int userId);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean RemoveBook(int bid, int uid, int cid);

}
