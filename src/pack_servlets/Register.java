package pack_servlets;

import java.io.IOException;

import java.sql.SQLException;
import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pack_dao.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
   // change start in jsp
		String u = req.getParameter("username");
		String p = req.getParameter("password");
	    String r = req.getParameter("email_id");
	   
		HttpSession session= req.getSession();  
       

	   
				int q=0;
				try {
					q = login_check.update(u, p, r);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				 session.setAttribute("response",q);  
				
				res.sendRedirect("Register.jsp");
			
			
		
		
	}
	
	}


