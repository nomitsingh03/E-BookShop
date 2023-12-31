package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.BookDATA;
import com.DAO.CartDATA;
import com.database.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int bookId=Integer.parseInt(req.getParameter("bid"));
			int userId = Integer.parseInt(req.getParameter("uid"));
			BookDATA dao = new BookDATA(DBConnect.getConn());
			BookDetails b = dao.getBookById(bookId);
		
			Cart c= new Cart();
			c.setBookId(bookId);
			c.setUserId(userId);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(b.getBookPrice());
			c.setTotalPrice(b.getBookPrice());
			
			CartDATA dao2= new CartDATA(DBConnect.getConn());
			boolean f2=dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f2) {
				System.out.println("Add Cart Success");
				session.setAttribute("addCart1", "Book Added to Cart");
				resp.sendRedirect("allnewbook.jsp");
			} else {
				session.setAttribute("failed", "Something wrong in Server");
				resp.sendRedirect("allnewbook.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
