package in.ineuron.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/test1")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// collect the inputs from request Object
		String accNo = request.getParameter("accNo");
		String accName = request.getParameter("accName");

		HttpSession session = request.getSession();
		session.setAttribute("accNo", accNo);
		session.setAttribute("accName", accName);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<body bgcolor='lightgreen'>");
		out.println("<center>");
		out.println("<form method='get' action ='" + response.encodeURL("./test2") + "'>");
		out.println("<table>");
		out.println("<tr><th>AccountType</th><td><input type='text' name ='accType'/></td></tr>");
		out.println("<tr><th>AccountBranch</th><td><input type='text' name ='accBranch'/></td></tr>");
		out.println("<tr><th></th><td><input type='submit' value='Next'/></td></tr>");
		out.println("</table>");
		out.println("</form>");
		out.println("</center>");
		out.println("</body>");

		out.close();

	}

}
