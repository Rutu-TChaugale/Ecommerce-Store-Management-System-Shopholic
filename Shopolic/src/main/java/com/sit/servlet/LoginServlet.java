// @Spuffyffets codes
package com.sit.servlet;

import java.io.IOException;

import java.io.PrintWriter;

import com.sit.dao.UserDao;
import com.sit.model.User;
import com.sit.util.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);

			// System.out.println(user);
			HttpSession httpSession = request.getSession();
			if (user == null) {
				httpSession.setAttribute("message", "Invalid Details !! Try with another one");
				response.sendRedirect("login.jsp");
				return;
			} else {
				out.println("<h1>Welcome " + user.getUserName() + " </h1>");

				// login
				httpSession.setAttribute("current-user", user);

				if (user.getUserType().equals("admin")) {
					// admin var jail
					response.sendRedirect("admin.jsp");
				} else if (user.getUserType().equals("user")) {
					// user page var jail
					response.sendRedirect("user.jsp");
				} else {
					out.println("We have not identified user type");
				}

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
