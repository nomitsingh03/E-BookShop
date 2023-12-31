package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.BookDATA;
import com.database.DBConnect;

/**
 * Servlet implementation class DeleteOldBook
 */
@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email = req.getParameter("em");
			int id = Integer.parseInt(req.getParameter("bid"));
			BookDATA dao = new BookDATA(DBConnect.getConn());
			boolean f = dao.deleteOldBook(email, "Old", id);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Old Book Delete Successfully..");
				resp.sendRedirect("old_book.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("old_book.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


}
