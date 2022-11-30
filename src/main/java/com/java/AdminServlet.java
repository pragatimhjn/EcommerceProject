package com.java;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    		response.setContentType("text/html ");
    		PrintWriter pw = response.getWriter();
    		String u = request.getParameter("name");
    		String p = request.getParameter("password");
    		pw.print("<br>");
    		if ((u.equals("Admin"))&&(p.equals("Admin123")))
    		{
    			response.sendRedirect("ViewServlet");
    			

    		}
    		else
    		{
    			pw.print("Invalid Username or Password");
    			pw.print("<br>");


    		}


    	}

}
