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

@WebServlet("/editBooks")
public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bName = req.getParameter("book_name");
			String author = req.getParameter("author_name");
			Double price = Double.parseDouble(req.getParameter("price"));
			String bookStatus = req.getParameter("b_status");

			BookDetails b = new BookDetails();
			b.setBookId(id);
			b.setBookName(bName);
			b.setAuthor(author);
			b.setBookPrice(price);
			b.setBookStatus(bookStatus);

			BookDATA dao = new BookDATA(DBConnect.getConn());
			boolean flag = dao.bookEditSuccess(b);

			HttpSession session = req.getSession();
			if(flag)
			{
				session.setAttribute("succMsg","Book Update Successfully...");
				res.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg","Something wrong , Book was not Updating..");
				res.sendRedirect("admin/all_books.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
