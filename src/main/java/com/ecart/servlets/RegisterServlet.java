package com.ecart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ecart.entities.User;
import com.ecart.helper.FactoryProvider;


public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
        	try {
        		
        		String userName = request.getParameter("user_name");
        		String userEmail = request.getParameter("user_email");
        		String userPass = request.getParameter("user_pass");
        		String userPhone = request.getParameter("user_phone");
        		String userAddress = request.getParameter("user_address");
        		
        		if(userName.isEmpty()) {
        			out.println("Name is blank !!");
        			return;
        		}
        		
        		// creating user object to store data
        		User user = new User(userName, userEmail, userPass, userPhone, "default.jpg", userAddress, "normal");
        		
        		// save data using hibernate
        		Session hibernateSession = FactoryProvider.getFactory().openSession();
        		Transaction tx = hibernateSession.beginTransaction();
        		
        		int userId = (int)hibernateSession.save(user);
        		
        		
        		tx.commit();
        		hibernateSession.close();
        		
        		
        		HttpSession httpSession = request.getSession();
        		httpSession.setAttribute("message", "Registration Successful !! ,user id: " + userId);
        		
        		response.sendRedirect("register.jsp");
        		return;
        		
        	}catch(Exception e) {
        		
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
    }// </editor-fold>

}
