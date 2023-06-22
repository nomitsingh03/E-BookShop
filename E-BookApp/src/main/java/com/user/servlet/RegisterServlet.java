package com.user.servlet;

import com.database.DBConnect;
import com.DAO.UserDATA;
import com.DAO.UserDAO;
import com.entity.User;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String mobile=req.getParameter("mobile");
			String password=req.getParameter("password");
			String confirmpassword=req.getParameter("confirmpassword");
			String check=req.getParameter("check");
//			System.out.println(name+" "+email+" "+mobile+" "+password+" "+check);
		
			User u = new User();
			u.setName(name);
			u.setEmail(email);
			u.setMobileNo(mobile);
			u.setPassword(password);
			u.setConfirmPassword(confirmpassword);
			
			HttpSession session = req.getSession();
			
			if(check!=null && confirmpassword.equals(password)) {
				UserDATA dao = new UserDATA(DBConnect.getConn());
				boolean flag = dao.userRegister(u);
				if(flag) {
					session.setAttribute("succmsg", "Registration Successfully...");
					res.sendRedirect("register.jsp");
				} else {
					session.setAttribute("failedmsg", "Something wrong on server..Try Again");
					res.sendRedirect("register.jsp");
				}
			} else {
				if(!confirmpassword.equals(password)) {
					session.setAttribute("failedmsg", "Password Mismatch");
					res.sendRedirect("register.jsp");
				} else {
					session.setAttribute("failedmsg", "Please check Agree & Terms of Service");
					res.sendRedirect("register.jsp");
				}
			}
	}
}
