package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.UserDATA;
import com.database.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String mobile=req.getParameter("mobile");
			String password=req.getParameter("password");
			
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			u.setMobileNo(mobile);
			
			UserDATA dao = new UserDATA(DBConnect.getConn());
			boolean check = dao.checkPassword(id, password);
			
			HttpSession session = req.getSession();
			
			if(check) {
				boolean update = dao.updateProfile(u);
				if(update) {
					session.setAttribute("succMsg", "Profile Updated Successfully...");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("failedMsg", "Something wrong on server..Try Again");
					resp.sendRedirect("edit_profile.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Incorrect Password");
				resp.sendRedirect("edit_profile.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
