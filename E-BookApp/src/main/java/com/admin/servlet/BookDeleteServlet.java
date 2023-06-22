package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.BookDATA;
import com.database.DBConnect;
import com.entity.BookDetails;

@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BookDATA dao = new BookDATA(DBConnect.getConn());
			boolean flag = dao.deleteBooks(id);

			HttpSession session = req.getSession();
			if(flag)
			{
				session.setAttribute("succMsg","Book Deleted Successfully...");
				res.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg","Something wrong on server.");
				res.sendRedirect("admin/all_books.jsp");
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


}
