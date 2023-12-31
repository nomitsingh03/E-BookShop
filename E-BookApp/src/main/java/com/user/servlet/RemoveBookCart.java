package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.CartDATA;
import com.database.DBConnect;

/**
 * Servlet implementation class RemoveBookCart
 */
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookId = Integer.parseInt(req.getParameter("bid"));
		int userId = Integer.parseInt(req.getParameter("uid"));
		int cartId = Integer.parseInt(req.getParameter("cid"));
		CartDATA dao = new CartDATA(DBConnect.getConn());
		boolean f = dao.RemoveBook(bookId, userId, cartId);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			resp.sendRedirect("checkout.jsp");
		}
		
	}

}
