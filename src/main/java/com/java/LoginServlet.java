package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    String name=request.getParameter("name");  
	    String password=request.getParameter("password");  
	    try
	    {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");
	    	PreparedStatement ps = con.prepareStatement("Select name,password from users where name=? and password=?");	    
            
	   ps.setString(1, name);
 	   ps.setString(2,password);
 	   ResultSet rs = ps.executeQuery();
 	  if(rs.next())
	   {
 		  if(name.equals(rs.getString(1))&& password.equals(rs.getString(2))){
 			  
			response.sendRedirect("updateUser.html");

 		  }
 		  else  {
		
 			  response.sendRedirect("error.jsp");

 		  }
 		  
	   }
	    }
		 catch (Exception err)
	     {
	  	   System.out.println(err);
	     }


	}

}
