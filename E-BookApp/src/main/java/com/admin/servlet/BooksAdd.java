package com.admin.servlet;

import com.DAO.*;
import com.database.DBConnect;
import com.entity.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.*;

@WebServlet("/addBooks")
@MultipartConfig
public class BooksAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String bName = req.getParameter("book_name");
			String author = req.getParameter("author_name");
			Double price = Double.parseDouble(req.getParameter("price"));
			String bookCategory = req.getParameter("b_category");
			String bookStatus = req.getParameter("b_status");
			Part part = req.getPart("b_img");
			String fileName = part.getSubmittedFileName();
			
			BookDetails bdtl = new BookDetails(bName,author,price,bookCategory,bookStatus,fileName,"admin");
			
			BookDATA da = new BookDATA(DBConnect.getConn());
			
			boolean flag = da.AddBooks(bdtl);
			
			HttpSession session = req.getSession();
			if(flag) {
				String path = getServletContext().getRealPath("")+"book";
//				System.out.println(path);
				File f = new File("path");
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Book Add Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Error Occur..");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
