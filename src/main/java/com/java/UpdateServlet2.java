package com.java;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet2")
public class UpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");

		
		User u=new User();
		u.setId(id);
		u.setName(name);
		u.setPassword(password);
		u.setEmail(email);
		u.setAddress(address);
		u.setPhone(phone);
		
		int status=UserDAO.update(u);
		if(status>0){
			out.print("<p>Record updated successfully!</p>");
			response.sendRedirect("ViewServlet");

		}else{
			out.println("Sorry! unable to update record");
		}
		
		out.close();



	
	}

}
