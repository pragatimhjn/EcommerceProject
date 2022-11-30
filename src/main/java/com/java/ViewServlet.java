package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		

		out.println("<h1>All Users List</h1>");
		
		List<User> list=UserDAO.getAllUsers();
		
		out.print("<table border='1' width='100%'");
		out.print("<tr><th>Id</th><th>Name</th><th>Password</th><th>Email</th><th>Address</th><th>Phone</th><th>Edit</th><th>Delete</th></tr>");
		for(User u:list){
			out.print("<tr><td>"+u.getId()+"</td><td>"+u.getName()+"</td><td>"+u.getPassword()+"</td><td>"+u.getEmail()+"</td><td>"+u.getAddress()+"</td><td>"+u.getPhone()+"</td><td><a href='updateUser.html?id="+u.getId()+"'>Edit</a></td><td><a href='DeleteServlet?id="+u.getId()+"'>Delete</a></td></tr>");
		}
		out.print("</table>");
		out.println("<br>");
		out.println("<br>");


		out.println("<a href='addProduct.html'>Add New Product</a>");
		out.close();
		
	
	}

}
