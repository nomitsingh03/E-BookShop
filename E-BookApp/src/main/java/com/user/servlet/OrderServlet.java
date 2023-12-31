package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;


import com.DAO.BookOrderDATA;
import com.DAO.CartDATA;
import com.database.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
			String address = req.getParameter("add");
			String landmark = req.getParameter("near");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pin");
			String paymentType = req.getParameter("paymenttype");
			String fullAddress = address+","+landmark+","+city+","+state+"-"+pincode;
			
			CartDATA dao = new CartDATA(DBConnect.getConn());
			List<Cart> list = dao.getBookByUser(id);
			
			if(list.isEmpty()) {
				session.setAttribute("failedMsg","Add Item");
				resp.sendRedirect("checkout.jsp");
			} else {
			BookOrderDATA dao2 = new BookOrderDATA(DBConnect.getConn());
			int i = dao2.getOrderNo();
			BookOrder b = null;
			
			List<BookOrder> orderList = new ArrayList<BookOrder>();
			for(Cart c: list) {
				b = new BookOrder();
				b.setOrderId("BOOK-ORD-00"+i);
				b.setUserName(name);
				b.setEmail(email);
				b.setMobile(mobile);
				b.setFullAddress(fullAddress);
				b.setBookName(c.getBookName());
				b.setAuthor(c.getAuthor());
				b.setPrice(c.getPrice());
				b.setPayment(paymentType);
				orderList.add(b);
				i++;
			}
			if("NoSelect".equals(paymentType)) {
				session.setAttribute("failedMsg","Select Payment type");
				resp.sendRedirect("checkout.jsp");
			} else {
				boolean flag = dao2.saveOrder(orderList);
				if(flag) {
//					session.setAttribute("succMsg","Congrats! Your Order is placed Succesfully");
					resp.sendRedirect("order_success.jsp");
				} else {
					session.setAttribute("failedMsg","Order failed");
					resp.sendRedirect("checkout.jsp");
				}
			}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
