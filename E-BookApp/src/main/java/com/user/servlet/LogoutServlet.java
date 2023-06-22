package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("userObject");
			
			HttpSession session2 = req.getSession();
			session2.setAttribute("succMsg", "Logout Successfully");
			resp.sendRedirect("login.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
