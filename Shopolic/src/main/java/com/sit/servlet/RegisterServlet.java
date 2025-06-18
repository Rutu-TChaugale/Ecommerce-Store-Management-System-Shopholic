// @Spuffyffets codes
package com.sit.servlet;

import java.io.IOException;


import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sit.model.User;
import com.sit.util.FactoryProvider;



@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

//	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		response.setContentType("text/html;charset=UTF-8");
//		try (PrintWriter out = response.getWriter()) {
//
//			try {
//
//				String userName = request.getParameter("user_name");
//				String userEmail = request.getParameter("user_email");
//				String userPassword = request.getParameter("user_password");
//				String userPhone = request.getParameter("user_phone");
//				String userAddress = request.getParameter("user_address");
//
//				// validations
//				if (userName.isEmpty()) {
//					out.println("Name is blank ");
//					return;
//				}
//				// data store karaysathi user cha object tayar kela
//				User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,
//						"normal");
//				Session hibernateSession = FactoryProvider.getFactory().openSession();
//				Transaction tx = hibernateSession.beginTransaction();
//				int userId = (int) hibernateSession.save(user);
//				tx.commit();
//				hibernateSession.close();
//				HttpSession httpSession = request.getSession();
//				httpSession.setAttribute("message", "Registration Successful !!");
//				response.sendRedirect("register.jsp");
//				return;
//
//			} catch (Exception e) {
//				e.printStackTrace();
//
//			}
//
//		}
//	}
	
	
	
	
	
	  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {

	            try {
	                String userName = request.getParameter("user_name");
	                String userEmail = request.getParameter("user_email");
	                String userPassword = request.getParameter("user_password");
	                String userPhone = request.getParameter("user_phone");
	                String userAddress = request.getParameter("user_address");
	                String userRole = request.getParameter("user_role");

	                if (userName.isEmpty()) {
	                    out.println("Name is blank");
	                    return;
	                }

	                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, userRole);
	                Session hibernateSession = FactoryProvider.getFactory().openSession();
	                Transaction tx = hibernateSession.beginTransaction();
	                int userId = (int) hibernateSession.save(user);
	                tx.commit();
	                hibernateSession.close();

	                HttpSession httpSession = request.getSession();
	                httpSession.setAttribute("message", "Registration Successful as " + userRole + "!!");
	                response.sendRedirect("register.jsp");
	                return;

	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	  }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
