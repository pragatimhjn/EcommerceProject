package com.java;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User {
	private int id;
	private String name,password,email,address,phone;
	private boolean logged = false;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	 public void login ()
	 {
	 Connection con = null;
	 PreparedStatement ps = null;
	 try
	 {
	 con = UserDAO.getConnection();
	 ps = con.prepareStatement("select id,email,address,phone from users where name = ? and password= ?");
	 ps.setString(1,getName());
	 ps.setString(2,getPassword());

	 ResultSet rs = ps.executeQuery();
	 logged = false;

	 if ( rs.next())
	 { 
		 id= rs.getInt("id");
		 email = rs.getString("email");
		 address = rs.getString("address");
		 phone = rs.getString("phone");
		 logged = true;
	 }
	 
	 }
	 catch(Exception ex)
	 {
	 System.out.println( ex.getMessage());
	 }
		

	 }



}
