package pack_servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pack_dao.Data_handle;

/**
 * Servlet implementation class done
 */
@WebServlet("/done")
public class done extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String name = request.getParameter("name");
	    String message = request.getParameter("message");
	    String service = request.getParameter("service");
	    String form1 = request.getParameter("form1");
	    String form2 = request.getParameter("form2");
	   
	    System.out.println(name);
	    System.out.println(message);
	    System.out.println(service);
	   
 
	    
	    
	    System.out.println("");
	    System.out.println("fsdjashfj");
		
	    int s=0;
	    
	   if(form1.equals("insert"))
	   {
		    if(service.equals("sequence")) {
			try {
				 s =  Data_handle.insert_sequence(name);
				 System.out.println("maaaa1");
				request.setAttribute("sourcing",s);
            
				  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
		    
		    System.out.println("maaaa2");
		   if(service.equals("random")) {
	    	try {System.out.println("maaaa3");
	    		String date=request.getParameter("dates");
				 s= Data_handle.insert_random(date,name);
				 System.out.println("maaaa4");
				  request.setAttribute("sourcing",s);
				  
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
		   
		   RequestDispatcher rd = request.getRequestDispatcher("done.jsp");
		   rd.forward(request,response);
		   
		   
		   
		   
	   }
	    int p=9;
	   
	   request.setAttribute("come",p);
	    
	    
	    if(form2.equals("view"))
    {
	    String nm = request.getParameter("date");
	    if(nm !=null)
	    {
	    ArrayList<ArrayList<String>> arl = null;
		try {
			arl = Data_handle.view_by_date(nm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    request.setAttribute("ArrayList", arl);
	    RequestDispatcher rd = request.getRequestDispatcher("done.jsp");
	    rd.forward(request,response);
	    }
	}
	}
	


}
