package in.ineuron.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */
@WebServlet("/second")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// collect the data from request object
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String saddr = request.getParameter("saddr");
		String sage = request.getParameter("sage");
		

		// send the request object data in the form of hidden fields

		PrintWriter out = response.getWriter();
		out.println("<body bgcolor='lightgreen'>");
		out.println("<center>");
		out.println("<form action ='./third'>");
		out.println("<table>");
		out.println("<input type='hidden' name = 'sid' value='"+sid+"'/>");
		out.println("<input type='hidden' name = 'sname' value='"+sname+"'/>");
		out.println("<input type='hidden' name = 'saddr' value='"+saddr+"'/>"); 
		out.println("<input type='hidden' name = 'sage' value='"+sage+"'/>");
		out.println("<tr><th>SEMAIL</th><td><input type='text' name ='semail'/></td></tr>");
		out.println("<tr><th></th><td><input type='submit' value='next'/></td></tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");
		out.close();

	}

}
