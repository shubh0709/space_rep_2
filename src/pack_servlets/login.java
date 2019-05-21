package pack_servlets;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pack_dao.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String u = req.getParameter("username");
		String p = req.getParameter("password");
		int w=0;
	
           ResultSet r=null;
		
			try {
				 r = login_check.UAP(u, p);
				System.out.println(0);
				HttpSession ses = req.getSession();
				if (r.next()!=false) {
					r.last();
					w=r.getInt("uid");
					System.out.println(w+" this is user_id ");
					ses.setAttribute("username",u);
					ses.setAttribute("uid",w);
					res.sendRedirect("done.jsp");
				}

				else {
					System.out.println(" sorry");
					ses.setAttribute("response",w);  
					res.sendRedirect("login.jsp");
					
				}

				/*
				 * else { res.sendRedirect("login.jsp?m=" + m); String mess =
				 * "invalid username and password"; }
				 */
				/*
				 * if (login_check.UAP(u, p) == 0) res.sendRedirect("login.jsp");
				 * 
				 * else { HttpSession session = req.getSession();
				 * session.setAttribute("username", u); res.sendRedirect("web.jsp"); }
				 */
			} catch (SQLException e) {
				e.printStackTrace();
			}
			

		}
	}


