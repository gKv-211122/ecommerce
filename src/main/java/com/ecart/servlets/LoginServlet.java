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
import com.ecart.userdao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
        	String email = request.getParameter("email");
        	String password = request.getParameter("password");
        	
        	// validating
        	
        	// authenticating user
        	UserDao userDao = new UserDao(FactoryProvider.getFactory());
        	User user = userDao.getUserEmailAndPassword(email, password);
        	
        	// System.out.println(user);
        	HttpSession httpSession = request.getSession();
        	
        	if(user == null) {
        		
        		httpSession.setAttribute("message", "Invalid Credentials, !! Try With another one");
        		response.sendRedirect("login.jsp");
        		return;
        		
        	} else {
        		out.println("<h3>Welcome, "+user.getUserName()+"</h3>");
        		
        		// login
        		httpSession.setAttribute("current-user", user);
        		
        		if(user.getUserType().equals("admin")) {
        			// admin: admin.jsp
        			response.sendRedirect("admin.jsp");
        		}else if(user.getUserType().equals("normal")) {
        			// normal: normal.jsp
        			response.sendRedirect("normal.jsp");
        		}else {
        			out.println("We have not identified user type");
        		}
        		
        		
        		
        		
        		
        	}
        	
        	
        	
        	
        	}catch(Exception e) {
        		
        		e.printStackTrace();
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
