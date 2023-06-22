package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.database.DBConnect;
import com.entity.User;
import com.DAO.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			try{ 
				HttpSession session = req.getSession();
			UserDATA dao = new UserDATA(DBConnect.getConn());
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User u = new User();
				u.setName("Admin");
				session.setAttribute("userObject", u);
				resp.sendRedirect("admin/home.jsp");
			} else {
				User u = dao.login(email, password);
				if(u!=null) {
					session.setAttribute("userObject", u);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedmsg", "Email or Password Invalid");
					resp.sendRedirect("login.jsp");
				}
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
