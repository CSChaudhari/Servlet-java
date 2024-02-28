package in.ineuron.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/test3")
public class ThirdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// collect the inputs from request Object
		String depName = request.getParameter("depName");
		String depAmount = request.getParameter("depAmount");

		// get the data from session object

		HttpSession session = request.getSession();
		Object accNo = session.getAttribute("accNo");
		Object accName = session.getAttribute("accName");
		Object accType = session.getAttribute("accType");
		Object accBranch = session.getAttribute("accBranch");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<body bgcolor='cyan'>");
		out.println("<center>");
		out.println("<table border='1'>");
		out.println("<tr><th>ACCOUT  NUMBER</th><td>" + accNo + "</td></tr>");
		out.println("<tr><th>ACCOUNT NAME</th><td>" + accName + "</td></tr>");
		out.println("<tr><th>ACCOUNT TYPE</th><td>" + accType + "</td></tr>");
		out.println("<tr><th>ACCOUNT BRANCH</th><td>" + accBranch + "</td></tr>");
		out.println("<tr><th>DEPT NAME</th><td>" + depName + "</td></tr>");
		out.println("<tr><th>DEPT AMOUNT</th><td>" + depAmount + "</td></tr>");
		out.println("</table>");
		out.println("</center>");
		out.println("</body>");
		
		out.close();

	}

}
